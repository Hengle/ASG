using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;


public partial class UnitStackViewModel 
{
    //[Inject("TerrainManager")] public TerrainManagerViewModel TerrainManager { get; set; }

    const float WithinHexDistance = 0.7f;

    public static TerrainManagerViewModel terrainManager;



    //public void SetPath (List<Hex> path)
    //{
    //    this.path = path;
    //    this.NextHexInPath
    //}


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

        // IF arrived at destination
        //if (HexLocation == Path.Last())
        //    return Path.Last();

        if (NextHexInPath == null)
            NextHexInPath = Path.First();

        if (MovePoints <= 0)
        {
            Controller.ExecuteCommand(this.StopMove);
            return null;
        }

        if (Vector3.Distance(WorldPos, NextHexInPath.worldPos) < WithinHexDistance)
        {
            MovePoints -= 1;

            for (int i = 0; i < Units.Count; i++)
            {
                Units[i].MovePoints -= 1;
            }

            Path.Remove(HexLocation);
            if (Path.IndexOf(HexLocation) + 1 < Path.Count)
            {
                NextHexInPath = Path[Path.IndexOf(HexLocation) + 1];
            }else{
                NextHexInPath = null;
            }
        }

        // if arrived at city destination


        // if arrived at settling location
        if (HexLocation == SettlingLocation)
        {
            //Debug.Log("Arrived at settlign location");
            Controller.ExecuteCommand(this.FoundCity, SettlingLocation);
        }

        // Next path
        return null;
    }

    public override bool ComputeMovementCompleted()
    {
        if (PathDestination != null)
            return Vector3.Distance(WorldPos, PathDestination.worldPos) < WithinHexDistance;
        else
            return false;
    }

    public bool CanMove()
    {
        return MovePoints > 0;
    }

    public bool CanMove(ModelCollection<UnitViewModel> units)
    {
        for (int i = 0; i < units.Count; i++)
        {
            if (units[i].MovePoints <= 0)
            {
                return false;
            }
        }

        return true;
    }

}
