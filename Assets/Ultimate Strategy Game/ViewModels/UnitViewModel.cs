using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;


public partial class UnitViewModel 
{
    //[Inject("TerrainManager")] public TerrainManagerViewModel TerrainManager { get; set; }

    public static TerrainManagerViewModel terrainManager;

    public override Hex ComputeHexLocation()
    {
        return Hex.GetHexAtPos(terrainManager, this.WorldPos);
    }

    public override Hex ComputeCalculateMovement()
    {
        //Debug.Log("Caculucating path " + MovementPath.Count);

        // If no where to move too
        if (MovementPath.Count == 0)
            return HexLocation;

        // IF arrived at destination
        if (HexLocation == MovementPath.Last())
            return MovementPath.Last();

        if (NextHexInPath == null)
            NextHexInPath = MovementPath.First();

        if (Vector3.Distance(WorldPos, NextHexInPath.worldPos) < 0.5f)
        {
            // TODO: later calculate the cost of moving through this type of terrain
            MovementPoints -= 1;

            if (MovementPoints <= 0)
            {

            }

            NextHexInPath = MovementPath[MovementPath.IndexOf(HexLocation) + 1];
        }

        // Next path
        return MovementPath[MovementPath.IndexOf(HexLocation) + 1];
    }

    public override bool ComputeMovementCompleted()
    {
        if (ToHexLocation != null)
            return Vector3.Distance(WorldPos, ToHexLocation.worldPos) < 0.5f;
        else
            return false;
    }

}
