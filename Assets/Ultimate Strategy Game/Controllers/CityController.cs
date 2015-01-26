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

    public override void RemovUnit(CityViewModel city, UnitViewModel unit)
    {
        city.Units.Remove(unit);
    }

}
