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

        fow.transform.localScale = new Vector3(FogOfWar.TerrainManager.TerrainWidth, FogOfWar.TerrainManager.TerrainWidth, FogOfWar.TerrainManager.TerrainWidth) * HexProperties.width / FogOfWar.TerrainManager.PixelsPerUnit;
        fow.transform.position = new Vector3(FogOfWar.TerrainManager.TerrainWidth, 5, FogOfWar.TerrainManager.TerrainWidth) * HexProperties.width / FogOfWar.TerrainManager.PixelsPerUnit / 2;

        fow.renderer.material.SetTexture("_FOW", DrawFOW());

    }
    
    /// Invokes UpdateUnitViewExecuted when the UpdateUnitView command is executed.
    public override void UpdateUnitViewExecuted() {
        base.UpdateUnitViewExecuted();
    }

    public Texture2D DrawFOW()
    {

        int chunkSize = FogOfWar.TerrainManager.ChunkSize;

        int size = (int)(FogOfWar.TerrainManager.TerrainWidth * HexProperties.width);
        Texture2D texture = new Texture2D(size, size);
        texture.wrapMode = TextureWrapMode.Clamp;

        int posX;
        int posY;


        for (int x = 0; x < FogOfWar.TerrainManager.TerrainWidth; x++)
        {
            for (int y = 0; y < FogOfWar.TerrainManager.TerrainHeight; y++)
            {
                posX = Mathf.RoundToInt(x * 2 * HexProperties.tileR + (y % 2 == 0 ? 0 : 1) * HexProperties.tileR + HexProperties.tileR);
                posY = Mathf.RoundToInt(y * (HexProperties.tileH + HexProperties.side));

                if (FogOfWar.TerrainManager.hexGrid[x, y].Visible)
                {
                    Hex.DrawHex(texture, posX, posY, Color.white);
                }
                else if (FogOfWar.TerrainManager.hexGrid[x, y].Explored)
                {
                    Hex.DrawHex(texture, posX, posY, Color.gray);
                }
                else
                {
                    Hex.DrawHex(texture, posX, posY, Color.black);
                }

            }
        }

        texture.Apply();
        return texture;
    }


}
