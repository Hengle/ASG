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


        ExecuteCommand(TerrainManager.GenerateMap); // TerrainManagerController.GenerateMap(gameLogic.TerrainManager);
        
        SetupPlayers(gameLogic);

    }


    public override void SetupPlayers(GameLogicViewModel gameLogic)
    {
        base.SetupPlayers(gameLogic);

        Hex startingHex = null;

        // Add human player
        if (gameLogic.HumanPlayer == null)
        {
            gameLogic.HumanPlayer = new PlayerViewModel(PlayerController);
        }

        gameLogic.CurrentPlayer = gameLogic.HumanPlayer;
        gameLogic.Players.Add(gameLogic.HumanPlayer);
        gameLogic.Factions.Add(gameLogic.HumanFaction);

        startingHex = TerrainManagerController.GetStartingLocation(TerrainManager);

        gameLogic.HumanPlayer.StartingHex = startingHex;
        gameLogic.HumanPlayer.Faction = gameLogic.HumanFaction;
        gameLogic.HumanFaction.Owner = gameLogic.HumanPlayer;

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
                Name = player.Name + "'s faction",
                Owner = player
            };
            player.Faction = faction;

            gameLogic.Players.Add(player);
            gameLogic.Factions.Add(faction);

            startingHex = TerrainManagerController.GetStartingLocation(TerrainManager);

            player.StartingHex = startingHex;
            GiveStarterUnits(player);
        }

        ExecuteCommand(FogOfWar.CalculateFOW, gameLogic.HumanPlayer.Faction);

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
            MovePoints = 8,
            MovePointsTotal = 8,
            ViewRange = 2
        };

        // Spawn the settle
        MeleeUnitViewModel meleeUnit = new MeleeUnitViewModel(MeleeUnitController)
        {
            Name = "Melee Unit",
            Owner = player,
            UnitCount = 80,
            UnitCountMax = 80,
            MovePoints = 10,
            MovePointsTotal = 10,
            ViewRange = 4
        };

        // Spawn the settle
        MeleeUnitViewModel meleeUnit2 = new MeleeUnitViewModel(MeleeUnitController)
        {
            Name = "Melee Unit",
            Owner = player,
            UnitCount = 80,
            UnitCountMax = 80,
            MovePoints = 10,
            MovePointsTotal = 10,
            ViewRange = 4
        };

        UnitStackViewModel unitStack = new UnitStackViewModel(UnitStackController)
        {
            Owner = player,
            HexLocation = player.StartingHex
        };

        player.Faction.UnitStacks.Add(unitStack);

        UnitStackController.AddUnit(unitStack, settler);
        UnitStackController.AddUnit(unitStack, meleeUnit);
        UnitStackController.AddUnit(unitStack, meleeUnit2);

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

    }
}
