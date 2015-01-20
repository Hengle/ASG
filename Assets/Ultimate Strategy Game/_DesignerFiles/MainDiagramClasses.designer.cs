// ------------------------------------------------------------------------------
//  <autogenerated>
//      This code was generated by a tool.
//      Mono Runtime Version: 2.0.50727.1433
// 
//      Changes to this file may cause incorrect behavior and will be lost if 
//      the code is regenerated.
//  </autogenerated>
// ------------------------------------------------------------------------------

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.Collections.ObjectModel;
using UnityEngine;


public partial class Hex : System.ComponentModel.INotifyPropertyChanged {
    
    private Vector2 _arrayCoord;
    
    private Vector3 _cubeCoord;
    
    private Vector3 _worldPos;
    
    private Int32 _height;
    
    private TerrainType _terrainType;
    
    private Int32 _pathParent;
    
    private Int32 _pathScore;
    
    private Int32 _Humidity;
    
    private Int32 _Temperature;
    
    private Int32 _RiverStrength;
    
    private Single _heightmapHeight;
    
    private Int32 _gCost;
    
    private Int32 _hCost;
    
    private Int32 _heapIndex;
    
    private Hex _parent;
    
    private Boolean _Visible;
    
    private Boolean _Explored;
    
    public event PropertyChangedEventHandler PropertyChanged;
    protected virtual void OnPropertyChanged(string propertyName){ PropertyChangedEventHandler handler = PropertyChanged; if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName)); }
    public virtual Vector2 arrayCoord {
        get {
            return this._arrayCoord;
        }
        set {
            _arrayCoord = value;
            OnPropertyChanged("arrayCoord");
        }
    }
    
    public virtual Vector3 cubeCoord {
        get {
            return this._cubeCoord;
        }
        set {
            _cubeCoord = value;
            OnPropertyChanged("cubeCoord");
        }
    }
    
    public virtual Vector3 worldPos {
        get {
            return this._worldPos;
        }
        set {
            _worldPos = value;
            OnPropertyChanged("worldPos");
        }
    }
    
    public virtual Int32 height {
        get {
            return this._height;
        }
        set {
            _height = value;
            OnPropertyChanged("height");
        }
    }
    
    public virtual TerrainType terrainType {
        get {
            return this._terrainType;
        }
        set {
            _terrainType = value;
            OnPropertyChanged("terrainType");
        }
    }
    
    public virtual Int32 pathParent {
        get {
            return this._pathParent;
        }
        set {
            _pathParent = value;
            OnPropertyChanged("pathParent");
        }
    }
    
    public virtual Int32 pathScore {
        get {
            return this._pathScore;
        }
        set {
            _pathScore = value;
            OnPropertyChanged("pathScore");
        }
    }
    
    public virtual Int32 Humidity {
        get {
            return this._Humidity;
        }
        set {
            _Humidity = value;
            OnPropertyChanged("Humidity");
        }
    }
    
    public virtual Int32 Temperature {
        get {
            return this._Temperature;
        }
        set {
            _Temperature = value;
            OnPropertyChanged("Temperature");
        }
    }
    
    public virtual Int32 RiverStrength {
        get {
            return this._RiverStrength;
        }
        set {
            _RiverStrength = value;
            OnPropertyChanged("RiverStrength");
        }
    }
    
    public virtual Single heightmapHeight {
        get {
            return this._heightmapHeight;
        }
        set {
            _heightmapHeight = value;
            OnPropertyChanged("heightmapHeight");
        }
    }
    
    public virtual Int32 gCost {
        get {
            return this._gCost;
        }
        set {
            _gCost = value;
            OnPropertyChanged("gCost");
        }
    }
    
    public virtual Int32 hCost {
        get {
            return this._hCost;
        }
        set {
            _hCost = value;
            OnPropertyChanged("hCost");
        }
    }
    
    public virtual Int32 heapIndex {
        get {
            return this._heapIndex;
        }
        set {
            _heapIndex = value;
            OnPropertyChanged("heapIndex");
        }
    }
    
    public virtual Hex parent {
        get {
            return this._parent;
        }
        set {
            _parent = value;
            OnPropertyChanged("parent");
        }
    }
    
    public virtual Boolean Visible {
        get {
            return this._Visible;
        }
        set {
            _Visible = value;
            OnPropertyChanged("Visible");
        }
    }
    
    public virtual Boolean Explored {
        get {
            return this._Explored;
        }
        set {
            _Explored = value;
            OnPropertyChanged("Explored");
        }
    }
}

public partial class TerrainSettings : System.ComponentModel.INotifyPropertyChanged {
    
    private Int32 _terrainWidth;
    
    private Int32 _terrainHeight;
    
    private Single _detail;
    
    private Single _altitudeVariation;
    
    public event PropertyChangedEventHandler PropertyChanged;
    protected virtual void OnPropertyChanged(string propertyName){ PropertyChangedEventHandler handler = PropertyChanged; if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName)); }
    public virtual Int32 terrainWidth {
        get {
            return this._terrainWidth;
        }
        set {
            _terrainWidth = value;
            OnPropertyChanged("terrainWidth");
        }
    }
    
    public virtual Int32 terrainHeight {
        get {
            return this._terrainHeight;
        }
        set {
            _terrainHeight = value;
            OnPropertyChanged("terrainHeight");
        }
    }
    
    public virtual Single detail {
        get {
            return this._detail;
        }
        set {
            _detail = value;
            OnPropertyChanged("detail");
        }
    }
    
    public virtual Single altitudeVariation {
        get {
            return this._altitudeVariation;
        }
        set {
            _altitudeVariation = value;
            OnPropertyChanged("altitudeVariation");
        }
    }
}
