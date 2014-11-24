using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;


[DiagramInfoAttribute("Ultimate Strategy Game")]
public class ChunkViewModelBase : ViewModel {
    
    public P<Vector2> _hexGridPosProperty;
    
    public P<Int32> _chunkSizeProperty;
    
    public ChunkViewModelBase(ChunkControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public ChunkViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _hexGridPosProperty = new P<Vector2>(this, "hexGridPos");
        _chunkSizeProperty = new P<Int32>(this, "chunkSize");
    }
}

public partial class ChunkViewModel : ChunkViewModelBase {
    
    private WorldManagerViewModel _ParentWorldManager;
    
    public ChunkViewModel(ChunkControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public ChunkViewModel() : 
            base() {
    }
    
    public virtual P<Vector2> hexGridPosProperty {
        get {
            return this._hexGridPosProperty;
        }
    }
    
    public virtual Vector2 hexGridPos {
        get {
            return _hexGridPosProperty.Value;
        }
        set {
            _hexGridPosProperty.Value = value;
        }
    }
    
    public virtual P<Int32> chunkSizeProperty {
        get {
            return this._chunkSizeProperty;
        }
    }
    
    public virtual Int32 chunkSize {
        get {
            return _chunkSizeProperty.Value;
        }
        set {
            _chunkSizeProperty.Value = value;
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
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeVector2("hexGridPos", this.hexGridPos);
        stream.SerializeInt("chunkSize", this.chunkSize);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.hexGridPos = stream.DeserializeVector2("hexGridPos");;
        		this.chunkSize = stream.DeserializeInt("chunkSize");;
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_hexGridPosProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_chunkSizeProperty, false, false, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class WorldManagerViewModelBase : ViewModel {
    
    public P<Int32> _terrainSeedProperty;
    
    public P<Boolean> _randomizeSeedProperty;
    
    public P<TerrainSettings> _terrainSettingsProperty;
    
    public P<Int32> _pixelsPerUnitProperty;
    
    public P<Int32> _pixelToHeightProperty;
    
    public P<Int32> _altitudesProperty;
    
    public P<Int32> _chunkSizeProperty;
    
    public P<Int32> _chunkResolutionProperty;
    
    public P<Int32> _chunkCollisionResolutionProperty;
    
    public P<HexProperties> _hexPropertiesProperty;
    
    public P<Int32> _terrainWidthProperty;
    
    public P<String> _terrainHeightProperty;
    
    public P<Single> _detailProperty;
    
    public P<Single> _altitudeVariationProperty;
    
    public ModelCollection<Hex> _hexGridProperty;
    
    public ModelCollection<ChunkViewModel> _chunksProperty;
    
    protected CommandWithSender<WorldManagerViewModel> _GenerateMap;
    
    protected CommandWithSender<WorldManagerViewModel> _GenerateChunks;
    
    protected CommandWithSender<WorldManagerViewModel> _GenerateMapDataTexture;
    
    protected CommandWithSender<WorldManagerViewModel> _GenerateMapHexTexture;
    
    public WorldManagerViewModelBase(WorldManagerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public WorldManagerViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _terrainSeedProperty = new P<Int32>(this, "terrainSeed");
        _randomizeSeedProperty = new P<Boolean>(this, "randomizeSeed");
        _terrainSettingsProperty = new P<TerrainSettings>(this, "terrainSettings");
        _pixelsPerUnitProperty = new P<Int32>(this, "pixelsPerUnit");
        _pixelToHeightProperty = new P<Int32>(this, "pixelToHeight");
        _altitudesProperty = new P<Int32>(this, "altitudes");
        _chunkSizeProperty = new P<Int32>(this, "chunkSize");
        _chunkResolutionProperty = new P<Int32>(this, "chunkResolution");
        _chunkCollisionResolutionProperty = new P<Int32>(this, "chunkCollisionResolution");
        _hexPropertiesProperty = new P<HexProperties>(this, "hexProperties");
        _terrainWidthProperty = new P<Int32>(this, "terrainWidth");
        _terrainHeightProperty = new P<String>(this, "terrainHeight");
        _detailProperty = new P<Single>(this, "detail");
        _altitudeVariationProperty = new P<Single>(this, "altitudeVariation");
        _hexGridProperty = new ModelCollection<Hex>(this, "hexGrid");
        _chunksProperty = new ModelCollection<ChunkViewModel>(this, "chunks");
        _chunksProperty.CollectionChanged += chunksCollectionChanged;
    }
    
    protected virtual void chunksCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
}

public partial class WorldManagerViewModel : WorldManagerViewModelBase {
    
    public WorldManagerViewModel(WorldManagerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public WorldManagerViewModel() : 
            base() {
    }
    
    public virtual P<Int32> terrainSeedProperty {
        get {
            return this._terrainSeedProperty;
        }
    }
    
    public virtual Int32 terrainSeed {
        get {
            return _terrainSeedProperty.Value;
        }
        set {
            _terrainSeedProperty.Value = value;
        }
    }
    
    public virtual P<Boolean> randomizeSeedProperty {
        get {
            return this._randomizeSeedProperty;
        }
    }
    
    public virtual Boolean randomizeSeed {
        get {
            return _randomizeSeedProperty.Value;
        }
        set {
            _randomizeSeedProperty.Value = value;
        }
    }
    
    public virtual P<TerrainSettings> terrainSettingsProperty {
        get {
            return this._terrainSettingsProperty;
        }
    }
    
    public virtual TerrainSettings terrainSettings {
        get {
            return _terrainSettingsProperty.Value;
        }
        set {
            _terrainSettingsProperty.Value = value;
        }
    }
    
    public virtual P<Int32> pixelsPerUnitProperty {
        get {
            return this._pixelsPerUnitProperty;
        }
    }
    
    public virtual Int32 pixelsPerUnit {
        get {
            return _pixelsPerUnitProperty.Value;
        }
        set {
            _pixelsPerUnitProperty.Value = value;
        }
    }
    
    public virtual P<Int32> pixelToHeightProperty {
        get {
            return this._pixelToHeightProperty;
        }
    }
    
    public virtual Int32 pixelToHeight {
        get {
            return _pixelToHeightProperty.Value;
        }
        set {
            _pixelToHeightProperty.Value = value;
        }
    }
    
    public virtual P<Int32> altitudesProperty {
        get {
            return this._altitudesProperty;
        }
    }
    
    public virtual Int32 altitudes {
        get {
            return _altitudesProperty.Value;
        }
        set {
            _altitudesProperty.Value = value;
        }
    }
    
    public virtual P<Int32> chunkSizeProperty {
        get {
            return this._chunkSizeProperty;
        }
    }
    
    public virtual Int32 chunkSize {
        get {
            return _chunkSizeProperty.Value;
        }
        set {
            _chunkSizeProperty.Value = value;
        }
    }
    
    public virtual P<Int32> chunkResolutionProperty {
        get {
            return this._chunkResolutionProperty;
        }
    }
    
    public virtual Int32 chunkResolution {
        get {
            return _chunkResolutionProperty.Value;
        }
        set {
            _chunkResolutionProperty.Value = value;
        }
    }
    
    public virtual P<Int32> chunkCollisionResolutionProperty {
        get {
            return this._chunkCollisionResolutionProperty;
        }
    }
    
    public virtual Int32 chunkCollisionResolution {
        get {
            return _chunkCollisionResolutionProperty.Value;
        }
        set {
            _chunkCollisionResolutionProperty.Value = value;
        }
    }
    
    public virtual P<HexProperties> hexPropertiesProperty {
        get {
            return this._hexPropertiesProperty;
        }
    }
    
    public virtual HexProperties hexProperties {
        get {
            return _hexPropertiesProperty.Value;
        }
        set {
            _hexPropertiesProperty.Value = value;
        }
    }
    
    public virtual P<Int32> terrainWidthProperty {
        get {
            return this._terrainWidthProperty;
        }
    }
    
    public virtual Int32 terrainWidth {
        get {
            return _terrainWidthProperty.Value;
        }
        set {
            _terrainWidthProperty.Value = value;
        }
    }
    
    public virtual P<String> terrainHeightProperty {
        get {
            return this._terrainHeightProperty;
        }
    }
    
    public virtual String terrainHeight {
        get {
            return _terrainHeightProperty.Value;
        }
        set {
            _terrainHeightProperty.Value = value;
        }
    }
    
    public virtual P<Single> detailProperty {
        get {
            return this._detailProperty;
        }
    }
    
    public virtual Single detail {
        get {
            return _detailProperty.Value;
        }
        set {
            _detailProperty.Value = value;
        }
    }
    
    public virtual P<Single> altitudeVariationProperty {
        get {
            return this._altitudeVariationProperty;
        }
    }
    
    public virtual Single altitudeVariation {
        get {
            return _altitudeVariationProperty.Value;
        }
        set {
            _altitudeVariationProperty.Value = value;
        }
    }
    
    public virtual ModelCollection<Hex> hexGrid {
        get {
            return this._hexGridProperty;
        }
    }
    
    public virtual ModelCollection<ChunkViewModel> chunks {
        get {
            return this._chunksProperty;
        }
    }
    
    public virtual CommandWithSender<WorldManagerViewModel> GenerateMap {
        get {
            return _GenerateMap;
        }
        set {
            _GenerateMap = value;
        }
    }
    
    public virtual CommandWithSender<WorldManagerViewModel> GenerateChunks {
        get {
            return _GenerateChunks;
        }
        set {
            _GenerateChunks = value;
        }
    }
    
    public virtual CommandWithSender<WorldManagerViewModel> GenerateMapDataTexture {
        get {
            return _GenerateMapDataTexture;
        }
        set {
            _GenerateMapDataTexture = value;
        }
    }
    
    public virtual CommandWithSender<WorldManagerViewModel> GenerateMapHexTexture {
        get {
            return _GenerateMapHexTexture;
        }
        set {
            _GenerateMapHexTexture = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
        var worldManager = controller as WorldManagerControllerBase;
        this.GenerateMap = new CommandWithSender<WorldManagerViewModel>(this, worldManager.GenerateMap);
        this.GenerateChunks = new CommandWithSender<WorldManagerViewModel>(this, worldManager.GenerateChunks);
        this.GenerateMapDataTexture = new CommandWithSender<WorldManagerViewModel>(this, worldManager.GenerateMapDataTexture);
        this.GenerateMapHexTexture = new CommandWithSender<WorldManagerViewModel>(this, worldManager.GenerateMapHexTexture);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeInt("terrainSeed", this.terrainSeed);
        stream.SerializeBool("randomizeSeed", this.randomizeSeed);
        stream.SerializeInt("pixelsPerUnit", this.pixelsPerUnit);
        stream.SerializeInt("pixelToHeight", this.pixelToHeight);
        stream.SerializeInt("altitudes", this.altitudes);
        stream.SerializeInt("chunkSize", this.chunkSize);
        stream.SerializeInt("chunkResolution", this.chunkResolution);
        stream.SerializeInt("chunkCollisionResolution", this.chunkCollisionResolution);
        stream.SerializeInt("terrainWidth", this.terrainWidth);
        stream.SerializeString("terrainHeight", this.terrainHeight);
        stream.SerializeFloat("detail", this.detail);
        stream.SerializeFloat("altitudeVariation", this.altitudeVariation);
        if (stream.DeepSerialize) stream.SerializeArray("chunks", this.chunks);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.terrainSeed = stream.DeserializeInt("terrainSeed");;
        		this.randomizeSeed = stream.DeserializeBool("randomizeSeed");;
        		this.pixelsPerUnit = stream.DeserializeInt("pixelsPerUnit");;
        		this.pixelToHeight = stream.DeserializeInt("pixelToHeight");;
        		this.altitudes = stream.DeserializeInt("altitudes");;
        		this.chunkSize = stream.DeserializeInt("chunkSize");;
        		this.chunkResolution = stream.DeserializeInt("chunkResolution");;
        		this.chunkCollisionResolution = stream.DeserializeInt("chunkCollisionResolution");;
        		this.terrainWidth = stream.DeserializeInt("terrainWidth");;
        		this.terrainHeight = stream.DeserializeString("terrainHeight");;
        		this.detail = stream.DeserializeFloat("detail");;
        		this.altitudeVariation = stream.DeserializeFloat("altitudeVariation");;
if (stream.DeepSerialize) {
        this.chunks.Clear();
        this.chunks.AddRange(stream.DeserializeObjectArray<ChunkViewModel>("chunks"));
}
    }
    
    public override void Unbind() {
        base.Unbind();
        _chunksProperty.CollectionChanged -= chunksCollectionChanged;
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_terrainSeedProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_randomizeSeedProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_terrainSettingsProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_pixelsPerUnitProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_pixelToHeightProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_altitudesProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_chunkSizeProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_chunkResolutionProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_chunkCollisionResolutionProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_hexPropertiesProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_terrainWidthProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_terrainHeightProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_detailProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_altitudeVariationProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_hexGridProperty, false, true, false));
        list.Add(new ViewModelPropertyInfo(_chunksProperty, true, true, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("GenerateMap", GenerateMap) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("GenerateChunks", GenerateChunks) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("GenerateMapDataTexture", GenerateMapDataTexture) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("GenerateMapHexTexture", GenerateMapHexTexture) { ParameterType = typeof(void) });
    }
    
    protected override void chunksCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.OldItems.OfType<ChunkViewModel>()) item.ParentWorldManager = null;;
        foreach (var item in args.NewItems.OfType<ChunkViewModel>()) item.ParentWorldManager = this;;
    }
}

public enum TerrainType {
    
    GrassLand,
    
    Forest,
    
    Water,
}
