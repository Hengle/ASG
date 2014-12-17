using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
using UnityEngine.UI;
using UnityEngine.EventSystems;


public partial class GameLogicGUI 
{ 

    public Text season;
    public Image seasonBackground; 

    public Text yearCounter;
    public Text turnCounter;


    /// Subscribes to the property and is notified anytime the value changes.
    public override void SeasonChanged(Seasons value) {
        season.text = value.ToString();
        switch (value)
        {
            case Seasons.Spring:
                seasonBackground.color = Color.green;
                break;
            case Seasons.Summer:
                seasonBackground.color = Color.yellow;
                break;
            case Seasons.Autum:
                seasonBackground.color = Color.red;
                break;
            case Seasons.Winter:
                seasonBackground.color = Color.white;
                break;
            default:
                break;
        }

    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void YearChanged(Int32 value) {
        yearCounter.text = "Year " + value;
    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void TurnCountChanged(Int32 value)
    {
        turnCounter.text = "Turn " + value;
    }

    public void NextTurn ()
    {
        // Validate later if the player can actually go to the next turn or if there is
        // Somethign to be managed
        ExecuteNextTurn();
    }



}
