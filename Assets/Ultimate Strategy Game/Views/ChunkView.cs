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


    public ChunkLOD[] chunkLods;

    [System.Serializable] 
    public class ChunkLOD
    {
        public int resolution;
        public float distance;
    }


    public Texture2D hexHeightmap;
    public Texture2D hexBiomeMap;


    public static ProceduralMaterial substance;
    public static Texture2D substanceTexture2D;



    private static Vector3[] vertices;
    private static Vector3[] normals;
    private static Vector2[] uv;



    public override void Start()
    {
        base.Start();
    }

    public override void GenerateChunkExecuted()
    {

        GenerateTextures();
        UpdateCollisions();
        GenerateLODs();
        
       
        

        vertices = null;
        normals = null;
        uv = null;
    }

    public override void UpdateChunkExecuted()
    {
        base.UpdateChunkExecuted();
    }
    
    public void GenerateLODs()
    {
        GetComponent<MeshFilter>().mesh = UpdateMesh(chunkLods[0].resolution);

        LOD[] lods = new LOD[chunkLods.Length];
        Renderer[] lodRenderers = new Renderer[1];

        // Heighest detail
        lodRenderers[0] = GetComponent<Renderer>();

        lods[0].renderers = lodRenderers;
        lods[0].screenRelativeTransitionHeight = chunkLods[0].distance;

        for (int i = 1; i < chunkLods.Length; i++)
        {
            Renderer[] lodRenderers2 = new Renderer[1];
            lodRenderers2[0] = GenerateLOD(chunkLods[i].resolution);
            lods[i].renderers = lodRenderers2;
            lods[i].screenRelativeTransitionHeight = chunkLods[i].distance;
        }


        // Make it live!
        GetComponent<LODGroup>().SetLODS(lods);
        GetComponent<LODGroup>().RecalculateBounds();
    }

    public Renderer GenerateLOD(int res)
    {
        GameObject chunk = new GameObject();
        chunk.transform.position = transform.position;
        chunk.transform.parent = transform;
        chunk.name = "Chunk " + res;


        MeshFilter meshFilter = chunk.AddComponent<MeshFilter>();
        MeshRenderer meshRenderer = chunk.AddComponent<MeshRenderer>();

        meshFilter.mesh = UpdateMesh(res);
        meshRenderer.sharedMaterial = substance;

        return chunk.GetComponent<Renderer>();
    }

    public void GenerateTextures ()
    {
        //Timer.Start("Generating texture");
        // Texture generation
        substance = GetComponent<Renderer>().material as ProceduralMaterial;
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
        //Timer.End();
    }


    private Mesh UpdateMesh(int res)
    {
        Mesh mesh = new Mesh();
        mesh.Clear();
        
        // Pixels per vetex point
        float resStep = (float)chunkSize / (float)res;
        float heightmapStep = (float)substanceTexture2D.width / (float)res;
        float uvStep = 1f / chunkSize;

        vertices = new Vector3[(res + 1) * (res + 1)];
        normals = new Vector3[vertices.Length];
        uv = new Vector2[vertices.Length];


        for (int v = 0, z = 0; z <= res; z++)
        {
            for (int x = 0; x <= res; x++, v++)
            {
                vertices[v] = new Vector3(Mathf.Clamp(x * resStep / pixelsPerUnit, 0, res * resStep / pixelsPerUnit),
                                          substanceTexture2D.GetPixel((int)(x * heightmapStep), (int)(z * heightmapStep)).grayscale * Chunk.TerrainManager.PixelToHeight,
                                          Mathf.Clamp(z * resStep / pixelsPerUnit, 0, res * resStep / pixelsPerUnit)
                                          );

                normals[v] = Vector3.up;
                uv[v] = new Vector2(x * resStep * uvStep, z * resStep * uvStep);
            }
        }

        mesh.vertices = vertices;
        mesh.normals = normals;
        mesh.uv = uv;

        int[] triangles = new int[res * res * 6];
        for (int t = 0, v = 0, y = 0; y < res; y++, v++)
        {
            for (int x = 0; x < res; x++, v++, t += 6)
            {
                triangles[t] = v;
                triangles[t + 1] = v + res + 1;
                triangles[t + 2] = v + 1;
                triangles[t + 3] = v + 1;
                triangles[t + 4] = v + res + 1;
                triangles[t + 5] = v + res + 2;
            }
        }
        mesh.triangles = triangles;

        CalculateNormals(res);
        TangentSolver.Solve(mesh);
        mesh.Optimize();
        return mesh;
    }

    private Mesh GenerateMesh(int resolution)
    {
        Mesh mesh = new Mesh();

        // Pixels per vetex point
        float resStep = (float)chunkSize / (float)resolution;
        float heightmapStep = (float)substanceTexture2D.width / (float)resolution;
        float uvStep = 1f / chunkSize;

        vertices = new Vector3[(resolution + 1) * (resolution + 1)];
        normals = new Vector3[vertices.Length];
        uv = new Vector2[vertices.Length];


        for (int v = 0, z = 0; z <= resolution; z++)
        {
            for (int x = 0; x <= resolution; x++, v++)
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

        int[] triangles = new int[resolution * resolution * 6];
        for (int t = 0, v = 0, y = 0; y < resolution; y++, v++)
        {
            for (int x = 0; x < resolution; x++, v++, t += 6)
            {
                triangles[t] = v;
                triangles[t + 1] = v + resolution + 1;
                triangles[t + 2] = v + 1;
                triangles[t + 3] = v + 1;
                triangles[t + 4] = v + resolution + 1;
                triangles[t + 5] = v + resolution + 2;
            }
        }
        mesh.triangles = triangles;

        CalculateNormals(resolution);
        TangentSolver.Solve(mesh);
        mesh.Optimize();
        return mesh;
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


    private static float GetXDerivative(int x, int z, int resolution)
    {
        int rowOffset = z * (resolution + 1);
        float left, right, scale;
        if (x > 0)
        {
            left = vertices[rowOffset + x ].y;
            if (x < resolution)
            {
                right = vertices[rowOffset + x + 1].y;
                scale = 0.5f * resolution;
            }
            else
            {
                right = vertices[rowOffset + x].y;
                scale = resolution;
            }
        }
        else
        {
            left = vertices[rowOffset + x].y;
            right = vertices[rowOffset + x + 1].y;
            scale = resolution;
        }
        return (right - left) * scale;
    }

    private static float GetZDerivative(int x, int z, int resolution)
    {
        int rowLength = resolution + 1;
        float back, forward, scale;
        if (z > 0)
        {
            back = vertices[(z ) * rowLength + x].y;
            if (z < resolution)
            {
                forward = vertices[(z + 1) * rowLength + x].y;
                scale = 0.5f * resolution;
            }
            else
            {
                forward = vertices[z * rowLength + x].y;
                scale = resolution;
            }
        }
        else
        {
            back = vertices[z * rowLength + x].y;
            forward = vertices[(z + 1) * rowLength + x].y;
            scale = resolution;
        }
        return (forward - back) * scale;
    }

    private static void CalculateNormals(int resolution)
    {
        for (int v = 0, z = 0; z <= resolution; z++)
        {
            for (int x = 0; x <= resolution; x++, v++)
            {
                normals[v] = new Vector3(-GetXDerivative(x, z, resolution), 1f, -GetZDerivative(x, z, resolution)).normalized;
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

    public static void StitchChunks(Mesh chunk1, Mesh chunk2, int resolution, int side)
    {
        float[] heights1 = new float[resolution + 1];
        
        vertices = chunk1.vertices;
        Vector3[] vertices2 = chunk2.vertices;


        for (int z = 0, v = 0; z <= resolution; z++)
        {
            for (int x = 0; x <= resolution; x++, v++)
            {

                if (z == resolution && side == 0)
                {
                    heights1[x] = vertices[v].y;
                }

                if (x == resolution && side == 1)
                {
                    vertices2[z + z * resolution].y = vertices[v].y;
                }
            }
        }

        for (int x = 0; x <= resolution; x++)
        {
            vertices2[x].y = heights1[x];
        }

        chunk1.vertices = vertices;
        chunk2.vertices = vertices2;
    }
}