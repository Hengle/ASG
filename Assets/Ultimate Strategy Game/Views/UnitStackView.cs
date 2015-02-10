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


    public GameObject obj;

    public override void Start()
    {
        base.Start();

        _transform = transform;
        _transform.position = UnitStack.HexLocation.worldPos + Vector3.up * 0.6f;
    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void HexLocationChanged(Hex value)
    {
        /*
        Timer.Start("Vision");
        List<Hex> result = new List<Hex>();
        result.Add(UnitStack.HexLocation);
        Hex.GetViewRange(UnitStack.HexLocation, UnitStack.MovePoints, 6, result);
        Timer.End();*/
        //Timer.Start("Move range");
        //MeshBuilder.DrawArea(obj, Pathfinding.GetWalkablePath(UnitStack.HexLocation, 20));
        //Timer.End(); 
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
        if (_transform && UnitStack.NextHexInPath != null)
        {
            _transform.position = Vector3.MoveTowards(_transform.position, UnitStack.NextHexInPath.worldPos + Vector3.up * 0.6f, moveSpeed * Time.deltaTime);
        }
    }

    public override void DestroyStackExecuted()
    {
        Destroy(this.gameObject);
    }

    protected override IObservable<Vector3> GetWorldPosObservable()
    {
        return PositionAsObservable;    
    }



}
