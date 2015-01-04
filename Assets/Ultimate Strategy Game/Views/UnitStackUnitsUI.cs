using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
using UnityEngine.UI;


public partial class UnitStackUnitsUI {

    public RectTransform unitSlotsContainer;
    public GameObject unitSlotPrefab;

    public int unitSlotCount;
    public List<UnitSlot> unitSlots;

    public override void Start()
    {
        base.Start();
        GenerateUnitSlots();
        ToggleShowSlots(false);

    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void SelectedUnitStackChanged(UnitStackViewModel value) 
    {
        if (value == null)
        {
            for (int i = 0; i < unitSlots.Count; i++)
            {
                unitSlots[i].gameObject.SetActive(false);
            }
            return;
        }

        UpdateUnitStackSlots();
        Player.SelectedUnitStack._UnitsProperty.Subscribe(units => UpdateUnitStackSlots()).DisposeWhenChanged(Player.SelectedUnitStackProperty, true);        

    }

    private void UpdateUnitStackSlots ()
    {
        for (int i = 0; i < unitSlots.Count; i++)
        {
            if (i < Player.SelectedUnitStack.Units.Count)
            {
                unitSlots[i].gameObject.SetActive(true);
                unitSlots[i].Unit = Player.SelectedUnitStack.Units[i];
                unitSlots[i].SetupBindings();
            }
            else
            {
                unitSlots[i].gameObject.SetActive(false);
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
        GameObject newUnitSlot;
        for (int i = 0; i < unitSlotCount; i++)
        {
            newUnitSlot = Instantiate(unitSlotPrefab) as GameObject;

            newUnitSlot.transform.SetParent(unitSlotsContainer.transform);

            newUnitSlot.GetComponent<RectTransform>().localScale = Vector3.one;
            newUnitSlot.GetComponent<RectTransform>().transform.localPosition = Vector3.zero;
            unitSlotsContainer.GetComponent<GridLayoutGroup>().CalculateLayoutInputHorizontal();

            unitSlots.Add(newUnitSlot.GetComponent<UnitSlot>());
            

            //unitSlots[i].Unit = null;
            //unitSlots[i].Unbind();
        }
    }

    private void ToggleShowSlots (bool value)
    {
        for (int i = 0; i < unitSlots.Count; i++)
        {
            if (unitSlots[i].Unit != null)
                unitSlots[i].gameObject.SetActive(value);
        }
    }

    

}
