using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class CityView 
{

    public override void Start()
    {
        base.Start();

        transform.position = City.HexLocation.worldPos;

    }

}
