using UnityEngine;
using System.Collections;

/// <summary>
/// The hex chunck is responsible for generationg and update it's part of the terrain
/// </summary>
public class HexChunk : MonoBehaviour 
{

    private TerrainManager terrainManager;

    private int terrainDataX, terrainDataY, chunkSize, chunkResolution, collisionResolution;


    private Vector3[] vertices;
    private Vector3[] normals;


    public Texture2D texture;


    public void Initialize(int terrainDataX, int terrainDataY, int chunkSize, int chunkResolution, int collisionResolution, TerrainManager terrainManager)
    {
        this.terrainDataX = terrainDataX;
        this.terrainDataY = terrainDataY;
        this.chunkSize = chunkSize;
        this.chunkResolution = chunkResolution;
        this.collisionResolution = collisionResolution;
        this.terrainManager = terrainManager;

        GenerateChunk();
    }

    public void GenerateChunk ()
    {
        GenerateMesh();
        GenerateCollisionMesh();
        GenerateTexture();
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

                vertices[v] = new Vector3(x * resStep / terrainManager.pixelsPerUnit,
                                          terrainManager.hexTerrainData[Mathf.RoundToInt(x * (chunkSize / chunkResolution) + terrainDataX), Mathf.RoundToInt(z * (chunkSize / chunkResolution) + terrainDataY)] * terrainManager.resolutionHeight,
                                          z * resStep / terrainManager.pixelsPerUnit
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

    /// <summary>
    /// Converts the terrain data to a texture for the chunk
    /// </summary>
    private void GenerateTexture()
    {
        texture = new Texture2D(chunkSize, chunkSize);
        texture.wrapMode = TextureWrapMode.Clamp;
        //texture.filterMode = FilterMode.Point;  
        for (int x = 0; x < chunkSize; x++)
            for (int y = 0; y < chunkSize; y++)
                texture.SetPixel(x, y, terrainManager.terrainAltitudeColors.Evaluate(terrainManager.hexTerrainData[x + terrainDataX, y + terrainDataY]));

        texture.Apply();
        GetComponent<Renderer>().material.mainTexture = texture;
    }


}
