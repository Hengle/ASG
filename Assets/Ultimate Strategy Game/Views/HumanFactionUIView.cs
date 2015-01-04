using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
using UnityEngine.UI;


public partial class HumanFactionUIView 
{

    public Text gold;

    /// Subscribes to the property and is notified anytime the value changes.
    public override void FoodChanged(Single value) {
        base.FoodChanged(value);
    }
    
    /// Subscribes to the property and is notified anytime the value changes.
    public override void GoldChanged(Single value) 
    {
        gold.text = value.ToString();
    }
}
