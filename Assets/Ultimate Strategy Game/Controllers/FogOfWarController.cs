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

        for (int i = 0; i < unitStack.HexLocation.neighbors.Count; i++)
        {
            unitStack.HexLocation.neighbors[i].Visible = true;
            unitStack.HexLocation.neighbors[i].Explored = true;
        }

        ExecuteCommand(fogOfWar.UpdateFOW);

    }


}
