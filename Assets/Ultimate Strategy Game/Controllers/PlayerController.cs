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

    public override void SetHoverUnitStack(PlayerViewModel player, UnitStackViewModel unitStack)
    {
        if (player.HoverUnitStack != unitStack)
        {
            player.HoverUnitStack = unitStack;
        }
    }

    public override void SetHoverCity(PlayerViewModel player, CityViewModel city)
    {
        if (player.HoverCity != city)
        {
            player.HoverCity = city;
        }
    }

    public override void SelectUnitStack(PlayerViewModel player, UnitStackViewModel unitStack)
    {
        player.SelectedUnitStack = unitStack;
        player.SelectedUnitStack.Selected = true;
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
            player.SelectedUnitStack.Selected = false;
            if (player.SelectedUnitStack.PathDestination == null)
            {
                player.SelectedUnitStack.PlannedAction = PlanedAction.None;
            }

            player.SelectedUnitStack = null;
        }

    
        player.SelectedCity = null;
    }

    public override void SelectHexAtPos(PlayerViewModel player, Vector3 pos)
    {
        ExecuteCommand(player.SelectHex, Hex.GetHexAtPos(TerrainManager, pos));
    }
}
