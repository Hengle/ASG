using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;
public partial class PlayerView
{ 
    public GameObject hoverHexHeightLight;
    public Vector2 hoverHexAraray;
    public TerrainManagerView terrain;
    public Transform pathContainer;
    public GameObject pathPrefab;
    public List<Transform> pathNodes;
    public int pathNodeCount = 30;

    public override void Start()
    {
        base.Start();
        SetupPathNodes();
    }
    private void SetupPathNodes()
    {
        Transform newPath;
        // Pool the path nodes at the start
        for (int p = 0; p < pathNodeCount; p++)
        {
            newPath = (Instantiate(pathPrefab, Vector3.zero, Quaternion.identity) as GameObject).GetComponent<Transform>();
            newPath.parent = pathContainer;
            pathNodes.Add(newPath);
        }
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
                Player.MovingUnit = true;
            }
        }
        if (Input.GetButtonUp("Mouse1") && Player.SelectedUnitStack != null && Player.SelectedHex != null)
        {
            ExecuteMoveUnitStack(Player.SelectedUnitStack);
            HidePath();
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
    /// Subscribes to the property and is notified anytime the value changes.
    public override void SelectedHexChanged(Hex hex)
    {
        if (Player.MovingUnit == true && hex != null && Player.SelectedUnitStack != null)
        {
            ShowPath();
        }
    }
    /// Subscribes to the property and is notified anytime the value changes.
    public override void MovingUnitChanged(Boolean value)
    {
        base.MovingUnitChanged(value);
        if (value == false)
        {
            HidePath();
        }
        else
        {
            ShowPath();
        }
    }
    private void ShowPath()
    {
        List<Hex> path = Pathfinding.GetPath(Player.SelectedUnitStack.HexLocation, Player.SelectedHex, 0);
        for (int h = 0; path != null && h < path.Count; h++)
        {
            if (h >= pathNodes.Count)
                pathNodes[h].position = Vector3.zero;
            pathNodes[h].position = path[h].worldPos;
        }
    }
    private void HidePath()
    {
        for (int p = 0; p < pathNodes.Count; p++)
        {
            pathNodes[p].position = Vector3.zero;
        }
    }
}