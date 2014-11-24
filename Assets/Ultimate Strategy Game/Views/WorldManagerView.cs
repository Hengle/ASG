using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class WorldManagerView { 
    
    /// Invokes GenerateMapExecuted when the GenerateMap command is executed.
    public override void GenerateMapExecuted() {
        base.GenerateMapExecuted();

        Debug.Log(WorldManager.terrainData);

    }


    /// <summary>
    /// Converts the terrain data to a heightmap
    /// </summary>
    private Texture2D DataToBiomeMap(float[,] data)
    {
        int timer = System.Environment.TickCount;

        Texture2D texture = new Texture2D(data.GetLength(0), data.GetLength(1));
        for (int x = 0; x < data.GetLength(0); x++)
            for (int y = 0; y < data.GetLength(1); y++)
            {
                float height = Mathf.Round(data[x, y] / 0.16f) * 0.16f;
                texture.SetPixel(x, y, new Color(height, height, height));
                if (height <= 0.16f)
                    texture.SetPixel(x, y, Color.blue);

                //if (height >= 1-0.16f)
                //  texture.SetPixel(x, y, Color.yellow);

                if (height <= 0.16f)
                    texture.SetPixel(x, y, Color.blue);

                if (height == 0.16f * 2)
                    texture.SetPixel(x, y, Color.yellow);


                if (height == 0.16f * 3)
                    texture.SetPixel(x, y, Color.green);

                if (height == 0.16f * 4)
                    texture.SetPixel(x, y, Color.gray);

                if (height == 0.16f * 5)
                    texture.SetPixel(x, y, new Color(87 / 256, 1 / 256, 1 / 256));

            }
        texture.Apply();

        Debug.Log("Data to biome: " + ((System.Environment.TickCount - timer) / 100f) + "ms");
        return texture;
    }

}
