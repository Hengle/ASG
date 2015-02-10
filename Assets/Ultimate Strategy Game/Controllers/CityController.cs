using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class CityController : CityControllerBase {
    
    public override void InitializeCity(CityViewModel city) {
        
    }

    public override void NextTurnCalculation(CityViewModel city)
    {
        ExecuteCommand(city.CalcGoldIncome);
        ExecuteCommand(city.CalcPopulation);
    }

    public override void CalcGoldIncome(CityViewModel city)
    {
        city.ParentFaction.Gold += city.GoldIncome;
    }

    public override void CalcPopulation(CityViewModel city)
    {

        city.Population += (int)(city.Population * city.PopulationGrowth);

    }

    public override void AddUnit(CityViewModel city, UnitViewModel unit)
    {
        city.Units.Add(unit);
    }

    public override void AddUnits(CityViewModel city, UnitViewModel[] units)
    {
        city.Units.AddRange(units);
    }

    public override void RemoveUnit(CityViewModel city, UnitViewModel unit)
    {
        city.Units.Remove(unit);
    }

    public override void RemoveUnits(CityViewModel city, UnitViewModel[] units)
    {
        for (int i = 0; i < units.Length; i++)
        {
            city.Units.Remove(units[i]);
        }
    }


    public override void MoveSelectedUnits(CityViewModel city, Hex destination)
    {
        PlayerViewModel player = city.Owner;
        ModelCollection<UnitViewModel> units = player.SelectedUnits;


        if (destination == null) return;
        if (city.CanMove(units) == false) return;

       
        // Create stack
        UnitStackViewModel newUnitStack = player.Faction.CreateUnitStack(city.HexLocation);
        ExecuteCommand(newUnitStack.AddUnits, units.ToList().ToArray());
        ExecuteCommand(city.RemoveUnits, units.ToList().ToArray());


        ExecuteCommand(player.SelectUnitStack, newUnitStack);
        ExecuteCommand(newUnitStack.Move, destination);
    }

    public override void MergeSelectedWithStack(CityViewModel city, UnitStackViewModel unitStack)
    {
        PlayerViewModel player = city.Owner;
        ModelCollection<UnitViewModel> units = player.SelectedUnits;


        if (city.CanMove(units) == false) return;


        // Create stack
        UnitStackViewModel newUnitStack = player.Faction.CreateUnitStack(city.HexLocation);
        ExecuteCommand(newUnitStack.AddUnits, units.ToList().ToArray());
        ExecuteCommand(city.RemoveUnits, units.ToList().ToArray());


        ExecuteCommand(player.SelectUnitStack, newUnitStack);
        ExecuteCommand(newUnitStack.MergeWithStack, unitStack);
    }

}
