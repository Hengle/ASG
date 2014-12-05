using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;


[DiagramInfoAttribute("Ultimate Strategy Game")]
public class ChunkViewModelBase : ViewModel {
    
    public P<Int32> _ChunkXProperty;
    
    public P<Int32> _ChunkYProperty;
    
    public P<Int32> _TerrainDataXProperty;
    
    public P<Int32> _TerrainDataYProperty;
    
    public P<Vector3> _WorldPosProperty;
    
    protected CommandWithSender<ChunkViewModel> _GenerateChunk;
    
    protected CommandWithSender<ChunkViewModel> _UpdateChunk;
    
    protected CommandWithSender<ChunkViewModel> _SaveChunkHexTexture;
    
    public ChunkViewModelBase(ChunkControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public ChunkViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _ChunkXProperty = new P<Int32>(this, "ChunkX");
        _ChunkYProperty = new P<Int32>(this, "ChunkY");
        _TerrainDataXProperty = new P<Int32>(this, "TerrainDataX");
        _TerrainDataYProperty = new P<Int32>(this, "TerrainDataY");
        _WorldPosProperty = new P<Vector3>(this, "WorldPos");
    }
}

public partial class ChunkViewModel : ChunkViewModelBase {
    
    private TerrainManagerViewModel _ParentTerrainManager;
    
