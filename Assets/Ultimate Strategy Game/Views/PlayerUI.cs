using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public partial class PlayerUI 
{ 

    public Image toolTip;
    public Text toolTipDescription;

    public Text unitName;
    

    /// Subscribes to the property and is notified anytime the value changes.
    public override void HoverUnitStackChanged(UnitStackViewModel unitStack) 
    {
        if (unitStack != null)
        {
            toolTipDescription.text = unitStack.LeadingUnit.Name;
        }
    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void HoverCityChanged(CityViewModel city) 
    {
        if (city != null)
        {
            toolTipDescription.text = city.Name + "\n" + city.Population;
        }
    }
 



    /// Subscribes to collection modifications.  Add & Remove methods are invoked for each modification.
    public override void SelectedUnitsAdded(UnitViewModel item)
    {
        base.SelectedUnitsAdded(item);
    }

    /// Subscribes to collection modifications.  Add & Remove methods are invoked for each modification.
    public override void SelectedUnitsRemoved(UnitViewModel item)
    {
        base.SelectedUnitsRemoved(item);
    }


    public override void SelectedUnitStackChanged(UnitStackViewModel unitStack)
    {
        if (unitStack != null && unitStack.LeadingUnit != null)
        {
            unitName.text = unitStack.LeadingUnit.Name;
        }
        else
        {
            unitName.text = "";
        }
    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void SelectedCityChanged(CityViewModel city)
    {
        if (city != null)
        {
            unitName.text = city.Name;
        }
        else
        {
            unitName.text = "";
        }
    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void SelectedHexChanged(Hex hex) 
    {
        if (hex != null)
        {
            if (toolTip.gameObject.activeSelf == false)
                toolTip.gameObject.SetActive(true);

            toolTipDescription.text = hex.terrainType + "\n Height: " + hex.height + "\n Humidity" + hex.Humidity + "\n Temperature" + hex.Temperature + "\n" + hex.arrayCoord;
        }
        else
        {
            toolTip.gameObject.SetActive(false);
        }
    }
    

    public override void Update()
    {
        toolTip.rectTransform.anchoredPosition = new Vector2(Input.mousePosition.x + toolTip.rectTransform.sizeDelta.x / 2 + 15, Input.mousePosition.y - toolTip.rectTransform.sizeDelta.y / 2 - 15);
    }

}
