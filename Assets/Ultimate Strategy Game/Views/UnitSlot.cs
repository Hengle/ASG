using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
using UnityEngine.UI;


public partial class UnitSlot 
{

    public Text unitCount;
    public Text unitCountMax;


    /// Subscribes to the property and is notified anytime the value changes.
    public override void UnitCountChanged(Int32 value) {
        base.UnitCountChanged(value);
        unitCount.text = value.ToString();
    }
    
    /// Subscribes to the property and is notified anytime the value changes.
    public override void UnitCountMaxChanged(Int32 value) {
        base.UnitCountMaxChanged(value);
        //unitCountMax.text = value.ToString();
    }
}
