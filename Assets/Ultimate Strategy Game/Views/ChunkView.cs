using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
using System.IO;


public partial class ChunkView 
{ 


    private int chunkSize, chunkResolution, collisionResolution, pixelsPerUnit;

    public Texture2D hexBiomeMap;
    public Texture2D hexHeightmap;


    private Vector3[] vertices;
    private Vector3[] normals;


    public ProceduralMaterial substance;
    public ProceduralTexture proceduralTexture;
    public ProceduralTexture substanceTexture;
    public Texture2D substanceTexture2D;


    public Color[] altitudes;


    void Start ()
    {
        chunkSize = Chunk.ParentTerrainManager.ChunkSize;
        chunkResolution = Chunk.ParentTerrainManager.ChunkResolution;
        collisionResolution = Chunk.ParentTerrainManager.ChunkCollisionResolution;
        pixelsPerUnit = Chunk.ParentTerrainManager.PixelsPerUnit;


        hexBiomeMap = DrawHexBiomeMap(Chunk.TerrainDataX, Chunk.TerrainDataY);
        hexHeightmap = DrawChunkHeightmap(Chunk.TerrainDataX, Chunk.TerrainDataY);


        // The issue is here -----------------------------------------------------

        ProceduralMaterial s = renderer.sharedMaterial as ProceduralMaterial;
        s.isReadable = true;
        substance = renderer.material as ProceduralMaterial;
        substance.isReadable = true;
       
        substanceTexture = substance.GetGeneratedTexture(substance.GetGeneratedTextures()[0].name);
        substanceTexture2D = new Texture2D(substanceTexture.width, substanceTexture.height, TextureFormat.ARGB32, false);
        substance.SetProceduralTexture("Hexagon_Heights", hexBiomeMap);

        substance.RebuildTexturesImmediately();
        

        substanceTexture2D.wrapMode = TextureWrapMode.Clamp;
        substanceTexture2D.SetPixels32(substanceTexture.GetPixels32(0, 0, substanceTexture.width, substanceTexture.height));
        substanceTexture2D.Apply();

        //------------------------------------------------------------------------




        //substance.SetProceduralTexture("Hexagon_Heights", hexHeightmap);
        //substance.RebuildTexturesImmediately();

        //proceduralTexture = substance.GetGeneratedTexture("TerrainTest2_diffuse"); //substance.GetProceduralTexture("TerrainTest2_diffuse");
        

        //temp = new Texture2D(proceduralTexture.width, proceduralTexture.height, TextureFormat.ARGB32, false);
        //var pixels = proceduralTexture.GetPixels32(0, 0, proceduralTexture.width, proceduralTexture.height);
        //temp.SetPixels32(pixels);
        //temp.Apply();

        //substanceTexture = renderer.substance.mainTexture;
        //substanceTextur2D = substanceTexture as Texture2D;



        //substanceTexture2D = new Texture2D(proceduralTexture.width, proceduralTexture.height, TextureFormat.RGB24, false);
        //substanceTexture2D.SetPixels32(proceduralTexture.GetPixels32(0, 0, proceduralTexture.width, proceduralTexture.height));
        //substanceTexture2D.Apply();
        

        GenerateMesh();
        GenerateCollisionMesh();
        //GenerateTexture();
       
    }


    /// Invokes GenerateChunkExecuted when the GenerateChunk command is executed.
    public override void GenerateChunkExecuted() {
        base.GenerateChunkExecuted();

        chunkSize = Chunk.ParentTerrainManager.ChunkSize;
        chunkResolution = Chunk.ParentTerrainManager.ChunkResolution;
        collisionResolution = Chunk.ParentTerrainManager.ChunkCollisionResolution;
        pixelsPerUnit = Chunk.ParentTerrainManager.PixelsPerUnit;

        //DrawChunkHeightmap(hexHeightmap, Chunk.terrainDataX, Chunk.terrainDataY);
        //GenerateMesh();
        //GenerateCollisionMesh();
        //GenerateTexture();
    }

    /// Invokes UpdateChunkExecuted when the UpdateChunk command is executed.
    public override void UpdateChunkExecuted()
    {
        base.UpdateChunkExecuted();
    }


