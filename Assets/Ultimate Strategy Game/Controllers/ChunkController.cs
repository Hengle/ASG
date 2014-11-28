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
        return base.CreateChunk();
        
    }

}
