using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class TerrainManagerView
{

    public GameObject chunkPrefab;



    public Texture2D terrainHeightMap;


    public bool displayHexNodes;
    public bool displayHexPath;


    public GameObject[,] chunks;
    public Texture2D[,] chunkHeightmaps;
    public Texture2D[,] chunkBiomes;


    //public Texture2D temp;
    //public Texture2D temp2;


    RenderTexture renderTexture;
    Material material;


    public Color[] colors;

    public Biome[] biomes;

    [System.Serializable]
    public class Biome
    {
        public string name;
        public int minTemp;
        public int minHum;
        public Color color;
    }



    public override void Start()
    {
        base.Start();

        // create material for GL rendering //
        material = new Material(Shader.Find("GUI/Text Shader"));
        material.hideFlags = HideFlags.HideAndDontSave;
        material.shader.hideFlags = HideFlags.HideAndDontSave;
    }



    /// Invokes GenerateMapExecuted when the GenerateMap command is executed.
    public override void GenerateMapExecuted()
    {
        base.GenerateMapExecuted();



    }

    /// Invokes GenerateChunksExecuted when the GenerateChunks command is executed.
    public override void GenerateChunksExecuted()
    {
        ChunkView.chunkSize = TerrainManager.ChunkSize;
        ChunkView.chunkResolution = TerrainManager.ChunkResolution;
        ChunkView.collisionResolution = TerrainManager.ChunkCollisionResolution;
        ChunkView.pixelsPerUnit = TerrainManager.PixelsPerUnit;

        GenerateChunkTextures();

        StartCoroutine(TimedChunkGeneration());

    }

    private IEnumerator TimedChunkGeneration()
    {

        ChunkView chunkView;
        Vector3 chunkPos;
        chunks = new GameObject[TerrainManager.Chunks.GetLength(0), TerrainManager.Chunks.GetLength(1)];

        for (int x = 0; x < TerrainManager.Chunks.GetLength(0); x++)
        {
            for (int y = 0; y < TerrainManager.Chunks.GetLength(1); y++)
            {

                chunkPos = new Vector3(TerrainManager.Chunks[x, y].ChunkX * (TerrainManager.ChunkSize / TerrainManager.PixelsPerUnit),
                                       0,
                                       TerrainManager.Chunks[x, y].ChunkY * (TerrainManager.ChunkSize / TerrainManager.PixelsPerUnit));

                var chunkObj = InstantiateView(chunkPrefab, TerrainManager.Chunks[x, y], chunkPos, Quaternion.identity);
                chunks[x, y] = chunkObj.gameObject;

                chunkObj.gameObject.name = "Chunk [" + TerrainManager.Chunks[x, y].TerrainDataX + ", " + TerrainManager.Chunks[x, y].TerrainDataY + "]";

                chunkView = chunkObj.gameObject.GetComponent<ChunkView>();

                chunkView.hexHeightmap = chunkHeightmaps[x, y];
                chunkView.hexBiomeMap = chunkBiomes[x, y];

                ExecuteCommand(TerrainManager.Chunks[x, y].GenerateChunk);

                yield return null;

            }
        }
        StitchChunks();
        yield return null;
    }

    public void StitchChunks()
    {
        for (int x = 0; x < TerrainManager.Chunks.GetLength(0); x++)
        {
            for (int y = 0; y < TerrainManager.Chunks.GetLength(1); y++)
            {
                if (x + 1 < TerrainManager.Chunks.GetLength(0))
                    ChunkView.StitchChunks(chunks[x, y].GetComponent<MeshFilter>().mesh, chunks[x + 1, y].GetComponent<MeshFilter>().mesh, 1);

                if (y + 1 < TerrainManager.Chunks.GetLength(1))
                    ChunkView.StitchChunks(chunks[x, y].GetComponent<MeshFilter>().mesh, chunks[x, y + 1].GetComponent<MeshFilter>().mesh, 0);
            }
        }
    }

    /// <summary>
    /// Converts the terrain data to a heightmap texture.
    /// </summary>
    private Texture2D TerrainDataToHeightMap(float[,] data)
    {
        int timer = System.Environment.TickCount;

        float height;
        Texture2D texture = new Texture2D(data.GetLength(0), data.GetLength(1));

        for (int x = 0; x < data.GetLength(0); x++)
        {
            for (int y = 0; y < data.GetLength(1); y++)
            {
                height = Mathf.Round(data[x, y] / 0.16f) * 0.16f;
                texture.SetPixel(x, y, new Color(height, height, height));
            }
        }

        texture.Apply();

        Debug.Log("Terrain data to texture: " + (System.Environment.TickCount - timer) + "ms");

        return texture;
    }

    private void GenerateChunkTextures()
    {
        int timer = System.Environment.TickCount;

        // set the RenderTexture as global target (that means GL too)
        RenderTexture.active = renderTexture;

        chunkHeightmaps = new Texture2D[TerrainManager.Chunks.GetLength(0), TerrainManager.Chunks.GetLength(1)];
        chunkBiomes = new Texture2D[TerrainManager.Chunks.GetLength(0), TerrainManager.Chunks.GetLength(1)];

        for (int x = 0; x < chunkHeightmaps.GetLength(0); x++)
        {
            for (int y = 0; y < chunkHeightmaps.GetLength(1); y++)
            {
                chunkHeightmaps[x, y] = DrawChunkHeightmap(x, y);
                chunkBiomes[x, y] = DrawChunkBiome(x, y);
            }
        }
        //temp = chunkHeightmaps[0, 0];
        //temp2 = chunkHeightmaps[1, 0];

        Debug.Log("Chunk heightmaps and biomes generated in: " + (System.Environment.TickCount - timer) + "ms");
    }

    private Texture2D DrawChunkHeightmap(int chunkX, int chunkY)
    {

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


        for (int x = dataX; x <= dataX + chunkHexCountX + chunkX && x < TerrainManager.TerrainWidth; x++)
        {
            for (int y = dataY; y <= dataY + chunkHexCountY + chunkY && y < TerrainManager.TerrainHeight; y++)
            {

                int ty = y;

                posX = Mathf.RoundToInt(x * 2 * HexProperties.tileR + (ty % 2 == 0 ? 0 : 1) * HexProperties.tileR + HexProperties.tileR) - chunkTextureOffsetX;
                posY = chunkSize - (Mathf.RoundToInt(ty * (HexProperties.tileH + HexProperties.side) + HexProperties.side) - chunkTextureOffsetY);

                GL.Color(new Color(TerrainManager.hexGrid[x, ty].heightmapHeight, TerrainManager.hexGrid[x, ty].heightmapHeight, TerrainManager.hexGrid[x, ty].heightmapHeight));

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
    }

    private Texture2D DrawChunkBiome(int chunkX, int chunkY)
    {

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
    }


    void OnDrawGizmos()
    {
        if (displayHexNodes && TerrainManager.hexGrid != null)
        {
            Gizmos.color = Color.white;
            Vector2 arrayPos = Vector2.zero;
            for (int x = 0; x < TerrainManager.hexGrid.GetLength(0); x++)
            {
                for (int y = 0; y < TerrainManager.hexGrid.GetLength(1); y++)
                {
                    Gizmos.DrawWireSphere(new Vector3(TerrainManager.hexGrid[x, y].worldPos.x, TerrainManager.PixelToHeight / (6 / TerrainManager.hexGrid[x, y].height), TerrainManager.hexGrid[x, y].worldPos.z), 1f);
                    //if (hoverHex == hexGrid[x, y])
                    //Gizmos.DrawWireSphere(hexGrid[x, y].worldPos, 0.5f);

                    for (int n = 0; n < 6; n++)
                    {
                        arrayPos = Hexagon.CubeToOffsetOddQ(TerrainManager.hexGrid[x, y].cubeCoord + Hexagon.neighborDirs[n]);

                        if (arrayPos.x >= 0 && arrayPos.x < TerrainManager.hexGrid.GetLength(0) && arrayPos.y >= 0 && arrayPos.y < TerrainManager.hexGrid.GetLength(1))
                            Gizmos.DrawLine(TerrainManager.hexGrid[x, y].worldPos, TerrainManager.hexGrid[(int)arrayPos.x, (int)arrayPos.y].worldPos);
                    }

                }
            }
        }
    }
}