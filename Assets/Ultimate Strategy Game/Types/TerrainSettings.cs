using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.Collections.ObjectModel;
using UnityEngine;

[System.Serializable]
public partial class TerrainSettings 
{

    public Biome[] biomeList;
    [System.Serializable]
    public class Biome
    {
        public float temperature;
        public float humidity;
        public Color color;
    }

}
