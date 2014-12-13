using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class PlayerController : PlayerControllerBase {
    
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

    public override void GetHexAtWorldPos(PlayerViewModel player, Vector3 pos)
    {

        float stepSize = 1f / TerrainManager.ChunkSize;
        float resScale = TerrainManager.ChunkSize / TerrainManager.ChunkResolution;


        float pointX = pos.x;
        float pointZ = pos.z;
        pointX = pointX * TerrainManager.PixelsPerUnit;
        pointZ = pointZ * TerrainManager.PixelsPerUnit;
        pointZ += HexProperties.tileH;
        pointX -= HexProperties.width / 2;
        pointZ -= (HexProperties.height - HexProperties.tileH);


        float q = (1f / 3f * Mathf.Sqrt(3f) * pointX - 1f / 3f * pointZ) / HexProperties.side;
        float r = 2f / 3f * pointZ / HexProperties.side;


        Vector3 cube = new Vector3();
        cube.x = q;
        cube.z = r;
        cube.y = -cube.x - cube.z;

        cube = Hexagon.RoundCubeCoord(cube);

        Vector2 hoverHexAraray = Hexagon.CubeToOffsetOddQ(cube);
        Hex hex = null;

        if (hoverHexAraray.x >= 0 && hoverHexAraray.y >= 0 && hoverHexAraray.x < TerrainManager.hexGrid.GetLength(0) && hoverHexAraray.y < TerrainManager.hexGrid.GetLength(1))
            hex = TerrainManager.hexGrid[(int)hoverHexAraray.x, (int)hoverHexAraray.y];

        SelectHex(player, hex);
    }

    public override void MoveUnit(PlayerViewModel player, UnitViewModel unit)
    {
        base.MoveUnit(player, unit);
        Debug.Log(unit);
        ExecuteCommand(unit.Move, player.SelectedHex);
        //UnitController.MoveUnit(unit, );
        player.MovingUnit = false;   
    }
}
