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
        player.SelectedCity = null;
        player.SelectedUnits.Clear();
        
        if (player.SelectedUnitStack != null)
        {
            player.SelectedUnitStack.Selected = false;
        }

        player.SelectedUnitStack = unitStack;
        player.SelectedUnitStack.Selected = true;
    }

    public override void SelectUnit(PlayerViewModel player, UnitViewModel unit)
    {
        Debug.Log("Selected");
        // Remove if selected again
        if (player.SelectedUnits.Count == 1 && player.SelectedUnits[0] == unit)
        {
            player.SelectedUnits.Remove(unit);
            return;
        }

        player.SelectedUnits.Clear();
        player.SelectedUnits.Add(unit);
    }

    public override void CtrlSelectUnit(PlayerViewModel player, UnitViewModel unit)
    {
        if (player.SelectedUnits.Contains(unit))
        {
            player.SelectedUnits.Remove(unit);
        }
        else
        {
            player.SelectedUnits.Add(unit);
        }
    }

    public override void ShiftSelectUnit(PlayerViewModel player, UnitViewModel unit)
    {
        // If no selected
        if (player.SelectedUnits.Count == 0)
        {
            player.SelectedUnits.Add(unit);
            return;
        }


        ModelCollection<UnitViewModel> unitList = null;
        if (player.SelectedUnitStack != null)
        {
            unitList = player.SelectedUnitStack.Units;
        }
        if (player.SelectedCity != null)
        {
            unitList = player.SelectedCity.Units;
        }

        UnitViewModel fromUnit = player.SelectedUnits[0];

        int start = unitList.IndexOf(fromUnit);
        int end = unitList.IndexOf(unit);

        if (end < start)
        {
            start = end;
            end = unitList.IndexOf(fromUnit);
        }

        player.SelectedUnits.Clear();

        for (int i = start; i < end + 1; i++)
        {
            player.SelectedUnits.Add(unitList[i]);
        }

 
    }


    public override void SelectCity(PlayerViewModel player, CityViewModel city)
    {
        player.SelectedUnitStack = null;
        player.SelectedUnits.Clear();

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
