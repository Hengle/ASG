using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class GameLogicController : GameLogicControllerBase 
{

    [Inject]
    public UnitStackController UnitStackController { get; set; }

    [Inject]
    public SettlerUnitController SettlerUnitController { get; set; }

    [Inject]
    public MeleeUnitController MeleeUnitController { get; set; }


    public override void InitializeGameLogic(GameLogicViewModel gameLogic) {
    }



    public override void StartGame(GameLogicViewModel gameLogic)
    {
        base.StartGame(gameLogic);

        gameLogic.GameState = GameState.GeneratingMap;
        gameLogic.GameState = GameState.Playing;
        gameLogic.Season = Seasons.Spring;

        // Make sure to set the tell the units what the terrain manager.
        UnitStackViewModel.terrainManager = gameLogic.TerrainManager;


        TerrainManagerController.GenerateMap(gameLogic.TerrainManager);
        
        SetupPlayers(gameLogic);

    }


    public override void SetupPlayers(GameLogicViewModel gameLogic)
    {
        base.SetupPlayers(gameLogic);

        Hex startingHex = null;

        // Add human player
        if (gameLogic.HumanPlayer == null)
            gameLogic.HumanPlayer = new PlayerViewModel(PlayerController);
        
        gameLogic.CurrentPlayer = gameLogic.HumanPlayer;
        gameLogic.Players.Add(gameLogic.HumanPlayer);
        gameLogic.Factions.Add(gameLogic.HumanFaction);

        startingHex = TerrainManagerController.GetStartingLocation(TerrainManager);

        gameLogic.HumanPlayer.StartingHex = startingHex;
        GiveStarterUnits(gameLogic.HumanPlayer);


        FactionViewModel faction;

        for (int p = 0; p < gameLogic.PlayerCount; p++)
        {
            // Hardcoding AI players!!!
            var player = new PlayerViewModel(PlayerController)
            {
                Name = "AI " + p,
                IsHuman = false
            };

            faction = new FactionViewModel(FactionController) { 
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

        SettlerUnitViewModel settler = new SettlerUnitViewModel(SettlerUnitController)
        {
            Name = "Settler",
            Owner = player,
            Population = 850,
            UnitCount = 40,
            UnitCountMax = 50,
            ParentFaction = player.Faction
        };

        // Spawn the settle
        MeleeUnitViewModel meleeUnit = new MeleeUnitViewModel(MeleeUnitController)
        {
            Name = "Melee Unit",
            Owner = player,
            UnitCount = 80,
            UnitCountMax = 80,
            ParentFaction = player.Faction
        };

        var unitStack = new UnitStackViewModel(UnitStackController)
        {
            Owner = player,
            HexLocation = player.StartingHex,
            ParentFaction = player.Faction
        };


        player.Faction.UnitStacks.Add(unitStack);
        player.Faction.Units.Add(settler);
        player.Faction.Units.Add(meleeUnit);

        UnitStackController.AddUnit(unitStack, settler);
        UnitStackController.AddUnit(unitStack, meleeUnit);


        /*
        // Give each player 1 worker and 1 combat unitStack
        var worker = new WorkerUnitViewModel(WorkerUnitController)
        {
            Owner = player,
            CurrentTile = startTile,
            Position = player.StartingPosition
        };

        player..Add(worker);
        ExecuteCommand(startTile.SpawnUnit, worker);

        // Hack: grab a new starting position from the map and spawn a combat unitStack
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
        gameLogic.Season += 1;

        // Next year
        if ((int)gameLogic.Season == 4)
        {
            gameLogic.Season = Seasons.Spring;
            gameLogic.Year++;
        }

        for (int i = 0; i < gameLogic.Factions.Count; i++)
        {
            FactionController.NextTurnCalculation(gameLogic.Factions[i]);
        }


        Debug.Log("Turn " + gameLogic.TurnCount);

    }
}
