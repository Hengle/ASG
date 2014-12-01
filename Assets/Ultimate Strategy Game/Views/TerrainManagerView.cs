using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class TerrainManagerView 
{

    public TerrainSettings terrainSettings;

    public Texture2D terrainHeightMap;

    public GameObject chunkPrefab;

    public bool displayHexNodes;
    public bool displayHexPath;



    void Update()
    {
        if (Input.GetKeyDown(KeyCode.G))
        {
            ExecuteGenerateMap();
        }
    }



    /// Invokes GenerateMapExecuted when the GenerateMap command is executed.
    public override void GenerateMapExecuted()
    {
        base.GenerateMapExecuted();
        terrainHeightMap = TerrainDataToHeightMap(TerrainManager.terrainData);
    }

    /// Invokes GenerateChunksExecuted when the GenerateChunks command is executed.
    public override void GenerateChunksExecuted()
    {
        base.GenerateChunksExecuted();

    }

    /// This binding will add or remove views based on an element/viewmodel collection.
    public override ViewBase CreateChunksView(ChunkViewModel item)
    {
        ViewBase chunkView = InstantiateView(chunkPrefab, item, new Vector3(item.ChunkX * (TerrainManager.ChunkSize / TerrainManager.PixelsPerUnit), 0, item.ChunkY * (TerrainManager.ChunkSize / TerrainManager.PixelsPerUnit)), Quaternion.identity);
        chunkView.gameObject.name = "Chunk [" + item.TerrainDataX + "," + item.TerrainDataY + "]";

        return chunkView;
    }

    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void ChunksAdded(ViewBase item)
    {
        base.ChunksAdded(item);
    }

    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void ChunksRemoved(ViewBase item)
    {
        base.ChunksRemoved(item);
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

    void OnDrawGizmos()
    {
        if (displayHexNodes)
        {
            Gizmos.color = Color.white;
            Vector2 arrayPos = Vector2.zero;
            for (int x = 0; x < TerrainManager.hexGrid.GetLength(0); x++)
            {
                for (int y = 0; y < TerrainManager.hexGrid.GetLength(1); y++)
                {
                    Gizmos.DrawWireSphere(TerrainManager.hexGrid[x, y].worldPos, 0.35f);
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

        /*
        if (showCurrentPathNodes)
        {
            Gizmos.color = Color.blue;

            for (int a = 0; a < path.Count; a++)
            {
                Gizmos.DrawWireSphere(path[a].worldPos, .75f);

                if (a + 1 < path.Count)
                    Gizmos.DrawLine(path[a].worldPos, path[a + 1].worldPos);

            }
        }
        */
    }
}
