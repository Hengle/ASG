using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
using UnityEngine.UI;


public partial class UnitStackActionsUI 
{

    public Button moveAction;
    public Button settleAction;

    public override void Start()
    {
        base.Start();
        SetupButtonBindings();
    }


    /// Subscribes to the property and is notified anytime the value changes.
    public override void SelectedUnitStackChanged(UnitStackViewModel unitStack)
    {
        base.SelectedUnitStackChanged(unitStack);

        ToggleActionBar(unitStack != null);

        if (unitStack != null)
        {
            EvaluateActions();
            unitStack.MovePointsProperty.Subscribe(state => EvaluateActions()).DisposeWhenChanged(Player._SelectedUnitStackProperty, true);
            unitStack._UnitsProperty.Subscribe(state => EvaluateActions()).DisposeWhenChanged(Player._SelectedUnitStackProperty, true);
        }
    }


    /// Subscribes to collection modifications.  Add & Remove methods are invoked for each modification.
    public override void SelectedUnitsAdded(UnitViewModel item)
    {
        base.SelectedUnitsAdded(item);
    }

    /// Subscribes to collection modifications.  Add & Remove methods are invoked for each modification.
    public override void SelectedUnitsRemoved(UnitViewModel item)
    {
        base.SelectedUnitsRemoved(item);
    }

    private void ToggleActionBar(bool value)
    {
        moveAction.gameObject.SetActive(value);
        settleAction.gameObject.SetActive(value);
    }

    private void EvaluateActions()
    {
        // Deactive, then see if settler exists and activate then
        settleAction.gameObject.SetActive(false);

        for (int i = 0; i < Player.SelectedUnitStack.Units.Count; i++)
        {
            // Movement action check
            if (Player.SelectedUnitStack.MovePoints <= 0)
            {
                moveAction.interactable = false;
            }
            else
            {
                moveAction.interactable = true;
            }


            // Settle action check
            if (settleAction.IsActive() == false && Player.SelectedUnitStack.Units[i].GetType() == typeof(SettlerUnitViewModel))
            {
                settleAction.gameObject.SetActive(true);

                if (Player.SelectedUnitStack.MovePoints <= 0)
                {
                    settleAction.interactable = false;
                }
                else
                {
                    settleAction.interactable = true;
                }
            }
        }
    }

    private void SetupButtonBindings ()
    {
        moveAction.onClick.AddListener(() => PlanMovement());
        settleAction.onClick.AddListener(() => PlanSettling());
    }

    private void PlanMovement ()
    {
        ExecuteCommand(Player.SelectedUnitStack.PlanMovement);
    }
    private void PlanSettling()
    {
        ExecuteCommand(Player.SelectedUnitStack.PlanSettling);
    }

}
