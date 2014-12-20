using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class UnitStackController : UnitStackControllerBase {


    public override void InitializeUnitStack(UnitStackViewModel unitStack)
    {
    }

    public override void Move(UnitStackViewModel unitStack, Hex pathDestination)
    {
        // TODO: Check if hex is valid
        if (pathDestination == null)
        {
            Debug.Log("Not valid hex to move to! " + pathDestination);
            return;
        }

        unitStack.PathDestination = pathDestination;

        // Clear the previous path
        unitStack.Path.Clear();

        // Then assign the new one
        List<Hex> path = Pathfinding.GetPath(unitStack.HexLocation, pathDestination, 0);
        if (path != null) unitStack.Path.AddRange(path);
    }

    public override void WorldPosToHexLocation(UnitStackViewModel unitStack, Vector3 pos)
    {
        unitStack.HexLocation = Hex.GetHexAtPos(TerrainManager, pos);
    }

}
