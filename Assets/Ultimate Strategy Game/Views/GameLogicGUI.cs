using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class GameLogicGUI 
{ 
    
    public void NextTurn ()
    {
        // Validate later if the player can actually go to the next turn or if there is
        // Somethign to be managed
        ExecuteNextTurn();
    }

}
