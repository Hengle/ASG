using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Invert.StateMachine;


public class UnitState : UnitStateBase {
    
    public UnitState(ViewModel vm, string propertyName) : 
            base(vm, propertyName) {
    }
}
