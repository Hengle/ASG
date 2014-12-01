using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class GameLogicGUI {
    
    /// Subscribes to the property and is notified anytime the value changes.
    public override void TurnCountChanged(Int32 value) {
        base.TurnCountChanged(value);
    }
    
    /// Invokes NextTurnExecuted when the NextTurn command is executed.
    public override void NextTurnExecuted() {
        base.NextTurnExecuted();
    }
    
    /// Subscribes to collection modifications.  Add & Remove methods are invoked for each modification.
    public override void FactionsAdded(FactionViewModel item) {
        base.FactionsAdded(item);
    }
    
    /// Subscribes to collection modifications.  Add & Remove methods are invoked for each modification.
    public override void FactionsRemoved(FactionViewModel item) {
        base.FactionsRemoved(item);
    }

    
    public void NextTurn ()
    {
        // Validate later if the player can actually go to the next turn or if there is
        // Somethign to be managed
        ExecuteNextTurn();
    }

}
