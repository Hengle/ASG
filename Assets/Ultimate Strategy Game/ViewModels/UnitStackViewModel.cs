using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;


public partial class UnitStackViewModel 
{
    //[Inject("TerrainManager")] public TerrainManagerViewModel TerrainManager { get; set; }

    public static TerrainManagerViewModel terrainManager;


    public override Hex ComputeHexLocation()
    {
        return Hex.GetHexAtPos(terrainManager, this.WorldPos);
    }

    public override Hex ComputeCalculateMovement()
    {
        //Debug.Log("Caculucating path " + Path.Count);

        // If no where to move too
        if (Path.Count == 0)
            return HexLocation;

        // IF arrived at destination
        if (HexLocation == Path.Last())
            return Path.Last();

        if (NextHexInPath == null)
            NextHexInPath = Path.First();

        if (Vector3.Distance(WorldPos, NextHexInPath.worldPos) < 0.5f)
        {
            // TODO: later calculate the cost of moving through this type of terrain
            MovePoints -= 1;

            if (MovePoints <= 0)
            {
                
            }

            NextHexInPath = Path[Path.IndexOf(HexLocation) + 1];
        }

        // Next path
        return Path[Path.IndexOf(HexLocation) + 1];
    }

    public override bool ComputeMovementCompleted()
    {
        if (PathDestination != null)
            return Vector3.Distance(WorldPos, PathDestination.worldPos) < 0.5f;
        else
            return false;
    }

}
