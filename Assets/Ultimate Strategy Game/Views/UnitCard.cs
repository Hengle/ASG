using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
using UnityEngine.UI;


public partial class UnitCard 
{
    public UnitCardsUI unitCardsUI;

    public Text unitCount;
    public Text unitCountMax;

    public Color defaultColor;
    public Color selectedColor;

    public override void Start()
    {
        base.Start();
        
        GetComponent<Button>().onClick.AddListener(() =>
        {
            if (Input.GetKey(KeyCode.LeftControl))
            {
                ExecuteCommand(Unit.ParentFaction.ParentPlayer.CtrlSelectUnit, Unit);
                return;
            }

            if (Input.GetKey(KeyCode.LeftShift))
            {
                ExecuteCommand(Unit.ParentFaction.ParentPlayer.ShiftSelectUnit, Unit);
                return;
            }

            ExecuteCommand(Unit.ParentFaction.ParentPlayer.SelectUnit, Unit);
        });
 
    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void UnitCountChanged(Int32 value) 
    {
        base.UnitCountChanged(value);
        unitCount.text = value.ToString();

        
    }
    
    /// Subscribes to the property and is notified anytime the value changes.
    public override void UnitCountMaxChanged(Int32 value) 
    {
        base.UnitCountMaxChanged(value);
        //unitCountMax.text = value.ToString();
    }
    
    public void Select (bool value)
    {
        Button button = GetComponent<Button>(); 
        if (value)
        {
            ColorBlock colors = button.colors;
            colors.normalColor = selectedColor;
            colors.pressedColor = selectedColor;
            colors.highlightedColor = selectedColor;
            button.colors = colors;
        }else{
            ColorBlock colors = button.colors;
            colors.normalColor = defaultColor;
            colors.pressedColor = defaultColor;
            colors.highlightedColor = defaultColor;
            button.colors = colors;
        }
    }

}
