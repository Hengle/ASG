using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class ChunkController : ChunkControllerBase {
    
    public override void InitializeChunk(ChunkViewModel chunk) 
    {
        GenerateChunk(chunk);
    }

    public override ChunkViewModel CreateChunk()
    {
        ChunkViewModel chunk = base.CreateChunk();
        chunk.TerrainManager = TerrainManager;
        return chunk;
    }

    public override void SaveChunkHexTexture(ChunkViewModel chunk)
    {
        base.SaveChunkHexTexture(chunk);
        Debug.Log("exec save");
    }

}