    public Texture2D DrawChunkHeightmap(int dataX, int dataY)
    {

        Texture2D texture = new Texture2D(chunkSize, chunkSize); //TextureFormat.RGBA32, true 
        texture.wrapMode = TextureWrapMode.Clamp;
        //texture.filterMode = FilterMode.Trilinear;
        //texture.EncodeToJPG();// = TextureFormat.RGBA32;
        texture.alphaIsTransparency = false;

        float terrainVal = 0;
        int posX;
        int posY;

        int chunkHexCountX = (int)(chunkSize / HexProperties.width);
        int chunkHexCountY = (int)(chunkSize / (HexProperties.tileH + HexProperties.side));


        int chunkTextureOffsetX = Chunk.ChunkX * chunkSize;
        int chunkTextureOffsetY = Chunk.ChunkY * chunkSize;


        for (int x = dataX; x <= dataX + chunkHexCountX + Chunk.ChunkX && x < Chunk.ParentTerrainManager.TerrainWidth; x++)
        {
            for (int y = dataY; y <= dataY + chunkHexCountY + Chunk.ChunkY && y < Chunk.ParentTerrainManager.TerrainHeight; y++)
            {
                posX = Mathf.RoundToInt(x * 2 * HexProperties.tileR + (y % 2 == 0 ? 0 : 1) * HexProperties.tileR + HexProperties.tileR) - chunkTextureOffsetX;
                posY = Mathf.RoundToInt(y * (HexProperties.tileH + HexProperties.side)) - chunkTextureOffsetY;

                if (x >= 0 && y >= 0)
                {
                    terrainVal = Mathf.Round(Chunk.ParentTerrainManager.terrainData[x, y] / Chunk.ParentTerrainManager.Altitudes) * Chunk.ParentTerrainManager.Altitudes;
                    DrawHex(texture, posX, posY, new Color(terrainVal, terrainVal, terrainVal));
                }
            }
        }

        // SEt edges
        Color col;
        Color col2;
        for (int x = 0; x <= chunkSize; x++)
        {
            col = texture.GetPixel(x, 0);
            texture.SetPixel(x, 0, new Color(col.r, col.g, col.b, 0));
            col2 = texture.GetPixel(x, chunkSize);
            texture.SetPixel(x, chunkSize, new Color(col2.r, col2.g, col2.b, 0));
        }

        for (int y = 0; y <= chunkSize; y++)
        {
            col = texture.GetPixel(0, y);
            texture.SetPixel(0, y, new Color(col.r, col.g, col.b, 0));
            col2 = texture.GetPixel(chunkSize, y);
            texture.SetPixel(chunkSize, y, new Color(col2.r, col2.g, col2.b, 0));

        }

        texture.Apply();
        return texture;
    }

    public Texture2D DrawHexBiomeMap(int dataX, int dataY)
    {

        Texture2D texture = new Texture2D(chunkSize, chunkSize); 
        texture.wrapMode = TextureWrapMode.Clamp;

        float terrainVal = 0;
        int posX;
        int posY;

        int chunkHexCountX = (int)(chunkSize / HexProperties.width);
        int chunkHexCountY = (int)(chunkSize / (HexProperties.tileH + HexProperties.side));


        int chunkTextureOffsetX = Chunk.ChunkX * chunkSize;
        int chunkTextureOffsetY = Chunk.ChunkY * chunkSize;


        for (int x = dataX; x <= dataX + chunkHexCountX + Chunk.ChunkX && x < Chunk.ParentTerrainManager.TerrainWidth; x++)
        {
            for (int y = dataY; y <= dataY + chunkHexCountY + Chunk.ChunkY && y < Chunk.ParentTerrainManager.TerrainHeight; y++)
            {
                posX = Mathf.RoundToInt(x * 2 * HexProperties.tileR + (y % 2 == 0 ? 0 : 1) * HexProperties.tileR + HexProperties.tileR) - chunkTextureOffsetX;
                posY = Mathf.RoundToInt(y * (HexProperties.tileH + HexProperties.side)) - chunkTextureOffsetY;

                if (x >= 0 && y >= 0)
                {
                    terrainVal = Mathf.Clamp(Mathf.Round(Chunk.ParentTerrainManager.terrainData[x, y] / Chunk.ParentTerrainManager.Altitudes) * Chunk.ParentTerrainManager.Altitudes / Chunk.ParentTerrainManager.Altitudes - 1, 0, 5);
                    //Debug.Log(Mathf.FloorToInt(terrainVal / Chunk.ParentTerrainManager.Altitudes) - 2);
                    if (Chunk.ParentTerrainManager.hexGrid[x, y].RiverStrength <= 0)
                        DrawHex(texture, posX, posY, altitudes[(int)terrainVal]);
                    else
                        DrawHex(texture, posX, posY, Color.cyan);

                }
            }
        }

        texture.Apply();
        return texture;
    }


