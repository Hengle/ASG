using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;


public partial class CityViewModel 
{


    public bool CanMove(ModelCollection<UnitViewModel> units)
    {
        for (int i = 0; i < units.Count; i++)
        {
            if (units[i].MovePoints <= 0)
            {
                return false;
            }
        }

        return true;
    }

}
