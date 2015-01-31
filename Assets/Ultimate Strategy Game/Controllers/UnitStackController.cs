using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class UnitStackController : UnitStackControllerBase {


    [Inject] public CityController CityController { get; set; }

    public override void InitializeUnitStack(UnitStackViewModel unitStack)
    {
        // Calculate hex
        unitStack.WorldPosProperty.Subscribe(pos => CalculateHexLocation(unitStack, pos));


        // make sure to later dispose of this command somehow
        //ExecuteCommand(FogOfWar.CalculateFOW, unitStack);
        unitStack.HexLocationProperty.Subscribe(hex => ExecuteCommand(FogOfWar.CalculateFOW, unitStack.ParentFaction));



        // If the unit is not selected the player cannot plan actions with it!
        unitStack.SelectedProperty.Subscribe(selected =>
        {
            if (selected == false)
            {
                unitStack.PlannedAction = PlanedAction.None;
            }
        });

    }

    public override void Select(UnitStackViewModel unitStack)
    {
        unitStack.Selected = true;
    }

    public override void Deselect(UnitStackViewModel unitStack)
    {
        unitStack.Selected = false;
        unitStack.PlannedAction = PlanedAction.None;
    }

    public void CalculateHexLocation(UnitStackViewModel unitStack, Vector3 pos)
    {
        // Make sure that we only assign a hex value if 
        // our position is in a new hex
        Hex hex = Hex.GetHexAtPos(TerrainManager, pos);
        if (unitStack.HexLocation != hex)
        {
            unitStack.HexLocation = hex;
        }
    }

    public override void NextTurnCalculation(UnitStackViewModel unitStack)
    {
        base.NextTurnCalculation(unitStack);

        unitStack.MovePoints = unitStack.MovePointsTotal;

    }

    public override void AddUnit(UnitStackViewModel unitStack, UnitViewModel unit)
    {
        unitStack.Units.Add(unit);
        unitStack.LeadingUnit = unitStack.Units[0];
    }

    public override void RemoveUnit(UnitStackViewModel unitStack, UnitViewModel unit)
    {
        unitStack.Units.Remove(unit);

        if (unitStack.Units.Count == 0)
        {
            ExecuteCommand(unitStack.DestroyStack, unitStack);
            return;
        }

        unitStack.LeadingUnit = unitStack.Units[0];
    }

    public override void DestroyStack(UnitStackViewModel unitStack)
    {
        for (int i = 0; i < unitStack.Units.Count; i++)
        {
            ExecuteCommand(unitStack.RemoveUnit, unitStack.Units[i]);
        }
    }

    public override void PlanMovement(UnitStackViewModel unitStack)
    {
        unitStack.PlannedAction = PlanedAction.Move;

        ExecuteCommand(unitStack.EvaluateMovementPath, unitStack.ParentPlayer.SelectedHex);

        unitStack.ParentPlayer._SelectedHexProperty.Subscribe(hex => ExecuteCommand(unitStack.EvaluateMovementPath, hex)).DisposeWhenChanged(unitStack._PlannedActionProperty);
    }

    public override void PlanSettling(UnitStackViewModel unitStack)
    {

        // apparently starts lags if spams the plan setling actions
        unitStack.PlannedAction = PlanedAction.Settle;

        // Evaluate every time the selected hex changes

        ExecuteCommand(unitStack.EvaluateMovementPath, unitStack.ParentPlayer.SelectedHex);
        unitStack.ParentPlayer._SelectedHexProperty.Subscribe(hex => ExecuteCommand(unitStack.EvaluateMovementPath, hex)).DisposeWhenChanged(unitStack._PlannedActionProperty);

        ExecuteCommand(unitStack.EvaluateSettlingLocation, unitStack.ParentPlayer.SelectedHex);
        unitStack.ParentPlayer._SelectedHexProperty.Subscribe(hex => ExecuteCommand(unitStack.EvaluateSettlingLocation, hex)).DisposeWhenChanged(unitStack._PlannedActionProperty);

    }



    public override void EvaluateMovementPath(UnitStackViewModel unitStack, Hex destination)
    {
        unitStack.Path.Clear();

        List<Hex> path = Pathfinding.FindPath(unitStack.HexLocation, destination);
        if (path != null)
        {
            unitStack.Path.AddRange(path);
        }
    }

    public override void EvaluateSettlingLocation(UnitStackViewModel unitStack, Hex hex)
    {
        unitStack.PlannedSettlingLocation = hex;
    }


    public override void Move(UnitStackViewModel unitStack, Hex destination)
    {

        unitStack.PlannedAction = PlanedAction.None;

        if (destination == null)
        {
            Debug.Log("Cannot move to null");
            return;
        }

        if (unitStack.MovePoints <= 0)
        {
            Debug.Log("Out of msovement points");
            return;
        }

        if (unitStack.HexLocation == destination)
        {
            Debug.Log("Already at destiantion");
            return;
        }


        // Clear the previous path
        unitStack.Path.Clear();

        // Find a new path
        List<Hex> path = Pathfinding.FindPath(unitStack.HexLocation, destination);

        if (path == null)
        {
            Debug.Log("Couldn't find path");
        }

        unitStack.Path.AddRange(path);
        

        unitStack.PathDestination = destination;
        unitStack.NextHexInPath = unitStack.Path[0];
    }

    public override void MoveSelectedUnits(UnitStackViewModel unitStack, Hex destination)
    {
        if (destination == null)
        {
            Debug.Log("Cannot move to null");
            return;
        }

        if (unitStack.HexLocation == destination)
        {
            Debug.Log("Already at destiantion");
            return;
        }
        
        // TODO
        //if (unitStack.HexLocation.UnitStack)
        //{

        //}
        
        ModelCollection<UnitViewModel> units = unitStack.ParentPlayer.SelectedUnits;

        for (int i = 0; i < units.Count; i++)
        {
            if (units[i].MovePoints <= 0)
            {
                return;
            }
        }

        if (units.Count == 0) return;
        

        // Find the path that the stack will take
        List<Hex> path = Pathfinding.FindPath(unitStack.HexLocation, destination);

        if (path == null)
        {
            Debug.Log("Couldn't find path");
        }

        Hex splitToHex = path[0];

        UnitStackViewModel newUnitStack = new UnitStackViewModel(UnitStackController)
        {
            Owner = unitStack.ParentFaction.ParentPlayer,
            ParentFaction = unitStack.ParentFaction,
            HexLocation = splitToHex,
        };
        newUnitStack.ParentFaction.UnitStacks.Add(newUnitStack);
        

        for (int i = 0; i < units.Count; i++)
        {
            ExecuteCommand(unitStack.RemoveUnit, units[i]);
            ExecuteCommand(newUnitStack.AddUnit, units[i]);
        }

        newUnitStack.Owner = unitStack.ParentFaction.ParentPlayer;


        ExecuteCommand(unitStack.ParentFaction.ParentPlayer.SelectUnitStack, newUnitStack);
        ExecuteCommand(newUnitStack.Move, destination);

        unitStack.ParentPlayer.SelectedUnits.Clear();
    }
    

    /*
    public override void MoveUnits(UnitStackViewModel unitStack, Hex destination)
    {
        if (destination == null)
        {
            Debug.Log("Cannot move to null");
            return;
        }

        if (unitStack.MovePoints <= 0)
        {
            Debug.Log("Out of msovement points");
            return;
        }

        if (unitStack.HexLocation == destination)
        {
            Debug.Log("Already at destiantion");
            return;
        }

        // check if the movement is valid
    }*/

    public override void Settle(UnitStackViewModel unitStack)
    {
        unitStack.PlannedAction = PlanedAction.None;

        unitStack.SettlingLocation = unitStack.PlannedSettlingLocation;

        // If for whatver reason our path destiantion changes from the 
        // Settling path this means we are not longer settling
        unitStack.PathDestinationProperty.Subscribe(hex =>
        {
            if (hex != unitStack.SettlingLocation)
            {
                unitStack.PlannedSettlingLocation = null;
                unitStack.SettlingLocation = null;
            }
        }).DisposeWhenChanged(unitStack.SettlingLocationProperty, true);

        if (unitStack.HexLocation == unitStack.SettlingLocation)
        {
            ExecuteCommand(unitStack.FoundCity, unitStack.SettlingLocation);
        }
        else
        {
            ExecuteCommand(unitStack.Move, unitStack.SettlingLocation);
        }
    }

    public override void FoundCity(UnitStackViewModel unitStack, Hex settleHex)
    {
        SettlerUnitViewModel settler = null;
        for (int i = 0; i < unitStack.Units.Count; i++)
        {
           if (unitStack.Units[i].GetType() == typeof(SettlerUnitViewModel))
           {
               settler = (SettlerUnitViewModel)unitStack.Units[i];
               break;
           }
        }

        // Create city data
        CityViewModel city = new CityViewModel(CityController)
        {
            Name = "City " + (int)UnityEngine.Random.Range(0, 100),
            Happieness = 75,
            GoldIncome = 10,
            Population = settler.Population,
            PopulationGrowth = 0.02f,
            HexLocation = settleHex
        };
        // Remove the settler once the city has been founded
        ExecuteCommand(unitStack.RemoveUnit, settler);           


        // Move all units from stack into the city
        for (int i = 0; i < unitStack.Units.Count; i++)
        {
            ExecuteCommand(city.AddUnit, unitStack.Units[i]);           
        }


        unitStack.ParentFaction.Cities.Add(city);

        unitStack.StackState = StackState.Idling;
        unitStack.SettlingLocation = null;
        unitStack.PlannedSettlingLocation = null;
        ExecuteCommand(unitStack.DestroyStack, unitStack);
    }


    public override void StopMove(UnitStackViewModel unitStack)
    {
        base.StopMove(unitStack);

    }

}
