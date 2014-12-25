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
        List<Hex> path = Pathfinding.FindPath(unitStack.HexLocation, pathDestination, TerrainManager.MaxSize);
        if (path != null) unitStack.Path.AddRange(path);
    }

    public override void AddUnitToStack(UnitStackViewModel unitStack, UnitViewModel unit)
    {
        unitStack.Units.Add(unit);
        unitStack.LeadingUnit = unitStack.Units[0];
    }

    public override void PlanMovement(UnitStackViewModel unitStack)
    {
        unitStack.ActionState = UnitActionState.PlanningMovement;
        unitStack.ParentPlayer._SelectedHexProperty.Subscribe(hex => EvaluateMovementPath(unitStack, hex)).DisposeWhenChanged(unitStack._ActionStateProperty);
    }

    public override void EvaluateMovementPath(UnitStackViewModel unitStack, Hex destination)
    {
        //unitStack.PlanedPath = Pathfinding.FindPath(unitStack.HexLocation, destination);
    }

}
