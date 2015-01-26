using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
using System.IO;


public partial class ChunkView
{

    public static int chunkSize, chunkResolution, collisionResolution, pixelsPerUnit;


    public Texture2D hexHeightmap;
    public Texture2D hexBiomeMap;


    public static ProceduralMaterial substance;
    public static Texture2D substanceTexture2D;




    private static Vector3[] vertices;
    private static Vector3[] normals;
    private static Vector2[] uv;


    public override void GenerateChunkExecuted()
    {

        GenerateTextures();
        UpdateMesh();
        UpdateCollisions();

        /*
        LOD[] lods = new LOD[2];
 
        Renderer[] lodRenderers = new Renderer[1];
        lodRenderers[0] = GetComponent<MeshFilter>().renderer;
 
        // Assign list to LOD 0.  Do the same for others
        lods[0].renderers = lodRenderers;
        lods[0].screenRelativeTransitionHeight = 50;
        lods[1].screenRelativeTransitionHeight = 10;

        // Make it live!
        GetComponent<LODGroup>().SetLODS(lods);
        GetComponent<LODGroup>().RecalculateBounds();
        */

        vertices = null;
        normals = null;
        uv = null;
    }

    public override void UpdateChunkExecuted()
    {
        base.UpdateChunkExecuted();
    }


    public void GenerateTextures ()
    {
        // Texture generation
        substance = renderer.material as ProceduralMaterial;
        substance.isReadable = true;

        // Set the substance input textures
        substance.SetProceduralTexture("biome_map", hexBiomeMap);
        substance.SetProceduralTexture("heightmap", hexHeightmap);
        substance.RebuildTexturesImmediately();

        // Get the newly generated substance heightmap
        ProceduralTexture substanceTexture = substance.GetGeneratedTexture("Terrain_heightmap");

        // Convert it to a Texture2D
        substanceTexture2D = new Texture2D(substanceTexture.width, substanceTexture.height, TextureFormat.ARGB32, false);
        substanceTexture2D.SetPixels32(substanceTexture.GetPixels32(0, 0, substanceTexture.width, substanceTexture.height));
        //substanceTexture2D.Apply();
        substanceTexture2D.wrapMode = TextureWrapMode.Clamp;

        for (int i = 0; i < substance.GetGeneratedTextures().Length; i++)
        {
            substance.GetGeneratedTexture(substance.GetGeneratedTextures()[i].name).wrapMode = TextureWrapMode.Clamp;
        }

    }


    private void UpdateMesh()
    {
        Mesh mesh = GetComponent<MeshFilter>().mesh;
        mesh.Clear();

        // Pixels per vetex point
        float resStep = (float)chunkSize / (float)chunkResolution;
        float heightmapStep = (float)substanceTexture2D.width / (float)chunkResolution;
        float uvStep = 1f / chunkSize;

        vertices = new Vector3[(chunkResolution + 1) * (chunkResolution + 1)];
        normals = new Vector3[vertices.Length];
        uv = new Vector2[vertices.Length];


        for (int v = 0, z = 0; z <= chunkResolution; z++)
        {
            for (int x = 0; x <= chunkResolution; x++, v++)
            {
                vertices[v] = new Vector3(x * resStep / pixelsPerUnit,
                                          substanceTexture2D.GetPixel((int)(x * heightmapStep), (int)(z * heightmapStep)).grayscale * Chunk.TerrainManager.PixelToHeight,
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
        TangentSolver.Solve(mesh);
        mesh.Optimize();
    }


    private void UpdateCollisions()
    {

        Mesh meshCollider = new Mesh();
        vertices = new Vector3[(collisionResolution + 1) * (collisionResolution + 1)];

        // Pixels per vetex point
        float resStep = chunkSize / collisionResolution;
        float heightmapStep = (float)substanceTexture2D.width / (float)collisionResolution;


        for (int v = 0, z = 0; z <= collisionResolution; z++)
        {
            for (int x = 0; x <= collisionResolution; x++, v++)
            {
                vertices[v] = new Vector3(x * resStep / pixelsPerUnit,
                                             substanceTexture2D.GetPixel((int)(x * heightmapStep), (int)(z * heightmapStep)).grayscale * Chunk.TerrainManager.PixelToHeight,
                                             z * resStep / pixelsPerUnit
                                             );
            }
        }

        meshCollider.vertices = vertices;

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

        meshCollider = null;
    }


    private static float GetXDerivative(int x, int z)
    {
        int rowOffset = z * (chunkResolution + 1);
        float left, right, scale;
        if (x > 0)
        {
            left = vertices[rowOffset + x ].y;
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

    private static float GetZDerivative(int x, int z)
    {
        int rowLength = chunkResolution + 1;
        float back, forward, scale;
        if (z > 0)
        {
            back = vertices[(z ) * rowLength + x].y;
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

    private static void CalculateNormals()
    {
        for (int v = 0, z = 0; z <= chunkResolution; z++)
        {
            for (int x = 0; x <= chunkResolution; x++, v++)
            {
                normals[v] = new Vector3(-GetXDerivative(x, z), 1f, -GetZDerivative(x, z)).normalized;
            }
        }
    }

    public override void SaveChunkHexTextureExecuted()
    {
        Debug.Log("Saving chunk");
        // Set the substance input textures
        substance.SetProceduralTexture("biome_map", hexBiomeMap);
        substance.SetProceduralTexture("heightmap", hexHeightmap);
        substance.RebuildTexturesImmediately();
        
        /*base.ExecuteSaveChunkHexTexture();
        byte[] data = hexBiomeMap.EncodeToPNG();
        File.WriteAllBytes(Application.dataPath + "/chunk.png", data);*/
    }

 

    /*   0 
     * 3   1
     *   2  
     */

    public static void StitchChunks(Mesh chunk1, Mesh chunk2, int side)
    {
        float[] heights1 = new float[chunkResolution + 1];
        
        vertices = chunk1.vertices;
        Vector3[] vertices2 = chunk2.vertices;
        

        for (int z = 0, v = 0; z <= chunkResolution; z++)
        {
            for (int x = 0; x <= chunkResolution; x++, v++)
            {

                if (z == chunkResolution && side == 0)
                {
                    heights1[x] = vertices[v].y;
                }

                if (x == chunkResolution && side == 1)
                {
                    vertices2[z + z * chunkResolution].y = vertices[v].y;
                }
            }
        }

        for (int x = 0; x <= chunkResolution; x++)
        {
            vertices2[x].y = heights1[x];
        }

        chunk1.vertices = vertices;
        chunk2.vertices = vertices2;
    }
}