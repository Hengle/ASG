using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class UnitController : UnitControllerBase {
    
    public override void InitializeUnit(UnitViewModel unit) {
    }

    public override void Move(UnitViewModel unit, Hex toHex)
    {
        // TODO: Check if hex is valid
        if (toHex == null)
        {
            Debug.Log("Not valid hex to move to! " + toHex);
            return;
        }

        unit.ToHexLocation = toHex;

        // Clear the previous path
        unit.MovementPath.Clear();

        // Then assign the new one
        List<Hex> path = Pathfinding.GetPath(unit.HexLocation, toHex, 0);
        if (path != null) unit.MovementPath.AddRange(path);
    }

    public override void WorldPosToHexLocation(UnitViewModel unit, Vector3 pos)
    {
        unit.HexLocation = Hex.GetHexAtPos(TerrainManager, pos);
    }

}
