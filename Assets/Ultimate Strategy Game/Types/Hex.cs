using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.Collections.ObjectModel;
using UnityEngine;


public partial class Hex : IHeapItem<Hex>
{


    public List<Hex> neighbors;


    public static Vector3[] neighborDirs = new Vector3[]{ new Vector3(+1, -1, 0), new Vector3(+1, 0, -1), new Vector3(0, +1, -1), 
                                                       new Vector3(-1, +1, 0), new Vector3(-1, 0, +1), new Vector3(0, -1, +1) };


    public static Vector3[] diagonalsDirs = new Vector3[]{ new Vector3(+2, -1, -1), new Vector3(+1, +1, -2), new Vector3(-1, +2, -1),
                                                       new Vector3(-2, +1, +1), new Vector3(-1, -1, +2), new Vector3(+1, -2, +1) };




    public Hex(Vector2 arrayCoord, int height, float heightmapHeight, Vector3 worldPos, int humidity, int temperature)
    {
        this.arrayCoord = arrayCoord;
        this.cubeCoord = OffsetToCubeOddQ(arrayCoord);

        this.worldPos = worldPos;
        this.height = height;
        this.heightmapHeight = heightmapHeight;
        this.neighbors = new List<Hex>();

        this.Humidity = humidity;
        this.Temperature = temperature;
    }

    public int fCost
    {
        get {
            return gCost + hCost;
        }
    }

    public int HeapIndex
    {
        get {
            return heapIndex;
        }
        set {
            heapIndex = value;
        }
    }

    public int CompareTo(Hex hexToCompare)
    {
        int compare = fCost.CompareTo(hexToCompare.fCost);
        if (compare == 0)
        {
            compare = hCost.CompareTo(hexToCompare.hCost);
        }
        return -compare;
    }





    public void SetPathParent(Hex parentHex)
    {
        pathScore = 0;


        if (parentHex == null)
        {
            pathParent = -1;
        }
        else
        {
            //Debug.Log("Seting parent " + parentHex.arrayCoord);
            for (int i = 0; i < 6; i++)
            {
                //Debug.Log(neighbors[i].arrayCoord);
                if (neighbors[i] == parentHex)
                    pathParent = i;
            }
            //Debug.Log(this + " pp: " + pathParent + " " + neighbors[pathParent]);
        }

    }

    public int GetPathScores(Hex goal)
    {
        // if there was no previous pathfinding to this hex 
        if (pathParent == -1)
        {
            pathScore = 0;
        }
        else
        {
            // Get the score of the parent hex
            int parentScore = neighbors[pathParent].pathScore;
            int score = (int)this.Distance(this.cubeCoord, goal.cubeCoord);

            // Do score logic here
            // score = calculate hight differences


            pathScore = parentScore + score;


            //if (Mathf.Abs(neighbors[pathParent].height - this.height) >= 2)
             //   pathScore += 50;

            //if (neighbors[pathParent].height == 5)
              //  pathScore += 20;

            //if (neighbors[pathParent].height == 0)
              //  pathScore += 20;

        }

        return pathScore;
    }




    public static Vector3 RoundCubeCoord(Vector3 cube)
    {
        float rx = Mathf.Round(cube.x);
        float ry = Mathf.Round(cube.y);
        float rz = Mathf.Round(cube.z);

        float x_diff = Mathf.Abs(rx - cube.x);
        float y_diff = Mathf.Abs(ry - cube.y);
        float z_diff = Mathf.Abs(rz - cube.z);

        if (x_diff > y_diff && x_diff > z_diff)
            rx = -ry - rz;
        else if (y_diff > z_diff)
            ry = -rx - rz;
        else
            rz = -rx - ry;

        return new Vector3(rx, ry, rz);
    }


    public static Vector2 ArrayCoordToOffset(Vector2 arrayCoord)
    {
        arrayCoord.y -= (int)(arrayCoord.x / 2);
        return arrayCoord;
    }


    public static Vector2 CubeToOffsetOddQ(Vector3 cube)
    {
        //# convert cube to odd-r offset
        //q = x + (z - (z&1)) / 2
        //r = z
        Vector2 offset = Vector2.zero;
        offset.x = cube.x + (cube.z - ((int)cube.z & 1)) / 2;
        offset.y = cube.z;

        return offset;
    }
    public static Vector3 OffsetToCubeOddQ(Vector2 array)
    {
        //# convert odd-r offset to cube
        //x = q - (r - (r&1)) / 2
        //z = r
        //y = -x-z
        Vector3 cube = new Vector3();
        cube.x = array.x - (array.y - ((int)array.y & 1)) / 2;
        cube.z = array.y;
        cube.y = -cube.x - cube.z;

        return cube;
    }




    public float Distance(Vector3 hex1, Vector3 hex2)
    {
        return (Mathf.Abs(hex1.x - hex2.x) + Mathf.Abs(hex1.y - hex2.y) + Mathf.Abs(hex1.z - hex2.z)) / 2;
    }

    public int DirectionTo(Hex toHex)
    {
        if (this == toHex)
        {
            Debug.LogWarning("Can't get direction to self");
            return -1;
        }

        Vector3 dir = toHex.worldPos - this.worldPos;
        float angle = Vector3.Angle(dir, Vector3.right);
        Vector3 rhs = Vector3.Cross(dir, Vector3.right);

        if (rhs.y < 0)
            return 5 - (int)(angle / 60);
        else
            return (int)(angle / 60);
    }


