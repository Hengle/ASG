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
using UniRx;


[System.SerializableAttribute()]
public sealed partial class MainTerrainSettings {
    
    public string[] _Scenes;
}

// <summary>
// The responsibility of this class is to manage the scenes Initialization, Loading, Transitioning, and Unloading.
// </summary>
public class MainTerrainBase : SceneManager {
    
    private ChunkController _ChunkController;
    
    private TerrainManagerController _TerrainManagerController;
    
    private WorldManagerController _WorldManagerController;
    
    private AStarController _AStarController;
    
    private KristianController _KristianController;
    
    private TerrainElementController _TerrainElementController;
    
    private GameLogicController _GameLogicController;
    
    private PlayerController _PlayerController;
    
    private UnitController _UnitController;
    
    private FactionController _FactionController;
    
    private CityController _CityController;
    
    private BuildingController _BuildingController;
    
    public MainTerrainSettings _MainTerrainSettings = new MainTerrainSettings();
    
    [Inject()]
    public virtual ChunkController ChunkController {
        get {
            if ((this._ChunkController == null)) {
                this._ChunkController = new ChunkController() { Container = Container };
            }
            return this._ChunkController;
        }
        set {
            _ChunkController = value;
        }
    }
    
    [Inject()]
    public virtual TerrainManagerController TerrainManagerController {
        get {
            if ((this._TerrainManagerController == null)) {
                this._TerrainManagerController = new TerrainManagerController() { Container = Container };
            }
            return this._TerrainManagerController;
        }
        set {
            _TerrainManagerController = value;
        }
    }
    
    [Inject()]
    public virtual WorldManagerController WorldManagerController {
        get {
            if ((this._WorldManagerController == null)) {
                this._WorldManagerController = new WorldManagerController() { Container = Container };
            }
            return this._WorldManagerController;
        }
        set {
            _WorldManagerController = value;
        }
    }
    
    [Inject()]
    public virtual AStarController AStarController {
        get {
            if ((this._AStarController == null)) {
                this._AStarController = new AStarController() { Container = Container };
            }
            return this._AStarController;
        }
        set {
            _AStarController = value;
        }
    }
    
    [Inject()]
    public virtual KristianController KristianController {
        get {
            if ((this._KristianController == null)) {
                this._KristianController = new KristianController() { Container = Container };
            }
            return this._KristianController;
        }
        set {
            _KristianController = value;
        }
    }
    
    [Inject()]
    public virtual TerrainElementController TerrainElementController {
        get {
            if ((this._TerrainElementController == null)) {
                this._TerrainElementController = new TerrainElementController() { Container = Container };
            }
            return this._TerrainElementController;
        }
        set {
            _TerrainElementController = value;
        }
    }
    
    [Inject()]
    public virtual GameLogicController GameLogicController {
        get {
            if ((this._GameLogicController == null)) {
                this._GameLogicController = new GameLogicController() { Container = Container };
            }
            return this._GameLogicController;
        }
        set {
            _GameLogicController = value;
        }
    }
    
    [Inject()]
    public virtual PlayerController PlayerController {
        get {
            if ((this._PlayerController == null)) {
                this._PlayerController = new PlayerController() { Container = Container };
            }
            return this._PlayerController;
        }
        set {
            _PlayerController = value;
        }
    }
    
    [Inject()]
    public virtual UnitController UnitController {
        get {
            if ((this._UnitController == null)) {
                this._UnitController = new UnitController() { Container = Container };
            }
            return this._UnitController;
        }
        set {
            _UnitController = value;
        }
    }
    
    [Inject()]
    public virtual FactionController FactionController {
        get {
            if ((this._FactionController == null)) {
                this._FactionController = new FactionController() { Container = Container };
            }
            return this._FactionController;
        }
        set {
            _FactionController = value;
        }
    }
    
    [Inject()]
    public virtual CityController CityController {
        get {
            if ((this._CityController == null)) {
                this._CityController = new CityController() { Container = Container };
            }
            return this._CityController;
        }
        set {
            _CityController = value;
        }
    }
    
    [Inject()]
    public virtual BuildingController BuildingController {
        get {
            if ((this._BuildingController == null)) {
                this._BuildingController = new BuildingController() { Container = Container };
            }
            return this._BuildingController;
        }
        set {
            _BuildingController = value;
        }
    }
    
    // <summary>
    // This method is the first method to be invoked when the scene first loads. Anything registered here with 'Container' will effectively 
    // be injected on controllers, and instances defined on a subsystem.And example of this would be Container.RegisterInstance<IDataRepository>(new CodeRepository()). Then any property with 
    // the 'Inject' attribute on any controller or view-model will automatically be set by uFrame. 
    // </summary>
    public override void Setup() {
        base.Setup();
        Container.RegisterController<ChunkController>(ChunkController);
        Container.RegisterController<TerrainManagerController>(TerrainManagerController);
        Container.RegisterController<WorldManagerController>(WorldManagerController);
        Container.RegisterController<AStarController>(AStarController);
        Container.RegisterController<KristianController>(KristianController);
        Container.RegisterController<TerrainElementController>(TerrainElementController);
        Container.RegisterController<GameLogicController>(GameLogicController);
        Container.RegisterController<PlayerController>(PlayerController);
        Container.RegisterController<UnitController>(UnitController);
        Container.RegisterController<FactionController>(FactionController);
        Container.RegisterController<CityController>(CityController);
        Container.RegisterController<BuildingController>(BuildingController);
        this.Container.InjectAll();
    }
    
    public override void Initialize() {
        base.Initialize();
    }
}
