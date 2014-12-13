using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class GameLogicController : GameLogicControllerBase 
{


    [Inject]
    public UnitController UnitController { get; set; }
    [Inject]
    public SettlerUnitController SettlerUnitController { get; set; }


    public override void InitializeGameLogic(GameLogicViewModel gameLogic) {
    }


    public override void StartGame(GameLogicViewModel gameLogic)
    {
        base.StartGame(gameLogic);

        gameLogic.GameState = GameState.GeneratingMap;
        TerrainManagerController.GenerateMap(gameLogic.TerrainManager);
        SetupPlayers(gameLogic);


        gameLogic.GameState = GameState.Playing;

    }


    public override void SetupPlayers(GameLogicViewModel gameLogic)
    {
        base.SetupPlayers(gameLogic);

        // Add human player
        if (gameLogic.HumanPlayer == null)
            gameLogic.HumanPlayer = new PlayerViewModel(PlayerController);
        
        gameLogic.CurrentPlayer = gameLogic.HumanPlayer;
        gameLogic.Players.Add(gameLogic.HumanPlayer);

        Hex startingHex = null;

        for (int p = 0; p < gameLogic.PlayerCount; p++)
        {
            // Hardcoding AI players!!!
            var player = new PlayerViewModel(PlayerController)
            {
                Name = "AI " + p,
                IsHuman = false
            };

            var faction = new FactionViewModel(FactionController) { 
                Name = player.Name + "'s faction"  
            };
            player.Faction = faction;

            gameLogic.Players.Add(player);
            gameLogic.Factions.Add(faction);

            startingHex = TerrainManagerController.GetStartingLocation(TerrainManager);

            player.StartingHex = startingHex;
            GiveStarterUnits(player);
        }

    }

    private void GiveStarterUnits (PlayerViewModel player)
    {

        // Spawn the settle
        var settler = new UnitViewModel(UnitController)
        {
            Name = "Settler",
            HexLocation = player.StartingHex
        };

        player.Faction.Units.Add(settler);

        /* Give each player 1 worker and 1 combat unit
        var worker = new WorkerUnitViewModel(WorkerUnitController)
        {
            Owner = player,
            CurrentTile = startTile,
            Position = player.StartingPosition
        };
        player.AllUnits.Add(worker);
        ExecuteCommand(startTile.SpawnUnit, worker);

        // Hack: grab a new starting position from the map and spawn a combat unit
        var randomPos = CoreMapController.GetRandomPlayerStartPosition();
        var tile = CoreMapController.GetTile(CoreMap, randomPos);
        var combatUnit = new CombatUnitViewModel(CombatUnitController)
        {
            Owner = player,
            CurrentTile = tile,
            Position = randomPos
        };
        player.AllUnits.Add(combatUnit);
        ExecuteCommand(tile.SpawnUnit, combatUnit);
        */
    }


    public override void NextTurn(GameLogicViewModel gameLogic)
    {
        base.NextTurn(gameLogic);

        gameLogic.TurnCount += 1;


        Debug.Log("Turn " + gameLogic.TurnCount);

    }
}
