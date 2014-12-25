using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;


public partial class TerrainManagerViewModel 
{
    public float[,] terrainData;
    public Hex[,] hexGrid;

    public int MaxSize
    {
        get {
            return TerrainWidth * TerrainHeight;
        }
    }

}
