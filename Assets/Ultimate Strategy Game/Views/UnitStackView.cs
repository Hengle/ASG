using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class UnitStackView
{ 
 
    public float moveSpeed;

    public GameObject selectionEffect;


    private Transform _transform;


    public override void Start()
    {
        base.Start();

        _transform = transform;
        _transform.position = UnitStack.HexLocation.worldPos;
    }


    public override void SelectedChanged(Boolean value)
    {
        selectionEffect.SetActive(value);
    }


    public override void StateChanged(Invert.StateMachine.State value)
    {
        base.StateChanged(value);
    }

    public override void OnIdling()
    {
        base.OnIdling();
    }

    public override void OnMoving()
    {
        base.OnMoving();
        Observable.EveryFixedUpdate().Subscribe(state => MoveToDestination()).DisposeWhenChanged(UnitStack.StateProperty, true);
    }


    public void MoveToDestination()
    {
        if (UnitStack.NextHexInPath != null)
        {
            _transform.position = Vector3.MoveTowards(_transform.position, UnitStack.NextHexInPath.worldPos + Vector3.up * 0.6f, moveSpeed * Time.fixedDeltaTime);
        }
    }


    protected override IObservable<Vector3> GetWorldPosObservable()
    {
        return PositionAsObservable;
    }
}
