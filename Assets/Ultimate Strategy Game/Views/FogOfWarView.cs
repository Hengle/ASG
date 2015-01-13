using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class FogOfWarView 
{

    public GameObject fow;


    /// Invokes UpdateFOWExecuted when the UpdateFOW command is executed.
    public override void UpdateFOWExecuted() 
    {
        Debug.Log("Updated FOW");
        fow.transform.localScale = new Vector3(FogOfWar.TerrainManager.TerrainWidth, FogOfWar.TerrainManager.TerrainWidth, FogOfWar.TerrainManager.TerrainWidth) * HexProperties.width / FogOfWar.TerrainManager.PixelsPerUnit;
        fow.transform.position = new Vector3(FogOfWar.TerrainManager.TerrainWidth, 2.5f, FogOfWar.TerrainManager.TerrainWidth) * HexProperties.width / FogOfWar.TerrainManager.PixelsPerUnit / 2;

        fow.renderer.material.SetTexture("_FOW", DrawFOW());

    }
    
    /// Invokes UpdateUnitViewExecuted when the UpdateUnitView command is executed.
    public override void UpdateUnitViewExecuted() 
    {

    }

    public Texture2D DrawFOW()
    {

        int chunkSize = FogOfWar.TerrainManager.ChunkSize;

        int size = (int)(FogOfWar.TerrainManager.TerrainWidth * FOWHexProperties.width);
        Texture2D texture = new Texture2D(size, size);
        texture.wrapMode = TextureWrapMode.Clamp;

        int posX;
        int posY;


        for (int x = 0; x < FogOfWar.TerrainManager.TerrainWidth; x++)
        {
            for (int y = 0; y < FogOfWar.TerrainManager.TerrainHeight; y++)
            {
                posX = Mathf.RoundToInt(x * 2 * FOWHexProperties.tileR + (y % 2 == 0 ? 0 : 1) * FOWHexProperties.tileR + FOWHexProperties.tileR);
                posY = Mathf.RoundToInt(y * (FOWHexProperties.tileH + FOWHexProperties.side));

                if (FogOfWar.TerrainManager.hexGrid[x, y].Visible)
                {
                    Hex.DrawFOWHex(texture, posX, posY, Color.white);
                }
                else if (FogOfWar.TerrainManager.hexGrid[x, y].Explored)
                {
                    Hex.DrawFOWHex(texture, posX, posY, Color.gray);
                }
                else
                {
                    Hex.DrawFOWHex(texture, posX, posY, Color.black);
                }

            }
        }

        texture.Apply();
        return texture;
    }


}