    public ChunkViewModel(ChunkControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public ChunkViewModel() : 
            base() {
    }
    
    public virtual P<Int32> ChunkXProperty {
        get {
            return this._ChunkXProperty;
        }
    }
    
    public virtual Int32 ChunkX {
        get {
            return _ChunkXProperty.Value;
        }
        set {
            _ChunkXProperty.Value = value;
        }
    }
    
    public virtual P<Int32> ChunkYProperty {
        get {
            return this._ChunkYProperty;
        }
    }
    
    public virtual Int32 ChunkY {
        get {
            return _ChunkYProperty.Value;
        }
        set {
            _ChunkYProperty.Value = value;
        }
    }
    
    public virtual P<Int32> TerrainDataXProperty {
        get {
            return this._TerrainDataXProperty;
        }
    }
    
    public virtual Int32 TerrainDataX {
        get {
            return _TerrainDataXProperty.Value;
        }
        set {
            _TerrainDataXProperty.Value = value;
        }
    }
    
    public virtual P<Int32> TerrainDataYProperty {
        get {
            return this._TerrainDataYProperty;
        }
    }
    
    public virtual Int32 TerrainDataY {
        get {
            return _TerrainDataYProperty.Value;
        }
        set {
            _TerrainDataYProperty.Value = value;
        }
    }
    
    public virtual P<Vector3> WorldPosProperty {
        get {
            return this._WorldPosProperty;
        }
    }
    
    public virtual Vector3 WorldPos {
        get {
            return _WorldPosProperty.Value;
        }
        set {
            _WorldPosProperty.Value = value;
        }
    }
    
    public virtual CommandWithSender<ChunkViewModel> GenerateChunk {
        get {
            return _GenerateChunk;
        }
        set {
            _GenerateChunk = value;
        }
    }
    
    public virtual CommandWithSender<ChunkViewModel> UpdateChunk {
        get {
            return _UpdateChunk;
        }
        set {
            _UpdateChunk = value;
        }
    }
    
    public virtual CommandWithSender<ChunkViewModel> SaveChunkHexTexture {
        get {
            return _SaveChunkHexTexture;
        }
        set {
            _SaveChunkHexTexture = value;
        }
    }
    
    public virtual TerrainManagerViewModel ParentTerrainManager {
        get {
            return this._ParentTerrainManager;
        }
        set {
            _ParentTerrainManager = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
        var chunk = controller as ChunkControllerBase;
        this.GenerateChunk = new CommandWithSender<ChunkViewModel>(this, chunk.GenerateChunk);
        this.UpdateChunk = new CommandWithSender<ChunkViewModel>(this, chunk.UpdateChunk);
        this.SaveChunkHexTexture = new CommandWithSender<ChunkViewModel>(this, chunk.SaveChunkHexTexture);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeInt("ChunkX", this.ChunkX);
        stream.SerializeInt("ChunkY", this.ChunkY);
        stream.SerializeInt("TerrainDataX", this.TerrainDataX);
        stream.SerializeInt("TerrainDataY", this.TerrainDataY);
        stream.SerializeVector3("WorldPos", this.WorldPos);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.ChunkX = stream.DeserializeInt("ChunkX");;
        		this.ChunkY = stream.DeserializeInt("ChunkY");;
        		this.TerrainDataX = stream.DeserializeInt("TerrainDataX");;
        		this.TerrainDataY = stream.DeserializeInt("TerrainDataY");;
        		this.WorldPos = stream.DeserializeVector3("WorldPos");;
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_ChunkXProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_ChunkYProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_TerrainDataXProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_TerrainDataYProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_WorldPosProperty, false, false, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("GenerateChunk", GenerateChunk) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("UpdateChunk", UpdateChunk) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("SaveChunkHexTexture", SaveChunkHexTexture) { ParameterType = typeof(void) });
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class TerrainManagerViewModelBase : ViewModel {
    
    public P<Int32> _TerrainSeedProperty;
    
    public P<Boolean> _RandomizeSeedProperty;
    
    public P<TerrainSettings> _TerrainSettingsProperty;
    
    public P<Int32> _PixelsPerUnitProperty;
    
    public P<Single> _PixelToHeightProperty;
    
    public P<Single> _AltitudesProperty;
    
    public P<Int32> _ChunkSizeProperty;
    
    public P<Int32> _ChunkResolutionProperty;
    
    public P<Int32> _ChunkCollisionResolutionProperty;
    
    public P<Int32> _TerrainWidthProperty;
    
    public P<Int32> _TerrainHeightProperty;
    
    public P<Single> _DetailProperty;
    
    public P<Single> _AltitudeVariationProperty;
    
    public P<Int32> _HexagonSideProperty;
    
    public P<Int32> _RiverCountProperty;
    
    public P<Single> _MinRiverHeightProperty;
    
    public P<Int32> _MinRiverStrengthProperty;
    
    public P<Int32> _MaxRiverStrengthProperty;
    
    public ModelCollection<ChunkViewModel> _ChunksProperty;
    
    protected CommandWithSender<TerrainManagerViewModel> _GenerateMap;
    
    protected CommandWithSender<TerrainManagerViewModel> _GenerateChunks;
    
    public TerrainManagerViewModelBase(TerrainManagerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public TerrainManagerViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _TerrainSeedProperty = new P<Int32>(this, "TerrainSeed");
        _RandomizeSeedProperty = new P<Boolean>(this, "RandomizeSeed");
        _TerrainSettingsProperty = new P<TerrainSettings>(this, "TerrainSettings");
        _PixelsPerUnitProperty = new P<Int32>(this, "PixelsPerUnit");
        _PixelToHeightProperty = new P<Single>(this, "PixelToHeight");
        _AltitudesProperty = new P<Single>(this, "Altitudes");
        _ChunkSizeProperty = new P<Int32>(this, "ChunkSize");
        _ChunkResolutionProperty = new P<Int32>(this, "ChunkResolution");
        _ChunkCollisionResolutionProperty = new P<Int32>(this, "ChunkCollisionResolution");
        _TerrainWidthProperty = new P<Int32>(this, "TerrainWidth");
        _TerrainHeightProperty = new P<Int32>(this, "TerrainHeight");
        _DetailProperty = new P<Single>(this, "Detail");
        _AltitudeVariationProperty = new P<Single>(this, "AltitudeVariation");
        _HexagonSideProperty = new P<Int32>(this, "HexagonSide");
        _RiverCountProperty = new P<Int32>(this, "RiverCount");
        _MinRiverHeightProperty = new P<Single>(this, "MinRiverHeight");
        _MinRiverStrengthProperty = new P<Int32>(this, "MinRiverStrength");
        _MaxRiverStrengthProperty = new P<Int32>(this, "MaxRiverStrength");
        _ChunksProperty = new ModelCollection<ChunkViewModel>(this, "Chunks");
        _ChunksProperty.CollectionChanged += ChunksCollectionChanged;
    }
    
    protected virtual void ChunksCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
}

public partial class TerrainManagerViewModel : TerrainManagerViewModelBase {
    
    private WorldManagerViewModel _ParentWorldManager;
    
    public TerrainManagerViewModel(TerrainManagerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public TerrainManagerViewModel() : 
            base() {
    }
    
    public virtual P<Int32> TerrainSeedProperty {
        get {
            return this._TerrainSeedProperty;
        }
    }
    
    public virtual Int32 TerrainSeed {
        get {
            return _TerrainSeedProperty.Value;
        }
        set {
            _TerrainSeedProperty.Value = value;
        }
    }
    
    public virtual P<Boolean> RandomizeSeedProperty {
        get {
            return this._RandomizeSeedProperty;
        }
    }
    
    public virtual Boolean RandomizeSeed {
        get {
            return _RandomizeSeedProperty.Value;
        }
        set {
            _RandomizeSeedProperty.Value = value;
        }
    }
    
    public virtual P<TerrainSettings> TerrainSettingsProperty {
        get {
            return this._TerrainSettingsProperty;
        }
    }
    
    public virtual TerrainSettings TerrainSettings {
        get {
            return _TerrainSettingsProperty.Value;
        }
        set {
            _TerrainSettingsProperty.Value = value;
        }
    }
    
    public virtual P<Int32> PixelsPerUnitProperty {
        get {
            return this._PixelsPerUnitProperty;
        }
    }
    
    public virtual Int32 PixelsPerUnit {
        get {
            return _PixelsPerUnitProperty.Value;
        }
        set {
            _PixelsPerUnitProperty.Value = value;
        }
    }
    
    public virtual P<Single> PixelToHeightProperty {
        get {
            return this._PixelToHeightProperty;
        }
    }
    
    public virtual Single PixelToHeight {
        get {
            return _PixelToHeightProperty.Value;
        }
        set {
            _PixelToHeightProperty.Value = value;
        }
    }
    
    public virtual P<Single> AltitudesProperty {
        get {
            return this._AltitudesProperty;
        }
    }
    
    public virtual Single Altitudes {
        get {
            return _AltitudesProperty.Value;
        }
        set {
            _AltitudesProperty.Value = value;
        }
    }
    
    public virtual P<Int32> ChunkSizeProperty {
        get {
            return this._ChunkSizeProperty;
        }
    }
    
    public virtual Int32 ChunkSize {
        get {
            return _ChunkSizeProperty.Value;
        }
        set {
            _ChunkSizeProperty.Value = value;
        }
    }
    
    public virtual P<Int32> ChunkResolutionProperty {
        get {
            return this._ChunkResolutionProperty;
        }
    }
    
    public virtual Int32 ChunkResolution {
        get {
            return _ChunkResolutionProperty.Value;
        }
        set {
            _ChunkResolutionProperty.Value = value;
        }
    }
    
    public virtual P<Int32> ChunkCollisionResolutionProperty {
        get {
            return this._ChunkCollisionResolutionProperty;
        }
    }
    
    public virtual Int32 ChunkCollisionResolution {
        get {
            return _ChunkCollisionResolutionProperty.Value;
        }
        set {
            _ChunkCollisionResolutionProperty.Value = value;
        }
    }
    
    public virtual P<Int32> TerrainWidthProperty {
        get {
            return this._TerrainWidthProperty;
        }
    }
    
    public virtual Int32 TerrainWidth {
        get {
            return _TerrainWidthProperty.Value;
        }
        set {
            _TerrainWidthProperty.Value = value;
        }
    }
    
    public virtual P<Int32> TerrainHeightProperty {
        get {
            return this._TerrainHeightProperty;
        }
    }
    
    public virtual Int32 TerrainHeight {
        get {
            return _TerrainHeightProperty.Value;
        }
        set {
            _TerrainHeightProperty.Value = value;
        }
    }
    
    public virtual P<Single> DetailProperty {
        get {
            return this._DetailProperty;
        }
    }
    
    public virtual Single Detail {
        get {
            return _DetailProperty.Value;
        }
        set {
            _DetailProperty.Value = value;
        }
    }
    
    public virtual P<Single> AltitudeVariationProperty {
        get {
            return this._AltitudeVariationProperty;
        }
    }
    
    public virtual Single AltitudeVariation {
        get {
            return _AltitudeVariationProperty.Value;
        }
        set {
            _AltitudeVariationProperty.Value = value;
        }
    }
    
    public virtual P<Int32> HexagonSideProperty {
        get {
            return this._HexagonSideProperty;
        }
    }
    
    public virtual Int32 HexagonSide {
        get {
            return _HexagonSideProperty.Value;
        }
        set {
            _HexagonSideProperty.Value = value;
        }
    }
    
    public virtual P<Int32> RiverCountProperty {
        get {
            return this._RiverCountProperty;
        }
    }
    
    public virtual Int32 RiverCount {
        get {
            return _RiverCountProperty.Value;
        }
        set {
            _RiverCountProperty.Value = value;
        }
    }
    
    public virtual P<Single> MinRiverHeightProperty {
        get {
            return this._MinRiverHeightProperty;
        }
    }
    
    public virtual Single MinRiverHeight {
        get {
            return _MinRiverHeightProperty.Value;
        }
        set {
            _MinRiverHeightProperty.Value = value;
        }
    }
    
    public virtual P<Int32> MinRiverStrengthProperty {
        get {
            return this._MinRiverStrengthProperty;
        }
    }
    
    public virtual Int32 MinRiverStrength {
        get {
            return _MinRiverStrengthProperty.Value;
        }
        set {
            _MinRiverStrengthProperty.Value = value;
        }
    }
    
    public virtual P<Int32> MaxRiverStrengthProperty {
        get {
            return this._MaxRiverStrengthProperty;
        }
    }
    
    public virtual Int32 MaxRiverStrength {
        get {
            return _MaxRiverStrengthProperty.Value;
        }
        set {
            _MaxRiverStrengthProperty.Value = value;
        }
    }
    
    public virtual ModelCollection<ChunkViewModel> Chunks {
        get {
            return this._ChunksProperty;
        }
    }
    
    public virtual CommandWithSender<TerrainManagerViewModel> GenerateMap {
        get {
            return _GenerateMap;
        }
        set {
            _GenerateMap = value;
        }
    }
    
    public virtual CommandWithSender<TerrainManagerViewModel> GenerateChunks {
        get {
            return _GenerateChunks;
        }
        set {
            _GenerateChunks = value;
        }
    }
    
    public virtual WorldManagerViewModel ParentWorldManager {
        get {
            return this._ParentWorldManager;
        }
        set {
            _ParentWorldManager = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
        var terrainManager = controller as TerrainManagerControllerBase;
        this.GenerateMap = new CommandWithSender<TerrainManagerViewModel>(this, terrainManager.GenerateMap);
        this.GenerateChunks = new CommandWithSender<TerrainManagerViewModel>(this, terrainManager.GenerateChunks);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeInt("TerrainSeed", this.TerrainSeed);
        stream.SerializeBool("RandomizeSeed", this.RandomizeSeed);
        stream.SerializeInt("PixelsPerUnit", this.PixelsPerUnit);
        stream.SerializeFloat("PixelToHeight", this.PixelToHeight);
        stream.SerializeFloat("Altitudes", this.Altitudes);
        stream.SerializeInt("ChunkSize", this.ChunkSize);
        stream.SerializeInt("ChunkResolution", this.ChunkResolution);
        stream.SerializeInt("ChunkCollisionResolution", this.ChunkCollisionResolution);
        stream.SerializeInt("TerrainWidth", this.TerrainWidth);
        stream.SerializeInt("TerrainHeight", this.TerrainHeight);
        stream.SerializeFloat("Detail", this.Detail);
        stream.SerializeFloat("AltitudeVariation", this.AltitudeVariation);
        stream.SerializeInt("HexagonSide", this.HexagonSide);
        stream.SerializeInt("RiverCount", this.RiverCount);
        stream.SerializeFloat("MinRiverHeight", this.MinRiverHeight);
        stream.SerializeInt("MinRiverStrength", this.MinRiverStrength);
        stream.SerializeInt("MaxRiverStrength", this.MaxRiverStrength);
        if (stream.DeepSerialize) stream.SerializeArray("Chunks", this.Chunks);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.TerrainSeed = stream.DeserializeInt("TerrainSeed");;
        		this.RandomizeSeed = stream.DeserializeBool("RandomizeSeed");;
        		this.PixelsPerUnit = stream.DeserializeInt("PixelsPerUnit");;
        		this.PixelToHeight = stream.DeserializeFloat("PixelToHeight");;
        		this.Altitudes = stream.DeserializeFloat("Altitudes");;
        		this.ChunkSize = stream.DeserializeInt("ChunkSize");;
        		this.ChunkResolution = stream.DeserializeInt("ChunkResolution");;
        		this.ChunkCollisionResolution = stream.DeserializeInt("ChunkCollisionResolution");;
        		this.TerrainWidth = stream.DeserializeInt("TerrainWidth");;
        		this.TerrainHeight = stream.DeserializeInt("TerrainHeight");;
        		this.Detail = stream.DeserializeFloat("Detail");;
        		this.AltitudeVariation = stream.DeserializeFloat("AltitudeVariation");;
        		this.HexagonSide = stream.DeserializeInt("HexagonSide");;
        		this.RiverCount = stream.DeserializeInt("RiverCount");;
        		this.MinRiverHeight = stream.DeserializeFloat("MinRiverHeight");;
        		this.MinRiverStrength = stream.DeserializeInt("MinRiverStrength");;
        		this.MaxRiverStrength = stream.DeserializeInt("MaxRiverStrength");;
if (stream.DeepSerialize) {
        this.Chunks.Clear();
        this.Chunks.AddRange(stream.DeserializeObjectArray<ChunkViewModel>("Chunks"));
}
    }
    
    public override void Unbind() {
        base.Unbind();
        _ChunksProperty.CollectionChanged -= ChunksCollectionChanged;
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_TerrainSeedProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_RandomizeSeedProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_TerrainSettingsProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_PixelsPerUnitProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_PixelToHeightProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_AltitudesProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_ChunkSizeProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_ChunkResolutionProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_ChunkCollisionResolutionProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_TerrainWidthProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_TerrainHeightProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_DetailProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_AltitudeVariationProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_HexagonSideProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_RiverCountProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_MinRiverHeightProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_MinRiverStrengthProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_MaxRiverStrengthProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_ChunksProperty, true, true, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("GenerateMap", GenerateMap) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("GenerateChunks", GenerateChunks) { ParameterType = typeof(void) });
    }
    
    protected override void ChunksCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.OldItems.OfType<ChunkViewModel>()) item.ParentTerrainManager = null;;
        foreach (var item in args.NewItems.OfType<ChunkViewModel>()) item.ParentTerrainManager = this;;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class WorldManagerViewModelBase : ViewModel {
    
    public P<TerrainManagerViewModel> _TerrainManagerProperty;
    
    public WorldManagerViewModelBase(WorldManagerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public WorldManagerViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _TerrainManagerProperty = new P<TerrainManagerViewModel>(this, "TerrainManager");
    }
}

public partial class WorldManagerViewModel : WorldManagerViewModelBase {
    
    public WorldManagerViewModel(WorldManagerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public WorldManagerViewModel() : 
            base() {
    }
    
    public virtual P<TerrainManagerViewModel> TerrainManagerProperty {
        get {
            return this._TerrainManagerProperty;
        }
    }
    
    public virtual TerrainManagerViewModel TerrainManager {
        get {
            return _TerrainManagerProperty.Value;
        }
        set {
            _TerrainManagerProperty.Value = value;
            if (value != null) value.ParentWorldManager = this;
        }
    }
    
    protected override void WireCommands(Controller controller) {
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
		if (stream.DeepSerialize) stream.SerializeObject("TerrainManager", this.TerrainManager);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
		if (stream.DeepSerialize) this.TerrainManager = stream.DeserializeObject<TerrainManagerViewModel>("TerrainManager");
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_TerrainManagerProperty, true, false, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class AStarViewModelBase : ViewModel {
    
    public AStarViewModelBase(AStarControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public AStarViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
    }
}

public partial class AStarViewModel : AStarViewModelBase {
    
    public AStarViewModel(AStarControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public AStarViewModel() : 
            base() {
    }
    
    protected override void WireCommands(Controller controller) {
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class GameLogicViewModelBase : ViewModel {
    
    public P<Int32> _TurnCountProperty;
    
    public P<PlayerViewModel> _PlayerProperty;
    
    public ModelCollection<FactionViewModel> _FactionsProperty;
    
    protected CommandWithSender<GameLogicViewModel> _NextTurn;
    
    public GameLogicViewModelBase(GameLogicControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public GameLogicViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _TurnCountProperty = new P<Int32>(this, "TurnCount");
        _PlayerProperty = new P<PlayerViewModel>(this, "Player");
        _FactionsProperty = new ModelCollection<FactionViewModel>(this, "Factions");
        _FactionsProperty.CollectionChanged += FactionsCollectionChanged;
    }
    
    protected virtual void FactionsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
}

public partial class GameLogicViewModel : GameLogicViewModelBase {
    
    public GameLogicViewModel(GameLogicControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public GameLogicViewModel() : 
            base() {
    }
    
    public virtual P<Int32> TurnCountProperty {
        get {
            return this._TurnCountProperty;
        }
    }
    
    public virtual Int32 TurnCount {
        get {
            return _TurnCountProperty.Value;
        }
        set {
            _TurnCountProperty.Value = value;
        }
    }
    
    public virtual P<PlayerViewModel> PlayerProperty {
        get {
            return this._PlayerProperty;
        }
    }
    
    public virtual PlayerViewModel Player {
        get {
            return _PlayerProperty.Value;
        }
        set {
            _PlayerProperty.Value = value;
            if (value != null) value.ParentGameLogic = this;
        }
    }
    
    public virtual ModelCollection<FactionViewModel> Factions {
        get {
            return this._FactionsProperty;
        }
    }
    
    public virtual CommandWithSender<GameLogicViewModel> NextTurn {
        get {
            return _NextTurn;
        }
        set {
            _NextTurn = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
        var gameLogic = controller as GameLogicControllerBase;
        this.NextTurn = new CommandWithSender<GameLogicViewModel>(this, gameLogic.NextTurn);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeInt("TurnCount", this.TurnCount);
		if (stream.DeepSerialize) stream.SerializeObject("Player", this.Player);
        if (stream.DeepSerialize) stream.SerializeArray("Factions", this.Factions);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.TurnCount = stream.DeserializeInt("TurnCount");;
		if (stream.DeepSerialize) this.Player = stream.DeserializeObject<PlayerViewModel>("Player");
if (stream.DeepSerialize) {
        this.Factions.Clear();
        this.Factions.AddRange(stream.DeserializeObjectArray<FactionViewModel>("Factions"));
}
    }
    
    public override void Unbind() {
        base.Unbind();
        _FactionsProperty.CollectionChanged -= FactionsCollectionChanged;
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_TurnCountProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_PlayerProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_FactionsProperty, true, true, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("NextTurn", NextTurn) { ParameterType = typeof(void) });
    }
    
    protected override void FactionsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.OldItems.OfType<FactionViewModel>()) item.ParentGameLogic = null;;
        foreach (var item in args.NewItems.OfType<FactionViewModel>()) item.ParentGameLogic = this;;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class PlayerViewModelBase : ViewModel {
    
    public P<Boolean> _IsAIProperty;
    
    public P<FactionViewModel> _FactionProperty;
    
    public P<UnitViewModel> _SelectedUnitProperty;
    
    public PlayerViewModelBase(PlayerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public PlayerViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _IsAIProperty = new P<Boolean>(this, "IsAI");
        _FactionProperty = new P<FactionViewModel>(this, "Faction");
        _SelectedUnitProperty = new P<UnitViewModel>(this, "SelectedUnit");
    }
}

public partial class PlayerViewModel : PlayerViewModelBase {
    
    private GameLogicViewModel _ParentGameLogic;
    
    public PlayerViewModel(PlayerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public PlayerViewModel() : 
            base() {
    }
    
    public virtual P<Boolean> IsAIProperty {
        get {
            return this._IsAIProperty;
        }
    }
    
    public virtual Boolean IsAI {
        get {
            return _IsAIProperty.Value;
        }
        set {
            _IsAIProperty.Value = value;
        }
    }
    
    public virtual P<FactionViewModel> FactionProperty {
        get {
            return this._FactionProperty;
        }
    }
    
    public virtual FactionViewModel Faction {
        get {
            return _FactionProperty.Value;
        }
        set {
            _FactionProperty.Value = value;
            if (value != null) value.ParentPlayer = this;
        }
    }
    
    public virtual P<UnitViewModel> SelectedUnitProperty {
        get {
            return this._SelectedUnitProperty;
        }
    }
    
    public virtual UnitViewModel SelectedUnit {
        get {
            return _SelectedUnitProperty.Value;
        }
        set {
            _SelectedUnitProperty.Value = value;
            if (value != null) value.ParentPlayer = this;
        }
    }
    
    public virtual GameLogicViewModel ParentGameLogic {
        get {
            return this._ParentGameLogic;
        }
        set {
            _ParentGameLogic = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeBool("IsAI", this.IsAI);
		if (stream.DeepSerialize) stream.SerializeObject("Faction", this.Faction);
		if (stream.DeepSerialize) stream.SerializeObject("SelectedUnit", this.SelectedUnit);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.IsAI = stream.DeserializeBool("IsAI");;
		if (stream.DeepSerialize) this.Faction = stream.DeserializeObject<FactionViewModel>("Faction");
		if (stream.DeepSerialize) this.SelectedUnit = stream.DeserializeObject<UnitViewModel>("SelectedUnit");
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_IsAIProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_FactionProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_SelectedUnitProperty, true, false, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class UnitViewModelBase : ViewModel {
    
    public UnitViewModelBase(UnitControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public UnitViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
    }
}

public partial class UnitViewModel : UnitViewModelBase {
    
    private PlayerViewModel _ParentPlayer;
    
    private FactionViewModel _ParentFaction;
    
    public UnitViewModel(UnitControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public UnitViewModel() : 
            base() {
    }
    
    public virtual PlayerViewModel ParentPlayer {
        get {
            return this._ParentPlayer;
        }
        set {
            _ParentPlayer = value;
        }
    }
    
    public virtual FactionViewModel ParentFaction {
        get {
            return this._ParentFaction;
        }
        set {
            _ParentFaction = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class FactionViewModelBase : ViewModel {
    
    public P<String> _NameProperty;
    
    public P<Single> _FoodProperty;
    
    public P<Single> _GoldProperty;
    
    public ModelCollection<UnitViewModel> _UnitsProperty;
    
    public ModelCollection<CityViewModel> _CitiesProperty;
    
    public FactionViewModelBase(FactionControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public FactionViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _NameProperty = new P<String>(this, "Name");
        _FoodProperty = new P<Single>(this, "Food");
        _GoldProperty = new P<Single>(this, "Gold");
        _UnitsProperty = new ModelCollection<UnitViewModel>(this, "Units");
        _UnitsProperty.CollectionChanged += UnitsCollectionChanged;
        _CitiesProperty = new ModelCollection<CityViewModel>(this, "Cities");
        _CitiesProperty.CollectionChanged += CitiesCollectionChanged;
    }
    
    protected virtual void UnitsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
    
    protected virtual void CitiesCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
}

public partial class FactionViewModel : FactionViewModelBase {
    
    private GameLogicViewModel _ParentGameLogic;
    
    private PlayerViewModel _ParentPlayer;
    
    public FactionViewModel(FactionControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public FactionViewModel() : 
            base() {
    }
    
    public virtual P<String> NameProperty {
        get {
            return this._NameProperty;
        }
    }
    
    public virtual String Name {
        get {
            return _NameProperty.Value;
        }
        set {
            _NameProperty.Value = value;
        }
    }
    
    public virtual P<Single> FoodProperty {
        get {
            return this._FoodProperty;
        }
    }
    
    public virtual Single Food {
        get {
            return _FoodProperty.Value;
        }
        set {
            _FoodProperty.Value = value;
        }
    }
    
    public virtual P<Single> GoldProperty {
        get {
            return this._GoldProperty;
        }
    }
    
    public virtual Single Gold {
        get {
            return _GoldProperty.Value;
        }
        set {
            _GoldProperty.Value = value;
        }
    }
    
    public virtual ModelCollection<UnitViewModel> Units {
        get {
            return this._UnitsProperty;
        }
    }
    
    public virtual ModelCollection<CityViewModel> Cities {
        get {
            return this._CitiesProperty;
        }
    }
    
    public virtual GameLogicViewModel ParentGameLogic {
        get {
            return this._ParentGameLogic;
        }
        set {
            _ParentGameLogic = value;
        }
    }
    
    public virtual PlayerViewModel ParentPlayer {
        get {
            return this._ParentPlayer;
        }
        set {
            _ParentPlayer = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeString("Name", this.Name);
        stream.SerializeFloat("Food", this.Food);
        stream.SerializeFloat("Gold", this.Gold);
        if (stream.DeepSerialize) stream.SerializeArray("Units", this.Units);
        if (stream.DeepSerialize) stream.SerializeArray("Cities", this.Cities);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.Name = stream.DeserializeString("Name");;
        		this.Food = stream.DeserializeFloat("Food");;
        		this.Gold = stream.DeserializeFloat("Gold");;
if (stream.DeepSerialize) {
        this.Units.Clear();
        this.Units.AddRange(stream.DeserializeObjectArray<UnitViewModel>("Units"));
}
if (stream.DeepSerialize) {
        this.Cities.Clear();
        this.Cities.AddRange(stream.DeserializeObjectArray<CityViewModel>("Cities"));
}
    }
    
    public override void Unbind() {
        base.Unbind();
        _UnitsProperty.CollectionChanged -= UnitsCollectionChanged;
        _CitiesProperty.CollectionChanged -= CitiesCollectionChanged;
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_NameProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_FoodProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_GoldProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_UnitsProperty, true, true, false));
        list.Add(new ViewModelPropertyInfo(_CitiesProperty, true, true, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
    
    protected override void UnitsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.OldItems.OfType<UnitViewModel>()) item.ParentFaction = null;;
        foreach (var item in args.NewItems.OfType<UnitViewModel>()) item.ParentFaction = this;;
    }
    
    protected override void CitiesCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.OldItems.OfType<CityViewModel>()) item.ParentFaction = null;;
        foreach (var item in args.NewItems.OfType<CityViewModel>()) item.ParentFaction = this;;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class CityViewModelBase : ViewModel {
    
    public P<String> _NameProperty;
    
    public ModelCollection<BuildingViewModel> _BuildingsProperty;
    
    public CityViewModelBase(CityControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public CityViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _NameProperty = new P<String>(this, "Name");
        _BuildingsProperty = new ModelCollection<BuildingViewModel>(this, "Buildings");
        _BuildingsProperty.CollectionChanged += BuildingsCollectionChanged;
    }
    
    protected virtual void BuildingsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
}

public partial class CityViewModel : CityViewModelBase {
    
    private FactionViewModel _ParentFaction;
    
    public CityViewModel(CityControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public CityViewModel() : 
            base() {
    }
    
    public virtual P<String> NameProperty {
        get {
            return this._NameProperty;
        }
    }
    
    public virtual String Name {
        get {
            return _NameProperty.Value;
        }
        set {
            _NameProperty.Value = value;
        }
    }
    
    public virtual ModelCollection<BuildingViewModel> Buildings {
        get {
            return this._BuildingsProperty;
        }
    }
    
    public virtual FactionViewModel ParentFaction {
        get {
            return this._ParentFaction;
        }
        set {
            _ParentFaction = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeString("Name", this.Name);
        if (stream.DeepSerialize) stream.SerializeArray("Buildings", this.Buildings);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.Name = stream.DeserializeString("Name");;
if (stream.DeepSerialize) {
        this.Buildings.Clear();
        this.Buildings.AddRange(stream.DeserializeObjectArray<BuildingViewModel>("Buildings"));
}
    }
    
    public override void Unbind() {
        base.Unbind();
        _BuildingsProperty.CollectionChanged -= BuildingsCollectionChanged;
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_NameProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_BuildingsProperty, true, true, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
    
    protected override void BuildingsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.OldItems.OfType<BuildingViewModel>()) item.ParentCity = null;;
        foreach (var item in args.NewItems.OfType<BuildingViewModel>()) item.ParentCity = this;;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class BuildingViewModelBase : ViewModel {
    
    public BuildingViewModelBase(BuildingControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public BuildingViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
    }
}

public partial class BuildingViewModel : BuildingViewModelBase {
    
    private CityViewModel _ParentCity;
    
    public BuildingViewModel(BuildingControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public BuildingViewModel() : 
            base() {
    }
    
    public virtual CityViewModel ParentCity {
        get {
            return this._ParentCity;
        }
        set {
            _ParentCity = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class KristianViewModelBase : ViewModel {
    
    public P<Int32> _ageProperty;
    
    public KristianViewModelBase(KristianControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public KristianViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _ageProperty = new P<Int32>(this, "age");
    }
}

public partial class KristianViewModel : KristianViewModelBase {
    
    public KristianViewModel(KristianControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public KristianViewModel() : 
            base() {
    }
    
    public virtual P<Int32> ageProperty {
        get {
            return this._ageProperty;
        }
    }
    
    public virtual Int32 age {
        get {
            return _ageProperty.Value;
        }
        set {
            _ageProperty.Value = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeInt("age", this.age);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.age = stream.DeserializeInt("age");;
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_ageProperty, false, false, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class TerrainElementViewModelBase : ViewModel {
    
    public TerrainElementViewModelBase(TerrainElementControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public TerrainElementViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
    }
}

public partial class TerrainElementViewModel : TerrainElementViewModelBase {
    
    public TerrainElementViewModel(TerrainElementControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public TerrainElementViewModel() : 
            base() {
    }
    
    protected override void WireCommands(Controller controller) {
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
}

public enum TerrainType {
    
    GrassLand,
    
    Forest,
    
    Water,
}
