using UnityEngine;
using UnityEditor;

public class CreateDepthMap : EditorWindow
{
    private string message;
    public Texture2D diffuse;
    public Texture2D normal;

    [MenuItem("Window/Advanced Terrain Texture Splatting/Create Diffuse with Depth...")]
    public static void Open()
    {
        GetWindow<CreateDepthMap>(true, "Create Diffuse with Depth");
    }

    public void OnGUI()
    {
        message = null;
        GUILayout.BeginHorizontal();

        GUILayout.BeginVertical();
        GUILayout.Label("Diffuse");
        diffuse = TextureField(diffuse);
        GUILayout.EndVertical();

        GUILayout.BeginVertical();
        GUILayout.Label("Normal or Height map");
        normal = TextureField(normal);
        GUILayout.EndVertical();

        GUILayout.EndHorizontal();

        if (message != null)
        {
            EditorGUILayout.HelpBox(message, MessageType.Error);
        }

        GUILayout.FlexibleSpace();

        var enabled = GUI.enabled;
        GUI.enabled = message == null;
        if (GUILayout.Button("Create"))
        {
            Create();
        }
        GUI.enabled = enabled;
    }

    private Texture2D TextureField(Texture2D texture)
    {
        texture = EditorGUILayout.ObjectField(texture, typeof(Texture2D), false, GUILayout.Width(128), GUILayout.Height(128)) as Texture2D;
        try
        {
            texture.GetPixel(0, 0);
        }
        catch (System.Exception e)
        {
            message = e.Message;
        }
        return texture;
    }

    public void Create()
    {
        var path = EditorUtility.SaveFilePanelInProject("Save", null, "png", null);
        if (!string.IsNullOrEmpty(path))
        {
            var result = new Texture2D(diffuse.width, diffuse.height, TextureFormat.RGBA32, false);
            var dp = diffuse.GetPixels();
            var np = normal.GetPixels();

            for (int i = 0; i < dp.Length; i++)
            {
                dp[i].a = np[i].grayscale;
            }

            result.SetPixels(dp);
            result.Apply();
            System.IO.File.WriteAllBytes(path, result.EncodeToPNG());
            DestroyImmediate(result);
            AssetDatabase.Refresh();
            Close();
        }
    }
}
