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
                ToggleShowMovementPath(false);
                break;

            case UnitActionState.PlanningMovement:
                ToggleShowMovementPath(true);
                UpdateMovementPath();
                break;

            case UnitActionState.PlanningSettling:
                break;

            default:
                break;
        }
    }

    private void ShowMovementPath()
    {
        //UnitStack.ParentPlayer._SelectedHexProperty.Subscribe(hex => UpdateMovementPath()).DisposeWhenChanged(UnitStack._ActionStateProperty);
    }

    private void ToggleShowMovementPath(bool value)
    {
        lineRenderer.gameObject.SetActive(value);
    }

    private void UpdateMovementPath ()
    {
        // Set the verts of the line to match the planned path
        if (UnitStack.PlanedPath != null)
        {
            lineRenderer.SetVertexCount(UnitStack.PlanedPath.Count);
            lineRenderer.SetColors(Color.green, Color.red);

            for (int h = 0; h < UnitStack.PlanedPath.Count; h++)
            {
                lineRenderer.SetPosition(h, UnitStack.PlanedPath[h].worldPos);
            }
        }

        
    }

    /// Subscribes to collection modifications.  Add & Remove methods are invoked for each modification.
    public override void PlanedPathAdded(Hex item)
    {
        base.PlanedPathAdded(item);
        UpdateMovementPath();
    }

    /// Subscribes to collection modifications.  Add & Remove methods are invoked for each modification.
    public override void PlanedPathRemoved(Hex item)
    {
        base.PlanedPathRemoved(item);
        UpdateMovementPath();
    }

}
