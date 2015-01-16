using UnityEngine;
using System.Collections;
using System;

public static class Timer 
{

    public static int timer;
    public static string taskName;

    public static void Start(string name) 
    {
        taskName = name;
        timer = System.Environment.TickCount; 
    }

    public static void End() 
    {
        Debug.Log(taskName + ": " + ((System.Environment.TickCount - timer) * 0.001f) + "s");
    }

}
