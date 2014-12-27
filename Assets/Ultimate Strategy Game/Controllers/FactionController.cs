using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class FactionController : FactionControllerBase {
    
    public override void InitializeFaction(FactionViewModel faction) {
    }


    public override void NextTurnCalculation(FactionViewModel faction)
    {
        base.NextTurnCalculation(faction);

        for (int i = 0; i < faction.UnitStacks.Count; i++)
        {
            UnitStackController.NextTurnCalculation(faction.UnitStacks[i]);
        }

        for (int i = 0; i < faction.Cities.Count; i++)
        {
            CityController.NextTurnCalculation(faction.Cities[i]);
        }

    }

}
