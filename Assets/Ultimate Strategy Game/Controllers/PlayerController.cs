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

    public override void SelectUnit(PlayerViewModel player, UnitViewModel unit)
    {
        player.SelectedUnit = unit;
    }

    public override void SelectHexAtPos(PlayerViewModel player, Vector3 pos)
    {
        ExecuteCommand(player.SelectHex, Hex.GetHexAtPos(TerrainManager, pos));
    }

    public override void MoveUnit(PlayerViewModel player, UnitViewModel unit)
    {
        ExecuteCommand(unit.Move, player.SelectedHex);
        player.MovingUnit = false;   
    }
}
