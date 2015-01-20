using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class TerrainManagerController : TerrainManagerControllerBase
{

    //[Inject] public ChunkController ChunkController { get; set; }


    public override void InitializeTerrainManager(TerrainManagerViewModel terrainManager)
    {
    }

    public override void GenerateMap(TerrainManagerViewModel terrainManager)
    {
        Timer.Start("Generating map");

        // Make sure to calculate the Hexagon dimensions before we do any logic
        HexProperties.SetProperties(terrainManager.HexagonSide);


        GenerateTerrainData        (terrainManager);
        TerrainDataToHexagonGrid   (terrainManager);
        SetupHexagonGridNeighbors  (terrainManager);
        CalculateWaterPools             (terrainManager);
        GenerateRivers             (terrainManager);
        CalculateHumidity          (terrainManager);
        CalculateTemperature       (terrainManager);
        CalculateBiomes            (terrainManager);
        
        
        ChunkController.ExecuteCommand(terrainManager.GenerateChunks);

        Timer.End();
    }


    public override void GenerateChunks(TerrainManagerViewModel terrainManager)
    {
        Timer.Start("Generating chunks");

        terrainManager.chunkHexCountX = (int)(terrainManager.ChunkSize / HexProperties.width);
        terrainManager.chunkHexCountY = (int)(terrainManager.ChunkSize / (HexProperties.tileH + HexProperties.side));

        int chunkCountX = Mathf.CeilToInt(terrainManager.TerrainWidth * HexProperties.width / (float)terrainManager.ChunkSize);
        int chunkCountY = Mathf.CeilToInt(terrainManager.TerrainHeight * (HexProperties.tileH + HexProperties.side) / (float)terrainManager.ChunkSize);


        terrainManager.Chunks = new ChunkViewModel[chunkCountX, chunkCountY];
        ChunkViewModel newChunk;
        for (int x = 0, v = 0; x < chunkCountX; x++)
        {
            for (int y = 0; y < chunkCountY; y++, v++)
            {

                newChunk = ChunkController.CreateChunk();
                newChunk.ChunkX = x;
                newChunk.ChunkY = y;
                newChunk.TerrainDataX = x * terrainManager.chunkHexCountX;
                newChunk.TerrainDataY = y * terrainManager.chunkHexCountY;

                terrainManager.Chunks[x, y] = newChunk;
            }
        }

        Timer.End();
    }
    

    private void GenerateTerrainData(TerrainManagerViewModel terrainManager)
    {
        int TerrainWidth = terrainManager.TerrainWidth;

        terrainManager.terrainData = new float[TerrainWidth + 1, TerrainWidth + 1];
        Pathfinding.gridSize = TerrainWidth * TerrainWidth + 2;

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
        Timer.Start("Terrain to hex grid");

        Vector3 worldPos = new Vector3();
        int gameHeight;
        
        terrainManager.hexGrid = new Hex[terrainManager.TerrainWidth, terrainManager.TerrainHeight];
        terrainManager.waterTiles = new List<Hex>();
        
        for (int x=0; x < terrainManager.TerrainWidth; x++)
        {
            for (int y=0; y < terrainManager.TerrainHeight; y++)
            {
                gameHeight = Mathf.RoundToInt(terrainManager.Altitudes * terrainManager.terrainData[x, y]);

                worldPos.x = Mathf.RoundToInt(x * 2 * HexProperties.tileR + (y % 2 == 0 ? 0 : 1) * HexProperties.tileR + HexProperties.tileR) / (float)terrainManager.PixelsPerUnit;
                worldPos.y = (gameHeight / terrainManager.Altitudes) * terrainManager.PixelToHeight;
                worldPos.z = Mathf.RoundToInt(y * (HexProperties.tileH + HexProperties.side) + HexProperties.side) / (float)terrainManager.PixelsPerUnit;


                terrainManager.hexGrid[x, y] = new Hex(new Vector2(x, y), 
                                                       (int)Mathf.Clamp(gameHeight, 1, terrainManager.Altitudes), 
                                                       gameHeight / terrainManager.Altitudes, 
                                                       worldPos, 
                                                       terrainManager.Humidity,
                                                       (int)terrainManager.TemperatureSpread.Evaluate(y / (float)terrainManager.TerrainHeight));
                //Debug.Log(terrainManager.TemperatureSpread.Evaluate((float)y / (float)terrainManager.TerrainHeight));
                if (gameHeight == 1)
                {
                    terrainManager.waterTiles.Add(terrainManager.hexGrid[x, y]);
                }

            }
        }

        Timer.End();
    }

    public void SetupHexagonGridNeighbors(TerrainManagerViewModel terrainManager)
    {
        Timer.Start("Setup neighbors");

        Vector3 arrayPos;
        for (int y = 0; y < terrainManager.hexGrid.GetLength(1); y++)
        {
            for (int x = 0; x < terrainManager.hexGrid.GetLength(0); x++)
            {
                for (int n = 0; n < 6 && terrainManager.hexGrid[x, y] != null; n++)
                {
                    arrayPos = Hex.CubeToOffsetOddQ(terrainManager.hexGrid[x, y].cubeCoord + Hex.neighborDirs[n]);

                    if (arrayPos.x >= 0 && arrayPos.x < terrainManager.hexGrid.GetLength(0) && arrayPos.y >= 0 && arrayPos.y < terrainManager.hexGrid.GetLength(1))
                    {
                        terrainManager.hexGrid[x, y].neighbors.Add(terrainManager.hexGrid[(int)arrayPos.x, (int)arrayPos.y]);
                    }
                }
            }
        }

        Timer.End();
    }

    public void CalculateWaterPools(TerrainManagerViewModel terrainManager)
    {
        Timer.Start("Calculating water pools");

        List<Hex> seaLevelHexes = new List<Hex>(terrainManager.waterTiles);
        List<Hex> scannedHexes = new List<Hex>();
        
        while (seaLevelHexes.Count > 0)
        {

            scannedHexes.Clear();
            scannedHexes.Add(seaLevelHexes[0]);
            

            Hex.SearchNeighbors(scannedHexes[0], p_hex => p_hex.height == 1, scannedHexes);

            // if the area of water is less that the minimum lake size 
            if (scannedHexes.Count < terrainManager.MinLakeSize)
            {
                FlattenArea(scannedHexes, terrainManager);
            }
            else if (scannedHexes.Count < terrainManager.MaxLakeSize) // make lake
            {
                GenerateLake(scannedHexes, terrainManager);
            }
            else                                                      // make ocean
            {
                GenerateOcean(scannedHexes, terrainManager); 
            }


            foreach (Hex w_hex in scannedHexes)
            {
                seaLevelHexes.Remove(w_hex);
            }
        }

        Timer.End();
    }

    public void FlattenArea(List<Hex> hexes, TerrainManagerViewModel terrainManager)
    {
        for (int i = 0; i < hexes.Count; i++)
        {
            hexes[i].height = 2;
            hexes[i].heightmapHeight = hexes[i].height / terrainManager.Altitudes;
            terrainManager.waterTiles.Remove(hexes[i]);
        }
    }

    public void GenerateLake(List<Hex> hexes, TerrainManagerViewModel terrainManager)
    {
        for (int i = 0; i < hexes.Count; i++)
        {
            hexes[i].terrainType = TerrainType.Water;
        }
    }

    public void GenerateOcean(List<Hex> hexes, TerrainManagerViewModel terrainManager)
    {
        for (int i = 0; i < hexes.Count; i++)
        {
            hexes[i].terrainType = TerrainType.Water;
        }
    }


    public void GenerateRivers(TerrainManagerViewModel terrainManager)
    {
        Timer.Start("Generating rivers");

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
                //nextHex.terrainType = TerrainType.Water;
                terrainManager.waterTiles.Add(nextHex);
                Debug.Log("Flowing " + nextHex.arrayCoord);

                riverStrength--;
            }

            nextHex = null;
        }

        Timer.End();
    }

    public void CalculateHumidity(TerrainManagerViewModel terrainManager)
    {
        Timer.Start("Calculating humidity");

        for (int i = 0; i < terrainManager.waterTiles.Count; i++)
        {
            Hex.HumiditySpread(terrainManager.waterTiles[i], 3, 50, terrainManager.HumidySpreadDecrease, terrainManager.waterTiles);
        }
        // loop through rivers
        //for (int i = 0; i < terrainManager.seaLevelHexes.Count; i++)
        //{
        //    Hex.RainfallSpread(terrainManager.seaLevelHexes[i], 10, 10, terrainManager.seaLevelHexes);
        //}
        Timer.End();
    }

    public void CalculateTemperature(TerrainManagerViewModel terrainManager)
    {
        for (int x = 0; x < terrainManager.TerrainWidth; x++)
        {
            for (int y = 0; y < terrainManager.TerrainHeight; y++)
            {
                terrainManager.hexGrid[x, y].Temperature -= (int)terrainManager.HumidityTemperature.Evaluate(terrainManager.hexGrid[x, y].Humidity);
                terrainManager.hexGrid[x, y].Temperature -= (int)terrainManager.HeightTemperature.Evaluate(terrainManager.hexGrid[x, y].height);
            }
        }
    }

    public void CalculateBiomes(TerrainManagerViewModel terrainManager)
    {
        Timer.Start("Calculating biomeList");

        for (int x = 0; x < terrainManager.TerrainWidth; x++)
        {
            for (int y = 0; y < terrainManager.TerrainHeight; y++)
            {
                if (terrainManager.hexGrid[x, y].terrainType == TerrainType.None)
                    terrainManager.hexGrid[x, y].terrainType = TerrainType.Grassland;
            }
        }

        Timer.End();
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
            //if (hex.terrainType == TerrainType.Water || hex.RiverStrength > 0)
            //{
            //    hex = null;
            //}
        }

        return hex;
    }



    private void DiamondSquare(float[,] terrainData, int xbegin, int ybegin, int xend, int yend, float randomRange, float randomDiminish)
    {
        Timer.Start("Diamond square");

        float sum, randomNow = randomRange;
        int squareSize = xend - xbegin; // Length of x
        int x0, y0, x1, y1;

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

        Timer.End();
    }
}
