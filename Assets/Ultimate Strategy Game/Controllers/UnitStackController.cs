using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class UnitStackController : UnitStackControllerBase {


    public override void InitializeUnitStack(UnitStackViewModel unitStack)
    {
        Debug.Log("initilized");

    }


    public override void NextTurnCalculation(UnitStackViewModel unitStack)
    {
        base.NextTurnCalculation(unitStack);

        unitStack.MovePoints = unitStack.MovePointsTotal;

    }

    public override void AddUnitToStack(UnitStackViewModel unitStack, UnitViewModel unit)
    {
        unitStack.Units.Add(unit);
        unitStack.LeadingUnit = unitStack.Units[0];
    }

    /*
     *  CLEAN UP THE CODE WHEN GET BACK!
     */


    public override void Move(UnitStackViewModel unitStack, Hex pathDestination)
    {
        Debug.Log("Executing move");
        // TODO: Check if hex is valid
        if (pathDestination == null)
        {
            Debug.Log("Not valid hex to move to! " + pathDestination);
            return;
        }

        if (unitStack.MovePoints <= 0)
        {
            Debug.Log("Not enough movement points");
            return;
        }


        unitStack.ActionState = UnitActionState.None;

        // Clear the previous path
        unitStack.Path.Clear();

        // Then assign the new one
        List<Hex> path = Pathfinding.FindPath(unitStack.HexLocation, pathDestination);
        if (path != null) unitStack.Path.AddRange(path);

        unitStack.PathDestination = pathDestination;
        unitStack.NextHexInPath = unitStack.Path[0];
    }


    public override void StopMove(UnitStackViewModel unitStack)
    {
        base.StopMove(unitStack);

        unitStack.ActionState = UnitActionState.None;

    }

    public override void PlanMovement(UnitStackViewModel unitStack)
    {
        unitStack.ActionState = UnitActionState.PlanningMovement;

        EvaluateMovementPath(unitStack, unitStack.ParentPlayer.SelectedHex);
        unitStack.ParentPlayer._SelectedHexProperty.Subscribe(hex => EvaluateMovementPath(unitStack, hex)).DisposeWhenChanged(unitStack._ActionStateProperty);
        
    }

    public override void EvaluateMovementPath(UnitStackViewModel unitStack, Hex destination)
    {
        unitStack.PlanedPath.Clear();
        List<Hex> path = Pathfinding.FindPath(unitStack.HexLocation, destination);
        if (path != null) unitStack.PlanedPath.AddRange(path);
    }

}
