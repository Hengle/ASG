using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class PlayerController : PlayerControllerBase 
{
    
    public override void InitializePlayer(PlayerViewModel player) {
    }

    public override void SelectHex(PlayerViewModel player, Hex hex)
    {
        player.SelectedHex = hex;
    }

    public override void SelectUnitStack(PlayerViewModel player, UnitStackViewModel unitStack)
    {
        player.SelectedUnitStack = unitStack;
    }

    public override void SelectUnit(PlayerViewModel player, UnitViewModel unit)
    {
        player.SelectedUnits.Add(unit);
    }

    public override void SelectCity(PlayerViewModel player, CityViewModel city)
    {
        player.SelectedCity = city;
    }

    public override void DeselectAll(PlayerViewModel player)
    {
        player.SelectUnit = null;
        player.SelectedUnitStack = null;
        player.SelectedCity = null;
        player.MovingUnit = false;
    }

    public override void SelectHexAtPos(PlayerViewModel player, Vector3 pos)
    {
        ExecuteCommand(player.SelectHex, Hex.GetHexAtPos(TerrainManager, pos));
    }

    public override void MoveUnitStack(PlayerViewModel player, UnitStackViewModel unitStack)
    {
        ExecuteCommand(unitStack.Move, player.SelectedHex);
        player.MovingUnit = false;
    }

}
