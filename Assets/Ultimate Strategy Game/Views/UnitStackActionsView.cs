using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class UnitStackActionsView 
{ 
 
    public static GameObject settleLocation;
    public GameObject settleLocationPrefab;


    public LineRenderer lineRenderer;


    public override void Awake()
    {
        base.Awake();

        // Spawn one static settle location prefab for the whole game at the start
        // only if it has not been spawned yet.
        if (settleLocation == null)
        {
            settleLocation = Instantiate(settleLocationPrefab) as GameObject;
        }
    }


    /// Subscribes to the property and is notified anytime the value changes.
    public override void SelectedChanged(Boolean value)
    {
        ToggleShowMovementPath(value);
    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void PlannedSettlingLocationChanged(Hex hex)
    {
        if (hex != null)
        {
            if (!settleLocation.activeSelf)
            {
                settleLocation.SetActive(true);
                UnitStack.PlannedActionProperty.Subscribe(_ => ToggleShowSettleLocation(false));
            }
            settleLocation.transform.position = hex.worldPos;
        }
        else
        {
            if (settleLocation.activeSelf)
            {
                settleLocation.SetActive(false);
            }
        }
    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void SettlingLocationChanged(Hex hex)
    {
        if (hex != null)
        {
            settleLocation.SetActive(true);
            settleLocation.transform.position = hex.worldPos;
        }
    }


    /// Invokes EvaluateSettlingLocationExecuted when the EvaluateSettlingLocation command is executed.
    public override void EvaluateSettlingLocationExecuted()
    {
        base.EvaluateSettlingLocationExecuted();
    }

    /// Subscribes to the property and is notified anytime the value changes.
    public override void PlannedActionChanged(PlanedAction value)
    {
        switch (value)
        {
            case PlanedAction.None:

                break;
            case PlanedAction.Move:
                break;
            case PlanedAction.Settle:
                //ToggleShowSettleLocation(true);
                break;
            default:
                break;
        }
    }


    /// Subscribes to the property and is notified anytime the value changes.
    public override void StackStateChanged(StackState value)
    {
        base.StackStateChanged(value);
    }

  
    private void ToggleShowMovementPath(bool value)
    {
        lineRenderer.gameObject.SetActive(value);
    }

    private void ToggleShowSettleLocation(bool value)
    {
        if (settleLocation) settleLocation.SetActive(value);
    }

    private void UpdateMovementPath ()
    {
        lineRenderer.SetVertexCount(UnitStack.Path.Count + 1);
        lineRenderer.SetColors(Color.green, Color.red);

        lineRenderer.SetPosition(0, UnitStack.HexLocation.worldPos);
        for (int h = 0; h < UnitStack.Path.Count; h++)
        {
            lineRenderer.SetPosition(h + 1, UnitStack.Path[h].worldPos);
        }
    }


    public override void PathAdded(Hex item)
    {
        UpdateMovementPath();
    }

    public override void PathRemoved(Hex item)
    {
        UpdateMovementPath();
    }

    public override void MoveSelectedUnitsExecuted()
    {
        UpdateMovementPath();
    }
}
