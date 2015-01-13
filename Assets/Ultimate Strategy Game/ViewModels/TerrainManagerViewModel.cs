using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;


public partial class TerrainManagerViewModel 
{
    public float[,] terrainData;

    public Hex[,] hexGrid;
    public List<Hex> waterTiles;

    public ChunkViewModel[,] Chunks;


    public int chunkHexCountX;
    public int chunkHexCountY;

    public int chunkCountX;
    public int chunkCountY;



    public int GridSize
    {
        get {
            return TerrainWidth * TerrainHeight;
        }
    }

}
