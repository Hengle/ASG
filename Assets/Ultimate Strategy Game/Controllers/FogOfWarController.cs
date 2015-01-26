using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class FogOfWarController : FogOfWarControllerBase 
{
    
    public override void InitializeFogOfWar(FogOfWarViewModel fogOfWar) 
    {

        
        //fogOfWar.TerrainManager.GenerateMap.Subscribe(g => ExecuteCommand(fogOfWar.UpdateFOW));

    }

    public override void UpdateFOW(FogOfWarViewModel fogOfWar)
    {

        

    }

    public override void UpdateUnitView(FogOfWarViewModel fogOfWar, UnitStackViewModel unitStack)
    {

        

        unitStack.HexLocation.Visible = true;
        unitStack.HexLocation.Explored = true;

        List<Hex> visibleTiles = new List<Hex>();
        Hex.SearchNeighbors(unitStack.HexLocation, unitStack.ViewRange, p_hex => p_hex.height <= 6, visibleTiles);

        for (int i = 0; i < visibleTiles.Count; i++)
        {
            visibleTiles[i].Visible = true;
        }

        /*
        for (int i = 0; i < unitStack.HexLocation.neighbors.Count; i++)
        {
            unitStack.HexLocation.neighbors[i].Visible = true;
            unitStack.HexLocation.neighbors[i].Explored = true;

            for (int b = 0; b < unitStack.HexLocation.neighbors[i].neighbors.Count; b++)
            {
                unitStack.HexLocation.neighbors[i].neighbors[b].Visible = true;
                unitStack.HexLocation.neighbors[i].neighbors[b].Explored = true;
            }

        }*/

        ExecuteCommand(fogOfWar.UpdateFOW);

    }


}
