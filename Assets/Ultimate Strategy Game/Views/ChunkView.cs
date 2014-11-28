using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class ChunkView 
{

    private int chunkSize, chunkResolution, collisionResolution, pixelsPerUnit;

    public Texture2D hexTexture;


    private Vector3[] vertices;
    private Vector3[] normals;


    public ProceduralMaterial material;


    void Start ()
    {
        chunkSize = Chunk.ParentWorldManager.ChunkSize;
        chunkResolution = Chunk.ParentWorldManager.ChunkResolution;
        collisionResolution = Chunk.ParentWorldManager.ChunkCollisionResolution;
        pixelsPerUnit = Chunk.ParentWorldManager.PixelsPerUnit;


        material = renderer.material as ProceduralMaterial;

        hexTexture = GenerateChunkHexes(Chunk.TerrainDataX, Chunk.TerrainDataY);

        material.SetProceduralTexture("Hexagon_Heights", hexTexture);
        material.RebuildTextures();


        GenerateMesh();
        //GenerateCollisionMesh();
        //GenerateTexture();
       


        //material.
        //renderer.material.mainTexture = hexTexture;

    }


    /// Invokes GenerateChunkExecuted when the GenerateChunk command is executed.
    public override void GenerateChunkExecuted() {
        base.GenerateChunkExecuted();

        chunkSize = Chunk.ParentWorldManager.ChunkSize;
        chunkResolution = Chunk.ParentWorldManager.ChunkResolution;
        collisionResolution = Chunk.ParentWorldManager.ChunkCollisionResolution;
        pixelsPerUnit = Chunk.ParentWorldManager.PixelsPerUnit;

        //GenerateChunkHexes(hexTexture, Chunk.terrainDataX, Chunk.terrainDataY);
        //GenerateMesh();
        //GenerateCollisionMesh();
        //GenerateTexture();
    }


    public Texture2D GenerateChunkHexes(int dataX, int dataY)
    {

        Texture2D texture = new Texture2D(chunkSize, chunkSize, TextureFormat.RGBA32, true);
        texture.wrapMode = TextureWrapMode.Clamp;
        texture.filterMode = FilterMode.Trilinear;
        //texture.EncodeToJPG();// = TextureFormat.RGBA32;
        //texture.alphaIsTransparency = false;

        float terrainVal = 0;
        int posX;
        int posY;
        HexProperties hexProperties = Chunk.ParentWorldManager.HexProperties;

        int chunkHexCountX = (int)(chunkSize / hexProperties.width);
        int chunkHexCountY = (int)(chunkSize / (hexProperties.tileH + hexProperties.side));


        //int initPosX = Mathf.RoundToInt(dataX * 2 * hexProperties.tileR + (dataY % 2 == 0 ? 0 : 1) * hexProperties.tileR);
        //int initPosY = Mathf.RoundToInt(dataY * (hexProperties.tileH + hexProperties.side));

        int initPosX = Chunk.ChunkX * chunkSize;
        int initPosY = Chunk.ChunkY * chunkSize;


        for (int x = dataX; x <= dataX + chunkHexCountX + Chunk.ChunkX && x < Chunk.ParentWorldManager.TerrainWidth; x++)
        {
            for (int y = dataY; y <= dataY + chunkHexCountY + Chunk.ChunkY && y < Chunk.ParentWorldManager.TerrainHeight; y++)
            {
                posX = Mathf.RoundToInt(x * 2 * hexProperties.tileR + (y % 2 == 0 ? 0 : 1) * hexProperties.tileR + hexProperties.tileR) - initPosX;
                posY = Mathf.RoundToInt(y * (hexProperties.tileH + hexProperties.side)) - initPosY;

                if (x >= 0 && y >= 0)
                {
                    terrainVal = Mathf.Round(Chunk.ParentWorldManager.terrainData[x, y] / Chunk.ParentWorldManager.Altitudes) * Chunk.ParentWorldManager.Altitudes;
                    DrawHex(texture, posX, posY, new Color(terrainVal, terrainVal, terrainVal, 1));
                }
            }
        }
        texture.Apply();
        return texture;
    }


    void DrawHex(Texture2D texture, int centerX, int centerY, Color color)
    {
        int startX = 0, endX = 0;

        HexProperties hexProperties = Chunk.ParentWorldManager.HexProperties;

        for (int y = (int)hexProperties.height; y > 0; y--)
        {

            if (y < hexProperties.tileH) // TOP
            {
                startX = Mathf.FloorToInt(-(y / hexProperties.tileH * hexProperties.tileR));
                endX = Mathf.CeilToInt(y / hexProperties.tileH * hexProperties.tileR);
            }
            else if (y >= hexProperties.tileH && y <= hexProperties.side + hexProperties.tileH) // MIDDLE
            {
                startX = Mathf.FloorToInt(-hexProperties.tileR);
                endX = Mathf.CeilToInt(hexProperties.tileR);
            }
            else // BOTTOM
            {
                startX = Mathf.FloorToInt(-((hexProperties.height - y) / hexProperties.tileH * hexProperties.tileR));
                endX = Mathf.CeilToInt(((hexProperties.height - y) / hexProperties.tileH * hexProperties.tileR));
            }

            for (int x = startX; x < endX; x++)
            {
                if (x + centerX >= 0 && x + centerX <= chunkSize + 1 && y + centerY >= 0 && y + centerY <= chunkSize + 1)
                {
                    //if (x == 0 || y == 0 || x + centerX == chunkSize || y + centerY == chunkSize)
                    //    texture.SetPixel(x + centerX, y + centerY, new Color(color.r, color.g, color.b, 0));
                   // else
                        texture.SetPixel(x + centerX, y + centerY, color);
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
        
        Texture2D matTexture = material.GetProceduralTexture("Hexagon_Heights");

        for (int v = 0, z = 0; z <= chunkResolution; z++)
        {
            for (int x = 0; x <= chunkResolution; x++, v++)
            {

                vertices[v] = new Vector3(x * resStep / pixelsPerUnit,
                                          matTexture.GetPixel((int)(x * resStep), (int)(z * resStep)).grayscale * Chunk.ParentWorldManager.PixelToHeight, //Chunk.ParentWorldManager.terrainData[x + Chunk.TerrainDataX, z + Chunk.TerrainDataY] * Chunk.ParentWorldManager.PixelToHeight
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

    /*
    private void GenerateCollisionMesh()
    {

        Mesh meshCollider = new Mesh();
        Vector3[] colVertices = new Vector3[(terrainManager.chunkCollisionResolution + 1) * (terrainManager.chunkCollisionResolution + 1)];

        float quadSize = terrainManager.chunkCollisionResolution / chunkSize;


        float terrainSizeInUnits = terrainManager.terrainWidth / terrainManager.pixelsPerUnit;
        float unitsPerChunk = terrainSizeInUnits / (terrainManager.terrainWidth / terrainManager.chunkSize);
        float unitsPerRes = unitsPerChunk / terrainManager.chunkCollisionResolution;

        float stepSize = 1f / terrainManager.terrainWidth;
        float resScale = chunkSize / terrainManager.chunkCollisionResolution;


        for (int v = 0, z = 0; z <= terrainManager.chunkCollisionResolution; z++)
        {
            for (int x = 0; x <= terrainManager.chunkCollisionResolution; x++, v++)
            {
                colVertices[v] = new Vector3(x * unitsPerRes,
                                             terrainManager.hexTerrainData[Mathf.RoundToInt(x * (chunkSize / terrainManager.chunkCollisionResolution) + terrainDataX), Mathf.RoundToInt(z * (chunkSize / terrainManager.chunkCollisionResolution) + terrainDataY)] * terrainManager.resolutionHeight,
                                             z * unitsPerRes
                                             );
            }
        }

        meshCollider.vertices = colVertices;

        int[] triangles = new int[terrainManager.chunkCollisionResolution * terrainManager.chunkCollisionResolution * 6];
        for (int t = 0, v = 0, y = 0; y < terrainManager.chunkCollisionResolution; y++, v++)
        {
            for (int x = 0; x < terrainManager.chunkCollisionResolution; x++, v++, t += 6)
            {
                triangles[t] = v;
                triangles[t + 1] = v + terrainManager.chunkCollisionResolution + 1;
                triangles[t + 2] = v + 1;
                triangles[t + 3] = v + 1;
                triangles[t + 4] = v + terrainManager.chunkCollisionResolution + 1;
                triangles[t + 5] = v + terrainManager.chunkCollisionResolution + 2;
            }
        }
        meshCollider.triangles = triangles;


        GetComponent<MeshCollider>().sharedMesh = meshCollider;


    }
    */

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


}
