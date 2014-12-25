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



    public override void Start()
    {
        base.Start();
    }

    public override void Update()
    {
        MouseSelect();
        if (Input.GetKeyDown(KeyCode.Backspace))
        {
        }
    }

    void MouseSelect()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, 400))
        {
            Debug.DrawLine(ray.origin, hit.point);
            if (Input.GetButtonDown("Mouse0"))
            {
                // Select Unit
                if (hit.collider.gameObject.CompareTag("CampainUnit"))
                {
                    ExecuteSelectUnitStack(hit.collider.gameObject.GetComponent<UnitStackView>().UnitStack);
                    return;
                }
                // Select City
                if (hit.collider.gameObject.CompareTag("City"))
                {
                    ExecuteSelectCity(hit.collider.gameObject.GetComponent<CityView>().City);
                    return;
                }
                // Deselect Unit
                if (hit.collider.gameObject.CompareTag("Terrain"))
                {
                    ExecuteDeselectAll();
                    return;
                }
            }
            else
            {
                ExecuteSelectHexAtPos(hit.point);
            }
            if (Input.GetButtonDown("Mouse1") && Player.SelectedUnitStack != null && Player.SelectedHex != null)
            {
            }
        }
        if (Input.GetButtonUp("Mouse1") && Player.SelectedUnitStack != null && Player.SelectedHex != null)
        {
            ExecuteMoveUnitStack(Player.SelectedUnitStack);
        }
        /*
        if (hoverHex != null)
        {
        hoverHexHeightLight.transform.position = hoverHex.worldPos;
        }
        else
        {
        hoverHexHeightLight.transform.position = Vector3.up * -100;
        }
        */
    }

  
}