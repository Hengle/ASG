using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class PlayerView 
{

        
    public Hex hoverHex;
    public GameObject hoverHexHeightLight;



    /// Subscribes to the property and is notified anytime the value changes.
    public override void SelectedUnitChanged(UnitViewModel value) 
    {
        base.SelectedUnitChanged(value);
    }

    void FixedUpdate()
    {
        //HexSelect();
    }

    /*
    void HexSelect()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, 200))
        {
            Debug.DrawLine(ray.origin, hit.point);

            float stepSize = 1f / chunkSize;
            float resScale = chunkSize / chunkResolution;


            float pointX = hit.point.x;
            float pointZ = hit.point.z;
            pointX = pointX * pixelsPerUnit;
            pointZ = pointZ * pixelsPerUnit;
            pointZ += hexProperties.tileH;
            pointX -= hexProperties.width / 2;
            pointZ -= (hexProperties.height - hexProperties.tileH);


            float q = (1f / 3f * Mathf.Sqrt(3f) * pointX - 1f / 3f * pointZ) / hexProperties.side;
            float r = 2f / 3f * pointZ / hexProperties.side;


            Vector3 cube = new Vector3();
            cube.x = q;
            cube.z = r;
            cube.y = -cube.x - cube.z;

            cube = Hexagon.RoundCubeCoord(cube);

            hoverHexAraray = Hexagon.CubeToOffsetOddQ(cube);


            if (hoverHexAraray.x >= 0 && hoverHexAraray.y >= 0 && hoverHexAraray.x < hexGrid.GetLength(0) && hoverHexAraray.y < hexGrid.GetLength(1))
                hoverHex = hexGrid[(int)hoverHexAraray.x, (int)hoverHexAraray.y];
            else
                hoverHex = null;

            if (Input.GetButton("Fire1"))
            {
                int pathCost = 0;
                path = Pathfinding.GetPath(hexGrid[2, 2], hoverHex, pathCost);
                Debug.Log(pathCost);
            }

        }

        if (hoverHex != null)
        {
            hoverHexHeightLight.transform.position = hoverHex.worldPos;
        }
        else
        {
            hoverHexHeightLight.transform.position = Vector3.up * -100;
        }


    }
    */




}
