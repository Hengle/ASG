using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public partial class PlayerHUDView 
{ 

    public Image toolTip;
    public Text hexDescription;

    public Text unitName;

    public override void SelectedUnitStackChanged(UnitStackViewModel unitStack)
    {
        if (unitStack != null)
        {
            unitName.text = unitStack.ComputeLeadingUnit().Name;
        }
        else
        {
            unitName.text = "No Unit Selected";
        }
    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void SelectedHexChanged(Hex hex) 
    {
        if (hex != null)
        {
            if (toolTip.gameObject.activeSelf == false)
                toolTip.gameObject.SetActive(true);
            hexDescription.text = hex.terrainType + "\n" + hex.arrayCoord;
        }
        else
        {
            toolTip.gameObject.SetActive(false);
        }
    }
    

    public override void Update()
    {
        base.Update();

        toolTip.rectTransform.anchoredPosition = new Vector2(Input.mousePosition.x + toolTip.rectTransform.sizeDelta.x / 2 + 15, Input.mousePosition.y - toolTip.rectTransform.sizeDelta.y / 2 - 15);
    }

}
