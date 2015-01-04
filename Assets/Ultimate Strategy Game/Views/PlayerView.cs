using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
public partial class PlayerView
{

    public TerrainManagerView terrain;
    

    public GameObject hoverHexHeightLight;
    public Vector2 hoverHexAraray;

    private GameObject hoverObject;

    public override void Start()
    {
        base.Start();
    }

    public override void Update()
    {
        base.Update();
        MouseSelect();
    
    }

    void MouseSelect()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        
        if (Physics.Raycast(ray, out hit, 400))
        {
            Debug.DrawLine(ray.origin, hit.point);
            hoverObject = hit.collider.gameObject;

            // Hovering over gameplay objects
            if (hoverObject.CompareTag("Terrain"))
            {
                ExecuteSelectHexAtPos(hit.point);
            }
            
            if (hoverObject.CompareTag("City"))
            {
                ExecuteSetHoverCity(hoverObject.GetComponent<CityView>().City);
            }
            else
            {
                ExecuteSetHoverCity(null);
            }
            
            if (hoverObject.CompareTag("CampainUnit"))
            {
                ExecuteSetHoverUnitStack(hoverObject.GetComponent<UnitStackView>().UnitStack);
            }
            else
            {
                ExecuteSetHoverUnitStack(null);
            }


            // Selecting gameplay objects
            if (Input.GetButtonDown("Mouse0"))
            {
                // Select Unit
                if (hoverObject.CompareTag("CampainUnit"))
                {
                    ExecuteSelectUnitStack(hoverObject.GetComponent<UnitStackView>().UnitStack);
                    return;
                }
                // Select City
                if (hoverObject.CompareTag("City"))
                {
                    ExecuteSelectCity(hoverObject.GetComponent<CityView>().City);
                    return;
                }

                // Settle city
                if (hoverObject.CompareTag("Terrain") && Player.SelectedUnitStack != null && Player.SelectedUnitStack.PlannedSettlingLocation != null)
                {
                    ExecuteCommand(Player.SelectedUnitStack.Settle);
                    return;
                }

                // Deselect Unit
                if (hoverObject.CompareTag("Terrain"))
                {
                    ExecuteDeselectAll();
                    return;
                }
            }




            
            // Evaluate terrain movement
            if (Input.GetButton("Mouse1") && Player.SelectedUnitStack != null && hit.collider.gameObject.CompareTag("Terrain") && Player.SelectedUnitStack.PlannedAction != PlanedAction.Move)
            {
                ExecuteCommand(Player.SelectedUnitStack.PlanMovement);
                return;
            }
            /*
            // Evaluate city 
            if (Input.GetButton("Mouse1") && hit.collider.gameObject.CompareTag("City") && Player.SelectedUnitStack.PlannedAction != PlanedAction.None)
            {
                ExecuteCommand(Player.SelectedUnitStack.EvaluateMovementPath);
            }

            if (Input.GetButton("Mouse1") && hit.collider.gameObject.CompareTag("CampainUnit") && Player.SelectedUnitStack.PlannedAction != PlanedAction.)
            {
                //ExecuteCommand(Player.SelectedUnitStack.EvaluateMovementPath);
            }
             * */



            if (Input.GetKeyUp(KeyCode.Mouse1) && Player.SelectedUnitStack != null && Player.HoverUnitStack != null)
            {
                //ExecuteCommand(Player.SelectedUnitStack.UnitDestiantion);
            }

            if (Input.GetKeyUp(KeyCode.Mouse1) && Player.SelectedUnitStack != null && Player.HoverCity != null)
            {
                //ExecuteCommand(Player.SelectedUnitStack.CityDestination);
            }

            if (Input.GetKeyUp(KeyCode.Mouse1) && Player.SelectedUnitStack != null && Player.SelectedHex != null)
            {
                ExecuteCommand(Player.SelectedUnitStack.Move, Player.SelectedHex);
            }



        }

 
    }

  
}