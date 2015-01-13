using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;


public partial class UnitStackViewModel 
{
    //[Inject("TerrainManager")] public TerrainManagerViewModel TerrainManager { get; set; }

    public static TerrainManagerViewModel terrainManager;

 /*
    public override Hex ComputeHexLocation()
    {
        return Hex.GetHexAtPos(terrainManager, this.WorldPos);
    }*/

    public override Hex ComputeCalculateMovement()
    {
        //Debug.Log("Caculucating path " + Path.Count);

        // If no where to move too
        if (Path.Count == 0)
            return HexLocation;

        // if arrived at settling location
        if (HexLocation == SettlingLocation)
        {
            //Debug.Log("Arrived at settlign location");
            Controller.ExecuteCommand(this.FoundCity, SettlingLocation);
            return null;
        }

        // IF arrived at destination
        if (HexLocation == Path.Last())
            return Path.Last();

        if (NextHexInPath == null)
            NextHexInPath = Path.First();

        if (MovePoints <= 0)
        {
            Controller.ExecuteCommand(this.StopMove);
            return null;
        }

        if (Vector3.Distance(WorldPos, NextHexInPath.worldPos) < 1f)
        {
            // TODO: later calculate the cost of moving through this type of terrain
            // TODO: calcualte prorper view range for units
            MovePoints -= 1;

            Path.Remove(HexLocation);
            NextHexInPath = Path[Path.IndexOf(HexLocation) + 1];


            //Controller.ExecuteCommand(terrainManager.ParentFogOfWar.UpdateUnitView, this);

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
