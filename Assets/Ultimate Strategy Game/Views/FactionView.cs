using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class FactionView 
{

    public GameObject settlerUnitPrefab;
  

    /// This binding will add or remove views based on an element/viewmodel collection.
    public override ViewBase CreateUnitsView(UnitViewModel item) 
    {
        var unit = InstantiateView(settlerUnitPrefab, item, item.HexLocation.worldPos, Quaternion.identity);

        return unit;
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void UnitsAdded(ViewBase item) {
        base.UnitsAdded(item);
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void UnitsRemoved(ViewBase item) {
        base.UnitsRemoved(item);
    }

    /// This binding will add or remove views based on an element/viewmodel collection.
    public override ViewBase CreateCitiesView(CityViewModel item) {
        return base.CreateCitiesView(item);
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void CitiesAdded(ViewBase item) {
        base.CitiesAdded(item);
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void CitiesRemoved(ViewBase item) {
        base.CitiesRemoved(item);
    }
}
