using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
using UnityEngine.UI;


public partial class CityUIView 
{  

    public Text cityName;
    public Text cityPopulation;
    public Text cityGoldIncome;
    public Text cityHappieness;


    /// Subscribes to the property and is notified anytime the value changes.
    public override void NameChanged(String value) 
    {
        cityName.text = value;
    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void PopulationChanged(Int32 value)
    {
        cityPopulation.text = value.ToString();
    }

    
    /// Subscribes to the property and is notified anytime the value changes.
    public override void HappienessChanged(Int32 value) 
    {
        cityHappieness.text = value.ToString();
    }
    
    /// Subscribes to the property and is notified anytime the value changes.
    public override void GoldIncomeChanged(Int32 value) 
    {
        cityGoldIncome.text = value.ToString();
    }
}
