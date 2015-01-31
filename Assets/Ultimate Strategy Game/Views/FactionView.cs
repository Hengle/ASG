using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class FactionView 
{

    public GameObject unitStackPrefab;
    public GameObject settlerUnitPrefab;

    public GameObject cityPrefab;
    public GameObject cityUIPrefab;
    public Transform cityUIContainer;


    public override void Start()
    {
        base.Start();
        
    }

    /// This binding will add or remove views based on an element/viewmodel collection.
    public override ViewBase CreateUnitStacksView(UnitStackViewModel item) 
    {
        var unitStack = InstantiateView(unitStackPrefab, item, item.HexLocation.worldPos + Vector3.up * 0.6f, Quaternion.identity);

        if (Faction.UnitStacks.Count == 1)
            CameraManager.main.PanTo(unitStack.transform);
        
        // TODO: owner is not being assigned

        // Use the properties used in the inspector
        unitStack.InitializeData(item);
        unitStack.GetComponent<UnitStackFlagView>().UnitStack = item;
        unitStack.GetComponent<UnitStackFlagView>().SetupBindings();
        unitStack.GetComponent<UnitStackActionsView>().UnitStack = item;
        unitStack.GetComponent<UnitStackActionsView>().SetupBindings();

        return unitStack;
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void UnitStacksAdded(ViewBase item) {
        base.UnitStacksAdded(item);
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void UnitStacksRemoved(ViewBase item) {
        base.UnitStacksRemoved(item);
    }


    /// This binding will add or remove views based on an element/viewmodel collection.
    public override ViewBase CreateCitiesView(CityViewModel item) 
    {
        var city = InstantiateView(cityPrefab, item, item.HexLocation.worldPos, Quaternion.identity);
        //city.InitializeData(item);
        city.GetComponent<CityFlagView>().City = item;
        city.GetComponent<CityFlagView>().SetupBindings();

        var cityUI = InstantiateView(cityUIPrefab, item, item.HexLocation.worldPos, Quaternion.identity);
        cityUI.transform.localScale = Vector3.one;
        cityUI.GetComponent<CityUIView>().City = item;
        cityUI.GetComponent<CityUIView>().SetupBindings();

        cityUI.transform.SetParent(GameObject.FindGameObjectWithTag("CityUIContainer").transform, false);
        cityUI.GetComponent<UIFollow>().followObj = city.gameObject;

        return city;
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
