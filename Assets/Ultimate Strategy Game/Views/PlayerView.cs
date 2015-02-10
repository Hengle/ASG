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

    public Texture2D defaultCursor;
    public Texture2D mergeCursor;
    public Texture2D enterCityCursor;



    private UnitStackViewModel selectedUnitStack;
    private CityViewModel selectedCity;



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
        
        if (Physics.Raycast(ray, out hit, 500))
        {
            Debug.DrawLine(ray.origin, hit.point);

            hoverObject = hit.collider.gameObject;

            selectedUnitStack = Player.SelectedUnitStack;
            selectedCity = Player.SelectedCity;

            Cursor.SetCursor(defaultCursor, Vector2.zero, CursorMode.Auto);

            // Hovering over gameplay objects
            if (hoverObject.CompareTag("Terrain"))
            {
                ExecuteSelectHexAtPos(hit.point);
            }
            
            if (hoverObject.CompareTag("City"))
            {
                ExecuteSetHoverCity(hoverObject.GetComponent<CityView>().City);
                
                // Change cursor
                if (Player.SelectedUnitStack != null && Player.Faction.OwnsCity(Player.HoverCity))
                {
                    Cursor.SetCursor(enterCityCursor, Vector2.zero, CursorMode.Auto);
                }
            }
            else
            {
                ExecuteSetHoverCity(null);
            }
            
            if (hoverObject.CompareTag("CampainUnit"))
            {
                ExecuteSetHoverUnitStack(hoverObject.GetComponent<UnitStackView>().UnitStack);
                
                // Merge stack with stack
                if (Player.SelectedUnitStack != null && Player.SelectedUnitStack != Player.HoverUnitStack && Player.Faction.OwnsUnitStack(Player.HoverUnitStack))
                {
                    Cursor.SetCursor(mergeCursor, Vector2.zero, CursorMode.Auto);
                }

                // Merge selected in city with stack
                if (Player.SelectedCity != null && Player.Faction.OwnsUnitStack(Player.HoverUnitStack))
                {
                    Cursor.SetCursor(mergeCursor, Vector2.zero, CursorMode.Auto);
                }
            }
            else
            {
                ExecuteSetHoverUnitStack(null);
            }


            // Selecting gameplay objects
            if (Input.GetButtonDown("Mouse0"))
            {
                // Select Unit
                if (hoverObject.tag == "CampainUnit")
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


            // Right click with a selected unit
            if (Input.GetKeyUp(KeyCode.Mouse1) && Player.SelectedUnitStack != null)
            {
                // Interact with other stacks
                if (Player.HoverUnitStack != null)
                {
                    // Merge two stack or attack
                    if (Player.Faction.OwnsUnitStack(Player.HoverUnitStack) && Player.HoverUnitStack != selectedUnitStack)
                    {
                        if (Player.SelectedUnits.Count == 0)
                        {
                            ExecuteCommand(selectedUnitStack.MergeWithStack, Player.HoverUnitStack);
                            return;
                        }
                        else
                        {
                            ExecuteCommand(selectedUnitStack.MergeSelectedUnitsWithStack, Player.HoverUnitStack);
                            return;
                        }
                    }
                    else  // Attack
                    {
                        //ExecuteCommand(Player.SelectedUnitStack.AttackStack, Player.HoverUnitStack);
                    }
                }

                // Interact with other stacks
                if (Player.HoverCity != null)
                {
                    // Merge two stack or attack
                    if (Player.Faction.OwnsCity(Player.HoverCity))
                    {
                        if (Player.SelectedUnits.Count == 0)
                        {
                            ExecuteCommand(selectedUnitStack.MergeWithCity, Player.HoverCity);
                            return;
                        }
                        else
                        {
                            ExecuteCommand(selectedUnitStack.MergeSelectedWithCity, Player.HoverCity);
                            return;
                        }
                    }
                    else  // Attack
                    {
                        //ExecuteCommand(Player.SelectedUnitStack.AttackStack, Player.HoverUnitStack);
                    }
                }

                // Move unit stack or selected
                if (Player.SelectedHex != null)
                {
                    if (Player.SelectedUnits.Count == 0)
                    {
                        ExecuteCommand(Player.SelectedUnitStack.Move, Player.SelectedHex);
                        return;
                    }
                    else
                    {
                        ExecuteCommand(Player.SelectedUnitStack.MoveSelectedUnits, Player.SelectedHex);
                        return;
                    }

                }
            }

            // Right click with city selected
            if (Input.GetKeyUp(KeyCode.Mouse1) && Player.SelectedCity != null)
            {
                // On Another stack
                if (Player.SelectedUnits.Count > 0 && Player.HoverUnitStack != null)
                {
                    ExecuteCommand(Player.SelectedCity.MergeSelectedWithStack, Player.HoverUnitStack);
                }
                
                // On a city
                //if (Player.HoverCity != null)
                //{
                    //ExecuteCommand(Player.SelectedUnitStack.CityDestination);
                //}

                // Set waypoint
                //if (Player.SelectedUnits.Count == 0 && Player.SelectedHex != null)
                //{
                //    ExecuteCommand(Player.SelectedUnitStack.Move, Player.SelectedHex);
                //    return;
                //}

                // Move selected units
                if (Player.SelectedUnits.Count > 0 && Player.SelectedHex != null)
                {
                    ExecuteCommand(Player.SelectedCity.MoveSelectedUnits, Player.SelectedHex);
                    return;
                }
            }

        }

 
    }

  
}