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
    
    private WorldManagerViewModel _ParentWorldManager;
    
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
    
    public virtual WorldManagerViewModel ParentWorldManager {
        get {
            return this._ParentWorldManager;
        }
        set {
            _ParentWorldManager = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
        var chunk = controller as ChunkControllerBase;
        this.GenerateChunk = new CommandWithSender<ChunkViewModel>(this, chunk.GenerateChunk);
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
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class WorldManagerViewModelBase : ViewModel {
    
    public P<Int32> _TerrainSeedProperty;
    
    public P<Boolean> _RandomizeSeedProperty;
    
    public P<TerrainSettings> _TerrainSettingsProperty;
    
    public P<Int32> _PixelsPerUnitProperty;
    
    public P<Int32> _PixelToHeightProperty;
    
    public P<Single> _AltitudesProperty;
    
    public P<Int32> _ChunkSizeProperty;
    
    public P<Int32> _ChunkResolutionProperty;
    
    public P<Int32> _ChunkCollisionResolutionProperty;
    
    public P<HexProperties> _HexPropertiesProperty;
    
    public P<Int32> _TerrainWidthProperty;
    
    public P<Int32> _TerrainHeightProperty;
    
    public P<Single> _DetailProperty;
    
    public P<Single> _AltitudeVariationProperty;
    
    public P<Single> _HexagonSideProperty;
    
    public ModelCollection<Hex> _HexGridProperty;
    
    public ModelCollection<ChunkViewModel> _ChunksProperty;
    
    protected CommandWithSender<WorldManagerViewModel> _GenerateMap;
    
    protected CommandWithSender<WorldManagerViewModel> _GenerateChunks;
    
    public WorldManagerViewModelBase(WorldManagerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public WorldManagerViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _TerrainSeedProperty = new P<Int32>(this, "TerrainSeed");
        _RandomizeSeedProperty = new P<Boolean>(this, "RandomizeSeed");
        _TerrainSettingsProperty = new P<TerrainSettings>(this, "TerrainSettings");
        _PixelsPerUnitProperty = new P<Int32>(this, "PixelsPerUnit");
        _PixelToHeightProperty = new P<Int32>(this, "PixelToHeight");
        _AltitudesProperty = new P<Single>(this, "Altitudes");
        _ChunkSizeProperty = new P<Int32>(this, "ChunkSize");
        _ChunkResolutionProperty = new P<Int32>(this, "ChunkResolution");
        _ChunkCollisionResolutionProperty = new P<Int32>(this, "ChunkCollisionResolution");
        _HexPropertiesProperty = new P<HexProperties>(this, "HexProperties");
        _TerrainWidthProperty = new P<Int32>(this, "TerrainWidth");
        _TerrainHeightProperty = new P<Int32>(this, "TerrainHeight");
        _DetailProperty = new P<Single>(this, "Detail");
        _AltitudeVariationProperty = new P<Single>(this, "AltitudeVariation");
        _HexagonSideProperty = new P<Single>(this, "HexagonSide");
        _HexGridProperty = new ModelCollection<Hex>(this, "HexGrid");
        _ChunksProperty = new ModelCollection<ChunkViewModel>(this, "Chunks");
        _ChunksProperty.CollectionChanged += ChunksCollectionChanged;
    }
    
    protected virtual void ChunksCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
}

public partial class WorldManagerViewModel : WorldManagerViewModelBase {
    
    public WorldManagerViewModel(WorldManagerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public WorldManagerViewModel() : 
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
    
    public virtual P<Int32> PixelToHeightProperty {
        get {
            return this._PixelToHeightProperty;
        }
    }
    
    public virtual Int32 PixelToHeight {
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
    
    public virtual P<HexProperties> HexPropertiesProperty {
        get {
            return this._HexPropertiesProperty;
        }
    }
    
    public virtual HexProperties HexProperties {
        get {
            return _HexPropertiesProperty.Value;
        }
        set {
            _HexPropertiesProperty.Value = value;
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
    
    public virtual P<Single> HexagonSideProperty {
        get {
            return this._HexagonSideProperty;
        }
    }
    
    public virtual Single HexagonSide {
        get {
            return _HexagonSideProperty.Value;
        }
        set {
            _HexagonSideProperty.Value = value;
        }
    }
    
    public virtual ModelCollection<Hex> HexGrid {
        get {
            return this._HexGridProperty;
        }
    }
    
    public virtual ModelCollection<ChunkViewModel> Chunks {
        get {
            return this._ChunksProperty;
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
    
    protected override void WireCommands(Controller controller) {
        var worldManager = controller as WorldManagerControllerBase;
        this.GenerateMap = new CommandWithSender<WorldManagerViewModel>(this, worldManager.GenerateMap);
        this.GenerateChunks = new CommandWithSender<WorldManagerViewModel>(this, worldManager.GenerateChunks);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeInt("TerrainSeed", this.TerrainSeed);
        stream.SerializeBool("RandomizeSeed", this.RandomizeSeed);
        stream.SerializeInt("PixelsPerUnit", this.PixelsPerUnit);
        stream.SerializeInt("PixelToHeight", this.PixelToHeight);
        stream.SerializeFloat("Altitudes", this.Altitudes);
        stream.SerializeInt("ChunkSize", this.ChunkSize);
        stream.SerializeInt("ChunkResolution", this.ChunkResolution);
        stream.SerializeInt("ChunkCollisionResolution", this.ChunkCollisionResolution);
        stream.SerializeInt("TerrainWidth", this.TerrainWidth);
        stream.SerializeInt("TerrainHeight", this.TerrainHeight);
        stream.SerializeFloat("Detail", this.Detail);
        stream.SerializeFloat("AltitudeVariation", this.AltitudeVariation);
        stream.SerializeFloat("HexagonSide", this.HexagonSide);
        if (stream.DeepSerialize) stream.SerializeArray("Chunks", this.Chunks);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.TerrainSeed = stream.DeserializeInt("TerrainSeed");;
        		this.RandomizeSeed = stream.DeserializeBool("RandomizeSeed");;
        		this.PixelsPerUnit = stream.DeserializeInt("PixelsPerUnit");;
        		this.PixelToHeight = stream.DeserializeInt("PixelToHeight");;
        		this.Altitudes = stream.DeserializeFloat("Altitudes");;
        		this.ChunkSize = stream.DeserializeInt("ChunkSize");;
        		this.ChunkResolution = stream.DeserializeInt("ChunkResolution");;
        		this.ChunkCollisionResolution = stream.DeserializeInt("ChunkCollisionResolution");;
        		this.TerrainWidth = stream.DeserializeInt("TerrainWidth");;
        		this.TerrainHeight = stream.DeserializeInt("TerrainHeight");;
        		this.Detail = stream.DeserializeFloat("Detail");;
        		this.AltitudeVariation = stream.DeserializeFloat("AltitudeVariation");;
        		this.HexagonSide = stream.DeserializeFloat("HexagonSide");;
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
        list.Add(new ViewModelPropertyInfo(_HexPropertiesProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_TerrainWidthProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_TerrainHeightProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_DetailProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_AltitudeVariationProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_HexagonSideProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_HexGridProperty, false, true, false));
        list.Add(new ViewModelPropertyInfo(_ChunksProperty, true, true, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("GenerateMap", GenerateMap) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("GenerateChunks", GenerateChunks) { ParameterType = typeof(void) });
    }
    
    protected override void ChunksCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.OldItems.OfType<ChunkViewModel>()) item.ParentWorldManager = null;;
        foreach (var item in args.NewItems.OfType<ChunkViewModel>()) item.ParentWorldManager = this;;
    }
}

public enum TerrainType {
    
    GrassLand,
    
    Forest,
    
    Water,
}
