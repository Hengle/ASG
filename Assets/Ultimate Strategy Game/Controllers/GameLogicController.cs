using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class GameLogicController : GameLogicControllerBase {
    
    public override void InitializeGameLogic(GameLogicViewModel gameLogic) {
    }

    public override void NextTurn(GameLogicViewModel gameLogic)
    {
        base.NextTurn(gameLogic);

        gameLogic.TurnCount += 1;


        Debug.Log("Turn " + gameLogic.TurnCount);

    }
}
