using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
using UnityEngine.UI;

/// <summary>
/// Generic unit card UI. 
/// Used for both cities and unit stacks.
/// </summary>
public partial class UnitCardsUI {

    public GameObject unitSlotPrefab;
    public RectTransform unitSlotsContainer;

    
    public int unitSlotCount;
    public List<UnitCard> unitSlots;



    public override void Start()
    {
        base.Start();

        GenerateUnitSlots();

        ShowUnitCards(false);

    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void SelectedUnitStackChanged(UnitStackViewModel unitStack) 
    {
        if (unitStack == null)
        {
            ShowUnitCards(false);
            return;
        }

        // Update the unit cards
        UpdateUnitCards(unitStack.Units);
        UpdateSelectedUnits();
        unitStack._UnitsProperty.Subscribe(units => UpdateUnitCards(unitStack.Units)).DisposeWhenChanged(Player.SelectedUnitStackProperty, true);
        Player._SelectedUnitsProperty.Subscribe(units => UpdateSelectedUnits()).DisposeWhenChanged(Player.SelectedUnitStackProperty, true);    

    }

    public override void SelectedUnitsAdded(UnitViewModel unit)
    {
        for (int i = 0; i < unitSlots.Count; i++)
        {
            if (unitSlots[i].Unit != null && unitSlots[i].Unit == unit)
            {
                unitSlots[i].Select(true);
            }
        }
    }

    public override void SelectedUnitsRemoved(UnitViewModel unit)
    {

    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void SelectedCityChanged(CityViewModel city)
    {
        if (city == null)
        {
            ShowUnitCards(false);
            return;
        }

        // Update the unit cards
        UpdateUnitCards(city.Units);
        UpdateSelectedUnits();
        city._UnitsProperty.Subscribe(units => UpdateUnitCards(city.Units)).DisposeWhenChanged(Player.SelectedCityProperty, true);
        Player._SelectedUnitsProperty.Subscribe(units => UpdateSelectedUnits()).DisposeWhenChanged(Player.SelectedCityProperty, true); 
    }

    private void UpdateUnitCards (ModelCollection<UnitViewModel> units)
    {
        for (int i = 0; i < unitSlots.Count; i++)
        {
            if (i < units.Count)
            {
                unitSlots[i].gameObject.SetActive(true);
                unitSlots[i].Unit = units[i];
                unitSlots[i].SetupBindings();
            }
            else
            {
                unitSlots[i].gameObject.SetActive(false);
            }
        }
    }

    public void UpdateSelectedUnits()
    {
        for (int i = 0; i < unitSlots.Count; i++)
        {
            if (Player.SelectedUnits.Contains(unitSlots[i].Unit))
            {
                unitSlots[i].Select(true);
            }
            else
            {
                unitSlots[i].Select(false);
            }
        }
    }

    /*
    /// Subscribes to collection modifications.  Add & Remove methods are invoked for each modification.
    public override void UnitsAdded(UnitViewModel item) 
    {
        for (int i = 0; i < unitSlots.Count; i++)
        {
            if (unitSlots[i].Unit == null)
            {  
                unitSlots[i].Unit = item;
                unitSlots[i].Bind();
                unitSlots[i].gameObject.SetActive(true);
            }
        }
    }
    
    /// Subscribes to collection modifications.  Add & Remove methods are invoked for each modification.
    public override void SelectedUnitsRemoved(UnitViewModel item) 
    {
        for (int i = 0; i < unitSlots.Count; i++)
        {
            if (unitSlots[i].Unit == item)
            {
                unitSlots[i].Unbind();
                unitSlots[i].Unit = null;
                unitSlots[i].gameObject.SetActive(false);
            }
        }
    }*/

    private void GenerateUnitSlots ()
    {
        GameObject unitCard;
        for (int i = 0; i < unitSlotCount; i++)
        {
            unitCard = Instantiate(unitSlotPrefab, Vector3.zero, Quaternion.identity) as GameObject;

            unitCard.transform.SetParent(unitSlotsContainer.transform);

            unitCard.GetComponent<RectTransform>().localScale = Vector3.one;
            unitCard.GetComponent<RectTransform>().transform.localPosition = Vector3.zero;
            unitSlotsContainer.GetComponent<GridLayoutGroup>().CalculateLayoutInputHorizontal();

            unitSlots.Add(unitCard.GetComponent<UnitCard>());
            unitCard.GetComponent<UnitCard>().unitCardsUI = this;
        



            //unitSlots[i].Unit = null;
            //unitSlots[i].Unbind();
        }
    }

    private void ShowUnitCards (bool value)
    {
        for (int i = 0; i < unitSlots.Count; i++)
        {
            if (unitSlots[i].Unit != null)
                unitSlots[i].gameObject.SetActive(value);
        }
    }

    

}
