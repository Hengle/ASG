using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;


public partial class FactionViewModel 
{

    [Inject] public UnitStackController UnitStackController { get; set; }


    public bool OwnsCity(CityViewModel city)
    {
        return Cities.Contains(city);
    }
    public bool OwnsUnitStack(UnitStackViewModel unitStack)
    {
        return UnitStacks.Contains(unitStack);
    }

    public UnitStackViewModel CreateUnitStack(Hex location)
    {
        UnitStackViewModel newUnitStack = new UnitStackViewModel(UnitStackController)
        {
            Owner = this.Owner,
            HexLocation = location,
        };

        UnitStacks.Add(newUnitStack);

        return newUnitStack;
    }

}
