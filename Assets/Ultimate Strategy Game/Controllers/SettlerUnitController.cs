using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class SettlerUnitController : SettlerUnitControllerBase {
    
    public override void InitializeSettlerUnit(SettlerUnitViewModel settlerUnit) {
    }

    public override void Settle(SettlerUnitViewModel settlerUnit)
    {
        base.Settle(settlerUnit);

        CityViewModel city = new CityViewModel(CityController)
        {
            Name = settlerUnit.Owner + "'s city",
            Population = settlerUnit.Population,
            HexLocation = settlerUnit.ParentUnitStack.HexLocation
        };

        settlerUnit.ParentUnitStack.ParentFaction.Cities.Add(city);

        settlerUnit = null;

    }
}