    public List<Vector3> InRange(int distance)
    {

        List<Vector3> results = new List<Vector3>();

        for (int x = -distance; -distance <= x && x <= distance; x++)
            for (int y = -distance; -distance <= y && y <= distance; y++)
                for (int z = -distance; -distance <= z && z <= distance; z++)
                    if (x + y + z == 0)
                        results.Add(new Vector3(x, y, z));


        /*
        for(int x = -distance, z=0; -distance <= x && x <= distance; x++)
        {
            for (int y = -distance; Mathf.Max(-distance, -x - distance) <= y && y <= Mathf.Min(distance, -x + distance); y++)
            {
                z = -x - y;
                results.Add(new Vector3(x, y, z));
            }
        }
        */

        return results;
    }

    
    public static void SearchNeighbors(Hex hex, Func<Hex, bool> searchParams, List<Hex> result)
    {
        hex.neighbors.Where(searchParams).ToList().ForEach(t_hex =>
        {
            if (result.Contains(t_hex) == false)
            {
                result.Add(t_hex);
                Hex.SearchNeighbors(t_hex, searchParams, result);
            }
        });
    }

    public static void HumiditySpread(Hex spreadHex, int range, int humidity, int humidityDecrease, List<Hex> waterTiles)
    {
        if (range > 0 && spreadHex.Humidity < humidity)
        {
            spreadHex.Humidity = humidity;
            
            foreach(Hex hex in spreadHex.neighbors)
            {
                // Make sure we don't set rainfall on a water tile
                if (hex.terrainType != TerrainType.Water)  //  && waterTiles.Contains(hex) == false
                {
                    HumiditySpread(hex, range - 1, humidity - humidityDecrease, humidityDecrease, waterTiles); 
                } 

            }
        }
    }

    public static Hex GetHexAtPos (TerrainManagerViewModel terrainManager, Vector3 pos)
    {
        float pointX = pos.x;
        float pointZ = pos.z;
        pointX = pointX * terrainManager.PixelsPerUnit;
        pointZ = pointZ * terrainManager.PixelsPerUnit;
        pointZ += HexProperties.tileH;
        pointX -= HexProperties.width / 2;
        pointZ -= (HexProperties.height - HexProperties.tileH);


        float q = (1f / 3f * Mathf.Sqrt(3f) * pointX - 1f / 3f * pointZ) / HexProperties.side;
        float r = 2f / 3f * pointZ / HexProperties.side;


        Vector3 cube = new Vector3();
        cube.x = q;
        cube.z = r;
        cube.y = -cube.x - cube.z;

        cube = Hexagon.RoundCubeCoord(cube);

        Vector2 hoverHexAraray = Hexagon.CubeToOffsetOddQ(cube);
        Hex hex = null;

        if (hoverHexAraray.x >= 0 && hoverHexAraray.y >= 0 && hoverHexAraray.x < terrainManager.hexGrid.GetLength(0) && hoverHexAraray.y < terrainManager.hexGrid.GetLength(1))
            hex = terrainManager.hexGrid[(int)hoverHexAraray.x, (int)hoverHexAraray.y];

        return hex;
    }


    public static void DrawHex(Texture2D texture, int centerX, int centerY, Color color)
    {
        int startX = 0, endX = 0;


        for (int y = (int)HexProperties.height; y > 0; y--)
        {

            if (y < HexProperties.tileH) // TOP triangle
            {
                startX = Mathf.FloorToInt(-(y / HexProperties.tileH * HexProperties.tileR));
                endX = Mathf.CeilToInt(y / HexProperties.tileH * HexProperties.tileR);
            }
            else if (y >= HexProperties.tileH && y <= HexProperties.side + HexProperties.tileH) // MIDDLE rectangle
            {
                startX = Mathf.FloorToInt(-HexProperties.tileR);
                endX = Mathf.CeilToInt(HexProperties.tileR);
            }
            else // BOTTOM triangle
            {
                startX = Mathf.FloorToInt(-((HexProperties.height - y) / HexProperties.tileH * HexProperties.tileR));
                endX = Mathf.CeilToInt(((HexProperties.height - y) / HexProperties.tileH * HexProperties.tileR));
            }

            for (int x = startX; x < endX; x++)
            {
                if (x + centerX >= 0 && x + centerX <= texture.width && y + centerY >= 0 && y + centerY <= texture.height)
                {
                    texture.SetPixel(x + centerX, y + centerY, color);
                }

            }
        }
    }

    public static void DrawFOWHex(Texture2D texture, int centerX, int centerY, Color color)
    {
        int startX = 0, endX = 0;


        for (int y = (int)FOWHexProperties.height; y > 0; y--)
        {

            if (y < FOWHexProperties.tileH) // TOP triangle
            {
                startX = Mathf.FloorToInt(-(y / FOWHexProperties.tileH * FOWHexProperties.tileR));
                endX = Mathf.CeilToInt(y / FOWHexProperties.tileH * FOWHexProperties.tileR);
            }
            else if (y >= FOWHexProperties.tileH && y <= FOWHexProperties.side + FOWHexProperties.tileH) // MIDDLE rectangle
            {
                startX = Mathf.FloorToInt(-FOWHexProperties.tileR);
                endX = Mathf.CeilToInt(FOWHexProperties.tileR);
            }
            else // BOTTOM triangle
            {
                startX = Mathf.FloorToInt(-((FOWHexProperties.height - y) / FOWHexProperties.tileH * FOWHexProperties.tileR));
                endX = Mathf.CeilToInt(((FOWHexProperties.height - y) / FOWHexProperties.tileH * FOWHexProperties.tileR));
            }

            for (int x = startX; x < endX; x++)
            {
                if (x + centerX >= 0 && x + centerX <= texture.width && y + centerY >= 0 && y + centerY <= texture.height)
                {
                    texture.SetPixel(x + centerX, y + centerY, color);
                }

            }
        }
    }

}
