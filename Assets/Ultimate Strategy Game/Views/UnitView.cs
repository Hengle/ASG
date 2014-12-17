using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class UnitView 
{

    public float movementSpeed;


    // make sure to cashe the transform
    private Transform _transform;

    public override void Start()
    {
        base.Start();
        _transform = transform;
    }


    /// Subscribes to the state machine property and executes a method for each state.
    public override void StateChanged(Invert.StateMachine.State value) {
        base.StateChanged(value);
    }
    
    public override void OnIdling() 
    {
        base.OnIdling();
    }
    
    public override void OnMoving() 
    {
        base.OnMoving();
        Observable.EveryFixedUpdate().Subscribe(state => Moving()).DisposeWhenChanged(Unit.StateProperty, true);
    }


    public void Moving()
    {
        if (Unit.NextHexInPath != null)
            _transform.position = Vector3.MoveTowards(_transform.position, Unit.NextHexInPath.worldPos, movementSpeed * Time.fixedDeltaTime);

    }


    protected override IObservable<Vector3> GetWorldPosObservable()
    {
        return PositionAsObservable;
    }


    public override void MoveExecuted()
    {
    }


    /*Obserbale.EveryFixedUpdate().Subscribe(l => function).DisposeWhenChanged(a property);
 *  
 * 
 *         this.BindProperty(Unit.Health, health => ExecuteCancelMove(target)).DisposeWhenChanged(Unit.Health);

 * 
     * Observable.Interval(TimeSpan.FromSeconds(2.0f))
    .Subscribe(_ => HarvestResource(player))
    //.Subscribe(_ => player.WoodCount++)
    .DisposeWhenChanged(player.CurrentActionProperty);
 * 
 */

}
