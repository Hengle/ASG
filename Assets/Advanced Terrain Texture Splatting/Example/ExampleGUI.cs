using UnityEngine;

public class ExampleGUI : MonoBehaviour
{
    private static readonly string[] Captions = new[] { "Default Terrain Shader", "Advanced Terrain Shader" };
    private int selected = 1;

    public Material[] materials;
    public Terrain terrain;

    public void OnGUI()
    {
        GUILayout.BeginArea(new Rect(5, 5, 200, 200));
        GUILayout.BeginVertical("box");
        var select = GUILayout.SelectionGrid(selected, Captions, 1);
        if (select != selected)
        {
            terrain.materialTemplate = materials[select];
            selected = select;
        }
        GUILayout.EndVertical();

        if (selected == 1)
        {
            GUILayout.BeginVertical("box");
            GUILayout.Label("Blend Depth");
            materials[1].SetFloat("_Depth", GUILayout.HorizontalSlider(materials[1].GetFloat("_Depth"), 0.001f, 1));
            GUILayout.EndVertical();
        }
        GUILayout.EndArea();
    }
}