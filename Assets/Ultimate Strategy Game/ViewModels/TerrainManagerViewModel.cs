using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;


public partial class TerrainManagerViewModel 
{
    public float[,] terrainData;

    public Hex[,] hexGrid;
    public List<Hex> riverTiles = new List<Hex>();
    public List<Hex> waterTiles;

    public ChunkViewModel[,] Chunks;


    public int chunkHexCountX;
    public int chunkHexCountY;

    public int chunkCountX;
    public int chunkCountY;

    
    //public List<Biome> biomes;


    public Hex GetRandomLandTile()
    {
        return hexGrid[(int)UnityEngine.Random.Range(0, TerrainWidth), (int)UnityEngine.Random.Range(0, TerrainHeight)];
    }

    public Hex GetRandomWaterTile ()
    {
        return waterTiles[(int)UnityEngine.Random.Range(0, waterTiles.Count)];
    }


    public int GridSize
    {
        get {
            return TerrainWidth * TerrainHeight;
        }
    }

}
