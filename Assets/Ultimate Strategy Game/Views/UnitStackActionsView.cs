using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class UnitStackActionsView 
{

    public LineRenderer lineRenderer;

    /// Subscribes to the property and is notified anytime the value changes.
    public override void ActionStateChanged(UnitActionState value) 
    {
        base.ActionStateChanged(value);


        switch (value)
        {
            case UnitActionState.None:
                break;
            case UnitActionState.PlanningMovement:

                break;
            case UnitActionState.PlanningSettling:
                break;
            default:
                break;
        }
    }

    private void ShowMovementPath()
    {
        UnitStack.ParentPlayer._SelectedHexProperty.Subscribe(hex => UpdateMovementPath()).DisposeWhenChanged(UnitStack._ActionStateProperty);
    }

    private void UpdateMovementPath ()
    {
        // Set the verts of the line to match the planned path
        if (UnitStack.PlanedPath != null)
        {
            lineRenderer.SetVertexCount(UnitStack.PlanedPath.Count);

            for (int h = 0; h < UnitStack.PlanedPath.Count; h++)
            {
                lineRenderer.SetPosition(h, UnitStack.PlanedPath[h].worldPos);
            }
        }
    }

}
