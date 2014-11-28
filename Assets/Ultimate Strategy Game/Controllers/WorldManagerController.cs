using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class WorldManagerController : WorldManagerControllerBase
{

    public override void InitializeWorldManager(WorldManagerViewModel worldManager)
    {
    }

    public override void GenerateMap(WorldManagerViewModel worldManager)
    {
        base.GenerateMap(worldManager);
        
        int timeStart = System.Environment.TickCount;

        SetHexProperties(worldManager);
        GenerateTerrainData(worldManager);
        GenerateChunks(worldManager);

        Debug.Log("Terrain generated: " + ((System.Environment.TickCount - timeStart) / 100f) + "ms");

    }

    public override void GenerateChunks(WorldManagerViewModel worldManager)
    {
        Debug.Log("Generating chunk");

        base.GenerateChunks(worldManager);
        

        int chunkHexCountX = (int)(worldManager.ChunkSize / worldManager.HexProperties.width);
        int chunkHexCountY = (int)(worldManager.ChunkSize / (worldManager.HexProperties.tileH + worldManager.HexProperties.side));

        int chunkCountX = Mathf.CeilToInt(worldManager.TerrainWidth * worldManager.HexProperties.width / (float)worldManager.ChunkSize);
        int chunkCountY = Mathf.CeilToInt(worldManager.TerrainHeight * (worldManager.HexProperties.tileH + worldManager.HexProperties.side) / (float)worldManager.ChunkSize);

        Debug.Log("chunkHexCount X " + chunkHexCountX);
        Debug.Log("ChunkHexCount Y " + chunkHexCountY);
        Debug.Log("Chunk count X " + chunkCountX);
        Debug.Log("Chunk count Y " + chunkCountY);
        

        worldManager.Chunks.Clear();
        ChunkViewModel newChunk;
        for (int x = 0, v = 0; x < chunkCountX; x++)
        {
            for (int y = 0; y < chunkCountY; y++, v++)
            {

                newChunk = ChunkController.CreateChunk();
                newChunk.ChunkX = x;
                newChunk.ChunkY = y;
                newChunk.TerrainDataX = x * chunkHexCountX;
                newChunk.TerrainDataY = y * chunkHexCountY;

                worldManager.Chunks.Add(newChunk);
            }
        }
    }


    private void SetHexProperties(WorldManagerViewModel worldManager)
    {
        worldManager.HexProperties = new HexProperties();
        worldManager.HexProperties.side = worldManager.HexagonSide;
        worldManager.HexProperties.tileH = Mathf.Sin((30f * Mathf.PI) / 180f) * worldManager.HexProperties.side;
        worldManager.HexProperties.tileR = Mathf.Cos((30f * Mathf.PI) / 180f) * worldManager.HexProperties.side;

        worldManager.HexProperties.width = Mathf.RoundToInt(2f * worldManager.HexProperties.tileR);
        worldManager.HexProperties.height = Mathf.RoundToInt(worldManager.HexProperties.side + 2f * worldManager.HexProperties.tileH);
    }


    private void GenerateTerrainData(WorldManagerViewModel worldManager)
    {
        int TerrainWidth = worldManager.TerrainWidth;

        worldManager.terrainData = new float[TerrainWidth + 1, TerrainWidth + 1];

        // Setup the values of the four coreners of the world
        // Later to some logic to get terrian settings from the menu
        // The have custom code for different map types such as donut mirrored and so on.
        worldManager.terrainData[0, 0] = UnityEngine.Random.Range(0.1995f, 0.8005f);
        worldManager.terrainData[TerrainWidth, 0] = UnityEngine.Random.Range(0.2995f, 0.9005f);
        worldManager.terrainData[0, TerrainWidth] = UnityEngine.Random.Range(0.2995f, 1.005f);
        worldManager.terrainData[TerrainWidth, TerrainWidth] = UnityEngine.Random.Range(0.1995f, 0.6005f);

        DiamondSquare(worldManager.terrainData, 0, 0, TerrainWidth, TerrainWidth, worldManager.AltitudeVariation, worldManager.Detail);
    }


    private void DiamondSquare(float[,] terrainData, int xbegin, int ybegin, int xend, int yend, float randomRange, float randomDiminish)
    {

        float sum, randomNow = randomRange;
        int squareSize = xend - xbegin; // Length of x
        int x0, y0, x1, y1;

        int diamondTimer = System.Environment.TickCount;

        while (squareSize > 1)
        {
            // diamond step
            for (x0 = xbegin; x0 < xend; x0 += squareSize)
            {
                x1 = x0 + squareSize; // right

                for (y0 = ybegin; y0 < yend; y0 += squareSize)
                {
                    y1 = y0 + squareSize; // right


                    int midx = x0 + (x1 - x0) / 2; // Middle of the points
                    int midy = y0 + (y1 - y0) / 2;

                    sum = (terrainData[x0, y0] + terrainData[x0, y1] + terrainData[x1, y0] + terrainData[x1, y1]) / 4.0f; // Get avarage of the 4 points
                    terrainData[midx, midy] = sum * (1 + UnityEngine.Random.Range(-randomNow, randomNow)); // middle * (0.6 - 1.4) - essentially adds a bit of vaRIATION TO 
                }
            }

            // square step
            for (x0 = xbegin; x0 < xend; x0 += squareSize)
            {
                x1 = x0 + squareSize; // right

                for (y0 = ybegin; y0 < yend; y0 += squareSize)
                {
                    y1 = y0 + squareSize; // right

                    int midx = x0 + (x1 - x0) / 2; // Middle of the points
                    int midy = y0 + (y1 - y0) / 2;


                    if (y0 == ybegin) // top
                    {
                        sum = (terrainData[x0, y0] + terrainData[x1, y0] + terrainData[midx, midy]) / 3.0f; // Avarage middle top edge
                        terrainData[midx, y0] = sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow)));
                    }
                    else
                    {
                        sum = (terrainData[x0, y0] + terrainData[x1, y0] + terrainData[midx, midy] + terrainData[midx, midy - squareSize]) / 4.0f; // Bottom
                        terrainData[midx, y0] = sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow)));
                    }

                    if (y1 == yend)
                    {
                        sum = (terrainData[x0, y1] + terrainData[x1, y1] + terrainData[midx, midy]) / 3.0f;
                        terrainData[midx, y1] = sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow)));
                    }
                    else
                    {
                        sum = (terrainData[x0, y1] + terrainData[x1, y1] + terrainData[midx, midy] + terrainData[midx, midy + squareSize]) / 4.0f;
                        terrainData[midx, y1] = sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow)));
                    }

                    if (x0 == xbegin)
                    {
                        sum = (terrainData[x0, y0] + terrainData[x0, y1] + terrainData[midx, midy]) / 3.0f;
                        terrainData[x0, midy] = sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow)));
                    }
                    else
                    {
                        sum = (terrainData[x0, y0] + terrainData[x0, y1] + terrainData[midx, midy] + terrainData[midx - squareSize, midy]) / 4.0f;
                        terrainData[x0, midy] = sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow)));
                    }

                    if (x1 == xend)
                    {
                        sum = (terrainData[x1, y0] + terrainData[x1, y1] + terrainData[midx, midy]) / 3.0f;
                        terrainData[x1, midy] = sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow)));
                    }
                    else
                    {
                        sum = (terrainData[x1, y0] + terrainData[x1, y1] + terrainData[midx, midy] + terrainData[midx + squareSize, midy]) / 4.0f;
                        terrainData[x1, midy] = sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow)));
                    }
                }
            }

            squareSize /= 2; // Divide the map
            randomNow *= randomDiminish; // Decrease the randomization
        }

        Debug.Log("Diamond Square: " + ((System.Environment.TickCount - diamondTimer) / 100f) + "ms");
    }



}
