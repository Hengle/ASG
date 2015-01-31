using UnityEngine;
using System.Collections;

public class KernelExample : MonoBehaviour
{
    public Material material;
    ComputeBuffer buffer;

    const int count = 1024;
    const float size = 5.0f;

    void Start()
    {

        buffer = new ComputeBuffer(count, sizeof(float) * 3, ComputeBufferType.Default);

        float[] points = new float[count * 3];

        Random.seed = 0;
        for (int i = 0; i < count; i++)
        {
            points[i * 3 + 0] = Random.Range(-size, size);
            points[i * 3 + 1] = Random.Range(-size, size);
            points[i * 3 + 2] = 0.0f;
        }

        buffer.SetData(points);
    }

    void OnPostRender()
    {
        material.SetPass(0);
        material.SetBuffer("buffer", buffer);
        Graphics.DrawProcedural(MeshTopology.Points, count, 1);
    }

    void OnDestroy()
    {
        buffer.Release();
    }

    /*
    public ComputeShader shader, shaderCopy;

    RenderTexture tex, texCopy;

    void Start()
    {

        tex = new RenderTexture(64, 64, 0);
        tex.enableRandomWrite = true;
        tex.Create();

        texCopy = new RenderTexture(64, 64, 0);
        texCopy.enableRandomWrite = true;
        texCopy.Create();

        shader.SetTexture(0, "tex", tex);
        shader.Dispatch(0, tex.width / 8, tex.height / 8, 1);

        shaderCopy.SetTexture(0, "tex", tex);
        shaderCopy.SetTexture(0, "texCopy", texCopy);
        shaderCopy.Dispatch(0, texCopy.width / 8, texCopy.height / 8, 1);
    }

    void OnGUI()
    {
        int w = Screen.width / 2;
        int h = Screen.height / 2;
        int s = 512;

        GUI.DrawTexture(new Rect(w - s / 2, h - s / 2, s, s), texCopy);
    }

    void OnDestroy()
    {
        tex.Release();
        texCopy.Release();
    }*/
}