using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class WorldManagerView 
{

    public Texture2D terrainHeightMap;

    public GameObject chunkPrefab;



    void Update ()
    {
        if (Input.GetKeyDown(KeyCode.G))
        {
            ExecuteGenerateMap();
        }
    }


    /// Invokes GenerateMapExecuted when the GenerateMap command is executed.
    public override void GenerateMapExecuted() {
        base.GenerateMapExecuted();
        terrainHeightMap = TerrainDataToHeightMap(WorldManager.terrainData);
    }

    /// Invokes GenerateChunksExecuted when the GenerateChunks command is executed.
    public override void GenerateChunksExecuted() {
        base.GenerateChunksExecuted();

    }

    /// This binding will add or remove views based on an element/viewmodel collection.
    public override ViewBase CreateChunksView(ChunkViewModel item) 
    {
        ViewBase chunkView = InstantiateView(chunkPrefab, item, new Vector3(item.ChunkX * (WorldManager.ChunkSize / WorldManager.PixelsPerUnit), 0, item.ChunkY * (WorldManager.ChunkSize / WorldManager.PixelsPerUnit)), Quaternion.identity);
        chunkView.gameObject.name = "Chunk [" + item.TerrainDataX + "," + item.TerrainDataY + "]";

        return chunkView;
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void ChunksAdded(ViewBase item) {
        base.ChunksAdded(item);
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void ChunksRemoved(ViewBase item) {
        base.ChunksRemoved(item);
    }
 

    /// <summary>
    /// Converts the terrain data to a heightmap texture.
    /// </summary>
    private Texture2D TerrainDataToHeightMap(float[,] data)
    {
        int timer = System.Environment.TickCount;

        float height;
        Texture2D texture = new Texture2D(data.GetLength(0), data.GetLength(1));

        for (int x = 0; x < data.GetLength(0); x++)
        {
            for (int y = 0; y < data.GetLength(1); y++)
            {
                height = Mathf.Round(data[x, y] / 0.16f) * 0.16f;
                texture.SetPixel(x, y, new Color(height, height, height));
            }
        }

        texture.Apply();

        Debug.Log("Data to biome: " + ((System.Environment.TickCount - timer) / 100f) + "ms");

        return texture;
    }

    /*
    private void CreateChunk ()
    {
        int chunkHexCountX = (int)(WorldManager.chunkSize / WorldManager.hexProperties.width);
        int chunkHexCountY = (int)(WorldManager.chunkSize / (WorldManager.hexProperties.tileH + WorldManager.hexProperties.side));

        int chunkCountX = Mathf.CeilToInt(WorldManager.terrainWidth * WorldManager.hexProperties.width / (float)WorldManager.chunkSize);
        int chunkCountY = Mathf.CeilToInt(WorldManager.terrainHeight * WorldManager.hexProperties.height / (float)WorldManager.chunkSize);

        //chunks = new Texture2D[chunkCountX, chunkCountY];

        for (int x = 0; x < chunkCountX; x++)
        {
            for (int y = 0; y < chunkCountY; y++)
            {
                GameObject chunk = Instantiate(chunkPrefab, new Vector3(x * 10, 0, y * 10), Quaternion.identity) as GameObject;
                chunk.name = "Chunk [" + x + "," + y + "]";
                chunks[x, y] = new Texture2D(WorldManager.chunkSize, WorldManager.chunkSize);
                chunks[x, y].wrapMode = TextureWrapMode.Clamp;
                GenerateChunkHexes(chunks[x, y], x * chunkHexCountX, y * chunkHexCountY);
                chunk.renderer.material.mainTexture = chunks[x, y];
            }
        }

        chunkTexture = DataToBiomeMap(terrainData);
    }
    */
}
