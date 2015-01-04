using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class CityFlagView 
{
    public Transform flag;

    protected Transform _transform;

    public override void Start()
    {
        base.Start();
        _transform = transform;
    }

    public override void Update()
    {
        base.Update();

        flag.rotation = Quaternion.LookRotation(transform.position - new Vector3(Camera.main.transform.position.x, _transform.position.y, Camera.main.transform.position.z));

    }
}
