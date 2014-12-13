using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;


public class SettlerUnitController : SettlerUnitControllerBase {
    
    public override void InitializeSettlerUnit(SettlerUnitViewModel settlerUnit) {
    }

    public override void Move(UnitViewModel unit, Hex arg)
    {
        //base.Move(unit, arg);
        Debug.Log("Test");
    }
}
