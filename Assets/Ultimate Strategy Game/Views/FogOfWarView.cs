using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class FogOfWarView 
{

    public GameObject fow;

    public RenderTexture renderTexture;
    Material material;


    public override void Start()
    {
        base.Start();

        material = new Material(Shader.Find("GUI/Text Shader"));
        material.hideFlags = HideFlags.HideAndDontSave;
        material.shader.hideFlags = HideFlags.HideAndDontSave;

        FOWHexProperties.SetProperties(FogOfWar.HexBorderLegnth);
    }

    /// Invokes UpdateFOWExecuted when the UpdateFOW command is executed.
    public override void UpdateFOWExecuted() 
    {


      
        fow.transform.localScale = new Vector3(FogOfWar.TerrainManager.TerrainWidth, -FogOfWar.TerrainManager.TerrainWidth, FogOfWar.TerrainManager.TerrainWidth) * HexProperties.width / FogOfWar.TerrainManager.PixelsPerUnit;
        fow.transform.position = new Vector3(FogOfWar.TerrainManager.TerrainWidth, 2.5f, FogOfWar.TerrainManager.TerrainWidth) * HexProperties.width / FogOfWar.TerrainManager.PixelsPerUnit / 2;

        fow.GetComponent<Renderer>().material.SetTexture("_MainTex", DrawFov());
        //fow.GetComponent<Renderer>().material.SetTexture DrawFov());("_MainTex","texture");

    }
    
    /// Invokes UpdateUnitViewExecuted when the UpdateUnitView command is executed.
    public override void UpdateUnitViewExecuted() 
    {

    }

    public Texture2D DrawFov()
    {
        //int chunkSize = FogOfWar.TerrainManager.ChunkSize;

        int size = (int)(FogOfWar.TerrainManager.TerrainWidth * FOWHexProperties.width);
        //Texture2D texture = new Texture2D(size, size);
        //texture.wrapMode = TextureWrapMode.Clamp;

        float posX;
        float posY;


        // get a temporary RenderTexture //
        renderTexture = RenderTexture.GetTemporary(size, size);

        // set the RenderTexture as global target (that means GL too)
        RenderTexture.active = renderTexture;

        // clear GL //
        GL.Clear(false, true, Color.black);

        // render GL immediately to the active render texture //
        material.SetPass(0);
        GL.PushMatrix();
        GL.LoadPixelMatrix(0, size, size, 0);


        GL.Begin(GL.TRIANGLES);


        for (int x = 0; x < FogOfWar.TerrainManager.TerrainWidth; x++)
        {
            for (int y = 0; y < FogOfWar.TerrainManager.TerrainHeight; y++)
            {

                if (FogOfWar.TerrainManager.hexGrid[x, y].Visible)
                {
                    GL.Color(new Color(1, 1, 1, 1));
                }
                else if (FogOfWar.TerrainManager.hexGrid[x, y].Explored)
                {
                    GL.Color(Color.gray);
                }
                else
                {
                    continue;
                }

                posX = x * 2 * FOWHexProperties.tileR + (y % 2 == 0 ? 0 : 1) * FOWHexProperties.tileR + FOWHexProperties.tileR;
                posY = y * (FOWHexProperties.tileH + FOWHexProperties.side) + +FOWHexProperties.side;


                GL.Vertex3(posX + FOWHexProperties.vertPos[0].x, posY + FOWHexProperties.vertPos[0].y, 0);
                GL.Vertex3(posX + FOWHexProperties.vertPos[1].x, posY + FOWHexProperties.vertPos[1].y, 0);
                GL.Vertex3(posX + FOWHexProperties.vertPos[2].x, posY + FOWHexProperties.vertPos[2].y, 0);
                 

                GL.Vertex3(posX + FOWHexProperties.vertPos[0].x, posY + FOWHexProperties.vertPos[0].y, 0);
                GL.Vertex3(posX + FOWHexProperties.vertPos[2].x, posY + FOWHexProperties.vertPos[2].y, 0);
                GL.Vertex3(posX + FOWHexProperties.vertPos[3].x, posY + FOWHexProperties.vertPos[3].y, 0);

                GL.Vertex3(posX + FOWHexProperties.vertPos[0].x, posY + FOWHexProperties.vertPos[0].y, 0);
                GL.Vertex3(posX + FOWHexProperties.vertPos[3].x, posY + FOWHexProperties.vertPos[3].y, 0);
                GL.Vertex3(posX + FOWHexProperties.vertPos[4].x, posY + FOWHexProperties.vertPos[4].y, 0);

                GL.Vertex3(posX + FOWHexProperties.vertPos[0].x, posY + FOWHexProperties.vertPos[0].y, 0);
                GL.Vertex3(posX + FOWHexProperties.vertPos[4].x, posY + FOWHexProperties.vertPos[4].y, 0);
                GL.Vertex3(posX + FOWHexProperties.vertPos[5].x, posY + FOWHexProperties.vertPos[5].y, 0);

            }
        }

        GL.End();
        GL.PopMatrix();


        // read the active RenderTexture into a new Texture2D //
        Texture2D newTexture = new Texture2D(size, size);
        newTexture.ReadPixels(new Rect(0, 0, size, size), 0, 0, false);


        // apply pixels and compress //
        newTexture.Apply();
        //newTexture.Compress(true); // might not want to compress! check later

        // clean up after the party //
        //RenderTexture.active = null;
        //RenderTexture.ReleaseTemporary(renderTexture);


        // return the goods //
        return newTexture;
    }


    /*
    private Texture2D DrawFov()
    {

        int chunkSize = FogOfWar.TerrainManager.ChunkSize;

        int size = (int)(FogOfWar.TerrainManager.TerrainWidth * FOWHexProperties.width);
        // get a temporary RenderTexture //
        renderTexture = RenderTexture.GetTemporary(chunkSize, chunkSize);

        // set the RenderTexture as global target (that means GL too)
        RenderTexture.active = renderTexture;

        // clear GL //
        GL.Clear(false, true, Color.red);

        // render GL immediately to the active render texture //
        material.SetPass(0);
        GL.PushMatrix();
        GL.LoadPixelMatrix(0, chunkSize, chunkSize, 0);


        GL.Begin(GL.TRIANGLES);
        GL.Color(Color.red);


        //int chunkSize = FogOfWar.TerrainManager.ChunkSize;

        
        //Texture2D texture = new Texture2D(size, size);
        //texture.wrapMode = TextureWrapMode.Clamp;

        int posX;
        int posY;


        for (int x = 0; x < FogOfWar.TerrainManager.TerrainWidth; x++)
        {
            for (int y = 0; y < FogOfWar.TerrainManager.TerrainHeight; y++)
            {
                //posX = Mathf.RoundToInt(x * 2 * FOWHexProperties.tileR + (y % 2 == 0 ? 0 : 1) * FOWHexProperties.tileR + FOWHexProperties.tileR);
                //posY = Mathf.RoundToInt(y * (FOWHexProperties.tileH + FOWHexProperties.side));

                //int ty = y;

                posX = Mathf.RoundToInt(x * 2 * FOWHexProperties.tileR + (y % 2 == 0 ? 0 : 1) * FOWHexProperties.tileR + FOWHexProperties.tileR);
                posY = Mathf.RoundToInt(y * (FOWHexProperties.tileH + FOWHexProperties.side));

                if (FogOfWar.TerrainManager.hexGrid[x, y].Visible)
                {
                    GL.Color(Color.white);
                    Debug.Log("Shown");
                }
                else if (FogOfWar.TerrainManager.hexGrid[x, y].Explored)
                {
                    GL.Color(Color.gray);
                }
                else
                {
                    GL.Color(Color.gray);
                }


                GL.Vertex3(posX + HexProperties.vertPos[0].x, posY + HexProperties.vertPos[0].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[1].x, posY + HexProperties.vertPos[1].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[2].x, posY + HexProperties.vertPos[2].y, 0);


                GL.Vertex3(posX + HexProperties.vertPos[0].x, posY + HexProperties.vertPos[0].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[2].x, posY + HexProperties.vertPos[2].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[3].x, posY + HexProperties.vertPos[3].y, 0);

                GL.Vertex3(posX + HexProperties.vertPos[0].x, posY + HexProperties.vertPos[0].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[3].x, posY + HexProperties.vertPos[3].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[4].x, posY + HexProperties.vertPos[4].y, 0);

                GL.Vertex3(posX + HexProperties.vertPos[0].x, posY + HexProperties.vertPos[0].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[4].x, posY + HexProperties.vertPos[4].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[5].x, posY + HexProperties.vertPos[5].y, 0);

            }
        }

        GL.End();
        GL.PopMatrix();


        // read the active RenderTexture into a new Texture2D //
        Texture2D newTexture = new Texture2D(FogOfWar.TerrainManager.ChunkSize, FogOfWar.TerrainManager.ChunkSize);
        newTexture.ReadPixels(new Rect(0, 0, FogOfWar.TerrainManager.ChunkSize, FogOfWar.TerrainManager.ChunkSize), 0, 0);


        // apply pixels and compress //
        newTexture.Apply(false);
        newTexture.Compress(true); // might not want to compress! check later

        // clean up after the party //
        //RenderTexture.active = null;
        //RenderTexture.ReleaseTemporary(renderTexture);


        // return the goods //
        return newTexture;
    }*/

    /*
    private Texture2D DrawChunkBiome(int chunkX, int chunkY)
    {

        TerrainManagerViewModel TerrainManager = FogOfWar.TerrainManager;

        int dataX = TerrainManager.Chunks[chunkX, chunkY].TerrainDataX;
        int dataY = TerrainManager.Chunks[chunkX, chunkY].TerrainDataY;

        int chunkSize = TerrainManager.ChunkSize;

        int posX;
        int posY;

        int chunkHexCountX = TerrainManager.chunkHexCountX;
        int chunkHexCountY = TerrainManager.chunkHexCountY;


        int chunkTextureOffsetX = chunkX * chunkSize;
        int chunkTextureOffsetY = chunkY * chunkSize;



        // get a temporary RenderTexture //
        renderTexture = RenderTexture.GetTemporary(chunkSize, chunkSize);

        // set the RenderTexture as global target (that means GL too)
        RenderTexture.active = renderTexture;

        // clear GL //
        GL.Clear(false, true, Color.black);

        // render GL immediately to the active render texture //
        material.SetPass(0);
        GL.PushMatrix();
        GL.LoadPixelMatrix(0, chunkSize, chunkSize, 0);


        GL.Begin(GL.TRIANGLES);
        GL.Color(Color.red);

        for (int x = dataX; x <= dataX + chunkHexCountX + chunkX && x < TerrainManager.TerrainWidth; x++)
        {
            for (int y = dataY; y <= dataY + chunkHexCountY + chunkY && y < TerrainManager.TerrainHeight; y++)
            {

                //int ty = y - dataY + chunkHexCountY + chunkY;

                posX = Mathf.RoundToInt(x * 2 * HexProperties.tileR + (y % 2 == 0 ? 0 : 1) * HexProperties.tileR + HexProperties.tileR) - chunkTextureOffsetX;
                posY = chunkSize - (Mathf.RoundToInt(y * (HexProperties.tileH + HexProperties.side) + HexProperties.side) - chunkTextureOffsetY);




                if (TerrainManager.hexGrid[x, y].terrainType == TerrainType.Water)
                {
                    GL.Color(Color.blue);
                    //GL.Color(new Color(colors[TerrainManager.hexGrid[x, y].height - 1].r, colors[TerrainManager.hexGrid[x, y].height - 1].g, colors[TerrainManager.hexGrid[x, y].height - 1].b));
                }
                else
                {
                    //GL.Color(new Color(0, (float)TerrainManager.hexGrid[x, y].Temperature / 40, 0));
                    //GL.Color(new Color(colors[TerrainManager.hexGrid[x, y].height - 1].r, colors[TerrainManager.hexGrid[x, y].height - 1].g, colors[TerrainManager.hexGrid[x, y].height - 1].b));

                    for (int i = 0; i < biomes.Length; i++)
                    {
                        if (TerrainManager.hexGrid[x, y].height == TerrainManager.Altitudes)
                        {
                            GL.Color(Color.white);
                            break;
                        }

                        if (TerrainManager.hexGrid[x, y].Temperature >= biomes[i].minTemp && TerrainManager.hexGrid[x, y].Humidity >= biomes[i].minHum)
                        {
                            TerrainManager.hexGrid[x, y].terrainType = (TerrainType)(i);
                            GL.Color(new Color(biomes[i].color.r, biomes[i].color.g, biomes[i].color.b)); //  * (1 - 0.3f * (1 - TerrainManager.hexGrid[x, y].height / 6f))
                            break;
                        }
                        GL.Color(Color.red);
                    }
                }

                GL.Vertex3(posX + HexProperties.vertPos[0].x, posY + HexProperties.vertPos[0].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[1].x, posY + HexProperties.vertPos[1].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[2].x, posY + HexProperties.vertPos[2].y, 0);


                GL.Vertex3(posX + HexProperties.vertPos[0].x, posY + HexProperties.vertPos[0].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[2].x, posY + HexProperties.vertPos[2].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[3].x, posY + HexProperties.vertPos[3].y, 0);

                GL.Vertex3(posX + HexProperties.vertPos[0].x, posY + HexProperties.vertPos[0].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[3].x, posY + HexProperties.vertPos[3].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[4].x, posY + HexProperties.vertPos[4].y, 0);

                GL.Vertex3(posX + HexProperties.vertPos[0].x, posY + HexProperties.vertPos[0].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[4].x, posY + HexProperties.vertPos[4].y, 0);
                GL.Vertex3(posX + HexProperties.vertPos[5].x, posY + HexProperties.vertPos[5].y, 0);

            }
        }

        GL.End();
        GL.PopMatrix();


        // read the active RenderTexture into a new Texture2D //
        Texture2D newTexture = new Texture2D(TerrainManager.ChunkSize, TerrainManager.ChunkSize);
        newTexture.ReadPixels(new Rect(0, 0, TerrainManager.ChunkSize, TerrainManager.ChunkSize), 0, 0);


        // apply pixels and compress //
        newTexture.Apply(false);
        newTexture.Compress(true); // might not want to compress! check later

        // clean up after the party //
        //RenderTexture.active = null;
        //RenderTexture.ReleaseTemporary(renderTexture);


        // return the goods //
        return newTexture;
    }*/

}
