using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class UnitView 
{ 

    public float moveSpeed;


    // make sure to cashe the transform
    private Transform _transform;


    public override void Start()
    {
        base.Start();
        _transform = transform;
    }

    public override void MoveExecuted()
    {
        base.MoveExecuted();
        StartCoroutine(FollowPath());
    }


    private IEnumerator FollowPath ()
    {
        int hexIndex = 0;

        while (hexIndex <= Unit.MovementPath.Count)
        {
            //yield return new WaitForSeconds(0.5f);

            //_transform.position = Unit.MovementPath[hexIndex].worldPos;

            if (Vector3.Distance(transform.position, Unit.MovementPath[hexIndex].worldPos) < 0.5f)
            {
                
                hexIndex++;
            }

            if (hexIndex >= Unit.MovementPath.Count)
                yield return null;

            transform.position = Vector3.MoveTowards(transform.position, Unit.MovementPath[hexIndex].worldPos, 5 * Time.deltaTime);


            yield return null;

        }


        /*Obserbale.EveryFixedUpdate().Subscribe(l => function).DisposeWhenChanged(a property);
         *  
         * 
         * 
         */
        
    }

}