    void DrawHex(Texture2D texture, int centerX, int centerY, Color color)
    {
        int startX = 0, endX = 0;


        for (int y = (int)HexProperties.height; y > 0; y--)
        {

            if (y < HexProperties.tileH) // TOP
            {
                startX = Mathf.FloorToInt(-(y / HexProperties.tileH * HexProperties.tileR));
                endX = Mathf.CeilToInt(y / HexProperties.tileH * HexProperties.tileR);
            }
            else if (y >= HexProperties.tileH && y <= HexProperties.side + HexProperties.tileH) // MIDDLE
            {
                startX = Mathf.FloorToInt(-HexProperties.tileR);
                endX = Mathf.CeilToInt(HexProperties.tileR);
            }
            else // BOTTOM
            {
                startX = Mathf.FloorToInt(-((HexProperties.height - y) / HexProperties.tileH * HexProperties.tileR));
                endX = Mathf.CeilToInt(((HexProperties.height - y) / HexProperties.tileH * HexProperties.tileR));
            }

            for (int x = startX; x < endX; x++)
            {
                if (x + centerX >= 0 && x + centerX <= chunkSize && y + centerY >= 0 && y + centerY <= chunkSize)
                {
                    //if (x <= 0 || y <= 0 || x + centerX >= chunkSize || y + centerY >= chunkSize)
                    //    texture.SetPixel(x + centerX, y + centerY, new Color(color.r, color.g, color.b, 0));
                    //else
                        texture.SetPixel(x + centerX, y + centerY, new Color(color.r, color.g, color.b, 1));
                }
            }
        }
    }

