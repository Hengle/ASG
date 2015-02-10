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
        ExecuteCommand(FogOfWar.CalculateFOW, unitStack.ParentFaction);
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
        for (int i = 0; i < unitStack.Units.Count; i++)
        {
            unitStack.Units[i].MovePoints = unitStack.Units[i].MovePointsTotal;
        }

    }

    public override void AddUnit(UnitStackViewModel unitStack, UnitViewModel unit)
    {
        unitStack.Units.Add(unit);

        CalculateUnitStackStats(unitStack);
    }

    public override void AddUnits(UnitStackViewModel unitStack, UnitViewModel[] units)
    {
        unitStack.Units.AddRange(units);
    
        CalculateUnitStackStats(unitStack);
    }

    public override void RemoveUnit(UnitStackViewModel unitStack, UnitViewModel unit)
    {
        unitStack.Units.Remove(unit);

        if (unitStack.Units.Count == 0)
        {
            ExecuteCommand(unitStack.DestroyStack, unitStack);
            return;
        }


        CalculateUnitStackStats(unitStack);
    }

    public override void RemoveUnits(UnitStackViewModel unitStack, UnitViewModel[] units)
    {
        for (int i = 0; i < units.Length; i++)
        {
            unitStack.Units.Remove(units[i]);
        }

        CalculateUnitStackStats(unitStack);
    }

    private void CalculateUnitStackStats(UnitStackViewModel unitStack)
    {
        unitStack.Visible = true;
        unitStack.LeadingUnit = unitStack.Units[0];

        unitStack.MovePoints = unitStack.Units[0].MovePoints;
        unitStack.MovePointsTotal = unitStack.Units[0].MovePointsTotal;
        unitStack.ViewRange = unitStack.Units[0].ViewRange;


        foreach (UnitViewModel unit in unitStack.Units)
        {
            // Set movement points
            if (unit.MovePoints < unitStack.MovePoints)
            {
                unitStack.MovePoints = unit.MovePoints;
            }
            // Set total movement points
            if (unit.MovePointsTotal < unitStack.MovePointsTotal)
            {
                unitStack.MovePointsTotal = unit.MovePointsTotal;
            }
            // Set view range
            if (unit.ViewRange > unitStack.ViewRange)
            {
                unitStack.ViewRange = unit.ViewRange;
            }
        }
    }

    public override void DestroyStack(UnitStackViewModel unitStack)
    {
        // Make sure to clean up after stack
        ExecuteCommand(unitStack.CancelAction);
        
        for (int i = 0; i < unitStack.Units.Count; i++)
        {
            ExecuteCommand(unitStack.RemoveUnit, unitStack.Units[i]);
        }

        unitStack.ParentFaction.UnitStacks.Remove(unitStack);
    }

    public override void PlanMovement(UnitStackViewModel unitStack)
    {
        unitStack.PlannedAction = PlanedAction.Move;

        ExecuteCommand(unitStack.EvaluateMovementPath, unitStack.ParentPlayer.SelectedHex);
        unitStack.ParentPlayer._SelectedHexProperty.Subscribe(hex => ExecuteCommand(unitStack.EvaluateMovementPath, hex)).DisposeWhenChanged(unitStack._PlannedActionProperty);
    }

    public override void PlanSelectedUnitsMovement(UnitStackViewModel unitStack)
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


    public override void CancelAction(UnitStackViewModel unitStack)
    {
        unitStack.PlannedAction = PlanedAction.None;
        unitStack.PathDestination = null;
        unitStack.UnitStackTarget = null;
        unitStack.CityTarget = null;
        unitStack.Path.Clear();
    }

    public override void Move(UnitStackViewModel unitStack, Hex destination)
    {
        
        unitStack.PlannedAction = PlanedAction.None;

        if (destination == null) return;
        if (unitStack.HexLocation == destination) return;
        if (unitStack.CanMove() == false) return;


        List<Hex> path = Pathfinding.FindPath(unitStack.HexLocation, destination);
        unitStack.Path.Clear();
        unitStack.Path.AddRange(path);
        

        unitStack.PathDestination = destination;
        unitStack.NextHexInPath = unitStack.Path[0];
    }


    public override void MoveSelectedUnits(UnitStackViewModel unitStack, Hex destination)
    {
        PlayerViewModel player = unitStack.ParentPlayer;
        ModelCollection<UnitViewModel> units = player.SelectedUnits;

        unitStack.PlannedAction = PlanedAction.None;

        if (destination == null) return;
        if (unitStack.HexLocation == destination) return;
        if (unitStack.CanMove(units) == false) return;

        // if only a single unit in stack or all of them selected
        if (unitStack.Units.Count == 1 || unitStack.Units.Count == units.Count)
        {
            ExecuteCommand(unitStack.Move, destination);
            return;
        }

  
        // Create stack
        UnitStackViewModel newUnitStack = player.Faction.CreateUnitStack(unitStack.HexLocation);
        ExecuteCommand(newUnitStack.AddUnits, units.ToList().ToArray());
        ExecuteCommand(unitStack.RemoveUnits, units.ToList().ToArray());
       

        ExecuteCommand(unitStack.CancelAction);
        ExecuteCommand(player.SelectUnitStack, newUnitStack);
        ExecuteCommand(newUnitStack.Move, destination);
    }


    public override void MergeWithStack(UnitStackViewModel unitStack, UnitStackViewModel targetStack)
    {
        // If we are the target
        if (unitStack == targetStack) return;

        unitStack.UnitStackTarget = targetStack;

        ExecuteCommand(unitStack.Move, targetStack.HexLocation);


        // Follow target
        targetStack.HexLocationProperty.Subscribe( hex => ExecuteCommand(unitStack.EvaluateMovementPath, targetStack.HexLocation) ).DisposeWhenChanged(unitStack.UnitStackTargetProperty);
    
        // Merge once a hex away
        unitStack.HexLocationProperty.Subscribe(hex =>
        {
            if (hex == targetStack.HexLocation)
            {
                ExecuteCommand(targetStack.AddUnits, unitStack.Units.ToList().ToArray());
                ExecuteCommand(targetStack.Owner.SelectUnitStack, targetStack);
                ExecuteCommand(unitStack.DestroyStack);
            }
        }).DisposeWhenChanged(unitStack.UnitStackTargetProperty, false);

    }

    public override void MergeSelectedUnitsWithStack(UnitStackViewModel unitStack, UnitStackViewModel targetStack)
    {

        PlayerViewModel player = unitStack.ParentPlayer;
        ModelCollection<UnitViewModel> units = player.SelectedUnits;

        unitStack.PlannedAction = PlanedAction.None;

        if (targetStack == null) return;
        if (targetStack == unitStack) return;
        if (unitStack.CanMove(units) == false) return;

        // if only a single unit in stack or all of them selected
        if (unitStack.Units.Count == 1 || unitStack.Units.Count == units.Count)
        {
            ExecuteCommand(unitStack.MergeWithStack, targetStack);
            return;
        }


        // Create stack
        UnitStackViewModel newUnitStack = player.Faction.CreateUnitStack(unitStack.HexLocation);
        ExecuteCommand(newUnitStack.AddUnits, units.ToList().ToArray());
        ExecuteCommand(unitStack.RemoveUnits, units.ToList().ToArray());


        ExecuteCommand(unitStack.CancelAction);
        ExecuteCommand(player.SelectUnitStack, newUnitStack);
        ExecuteCommand(newUnitStack.MergeWithStack, targetStack);

    }

    public override void MergeWithCity(UnitStackViewModel unitStack, CityViewModel city)
    {
        unitStack.CityTarget = city;

        ExecuteCommand(unitStack.Move, city.HexLocation);

        // Merge once a hex away
        unitStack.HexLocationProperty.Subscribe(hex =>
        {
            if (hex == city.HexLocation)
            {
                ExecuteCommand(city.AddUnits, unitStack.Units.ToList().ToArray());
                ExecuteCommand(unitStack.Owner.SelectCity, city);
                ExecuteCommand(unitStack.DestroyStack);
            }
        }).DisposeWhenChanged(unitStack.CityTargetProperty, false);
    }

    public override void MergeSelectedWithCity(UnitStackViewModel unitStack, CityViewModel city)
    {
        PlayerViewModel player = unitStack.ParentPlayer;
        ModelCollection<UnitViewModel> units = player.SelectedUnits;

        unitStack.PlannedAction = PlanedAction.None;

        if (unitStack.CanMove(units) == false) return;

        // if only a single unit in stack or all of them selected
        if (unitStack.Units.Count == 1 || unitStack.Units.Count == units.Count)
        {
            ExecuteCommand(unitStack.MergeWithCity, city);
            return;
        }


        // Create stack
        UnitStackViewModel newUnitStack = player.Faction.CreateUnitStack(unitStack.HexLocation);
        ExecuteCommand(newUnitStack.AddUnits, units.ToList().ToArray());
        ExecuteCommand(unitStack.RemoveUnits, units.ToList().ToArray());


        ExecuteCommand(unitStack.CancelAction);
        ExecuteCommand(player.SelectUnitStack, newUnitStack);
        ExecuteCommand(newUnitStack.MergeWithCity, city);
    }



    public override void AttackStack(UnitStackViewModel unitStack, UnitStackViewModel target)
    {
        unitStack.UnitStackTarget = target;

        ExecuteCommand(unitStack.Move, target.HexLocation);

        // If the target moves follow it if we still see it
        unitStack.UnitStackTarget.HexLocationProperty.Subscribe(hex =>
        {
            if (target.Visible)
            {
                ExecuteCommand(unitStack.EvaluateMovementPath, target.HexLocation);
            }
            else
            {
                Debug.Log("Unit target lost");
                //unitStack.ParentFaction.Message("Unit Lost");
            }
        }).DisposeWhenChanged(unitStack.UnitStackTargetProperty);

        unitStack.HexLocationProperty.Subscribe(hex =>
        {
            if (unitStack.NextHexInPath == target.HexLocation)
            {

            }
        });

    }





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
            Owner = unitStack.Owner,
            Name = "City " + (int)UnityEngine.Random.Range(0, 100),
            ViewRange = 6,
            Happieness = 75,
            GoldIncome = 10,
            Population = settler.Population,
            PopulationGrowth = 0.02f,
            HexLocation = settleHex
        };
        unitStack.ParentFaction.Cities.Add(city);

        // Remove the settler once the city has been founded
        ExecuteCommand(unitStack.RemoveUnit, settler);           


        // Move all units from stack into the city
        for (int i = 0; i < unitStack.Units.Count; i++)
        {
            ExecuteCommand(city.AddUnit, unitStack.Units[i]);
        }

        // Remove the Unit Stack
        unitStack.StackState = StackState.Idling;
        unitStack.SettlingLocation = null;
        unitStack.PlannedSettlingLocation = null;
        ExecuteCommand(unitStack.DestroyStack, unitStack);

        ExecuteCommand(city.Owner.SelectCity, city);
    }


    public override void StopMove(UnitStackViewModel unitStack)
    {
        base.StopMove(unitStack);

    }

}
