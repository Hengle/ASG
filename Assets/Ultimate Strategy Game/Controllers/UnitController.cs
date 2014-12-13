using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class UnitController : UnitControllerBase {
    
    public override void InitializeUnit(UnitViewModel unit) {
    }

    public override void Move(UnitViewModel unit, Hex arg)
    {
        //base.Move(unit, arg);

        // TODO: Check if hex is valid
        if (arg == null)
        {
            Debug.Log("Not valid hex to move to!");
            return;
        }

        // Clear the previous path
        unit.MovementPath.Clear();
        // Then assign the new one
        unit.MovementPath.AddRange(Pathfinding.GetPath(unit.HexLocation, arg, 0));
    }

}
