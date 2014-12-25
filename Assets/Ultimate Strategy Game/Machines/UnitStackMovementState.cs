using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Invert.StateMachine;


public class UnitStackMovementState : UnitStackMovementStateBase {
    
    public UnitStackMovementState(ViewModel vm, string propertyName) : 
            base(vm, propertyName) {
    }
}
