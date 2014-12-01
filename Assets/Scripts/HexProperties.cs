using UnityEngine;
using System.Collections;

public static class HexProperties
{
    public static float side;
    public static float height;
    public static float width;

    public static float tileR;
    public static float tileH;

    public static void SetProperties (int hexSide)
    {
        side = hexSide;
        tileH = Mathf.Sin((30f * Mathf.PI) / 180f) * side;
        tileR = Mathf.Cos((30f * Mathf.PI) / 180f) * side;

        width = Mathf.RoundToInt(2f * tileR);
        height = Mathf.RoundToInt(side + 2f * tileH);
    }
}