    private void GenerateMesh()
    {

        Mesh mesh = GetComponent<MeshFilter>().mesh;
        mesh.Clear();

        // Pixels per vetex point
        float resStep = chunkSize / chunkResolution;
        float uvStep = 1f / chunkSize;

        vertices = new Vector3[(chunkResolution + 1) * (chunkResolution + 1)];
        normals = new Vector3[vertices.Length];
        Vector2[] uv = new Vector2[vertices.Length];


        for (int v = 0, z = 0; z <= chunkResolution; z++)
        {
            for (int x = 0; x <= chunkResolution; x++, v++)
            {
                vertices[v] = new Vector3(x * resStep / pixelsPerUnit,
                                          hexHeightmap.GetPixel((int)(x * resStep), (int)(z * resStep)).grayscale * Chunk.ParentTerrainManager.PixelToHeight, //, //Chunk.ParentTerrainManager.terrainData[x + Chunk.TerrainDataX, z + Chunk.TerrainDataY] * Chunk.ParentTerrainManager.PixelToHeight
                                          z * resStep / pixelsPerUnit
                                          );

                normals[v] = Vector3.up;
                uv[v] = new Vector2(x * resStep * uvStep, z * resStep * uvStep);
            }
        }

        mesh.vertices = vertices;
        mesh.normals = normals;
        mesh.uv = uv;

        int[] triangles = new int[chunkResolution * chunkResolution * 6];
        for (int t = 0, v = 0, y = 0; y < chunkResolution; y++, v++)
        {
            for (int x = 0; x < chunkResolution; x++, v++, t += 6)
            {
                triangles[t] = v;
                triangles[t + 1] = v + chunkResolution + 1;
                triangles[t + 2] = v + 1;
                triangles[t + 3] = v + 1;
                triangles[t + 4] = v + chunkResolution + 1;
                triangles[t + 5] = v + chunkResolution + 2;
            }
        }
        mesh.triangles = triangles;

        CalculateNormals();
        mesh.RecalculateBounds();
        TangentSolver.Solve(mesh);

    }

    
    private void GenerateCollisionMesh()
    {

        Mesh meshCollider = new Mesh();
        Vector3[] colVertices = new Vector3[(collisionResolution + 1) * (collisionResolution + 1)];

        Mesh mesh = GetComponent<MeshCollider>().sharedMesh;

        // Pixels per vetex point
        float resStep = chunkSize / collisionResolution;


        for (int v = 0, z = 0; z <= collisionResolution; z++)
        {
            for (int x = 0; x <= collisionResolution; x++, v++)
            {
                colVertices[v] = new Vector3(x * resStep / pixelsPerUnit,
                                             hexHeightmap.GetPixel((int)(x * resStep), (int)(z * resStep)).grayscale * Chunk.ParentTerrainManager.PixelToHeight,
                                             z * resStep / pixelsPerUnit
                                             );
            }
        }

        meshCollider.vertices = colVertices;

        int[] triangles = new int[collisionResolution * collisionResolution * 6];
        for (int t = 0, v = 0, y = 0; y < collisionResolution; y++, v++)
        {
            for (int x = 0; x < collisionResolution; x++, v++, t += 6)
            {
                triangles[t] = v;
                triangles[t + 1] = v + collisionResolution + 1;
                triangles[t + 2] = v + 1;
                triangles[t + 3] = v + 1;
                triangles[t + 4] = v + collisionResolution + 1;
                triangles[t + 5] = v + collisionResolution + 2;
            }
        }
        meshCollider.triangles = triangles;


        GetComponent<MeshCollider>().sharedMesh = meshCollider;


    }
    

    private float GetXDerivative(int x, int z)
    {
        int rowOffset = z * (chunkResolution + 1);
        float left, right, scale;
        if (x > 0)
        {
            left = vertices[rowOffset + x - 1].y;
            if (x < chunkResolution)
            {
                right = vertices[rowOffset + x + 1].y;
                scale = 0.5f * chunkResolution;
            }
            else
            {
                right = vertices[rowOffset + x].y;
                scale = chunkResolution;
            }
        }
        else
        {
            left = vertices[rowOffset + x].y;
            right = vertices[rowOffset + x + 1].y;
            scale = chunkResolution;
        }
        return (right - left) * scale;
    }

    private float GetZDerivative(int x, int z)
    {
        int rowLength = chunkResolution + 1;
        float back, forward, scale;
        if (z > 0)
        {
            back = vertices[(z - 1) * rowLength + x].y;
            if (z < chunkResolution)
            {
                forward = vertices[(z + 1) * rowLength + x].y;
                scale = 0.5f * chunkResolution;
            }
            else
            {
                forward = vertices[z * rowLength + x].y;
                scale = chunkResolution;
            }
        }
        else
        {
            back = vertices[z * rowLength + x].y;
            forward = vertices[(z + 1) * rowLength + x].y;
            scale = chunkResolution;
        }
        return (forward - back) * scale;
    }

    private void CalculateNormals()
    {
        for (int v = 0, z = 0; z <= chunkResolution; z++)
        {
            for (int x = 0; x <= chunkResolution; x++, v++)
            {
                normals[v] = new Vector3(-GetXDerivative(x, z), 1f, -GetZDerivative(x, z)).normalized;
            }
        }
    }

    /// Invokes SaveChunkhexHeightmapExecuted when the SaveChunkhexHeightmap command is executed.
    public override void ExecuteSaveChunkHexTexture()
    {
        base.ExecuteSaveChunkHexTexture();
        byte[] data = hexHeightmap.EncodeToPNG();
        File.WriteAllBytes(Application.dataPath + "/chunk.png", data);
    }

}
