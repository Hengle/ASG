using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(TerrainManagerViewBase), true)]
public class TerrainmanagerExtendedEditor : ViewInspector
{

    public override void OnInspectorGUI()
    {
 	    base.OnInspectorGUI();

        var terrainManager = target as TerrainManagerViewBase;


        EditorGUILayout.LabelField("Biomes:");
        if (GUILayout.Button("+"))
        {
            Biome[] savedBiomes = terrainManager._Biomes;
            terrainManager._Biomes = new Biome[savedBiomes.Length];

            for (int i = 0; i < savedBiomes.Length; i++)
            {
                terrainManager._Biomes[i] = savedBiomes[i];
            }
        }
        if (GUILayout.Button("+"))
        {

        }
        for (int i = 0; i < terrainManager._Biomes.Length; i++)
        {
            EditorGUILayout.BeginHorizontal();
            terrainManager._Biomes[i].maxTemp = EditorGUILayout.IntField("Max Temperature", terrainManager._Biomes[i].maxTemp);
            terrainManager._Biomes[i].maxHumidity = EditorGUILayout.IntField("Max Humidity", terrainManager._Biomes[i].maxHumidity);
            terrainManager._Biomes[i].color = EditorGUILayout.ColorField("Color", terrainManager._Biomes[i].color);
            EditorGUILayout.EndHorizontal();
        }
    }

}