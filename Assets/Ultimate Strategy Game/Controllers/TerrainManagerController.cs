using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class TerrainManagerController : TerrainManagerControllerBase
{

    public override void InitializeTerrainManager(TerrainManagerViewModel terrainManager)
    {
    }

    public override void GenerateMap(TerrainManagerViewModel terrainManager)
    {
        base.GenerateMap(terrainManager);
        int timeStart = System.Environment.TickCount;

        // Make sure to calculate the Hexagon dimensions before we do any logic
        HexProperties.SetProperties(terrainManager.HexagonSide);


        GenerateTerrainData(terrainManager);
        TerrainDataToHexagonGrid(terrainManager);
        SetupHexagonGridNeighbors(terrainManager);
        GenerateRivers(terrainManager);
        CalculateMoisture(terrainManager);
        CalculateTemperature(terrainManager);
        CalculateBiomes(terrainManager);
        

        GenerateChunks(terrainManager);



        Debug.Log("Terrain generated: " + (System.Environment.TickCount - timeStart) + "ms");

    }

    /* Use this later for timed mao generation
    public IEnumerator GenerateMap(TerrainManagerViewModel terrainManager)
    {
        /*
        // Don't want to generate anything less than 10x10 tiles
        if (coreMap.Height < 10) coreMap.Height = 10;
        if (coreMap.Width < 10) coreMap.Width = 10;
        var tileSize = coreMap.TileSize;
        var total = coreMap.Height * coreMap.Width;
        var progress = 0;
        for (int i = 0; i < coreMap.Width; i++)
        {
            for (int j = 0; j < coreMap.Height; j++)
            {
                var tileToAdd = new MapTileViewModel(MapTileController)
                {
                    Position = new Vector3(i * tileSize, 0, j * tileSize)
                };
                tileToAdd.Position = new Vector3(i * tileSize, 0, j * tileSize);
                coreMap.VisibleTiles.Add(tileToAdd);
                coreMap.GenerationProgress = (float)++progress / total;
                yield return null;
            }
        }
        yield break;
         
    }* */



    public override void GenerateChunks(TerrainManagerViewModel terrainManager)
    {
        int timeStart = System.Environment.TickCount;

        base.GenerateChunks(terrainManager);
        

        int chunkHexCountX = (int)(terrainManager.ChunkSize / HexProperties.width);
        int chunkHexCountY = (int)(terrainManager.ChunkSize / (HexProperties.tileH + HexProperties.side));

        int chunkCountX = Mathf.CeilToInt(terrainManager.TerrainWidth * HexProperties.width / (float)terrainManager.ChunkSize);
        int chunkCountY = Mathf.CeilToInt(terrainManager.TerrainHeight * (HexProperties.tileH + HexProperties.side) / (float)terrainManager.ChunkSize);



        Debug.Log("chunkHexCount X " + chunkHexCountX);
        Debug.Log("ChunkHexCount Y " + chunkHexCountY);
        Debug.Log("Chunk count X " + chunkCountX);
        Debug.Log("Chunk count Y " + chunkCountY);
        

        terrainManager.Chunks.Clear();
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

                terrainManager.Chunks.Add(newChunk);
            }
        }

        Debug.Log("Chunks generated: " + (System.Environment.TickCount - timeStart) + "ms");
    }

    private void GenerateTerrainData(TerrainManagerViewModel terrainManager)
    {
        int TerrainWidth = terrainManager.TerrainWidth;

        terrainManager.terrainData = new float[TerrainWidth + 1, TerrainWidth + 1];

        // Setup the values of the four coreners of the world
        // Later to some logic to get terrian settings from the menu
        // The have custom code for different map types such as donut mirrored and so on.
        //terrainManager.terrainData[0, 0] = UnityEngine.Random.Range(0.1995f, 0.8005f);
        //terrainManager.terrainData[TerrainWidth, 0] = UnityEngine.Random.Range(0.2995f, 0.9005f);
        //terrainManager.terrainData[0, TerrainWidth] = UnityEngine.Random.Range(0.2995f, 1.005f);
        //terrainManager.terrainData[TerrainWidth, TerrainWidth] = UnityEngine.Random.Range(0.1995f, 0.6005f);

        terrainManager.terrainData[0, 0] = 0.5f;
        terrainManager.terrainData[TerrainWidth, 0] = 0.5f;
        terrainManager.terrainData[0, TerrainWidth] = 0.5f;
        terrainManager.terrainData[TerrainWidth, TerrainWidth] = 0.5f;

        DiamondSquare(terrainManager.terrainData, 0, 0, TerrainWidth, TerrainWidth, terrainManager.AltitudeVariation, terrainManager.Detail);
    }

    public void TerrainDataToHexagonGrid(TerrainManagerViewModel terrainManager)
    {
        Vector3 worldPos = new Vector3();
        int gameHeight;
        terrainManager.hexGrid = new Hex[terrainManager.TerrainWidth, terrainManager.TerrainHeight];
        for (int x=0; x < terrainManager.TerrainWidth; x++)
        {
            for (int y=0; y < terrainManager.TerrainHeight; y++)
            {

                worldPos.x = Mathf.RoundToInt(x * 2 * HexProperties.tileR + (y % 2 == 0 ? 0 : 1) * HexProperties.tileR + HexProperties.tileR) / (float)terrainManager.PixelsPerUnit;
                worldPos.y = Mathf.Round(terrainManager.terrainData[x, y] / terrainManager.Altitudes) * terrainManager.Altitudes * terrainManager.PixelToHeight;
                worldPos.z = Mathf.RoundToInt(y * (HexProperties.tileH + HexProperties.side) + HexProperties.side) / (float)terrainManager.PixelsPerUnit;
                gameHeight = (int)(Mathf.Round(terrainManager.terrainData[x, y] / terrainManager.Altitudes) * terrainManager.Altitudes / terrainManager.terrainData[x, y] / terrainManager.Altitudes - 1);

                terrainManager.hexGrid[x, y] = new Hex(new Vector2(x, y), gameHeight, terrainManager.terrainData[x, y], worldPos);
            }
        }
    }

    public void SetupHexagonGridNeighbors(TerrainManagerViewModel terrainManager)
    {
        int timeStart = System.Environment.TickCount;

        Vector3 arrayPos;
        for (int y = 0; y < terrainManager.hexGrid.GetLength(1); y++)
        {
            for (int x = 0; x < terrainManager.hexGrid.GetLength(0); x++)
            {
                // Setup hex neighbors !!! DOEN"T WORK PROERLY!
                for (int n = 0; n < 6; n++)
                {
                    arrayPos = Hex.CubeToOffsetOddQ(terrainManager.hexGrid[x, y].cubeCoord + Hex.neighborDirs[n]);

                    if (arrayPos.x >= 0 && arrayPos.x < terrainManager.hexGrid.GetLength(0) && arrayPos.y >= 0 && arrayPos.y < terrainManager.hexGrid.GetLength(1))
                    {
                        terrainManager.hexGrid[x, y].neighbors[n] = terrainManager.hexGrid[(int)arrayPos.x, (int)arrayPos.y];
                    }
                }
            }
        }
        Debug.Log("Setting up hex neighbors: " + (System.Environment.TickCount - timeStart) + "ms");
    }

    public void GenerateRivers(TerrainManagerViewModel terrainManager)
    {
        int totalRivers = 0;
        int riverStrength = 0;
        int randomX, randomY;
        Hex nextHex = null;
        int iterations = 0;

        // Keep creating rivers unitStack we are done
        while (totalRivers < terrainManager.RiverCount && iterations <= 100)
        {
            // Get a new hex of the minimum height
            while (nextHex == null && iterations <= 100)
            {
                iterations++;
                randomX = (int)UnityEngine.Random.Range(0, terrainManager.TerrainWidth);
                randomY = (int)UnityEngine.Random.Range(0, terrainManager.TerrainHeight);
                if (terrainManager.hexGrid[randomX, randomY].height >= terrainManager.MinRiverHeight)
                {
                    nextHex = terrainManager.hexGrid[randomX, randomY];

                    riverStrength = (int)UnityEngine.Random.Range(terrainManager.MinRiverStrength, terrainManager.MaxRiverStrength);
                    nextHex.RiverStrength = riverStrength;
                    totalRivers++;
                    Debug.Log("Started river " + nextHex.arrayCoord);
                    
                }               
            }

            while (riverStrength > 0)
            {
                /* Got down the path fo the lowest neighbor height
                for (int n = 0; n < 6; n++)
                {
                    if (nextHex.neighbors[n] != null && nextHex.neighbors[n].heightmapHeight < nextHex.heightmapHeight)
                    {
                        nextHex = nextHex.neighbors[n];
                        break;
                    }else{
                        if (n == 5)
                            nextHex = nextHex.neighbors[(int)UnityEngine.Random.Range(0, 5)];
                    }
                    
                }*/

                nextHex = nextHex.neighbors[(int)UnityEngine.Random.Range(0, 5)];

                nextHex.RiverStrength = riverStrength;
                Debug.Log("Flowing " + nextHex.arrayCoord);

                riverStrength--;
            }

            nextHex = null;
        }

        Debug.Log("River iterations " + iterations);

    }

    public void CalculateMoisture(TerrainManagerViewModel terrainManager)
    {

    }

    public void CalculateTemperature(TerrainManagerViewModel terrainManager)
    {

    }

    public void CalculateBiomes(TerrainManagerViewModel terrainManager)
    {

    }

    public Hex GetStartingLocation (TerrainManagerViewModel terrainManager)
    {   
        Hex hex = null;

        int randomX = 0, randomY = 0;

        while (hex == null)
        {
            randomX = (int)UnityEngine.Random.Range(0, terrainManager.TerrainWidth);
            randomY = (int)UnityEngine.Random.Range(0, terrainManager.TerrainHeight);
            
            hex = terrainManager.hexGrid[randomX, randomY];

            // If the hex an invalid spawning location get a new one!
            if (hex.terrainType == TerrainType.Water || hex.RiverStrength > 0)
            {
                hex = null;
            }
        }

        return hex;
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
                    terrainData[midx, midy] = Mathf.Clamp(sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow))), 0, 1); // middle * (0.6 - 1.4) - essentially adds a bit of vaRIATION TO 
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
                        terrainData[midx, y0] = Mathf.Clamp(sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow))), 0, 1);
                    }
                    else
                    {
                        sum = (terrainData[x0, y0] + terrainData[x1, y0] + terrainData[midx, midy] + terrainData[midx, midy - squareSize]) / 4.0f; // Bottom
                        terrainData[midx, y0] = Mathf.Clamp(sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow))), 0, 1);
                    }

                    if (y1 == yend)
                    {
                        sum = (terrainData[x0, y1] + terrainData[x1, y1] + terrainData[midx, midy]) / 3.0f;
                        terrainData[midx, y1] = Mathf.Clamp(sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow))), 0, 1);
                    }
                    else
                    {
                        sum = (terrainData[x0, y1] + terrainData[x1, y1] + terrainData[midx, midy] + terrainData[midx, midy + squareSize]) / 4.0f;
                        terrainData[midx, y1] = Mathf.Clamp(sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow))), 0, 1);
                    }

                    if (x0 == xbegin)
                    {
                        sum = (terrainData[x0, y0] + terrainData[x0, y1] + terrainData[midx, midy]) / 3.0f;
                        terrainData[x0, midy] = Mathf.Clamp(sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow))), 0, 1);
                    }
                    else
                    {
                        sum = (terrainData[x0, y0] + terrainData[x0, y1] + terrainData[midx, midy] + terrainData[midx - squareSize, midy]) / 4.0f;
                        terrainData[x0, midy] = Mathf.Clamp(sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow))), 0, 1);
                    }

                    if (x1 == xend)
                    {
                        sum = (terrainData[x1, y0] + terrainData[x1, y1] + terrainData[midx, midy]) / 3.0f;
                        terrainData[x1, midy] = Mathf.Clamp(sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow))), 0, 1);
                    }
                    else
                    {
                        sum = (terrainData[x1, y0] + terrainData[x1, y1] + terrainData[midx, midy] + terrainData[midx + squareSize, midy]) / 4.0f;
                        terrainData[x1, midy] = Mathf.Clamp(sum * ((1.0f + UnityEngine.Random.Range(-randomNow, randomNow))), 0, 1);
                    }
                }
            }

            squareSize /= 2; // Divide the map
            randomNow *= randomDiminish; // Decrease the randomization
        }

        Debug.Log("Diamond Square: " + ((System.Environment.TickCount - diamondTimer) / 100f) + "ms");
    }
}
