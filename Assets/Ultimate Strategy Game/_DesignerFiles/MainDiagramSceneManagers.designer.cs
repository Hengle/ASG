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
    
    private TerrainManagerViewModel _TerrainManager;
    
    private FogOfWarViewModel _FogOfWar;
    
    private GameLogicViewModel _GameLogic;
    
    private ChunkController _ChunkController;
    
    private TerrainManagerController _TerrainManagerController;
    
    private WorldManagerController _WorldManagerController;
    
    private FogOfWarController _FogOfWarController;
    
    private GameLogicController _GameLogicController;
    
    private PlayerController _PlayerController;
    
    private UnitStackController _UnitStackController;
    
    private FactionController _FactionController;
    
    private CityController _CityController;
    
    private BuildingController _BuildingController;
    
    private AIPlayerController _AIPlayerController;
    
    private UnitController _UnitController;
    
    private SettlerUnitController _SettlerUnitController;
    
    private MeleeUnitController _MeleeUnitController;
    
    private CharacterController _CharacterController;
    
    private CharacterUnitController _CharacterUnitController;
    
    public MainTerrainSettings _MainTerrainSettings = new MainTerrainSettings();
    
    [Inject("TerrainManager")]
    public virtual TerrainManagerViewModel TerrainManager {
        get {
            if ((this._TerrainManager == null)) {
                this._TerrainManager = CreateInstanceViewModel<TerrainManagerViewModel>(TerrainManagerController, "TerrainManager");
            }
            return this._TerrainManager;
        }
        set {
            _TerrainManager = value;
        }
    }
    
    [Inject("FogOfWar")]
    public virtual FogOfWarViewModel FogOfWar {
        get {
            if ((this._FogOfWar == null)) {
                this._FogOfWar = CreateInstanceViewModel<FogOfWarViewModel>(FogOfWarController, "FogOfWar");
            }
            return this._FogOfWar;
        }
        set {
            _FogOfWar = value;
        }
    }
    
    [Inject("GameLogic")]
    public virtual GameLogicViewModel GameLogic {
        get {
            if ((this._GameLogic == null)) {
                this._GameLogic = CreateInstanceViewModel<GameLogicViewModel>(GameLogicController, "GameLogic");
            }
            return this._GameLogic;
        }
        set {
            _GameLogic = value;
        }
    }
    
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
    public virtual FogOfWarController FogOfWarController {
        get {
            if ((this._FogOfWarController == null)) {
                this._FogOfWarController = new FogOfWarController() { Container = Container };
            }
            return this._FogOfWarController;
        }
        set {
            _FogOfWarController = value;
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
    public virtual UnitStackController UnitStackController {
        get {
            if ((this._UnitStackController == null)) {
                this._UnitStackController = new UnitStackController() { Container = Container };
            }
            return this._UnitStackController;
        }
        set {
            _UnitStackController = value;
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
    
    [Inject()]
    public virtual AIPlayerController AIPlayerController {
        get {
            if ((this._AIPlayerController == null)) {
                this._AIPlayerController = new AIPlayerController() { Container = Container };
            }
            return this._AIPlayerController;
        }
        set {
            _AIPlayerController = value;
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
    public virtual SettlerUnitController SettlerUnitController {
        get {
            if ((this._SettlerUnitController == null)) {
                this._SettlerUnitController = new SettlerUnitController() { Container = Container };
            }
            return this._SettlerUnitController;
        }
        set {
            _SettlerUnitController = value;
        }
    }
    
    [Inject()]
    public virtual MeleeUnitController MeleeUnitController {
        get {
            if ((this._MeleeUnitController == null)) {
                this._MeleeUnitController = new MeleeUnitController() { Container = Container };
            }
            return this._MeleeUnitController;
        }
        set {
            _MeleeUnitController = value;
        }
    }
    
    [Inject()]
    public virtual CharacterController CharacterController {
        get {
            if ((this._CharacterController == null)) {
                this._CharacterController = new CharacterController() { Container = Container };
            }
            return this._CharacterController;
        }
        set {
            _CharacterController = value;
        }
    }
    
    [Inject()]
    public virtual CharacterUnitController CharacterUnitController {
        get {
            if ((this._CharacterUnitController == null)) {
                this._CharacterUnitController = new CharacterUnitController() { Container = Container };
            }
            return this._CharacterUnitController;
        }
        set {
            _CharacterUnitController = value;
        }
    }
    
    // <summary>
    // This method is the first method to be invoked when the scene first loads. Anything registered here with 'Container' will effectively 
    // be injected on controllers, and instances defined on a subsystem.And example of this would be Container.RegisterInstance<IDataRepository>(new CodeRepository()). Then any property with 
    // the 'Inject' attribute on any controller or view-model will automatically be set by uFrame. 
    // </summary>
    public override void Setup() {
        base.Setup();
        Container.RegisterViewModel<TerrainManagerViewModel>(TerrainManager,"TerrainManager");
        Container.RegisterViewModel<FogOfWarViewModel>(FogOfWar,"FogOfWar");
        Container.RegisterViewModel<GameLogicViewModel>(GameLogic,"GameLogic");
        Container.RegisterController<ChunkController>(ChunkController);
        Container.RegisterController<TerrainManagerController>(TerrainManagerController);
        Container.RegisterController<WorldManagerController>(WorldManagerController);
        Container.RegisterController<FogOfWarController>(FogOfWarController);
        Container.RegisterController<GameLogicController>(GameLogicController);
        Container.RegisterController<PlayerController>(PlayerController);
        Container.RegisterController<UnitStackController>(UnitStackController);
        Container.RegisterController<FactionController>(FactionController);
        Container.RegisterController<CityController>(CityController);
        Container.RegisterController<BuildingController>(BuildingController);
        Container.RegisterController<AIPlayerController>(AIPlayerController);
        Container.RegisterController<UnitController>(UnitController);
        Container.RegisterController<SettlerUnitController>(SettlerUnitController);
        Container.RegisterController<MeleeUnitController>(MeleeUnitController);
        Container.RegisterController<CharacterController>(CharacterController);
        Container.RegisterController<CharacterUnitController>(CharacterUnitController);
        this.Container.InjectAll();
        TerrainManagerController.Initialize(TerrainManager);
        FogOfWarController.Initialize(FogOfWar);
        GameLogicController.Initialize(GameLogic);
    }
    
    public override void Initialize() {
        base.Initialize();
    }
}
