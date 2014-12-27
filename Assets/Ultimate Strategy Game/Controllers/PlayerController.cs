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
        if (hex != player.SelectedHex) player.SelectedHex = hex;
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
        player.SelectedUnits.Clear();

        if (player.SelectedUnitStack != null)
        {
            player.SelectedUnitStack.ActionState = UnitActionState.None;
            player.SelectedUnitStack = null;
        }

        
        player.SelectedCity = null;
    }

    public override void SelectHexAtPos(PlayerViewModel player, Vector3 pos)
    {
        ExecuteCommand(player.SelectHex, Hex.GetHexAtPos(TerrainManager, pos));
    }

    public override void MoveUnitStack(PlayerViewModel player, UnitStackViewModel unitStack)
    {
        ExecuteCommand(unitStack.Move, player.SelectedHex);
    }

}
