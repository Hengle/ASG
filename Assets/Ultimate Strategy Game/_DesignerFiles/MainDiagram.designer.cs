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
    
    public P<TerrainManagerViewModel> _TerrainManagerProperty;
    
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
        _TerrainManagerProperty = new P<TerrainManagerViewModel>(this, "TerrainManager");
    }
}

public partial class ChunkViewModel : ChunkViewModelBase {
    
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
            if (value != null) value.ParentChunk = this;
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
		if (stream.DeepSerialize) stream.SerializeObject("TerrainManager", this.TerrainManager);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.ChunkX = stream.DeserializeInt("ChunkX");;
        		this.ChunkY = stream.DeserializeInt("ChunkY");;
        		this.TerrainDataX = stream.DeserializeInt("TerrainDataX");;
        		this.TerrainDataY = stream.DeserializeInt("TerrainDataY");;
        		this.WorldPos = stream.DeserializeVector3("WorldPos");;
		if (stream.DeepSerialize) this.TerrainManager = stream.DeserializeObject<TerrainManagerViewModel>("TerrainManager");
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
        list.Add(new ViewModelPropertyInfo(_TerrainManagerProperty, true, false, false));
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
    
    public P<Int32> _MinLakeSizeProperty;
    
    public P<Int32> _MaxLakeSizeProperty;
    
    public P<Int32> _HumidityProperty;
    
    public P<Int32> _TemperatureProperty;
    
    public P<Int32> _HumidySpreadDecreaseProperty;
    
    public P<AnimationCurve> _TemperatureSpreadProperty;
    
    public P<AnimationCurve> _HeightTemperatureProperty;
    
    public P<AnimationCurve> _HumidityTemperatureProperty;
    
    protected CommandWithSender<TerrainManagerViewModel> _GenerateMap;
    
    protected CommandWithSender<TerrainManagerViewModel> _GenerateChunks;
    
    protected CommandWithSenderAndArgument<TerrainManagerViewModel, Vector3> _GetHexAtWorldPos;
    
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
        _MinLakeSizeProperty = new P<Int32>(this, "MinLakeSize");
        _MaxLakeSizeProperty = new P<Int32>(this, "MaxLakeSize");
        _HumidityProperty = new P<Int32>(this, "Humidity");
        _TemperatureProperty = new P<Int32>(this, "Temperature");
        _HumidySpreadDecreaseProperty = new P<Int32>(this, "HumidySpreadDecrease");
        _TemperatureSpreadProperty = new P<AnimationCurve>(this, "TemperatureSpread");
        _HeightTemperatureProperty = new P<AnimationCurve>(this, "HeightTemperature");
        _HumidityTemperatureProperty = new P<AnimationCurve>(this, "HumidityTemperature");
    }
}

public partial class TerrainManagerViewModel : TerrainManagerViewModelBase {
    
    private ChunkViewModel _ParentChunk;
    
    private WorldManagerViewModel _ParentWorldManager;
    
    private GameLogicViewModel _ParentGameLogic;
    
    private FogOfWarViewModel _ParentFogOfWar;
    
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
    
    public virtual P<Int32> MinLakeSizeProperty {
        get {
            return this._MinLakeSizeProperty;
        }
    }
    
    public virtual Int32 MinLakeSize {
        get {
            return _MinLakeSizeProperty.Value;
        }
        set {
            _MinLakeSizeProperty.Value = value;
        }
    }
    
    public virtual P<Int32> MaxLakeSizeProperty {
        get {
            return this._MaxLakeSizeProperty;
        }
    }
    
    public virtual Int32 MaxLakeSize {
        get {
            return _MaxLakeSizeProperty.Value;
        }
        set {
            _MaxLakeSizeProperty.Value = value;
        }
    }
    
    public virtual P<Int32> HumidityProperty {
        get {
            return this._HumidityProperty;
        }
    }
    
    public virtual Int32 Humidity {
        get {
            return _HumidityProperty.Value;
        }
        set {
            _HumidityProperty.Value = value;
        }
    }
    
    public virtual P<Int32> TemperatureProperty {
        get {
            return this._TemperatureProperty;
        }
    }
    
    public virtual Int32 Temperature {
        get {
            return _TemperatureProperty.Value;
        }
        set {
            _TemperatureProperty.Value = value;
        }
    }
    
    public virtual P<Int32> HumidySpreadDecreaseProperty {
        get {
            return this._HumidySpreadDecreaseProperty;
        }
    }
    
    public virtual Int32 HumidySpreadDecrease {
        get {
            return _HumidySpreadDecreaseProperty.Value;
        }
        set {
            _HumidySpreadDecreaseProperty.Value = value;
        }
    }
    
    public virtual P<AnimationCurve> TemperatureSpreadProperty {
        get {
            return this._TemperatureSpreadProperty;
        }
    }
    
    public virtual AnimationCurve TemperatureSpread {
        get {
            return _TemperatureSpreadProperty.Value;
        }
        set {
            _TemperatureSpreadProperty.Value = value;
        }
    }
    
    public virtual P<AnimationCurve> HeightTemperatureProperty {
        get {
            return this._HeightTemperatureProperty;
        }
    }
    
    public virtual AnimationCurve HeightTemperature {
        get {
            return _HeightTemperatureProperty.Value;
        }
        set {
            _HeightTemperatureProperty.Value = value;
        }
    }
    
    public virtual P<AnimationCurve> HumidityTemperatureProperty {
        get {
            return this._HumidityTemperatureProperty;
        }
    }
    
    public virtual AnimationCurve HumidityTemperature {
        get {
            return _HumidityTemperatureProperty.Value;
        }
        set {
            _HumidityTemperatureProperty.Value = value;
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
    
    public virtual CommandWithSenderAndArgument<TerrainManagerViewModel, Vector3> GetHexAtWorldPos {
        get {
            return _GetHexAtWorldPos;
        }
        set {
            _GetHexAtWorldPos = value;
        }
    }
    
    public virtual ChunkViewModel ParentChunk {
        get {
            return this._ParentChunk;
        }
        set {
            _ParentChunk = value;
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
    
    public virtual GameLogicViewModel ParentGameLogic {
        get {
            return this._ParentGameLogic;
        }
        set {
            _ParentGameLogic = value;
        }
    }
    
    public virtual FogOfWarViewModel ParentFogOfWar {
        get {
            return this._ParentFogOfWar;
        }
        set {
            _ParentFogOfWar = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
        var terrainManager = controller as TerrainManagerControllerBase;
        this.GenerateMap = new CommandWithSender<TerrainManagerViewModel>(this, terrainManager.GenerateMap);
        this.GenerateChunks = new CommandWithSender<TerrainManagerViewModel>(this, terrainManager.GenerateChunks);
        this.GetHexAtWorldPos = new CommandWithSenderAndArgument<TerrainManagerViewModel, Vector3>(this, terrainManager.GetHexAtWorldPos);
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
        stream.SerializeInt("MinLakeSize", this.MinLakeSize);
        stream.SerializeInt("MaxLakeSize", this.MaxLakeSize);
        stream.SerializeInt("Humidity", this.Humidity);
        stream.SerializeInt("Temperature", this.Temperature);
        stream.SerializeInt("HumidySpreadDecrease", this.HumidySpreadDecrease);
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
        		this.MinLakeSize = stream.DeserializeInt("MinLakeSize");;
        		this.MaxLakeSize = stream.DeserializeInt("MaxLakeSize");;
        		this.Humidity = stream.DeserializeInt("Humidity");;
        		this.Temperature = stream.DeserializeInt("Temperature");;
        		this.HumidySpreadDecrease = stream.DeserializeInt("HumidySpreadDecrease");;
    }
    
    public override void Unbind() {
        base.Unbind();
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
        list.Add(new ViewModelPropertyInfo(_MinLakeSizeProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_MaxLakeSizeProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_HumidityProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_TemperatureProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_HumidySpreadDecreaseProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_TemperatureSpreadProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_HeightTemperatureProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_HumidityTemperatureProperty, false, false, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("GenerateMap", GenerateMap) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("GenerateChunks", GenerateChunks) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("GetHexAtWorldPos", GetHexAtWorldPos) { ParameterType = typeof(Vector3) });
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
public class GameLogicViewModelBase : ViewModel {
    
    public P<Int32> _PlayerCountProperty;
    
    public P<Int32> _TurnCountProperty;
    
    public P<PlayerViewModel> _CurrentPlayerProperty;
    
    public P<PlayerViewModel> _HumanPlayerProperty;
    
    public P<FactionViewModel> _HumanFactionProperty;
    
    public P<TerrainManagerViewModel> _TerrainManagerProperty;
    
    public P<GameState> _GameStateProperty;
    
    public P<Seasons> _SeasonProperty;
    
    public P<Int32> _YearProperty;
    
    public ModelCollection<PlayerViewModel> _PlayersProperty;
    
    public ModelCollection<FactionViewModel> _FactionsProperty;
    
    protected CommandWithSender<GameLogicViewModel> _StartGame;
    
    protected CommandWithSender<GameLogicViewModel> _SetupPlayers;
    
    protected CommandWithSender<GameLogicViewModel> _NextTurn;
    
    public GameLogicViewModelBase(GameLogicControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public GameLogicViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _PlayerCountProperty = new P<Int32>(this, "PlayerCount");
        _TurnCountProperty = new P<Int32>(this, "TurnCount");
        _CurrentPlayerProperty = new P<PlayerViewModel>(this, "CurrentPlayer");
        _HumanPlayerProperty = new P<PlayerViewModel>(this, "HumanPlayer");
        _HumanFactionProperty = new P<FactionViewModel>(this, "HumanFaction");
        _TerrainManagerProperty = new P<TerrainManagerViewModel>(this, "TerrainManager");
        _GameStateProperty = new P<GameState>(this, "GameState");
        _SeasonProperty = new P<Seasons>(this, "Season");
        _YearProperty = new P<Int32>(this, "Year");
        _PlayersProperty = new ModelCollection<PlayerViewModel>(this, "Players");
        _PlayersProperty.CollectionChanged += PlayersCollectionChanged;
        _FactionsProperty = new ModelCollection<FactionViewModel>(this, "Factions");
        _FactionsProperty.CollectionChanged += FactionsCollectionChanged;
    }
    
    protected virtual void PlayersCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
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
    
    public virtual P<Int32> PlayerCountProperty {
        get {
            return this._PlayerCountProperty;
        }
    }
    
    public virtual Int32 PlayerCount {
        get {
            return _PlayerCountProperty.Value;
        }
        set {
            _PlayerCountProperty.Value = value;
        }
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
    
    public virtual P<PlayerViewModel> CurrentPlayerProperty {
        get {
            return this._CurrentPlayerProperty;
        }
    }
    
    public virtual PlayerViewModel CurrentPlayer {
        get {
            return _CurrentPlayerProperty.Value;
        }
        set {
            _CurrentPlayerProperty.Value = value;
            if (value != null) value.ParentGameLogic = this;
        }
    }
    
    public virtual P<PlayerViewModel> HumanPlayerProperty {
        get {
            return this._HumanPlayerProperty;
        }
    }
    
    public virtual PlayerViewModel HumanPlayer {
        get {
            return _HumanPlayerProperty.Value;
        }
        set {
            _HumanPlayerProperty.Value = value;
            if (value != null) value.ParentGameLogic = this;
        }
    }
    
    public virtual P<FactionViewModel> HumanFactionProperty {
        get {
            return this._HumanFactionProperty;
        }
    }
    
    public virtual FactionViewModel HumanFaction {
        get {
            return _HumanFactionProperty.Value;
        }
        set {
            _HumanFactionProperty.Value = value;
            if (value != null) value.ParentGameLogic = this;
        }
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
            if (value != null) value.ParentGameLogic = this;
        }
    }
    
    public virtual P<GameState> GameStateProperty {
        get {
            return this._GameStateProperty;
        }
    }
    
    public virtual GameState GameState {
        get {
            return _GameStateProperty.Value;
        }
        set {
            _GameStateProperty.Value = value;
        }
    }
    
    public virtual P<Seasons> SeasonProperty {
        get {
            return this._SeasonProperty;
        }
    }
    
    public virtual Seasons Season {
        get {
            return _SeasonProperty.Value;
        }
        set {
            _SeasonProperty.Value = value;
        }
    }
    
    public virtual P<Int32> YearProperty {
        get {
            return this._YearProperty;
        }
    }
    
    public virtual Int32 Year {
        get {
            return _YearProperty.Value;
        }
        set {
            _YearProperty.Value = value;
        }
    }
    
    public virtual ModelCollection<PlayerViewModel> Players {
        get {
            return this._PlayersProperty;
        }
    }
    
    public virtual ModelCollection<FactionViewModel> Factions {
        get {
            return this._FactionsProperty;
        }
    }
    
    public virtual CommandWithSender<GameLogicViewModel> StartGame {
        get {
            return _StartGame;
        }
        set {
            _StartGame = value;
        }
    }
    
    public virtual CommandWithSender<GameLogicViewModel> SetupPlayers {
        get {
            return _SetupPlayers;
        }
        set {
            _SetupPlayers = value;
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
        this.StartGame = new CommandWithSender<GameLogicViewModel>(this, gameLogic.StartGame);
        this.SetupPlayers = new CommandWithSender<GameLogicViewModel>(this, gameLogic.SetupPlayers);
        this.NextTurn = new CommandWithSender<GameLogicViewModel>(this, gameLogic.NextTurn);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeInt("PlayerCount", this.PlayerCount);
        stream.SerializeInt("TurnCount", this.TurnCount);
		if (stream.DeepSerialize) stream.SerializeObject("CurrentPlayer", this.CurrentPlayer);
		if (stream.DeepSerialize) stream.SerializeObject("HumanPlayer", this.HumanPlayer);
		if (stream.DeepSerialize) stream.SerializeObject("HumanFaction", this.HumanFaction);
		if (stream.DeepSerialize) stream.SerializeObject("TerrainManager", this.TerrainManager);
		stream.SerializeInt("GameState", (int)this.GameState);
		stream.SerializeInt("Season", (int)this.Season);
        stream.SerializeInt("Year", this.Year);
        if (stream.DeepSerialize) stream.SerializeArray("Players", this.Players);
        if (stream.DeepSerialize) stream.SerializeArray("Factions", this.Factions);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.PlayerCount = stream.DeserializeInt("PlayerCount");;
        		this.TurnCount = stream.DeserializeInt("TurnCount");;
		if (stream.DeepSerialize) this.CurrentPlayer = stream.DeserializeObject<PlayerViewModel>("CurrentPlayer");
		if (stream.DeepSerialize) this.HumanPlayer = stream.DeserializeObject<PlayerViewModel>("HumanPlayer");
		if (stream.DeepSerialize) this.HumanFaction = stream.DeserializeObject<FactionViewModel>("HumanFaction");
		if (stream.DeepSerialize) this.TerrainManager = stream.DeserializeObject<TerrainManagerViewModel>("TerrainManager");
		this.GameState = (GameState)stream.DeserializeInt("GameState");
		this.Season = (Seasons)stream.DeserializeInt("Season");
        		this.Year = stream.DeserializeInt("Year");;
if (stream.DeepSerialize) {
        this.Players.Clear();
        this.Players.AddRange(stream.DeserializeObjectArray<PlayerViewModel>("Players"));
}
if (stream.DeepSerialize) {
        this.Factions.Clear();
        this.Factions.AddRange(stream.DeserializeObjectArray<FactionViewModel>("Factions"));
}
    }
    
    public override void Unbind() {
        base.Unbind();
        _PlayersProperty.CollectionChanged -= PlayersCollectionChanged;
        _FactionsProperty.CollectionChanged -= FactionsCollectionChanged;
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_PlayerCountProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_TurnCountProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_CurrentPlayerProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_HumanPlayerProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_HumanFactionProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_TerrainManagerProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_GameStateProperty, false, false, true));
        list.Add(new ViewModelPropertyInfo(_SeasonProperty, false, false, true));
        list.Add(new ViewModelPropertyInfo(_YearProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_PlayersProperty, true, true, false));
        list.Add(new ViewModelPropertyInfo(_FactionsProperty, true, true, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("StartGame", StartGame) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("SetupPlayers", SetupPlayers) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("NextTurn", NextTurn) { ParameterType = typeof(void) });
    }
    
    protected override void PlayersCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.NewItems.OfType<PlayerViewModel>()) item.ParentGameLogic = this;;
    }
    
    protected override void FactionsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.NewItems.OfType<FactionViewModel>()) item.ParentGameLogic = this;;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class PlayerViewModelBase : ViewModel {
    
    public P<String> _NameProperty;
    
    public P<Boolean> _IsHumanProperty;
    
    public P<Hex> _SelectedHexProperty;
    
    public P<UnitStackViewModel> _SelectedUnitStackProperty;
    
    public P<UnitStackViewModel> _HoverUnitStackProperty;
    
    public P<CityViewModel> _HoverCityProperty;
    
    public P<CityViewModel> _SelectedCityProperty;
    
    public P<FactionViewModel> _FactionProperty;
    
    public P<Color> _ColorProperty;
    
    public P<Hex> _StartingHexProperty;
    
    public ModelCollection<UnitViewModel> _SelectedUnitsProperty;
    
    protected CommandWithSenderAndArgument<PlayerViewModel, Hex> _SelectHex;
    
    protected CommandWithSenderAndArgument<PlayerViewModel, Vector3> _SelectHexAtPos;
    
    protected CommandWithSenderAndArgument<PlayerViewModel, UnitStackViewModel> _SelectUnitStack;
    
    protected CommandWithSenderAndArgument<PlayerViewModel, UnitViewModel> _SelectUnit;
    
    protected CommandWithSenderAndArgument<PlayerViewModel, CityViewModel> _SelectCity;
    
    protected CommandWithSenderAndArgument<PlayerViewModel, UnitStackViewModel> _SetHoverUnitStack;
    
    protected CommandWithSenderAndArgument<PlayerViewModel, CityViewModel> _SetHoverCity;
    
    protected CommandWithSenderAndArgument<PlayerViewModel, UnitStackViewModel> _MoveUnitStack;
    
    protected CommandWithSender<PlayerViewModel> _DeselectAll;
    
    public PlayerViewModelBase(PlayerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public PlayerViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _NameProperty = new P<String>(this, "Name");
        _IsHumanProperty = new P<Boolean>(this, "IsHuman");
        _SelectedHexProperty = new P<Hex>(this, "SelectedHex");
        _SelectedUnitStackProperty = new P<UnitStackViewModel>(this, "SelectedUnitStack");
        _HoverUnitStackProperty = new P<UnitStackViewModel>(this, "HoverUnitStack");
        _HoverCityProperty = new P<CityViewModel>(this, "HoverCity");
        _SelectedCityProperty = new P<CityViewModel>(this, "SelectedCity");
        _FactionProperty = new P<FactionViewModel>(this, "Faction");
        _ColorProperty = new P<Color>(this, "Color");
        _StartingHexProperty = new P<Hex>(this, "StartingHex");
        _SelectedUnitsProperty = new ModelCollection<UnitViewModel>(this, "SelectedUnits");
        _SelectedUnitsProperty.CollectionChanged += SelectedUnitsCollectionChanged;
    }
    
    protected virtual void SelectedUnitsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
}

public partial class PlayerViewModel : PlayerViewModelBase {
    
    private GameLogicViewModel _ParentGameLogic;
    
    private UnitStackViewModel _ParentUnitStack;
    
    private UnitViewModel _ParentUnit;
    
    public PlayerViewModel(PlayerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public PlayerViewModel() : 
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
    
    public virtual P<Boolean> IsHumanProperty {
        get {
            return this._IsHumanProperty;
        }
    }
    
    public virtual Boolean IsHuman {
        get {
            return _IsHumanProperty.Value;
        }
        set {
            _IsHumanProperty.Value = value;
        }
    }
    
    public virtual P<Hex> SelectedHexProperty {
        get {
            return this._SelectedHexProperty;
        }
    }
    
    public virtual Hex SelectedHex {
        get {
            return _SelectedHexProperty.Value;
        }
        set {
            _SelectedHexProperty.Value = value;
        }
    }
    
    public virtual P<UnitStackViewModel> SelectedUnitStackProperty {
        get {
            return this._SelectedUnitStackProperty;
        }
    }
    
    public virtual UnitStackViewModel SelectedUnitStack {
        get {
            return _SelectedUnitStackProperty.Value;
        }
        set {
            _SelectedUnitStackProperty.Value = value;
            if (value != null) value.ParentPlayer = this;
        }
    }
    
    public virtual P<UnitStackViewModel> HoverUnitStackProperty {
        get {
            return this._HoverUnitStackProperty;
        }
    }
    
    public virtual UnitStackViewModel HoverUnitStack {
        get {
            return _HoverUnitStackProperty.Value;
        }
        set {
            _HoverUnitStackProperty.Value = value;
            if (value != null) value.ParentPlayer = this;
        }
    }
    
    public virtual P<CityViewModel> HoverCityProperty {
        get {
            return this._HoverCityProperty;
        }
    }
    
    public virtual CityViewModel HoverCity {
        get {
            return _HoverCityProperty.Value;
        }
        set {
            _HoverCityProperty.Value = value;
            if (value != null) value.ParentPlayer = this;
        }
    }
    
    public virtual P<CityViewModel> SelectedCityProperty {
        get {
            return this._SelectedCityProperty;
        }
    }
    
    public virtual CityViewModel SelectedCity {
        get {
            return _SelectedCityProperty.Value;
        }
        set {
            _SelectedCityProperty.Value = value;
            if (value != null) value.ParentPlayer = this;
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
    
    public virtual P<Color> ColorProperty {
        get {
            return this._ColorProperty;
        }
    }
    
    public virtual Color Color {
        get {
            return _ColorProperty.Value;
        }
        set {
            _ColorProperty.Value = value;
        }
    }
    
    public virtual P<Hex> StartingHexProperty {
        get {
            return this._StartingHexProperty;
        }
    }
    
    public virtual Hex StartingHex {
        get {
            return _StartingHexProperty.Value;
        }
        set {
            _StartingHexProperty.Value = value;
        }
    }
    
    public virtual ModelCollection<UnitViewModel> SelectedUnits {
        get {
            return this._SelectedUnitsProperty;
        }
    }
    
    public virtual CommandWithSenderAndArgument<PlayerViewModel, Hex> SelectHex {
        get {
            return _SelectHex;
        }
        set {
            _SelectHex = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<PlayerViewModel, Vector3> SelectHexAtPos {
        get {
            return _SelectHexAtPos;
        }
        set {
            _SelectHexAtPos = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<PlayerViewModel, UnitStackViewModel> SelectUnitStack {
        get {
            return _SelectUnitStack;
        }
        set {
            _SelectUnitStack = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<PlayerViewModel, UnitViewModel> SelectUnit {
        get {
            return _SelectUnit;
        }
        set {
            _SelectUnit = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<PlayerViewModel, CityViewModel> SelectCity {
        get {
            return _SelectCity;
        }
        set {
            _SelectCity = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<PlayerViewModel, UnitStackViewModel> SetHoverUnitStack {
        get {
            return _SetHoverUnitStack;
        }
        set {
            _SetHoverUnitStack = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<PlayerViewModel, CityViewModel> SetHoverCity {
        get {
            return _SetHoverCity;
        }
        set {
            _SetHoverCity = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<PlayerViewModel, UnitStackViewModel> MoveUnitStack {
        get {
            return _MoveUnitStack;
        }
        set {
            _MoveUnitStack = value;
        }
    }
    
    public virtual CommandWithSender<PlayerViewModel> DeselectAll {
        get {
            return _DeselectAll;
        }
        set {
            _DeselectAll = value;
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
    
    public virtual UnitStackViewModel ParentUnitStack {
        get {
            return this._ParentUnitStack;
        }
        set {
            _ParentUnitStack = value;
        }
    }
    
    public virtual UnitViewModel ParentUnit {
        get {
            return this._ParentUnit;
        }
        set {
            _ParentUnit = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
        var player = controller as PlayerControllerBase;
        this.SelectHex = new CommandWithSenderAndArgument<PlayerViewModel, Hex>(this, player.SelectHex);
        this.SelectHexAtPos = new CommandWithSenderAndArgument<PlayerViewModel, Vector3>(this, player.SelectHexAtPos);
        this.SelectUnitStack = new CommandWithSenderAndArgument<PlayerViewModel, UnitStackViewModel>(this, player.SelectUnitStack);
        this.SelectUnit = new CommandWithSenderAndArgument<PlayerViewModel, UnitViewModel>(this, player.SelectUnit);
        this.SelectCity = new CommandWithSenderAndArgument<PlayerViewModel, CityViewModel>(this, player.SelectCity);
        this.SetHoverUnitStack = new CommandWithSenderAndArgument<PlayerViewModel, UnitStackViewModel>(this, player.SetHoverUnitStack);
        this.SetHoverCity = new CommandWithSenderAndArgument<PlayerViewModel, CityViewModel>(this, player.SetHoverCity);
        this.MoveUnitStack = new CommandWithSenderAndArgument<PlayerViewModel, UnitStackViewModel>(this, player.MoveUnitStack);
        this.DeselectAll = new CommandWithSender<PlayerViewModel>(this, player.DeselectAll);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeString("Name", this.Name);
        stream.SerializeBool("IsHuman", this.IsHuman);
		if (stream.DeepSerialize) stream.SerializeObject("SelectedUnitStack", this.SelectedUnitStack);
		if (stream.DeepSerialize) stream.SerializeObject("HoverUnitStack", this.HoverUnitStack);
		if (stream.DeepSerialize) stream.SerializeObject("HoverCity", this.HoverCity);
		if (stream.DeepSerialize) stream.SerializeObject("SelectedCity", this.SelectedCity);
		if (stream.DeepSerialize) stream.SerializeObject("Faction", this.Faction);
        if (stream.DeepSerialize) stream.SerializeArray("SelectedUnits", this.SelectedUnits);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.Name = stream.DeserializeString("Name");;
        		this.IsHuman = stream.DeserializeBool("IsHuman");;
		if (stream.DeepSerialize) this.SelectedUnitStack = stream.DeserializeObject<UnitStackViewModel>("SelectedUnitStack");
		if (stream.DeepSerialize) this.HoverUnitStack = stream.DeserializeObject<UnitStackViewModel>("HoverUnitStack");
		if (stream.DeepSerialize) this.HoverCity = stream.DeserializeObject<CityViewModel>("HoverCity");
		if (stream.DeepSerialize) this.SelectedCity = stream.DeserializeObject<CityViewModel>("SelectedCity");
		if (stream.DeepSerialize) this.Faction = stream.DeserializeObject<FactionViewModel>("Faction");
if (stream.DeepSerialize) {
        this.SelectedUnits.Clear();
        this.SelectedUnits.AddRange(stream.DeserializeObjectArray<UnitViewModel>("SelectedUnits"));
}
    }
    
    public override void Unbind() {
        base.Unbind();
        _SelectedUnitsProperty.CollectionChanged -= SelectedUnitsCollectionChanged;
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_NameProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_IsHumanProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_SelectedHexProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_SelectedUnitStackProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_HoverUnitStackProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_HoverCityProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_SelectedCityProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_FactionProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_ColorProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_StartingHexProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_SelectedUnitsProperty, true, true, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("SelectHex", SelectHex) { ParameterType = typeof(Hex) });
        list.Add(new ViewModelCommandInfo("SelectHexAtPos", SelectHexAtPos) { ParameterType = typeof(Vector3) });
        list.Add(new ViewModelCommandInfo("SelectUnitStack", SelectUnitStack) { ParameterType = typeof(UnitStackViewModel) });
        list.Add(new ViewModelCommandInfo("SelectUnit", SelectUnit) { ParameterType = typeof(UnitViewModel) });
        list.Add(new ViewModelCommandInfo("SelectCity", SelectCity) { ParameterType = typeof(CityViewModel) });
        list.Add(new ViewModelCommandInfo("SetHoverUnitStack", SetHoverUnitStack) { ParameterType = typeof(UnitStackViewModel) });
        list.Add(new ViewModelCommandInfo("SetHoverCity", SetHoverCity) { ParameterType = typeof(CityViewModel) });
        list.Add(new ViewModelCommandInfo("MoveUnitStack", MoveUnitStack) { ParameterType = typeof(UnitStackViewModel) });
        list.Add(new ViewModelCommandInfo("DeselectAll", DeselectAll) { ParameterType = typeof(void) });
    }
    
    protected override void SelectedUnitsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.NewItems.OfType<UnitViewModel>()) item.ParentPlayer = this;;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class UnitStackViewModelBase : ViewModel {
    
    private IDisposable _MovementCompletedDisposable;
    
    private IDisposable _CalculateMovementDisposable;
    
    public P<PlayerViewModel> _OwnerProperty;
    
    public P<Boolean> _SelectedProperty;
    
    public P<UnitViewModel> _LeadingUnitProperty;
    
    public UnitStackMovementState _StateProperty;
    
    public P<Vector3> _WorldPosProperty;
    
    public P<Int32> _MovePointsProperty;
    
    public P<Int32> _MovePointsTotalProperty;
    
    public P<StackState> _StackStateProperty;
    
    public P<PlanedAction> _PlannedActionProperty;
    
    public P<Hex> _PathDestinationProperty;
    
    public P<Hex> _NextHexInPathProperty;
    
    public P<UnitStackViewModel> _UnitStackDestinationProperty;
    
    public P<CityViewModel> _CityDestinationProperty;
    
    public P<Hex> _PlannedSettlingLocationProperty;
    
    public P<Hex> _SettlingLocationProperty;
    
    public P<Hex> _HexLocationProperty;
    
    public P<Boolean> _MovementCompletedProperty;
    
    public P<Hex> _CalculateMovementProperty;
    
    public ModelCollection<UnitViewModel> _UnitsProperty;
    
    public ModelCollection<Hex> _PathProperty;
    
    public ModelCollection<CharacterViewModel> _CharactersProperty;
    
    protected CommandWithSender<UnitStackViewModel> _NextTurnCalculation;
    
    protected CommandWithSenderAndArgument<UnitStackViewModel, UnitViewModel> _AddUnit;
    
    protected CommandWithSenderAndArgument<UnitStackViewModel, UnitViewModel> _RemoveUnit;
    
    protected CommandWithSender<UnitStackViewModel> _PlanMovement;
    
    protected CommandWithSender<UnitStackViewModel> _PlanUnitDestination;
    
    protected CommandWithSender<UnitStackViewModel> _PlanSettling;
    
    protected CommandWithSenderAndArgument<UnitStackViewModel, Hex> _EvaluateMovementPath;
    
    protected CommandWithSenderAndArgument<UnitStackViewModel, Hex> _EvaluateSettlingLocation;
    
    protected CommandWithSenderAndArgument<UnitStackViewModel, Hex> _Move;
    
    protected CommandWithSender<UnitStackViewModel> _StopMove;
    
    protected CommandWithSender<UnitStackViewModel> _Settle;
    
    protected CommandWithSenderAndArgument<UnitStackViewModel, Hex> _FoundCity;
    
    protected CommandWithSender<UnitStackViewModel> _CancelAction;
    
    protected CommandWithSender<UnitStackViewModel> _PlanUnit;
    
    public UnitStackViewModelBase(UnitStackControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public UnitStackViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _OwnerProperty = new P<PlayerViewModel>(this, "Owner");
        _SelectedProperty = new P<Boolean>(this, "Selected");
        _LeadingUnitProperty = new P<UnitViewModel>(this, "LeadingUnit");
        _StateProperty = new UnitStackMovementState(this, "State");
        _WorldPosProperty = new P<Vector3>(this, "WorldPos");
        _MovePointsProperty = new P<Int32>(this, "MovePoints");
        _MovePointsTotalProperty = new P<Int32>(this, "MovePointsTotal");
        _StackStateProperty = new P<StackState>(this, "StackState");
        _PlannedActionProperty = new P<PlanedAction>(this, "PlannedAction");
        _PathDestinationProperty = new P<Hex>(this, "PathDestination");
        _NextHexInPathProperty = new P<Hex>(this, "NextHexInPath");
        _UnitStackDestinationProperty = new P<UnitStackViewModel>(this, "UnitStackDestination");
        _CityDestinationProperty = new P<CityViewModel>(this, "CityDestination");
        _PlannedSettlingLocationProperty = new P<Hex>(this, "PlannedSettlingLocation");
        _SettlingLocationProperty = new P<Hex>(this, "SettlingLocation");
        _HexLocationProperty = new P<Hex>(this, "HexLocation");
        _MovementCompletedProperty = new P<Boolean>(this, "MovementCompleted");
        _CalculateMovementProperty = new P<Hex>(this, "CalculateMovement");
        _UnitsProperty = new ModelCollection<UnitViewModel>(this, "Units");
        _UnitsProperty.CollectionChanged += UnitsCollectionChanged;
        _PathProperty = new ModelCollection<Hex>(this, "Path");
        _CharactersProperty = new ModelCollection<CharacterViewModel>(this, "Characters");
        _CharactersProperty.CollectionChanged += CharactersCollectionChanged;
        this.ResetMovementCompleted();
        this.ResetCalculateMovement();
        this._Move.Subscribe(_StateProperty.Move);
        this._StopMove.Subscribe(_StateProperty.CancelMove);
        this._CancelAction.Subscribe(_StateProperty.CancelMove);
        this._StateProperty.MovementCompleted.AddComputer(_MovementCompletedProperty);
    }
    
    public virtual void ResetMovementCompleted() {
        if (_MovementCompletedDisposable != null) _MovementCompletedDisposable.Dispose();
        _MovementCompletedDisposable = _MovementCompletedProperty.ToComputed( ComputeMovementCompleted, this.GetMovementCompletedDependents().ToArray() ).DisposeWith(this);
    }
    
    public virtual void ResetCalculateMovement() {
        if (_CalculateMovementDisposable != null) _CalculateMovementDisposable.Dispose();
        _CalculateMovementDisposable = _CalculateMovementProperty.ToComputed( ComputeCalculateMovement, this.GetCalculateMovementDependents().ToArray() ).DisposeWith(this);
    }
    
    protected virtual void UnitsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
    
    protected virtual void CharactersCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
    
    public virtual Boolean ComputeMovementCompleted() {
        return default(Boolean);
    }
    
    public virtual IEnumerable<IObservableProperty> GetMovementCompletedDependents() {
        yield return _WorldPosProperty;
        yield break;
    }
    
    public virtual Hex ComputeCalculateMovement() {
        return default(Hex);
    }
    
    public virtual IEnumerable<IObservableProperty> GetCalculateMovementDependents() {
        yield return _WorldPosProperty;
        yield return _StateProperty;
        yield break;
    }
}

public partial class UnitStackViewModel : UnitStackViewModelBase {
    
    private PlayerViewModel _ParentPlayer;
    
    private UnitStackViewModel _ParentUnitStack;
    
    private FactionViewModel _ParentFaction;
    
    private FogOfWarViewModel _ParentFogOfWar;
    
    public UnitStackViewModel(UnitStackControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public UnitStackViewModel() : 
            base() {
    }
    
    public virtual P<PlayerViewModel> OwnerProperty {
        get {
            return this._OwnerProperty;
        }
    }
    
    public virtual PlayerViewModel Owner {
        get {
            return _OwnerProperty.Value;
        }
        set {
            _OwnerProperty.Value = value;
            if (value != null) value.ParentUnitStack = this;
        }
    }
    
    public virtual P<Boolean> SelectedProperty {
        get {
            return this._SelectedProperty;
        }
    }
    
    public virtual Boolean Selected {
        get {
            return _SelectedProperty.Value;
        }
        set {
            _SelectedProperty.Value = value;
        }
    }
    
    public virtual P<UnitViewModel> LeadingUnitProperty {
        get {
            return this._LeadingUnitProperty;
        }
    }
    
    public virtual UnitViewModel LeadingUnit {
        get {
            return _LeadingUnitProperty.Value;
        }
        set {
            _LeadingUnitProperty.Value = value;
            if (value != null) value.ParentUnitStack = this;
        }
    }
    
    public virtual UnitStackMovementState StateProperty {
        get {
            return this._StateProperty;
        }
    }
    
    public virtual Invert.StateMachine.State State {
        get {
            return _StateProperty.Value;
        }
        set {
            _StateProperty.Value = value;
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
    
    public virtual P<Int32> MovePointsProperty {
        get {
            return this._MovePointsProperty;
        }
    }
    
    public virtual Int32 MovePoints {
        get {
            return _MovePointsProperty.Value;
        }
        set {
            _MovePointsProperty.Value = value;
        }
    }
    
    public virtual P<Int32> MovePointsTotalProperty {
        get {
            return this._MovePointsTotalProperty;
        }
    }
    
    public virtual Int32 MovePointsTotal {
        get {
            return _MovePointsTotalProperty.Value;
        }
        set {
            _MovePointsTotalProperty.Value = value;
        }
    }
    
    public virtual P<StackState> StackStateProperty {
        get {
            return this._StackStateProperty;
        }
    }
    
    public virtual StackState StackState {
        get {
            return _StackStateProperty.Value;
        }
        set {
            _StackStateProperty.Value = value;
        }
    }
    
    public virtual P<PlanedAction> PlannedActionProperty {
        get {
            return this._PlannedActionProperty;
        }
    }
    
    public virtual PlanedAction PlannedAction {
        get {
            return _PlannedActionProperty.Value;
        }
        set {
            _PlannedActionProperty.Value = value;
        }
    }
    
    public virtual P<Hex> PathDestinationProperty {
        get {
            return this._PathDestinationProperty;
        }
    }
    
    public virtual Hex PathDestination {
        get {
            return _PathDestinationProperty.Value;
        }
        set {
            _PathDestinationProperty.Value = value;
        }
    }
    
    public virtual P<Hex> NextHexInPathProperty {
        get {
            return this._NextHexInPathProperty;
        }
    }
    
    public virtual Hex NextHexInPath {
        get {
            return _NextHexInPathProperty.Value;
        }
        set {
            _NextHexInPathProperty.Value = value;
        }
    }
    
    public virtual P<UnitStackViewModel> UnitStackDestinationProperty {
        get {
            return this._UnitStackDestinationProperty;
        }
    }
    
    public virtual UnitStackViewModel UnitStackDestination {
        get {
            return _UnitStackDestinationProperty.Value;
        }
        set {
            _UnitStackDestinationProperty.Value = value;
            if (value != null) value.ParentUnitStack = this;
        }
    }
    
    public virtual P<CityViewModel> CityDestinationProperty {
        get {
            return this._CityDestinationProperty;
        }
    }
    
    public virtual CityViewModel CityDestination {
        get {
            return _CityDestinationProperty.Value;
        }
        set {
            _CityDestinationProperty.Value = value;
            if (value != null) value.ParentUnitStack = this;
        }
    }
    
    public virtual P<Hex> PlannedSettlingLocationProperty {
        get {
            return this._PlannedSettlingLocationProperty;
        }
    }
    
    public virtual Hex PlannedSettlingLocation {
        get {
            return _PlannedSettlingLocationProperty.Value;
        }
        set {
            _PlannedSettlingLocationProperty.Value = value;
        }
    }
    
    public virtual P<Hex> SettlingLocationProperty {
        get {
            return this._SettlingLocationProperty;
        }
    }
    
    public virtual Hex SettlingLocation {
        get {
            return _SettlingLocationProperty.Value;
        }
        set {
            _SettlingLocationProperty.Value = value;
        }
    }
    
    public virtual P<Hex> HexLocationProperty {
        get {
            return this._HexLocationProperty;
        }
    }
    
    public virtual Hex HexLocation {
        get {
            return _HexLocationProperty.Value;
        }
        set {
            _HexLocationProperty.Value = value;
        }
    }
    
    public virtual P<Boolean> MovementCompletedProperty {
        get {
            return this._MovementCompletedProperty;
        }
    }
    
    public virtual Boolean MovementCompleted {
        get {
            return _MovementCompletedProperty.Value;
        }
        set {
            _MovementCompletedProperty.Value = value;
        }
    }
    
    public virtual P<Hex> CalculateMovementProperty {
        get {
            return this._CalculateMovementProperty;
        }
    }
    
    public virtual Hex CalculateMovement {
        get {
            return _CalculateMovementProperty.Value;
        }
        set {
            _CalculateMovementProperty.Value = value;
        }
    }
    
    public virtual ModelCollection<UnitViewModel> Units {
        get {
            return this._UnitsProperty;
        }
    }
    
    public virtual ModelCollection<Hex> Path {
        get {
            return this._PathProperty;
        }
    }
    
    public virtual ModelCollection<CharacterViewModel> Characters {
        get {
            return this._CharactersProperty;
        }
    }
    
    public virtual CommandWithSender<UnitStackViewModel> NextTurnCalculation {
        get {
            return _NextTurnCalculation;
        }
        set {
            _NextTurnCalculation = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<UnitStackViewModel, UnitViewModel> AddUnit {
        get {
            return _AddUnit;
        }
        set {
            _AddUnit = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<UnitStackViewModel, UnitViewModel> RemoveUnit {
        get {
            return _RemoveUnit;
        }
        set {
            _RemoveUnit = value;
        }
    }
    
    public virtual CommandWithSender<UnitStackViewModel> PlanMovement {
        get {
            return _PlanMovement;
        }
        set {
            _PlanMovement = value;
        }
    }
    
    public virtual CommandWithSender<UnitStackViewModel> PlanUnitDestination {
        get {
            return _PlanUnitDestination;
        }
        set {
            _PlanUnitDestination = value;
        }
    }
    
    public virtual CommandWithSender<UnitStackViewModel> PlanSettling {
        get {
            return _PlanSettling;
        }
        set {
            _PlanSettling = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<UnitStackViewModel, Hex> EvaluateMovementPath {
        get {
            return _EvaluateMovementPath;
        }
        set {
            _EvaluateMovementPath = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<UnitStackViewModel, Hex> EvaluateSettlingLocation {
        get {
            return _EvaluateSettlingLocation;
        }
        set {
            _EvaluateSettlingLocation = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<UnitStackViewModel, Hex> Move {
        get {
            return _Move;
        }
        set {
            _Move = value;
        }
    }
    
    public virtual CommandWithSender<UnitStackViewModel> StopMove {
        get {
            return _StopMove;
        }
        set {
            _StopMove = value;
        }
    }
    
    public virtual CommandWithSender<UnitStackViewModel> Settle {
        get {
            return _Settle;
        }
        set {
            _Settle = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<UnitStackViewModel, Hex> FoundCity {
        get {
            return _FoundCity;
        }
        set {
            _FoundCity = value;
        }
    }
    
    public virtual CommandWithSender<UnitStackViewModel> CancelAction {
        get {
            return _CancelAction;
        }
        set {
            _CancelAction = value;
        }
    }
    
    public virtual CommandWithSender<UnitStackViewModel> PlanUnit {
        get {
            return _PlanUnit;
        }
        set {
            _PlanUnit = value;
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
    
    public virtual UnitStackViewModel ParentUnitStack {
        get {
            return this._ParentUnitStack;
        }
        set {
            _ParentUnitStack = value;
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
    
    public virtual FogOfWarViewModel ParentFogOfWar {
        get {
            return this._ParentFogOfWar;
        }
        set {
            _ParentFogOfWar = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
        var unitStack = controller as UnitStackControllerBase;
        this.NextTurnCalculation = new CommandWithSender<UnitStackViewModel>(this, unitStack.NextTurnCalculation);
        this.AddUnit = new CommandWithSenderAndArgument<UnitStackViewModel, UnitViewModel>(this, unitStack.AddUnit);
        this.RemoveUnit = new CommandWithSenderAndArgument<UnitStackViewModel, UnitViewModel>(this, unitStack.RemoveUnit);
        this.PlanMovement = new CommandWithSender<UnitStackViewModel>(this, unitStack.PlanMovement);
        this.PlanUnitDestination = new CommandWithSender<UnitStackViewModel>(this, unitStack.PlanUnitDestination);
        this.PlanSettling = new CommandWithSender<UnitStackViewModel>(this, unitStack.PlanSettling);
        this.EvaluateMovementPath = new CommandWithSenderAndArgument<UnitStackViewModel, Hex>(this, unitStack.EvaluateMovementPath);
        this.EvaluateSettlingLocation = new CommandWithSenderAndArgument<UnitStackViewModel, Hex>(this, unitStack.EvaluateSettlingLocation);
        this.Move = new CommandWithSenderAndArgument<UnitStackViewModel, Hex>(this, unitStack.Move);
        this.StopMove = new CommandWithSender<UnitStackViewModel>(this, unitStack.StopMove);
        this.Settle = new CommandWithSender<UnitStackViewModel>(this, unitStack.Settle);
        this.FoundCity = new CommandWithSenderAndArgument<UnitStackViewModel, Hex>(this, unitStack.FoundCity);
        this.CancelAction = new CommandWithSender<UnitStackViewModel>(this, unitStack.CancelAction);
        this.PlanUnit = new CommandWithSender<UnitStackViewModel>(this, unitStack.PlanUnit);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
		if (stream.DeepSerialize) stream.SerializeObject("Owner", this.Owner);
        stream.SerializeBool("Selected", this.Selected);
		if (stream.DeepSerialize) stream.SerializeObject("LeadingUnit", this.LeadingUnit);
        stream.SerializeString("State", this.State.Name);;
        stream.SerializeVector3("WorldPos", this.WorldPos);
        stream.SerializeInt("MovePoints", this.MovePoints);
        stream.SerializeInt("MovePointsTotal", this.MovePointsTotal);
		stream.SerializeInt("StackState", (int)this.StackState);
		stream.SerializeInt("PlannedAction", (int)this.PlannedAction);
		if (stream.DeepSerialize) stream.SerializeObject("UnitStackDestination", this.UnitStackDestination);
		if (stream.DeepSerialize) stream.SerializeObject("CityDestination", this.CityDestination);
        if (stream.DeepSerialize) stream.SerializeArray("Units", this.Units);
        if (stream.DeepSerialize) stream.SerializeArray("Characters", this.Characters);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
		if (stream.DeepSerialize) this.Owner = stream.DeserializeObject<PlayerViewModel>("Owner");
        		this.Selected = stream.DeserializeBool("Selected");;
		if (stream.DeepSerialize) this.LeadingUnit = stream.DeserializeObject<UnitViewModel>("LeadingUnit");
        this._StateProperty.SetState(stream.DeserializeString("State"));
        		this.WorldPos = stream.DeserializeVector3("WorldPos");;
        		this.MovePoints = stream.DeserializeInt("MovePoints");;
        		this.MovePointsTotal = stream.DeserializeInt("MovePointsTotal");;
		this.StackState = (StackState)stream.DeserializeInt("StackState");
		this.PlannedAction = (PlanedAction)stream.DeserializeInt("PlannedAction");
		if (stream.DeepSerialize) this.UnitStackDestination = stream.DeserializeObject<UnitStackViewModel>("UnitStackDestination");
		if (stream.DeepSerialize) this.CityDestination = stream.DeserializeObject<CityViewModel>("CityDestination");
if (stream.DeepSerialize) {
        this.Units.Clear();
        this.Units.AddRange(stream.DeserializeObjectArray<UnitViewModel>("Units"));
}
if (stream.DeepSerialize) {
        this.Characters.Clear();
        this.Characters.AddRange(stream.DeserializeObjectArray<CharacterViewModel>("Characters"));
}
    }
    
    public override void Unbind() {
        base.Unbind();
        _UnitsProperty.CollectionChanged -= UnitsCollectionChanged;
        _CharactersProperty.CollectionChanged -= CharactersCollectionChanged;
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_OwnerProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_SelectedProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_LeadingUnitProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_StateProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_WorldPosProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_MovePointsProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_MovePointsTotalProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_StackStateProperty, false, false, true));
        list.Add(new ViewModelPropertyInfo(_PlannedActionProperty, false, false, true));
        list.Add(new ViewModelPropertyInfo(_PathDestinationProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_NextHexInPathProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_UnitStackDestinationProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_CityDestinationProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_PlannedSettlingLocationProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_SettlingLocationProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_HexLocationProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_MovementCompletedProperty, false, false, false, true));
        list.Add(new ViewModelPropertyInfo(_CalculateMovementProperty, false, false, false, true));
        list.Add(new ViewModelPropertyInfo(_UnitsProperty, true, true, false));
        list.Add(new ViewModelPropertyInfo(_PathProperty, false, true, false));
        list.Add(new ViewModelPropertyInfo(_CharactersProperty, true, true, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("NextTurnCalculation", NextTurnCalculation) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("AddUnit", AddUnit) { ParameterType = typeof(UnitViewModel) });
        list.Add(new ViewModelCommandInfo("RemoveUnit", RemoveUnit) { ParameterType = typeof(UnitViewModel) });
        list.Add(new ViewModelCommandInfo("PlanMovement", PlanMovement) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("PlanUnitDestination", PlanUnitDestination) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("PlanSettling", PlanSettling) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("EvaluateMovementPath", EvaluateMovementPath) { ParameterType = typeof(Hex) });
        list.Add(new ViewModelCommandInfo("EvaluateSettlingLocation", EvaluateSettlingLocation) { ParameterType = typeof(Hex) });
        list.Add(new ViewModelCommandInfo("Move", Move) { ParameterType = typeof(Hex) });
        list.Add(new ViewModelCommandInfo("StopMove", StopMove) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("Settle", Settle) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("FoundCity", FoundCity) { ParameterType = typeof(Hex) });
        list.Add(new ViewModelCommandInfo("CancelAction", CancelAction) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("PlanUnit", PlanUnit) { ParameterType = typeof(void) });
    }
    
    protected override void UnitsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.NewItems.OfType<UnitViewModel>()) item.ParentUnitStack = this;;
    }
    
    protected override void CharactersCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.NewItems.OfType<CharacterViewModel>()) item.ParentUnitStack = this;;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class FactionViewModelBase : ViewModel {
    
    public P<String> _NameProperty;
    
    public P<Single> _FoodProperty;
    
    public P<Single> _GoldProperty;
    
    public ModelCollection<UnitViewModel> _UnitsProperty;
    
    public ModelCollection<UnitStackViewModel> _UnitStacksProperty;
    
    public ModelCollection<CityViewModel> _CitiesProperty;
    
    protected CommandWithSender<FactionViewModel> _NextTurnCalculation;
    
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
        _UnitStacksProperty = new ModelCollection<UnitStackViewModel>(this, "UnitStacks");
        _UnitStacksProperty.CollectionChanged += UnitStacksCollectionChanged;
        _CitiesProperty = new ModelCollection<CityViewModel>(this, "Cities");
        _CitiesProperty.CollectionChanged += CitiesCollectionChanged;
    }
    
    protected virtual void UnitsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
    
    protected virtual void UnitStacksCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
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
    
    public virtual ModelCollection<UnitStackViewModel> UnitStacks {
        get {
            return this._UnitStacksProperty;
        }
    }
    
    public virtual ModelCollection<CityViewModel> Cities {
        get {
            return this._CitiesProperty;
        }
    }
    
    public virtual CommandWithSender<FactionViewModel> NextTurnCalculation {
        get {
            return _NextTurnCalculation;
        }
        set {
            _NextTurnCalculation = value;
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
        var faction = controller as FactionControllerBase;
        this.NextTurnCalculation = new CommandWithSender<FactionViewModel>(this, faction.NextTurnCalculation);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeString("Name", this.Name);
        stream.SerializeFloat("Food", this.Food);
        stream.SerializeFloat("Gold", this.Gold);
        if (stream.DeepSerialize) stream.SerializeArray("Units", this.Units);
        if (stream.DeepSerialize) stream.SerializeArray("UnitStacks", this.UnitStacks);
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
        this.UnitStacks.Clear();
        this.UnitStacks.AddRange(stream.DeserializeObjectArray<UnitStackViewModel>("UnitStacks"));
}
if (stream.DeepSerialize) {
        this.Cities.Clear();
        this.Cities.AddRange(stream.DeserializeObjectArray<CityViewModel>("Cities"));
}
    }
    
    public override void Unbind() {
        base.Unbind();
        _UnitsProperty.CollectionChanged -= UnitsCollectionChanged;
        _UnitStacksProperty.CollectionChanged -= UnitStacksCollectionChanged;
        _CitiesProperty.CollectionChanged -= CitiesCollectionChanged;
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_NameProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_FoodProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_GoldProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_UnitsProperty, true, true, false));
        list.Add(new ViewModelPropertyInfo(_UnitStacksProperty, true, true, false));
        list.Add(new ViewModelPropertyInfo(_CitiesProperty, true, true, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("NextTurnCalculation", NextTurnCalculation) { ParameterType = typeof(void) });
    }
    
    protected override void UnitsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.NewItems.OfType<UnitViewModel>()) item.ParentFaction = this;;
    }
    
    protected override void UnitStacksCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.NewItems.OfType<UnitStackViewModel>()) item.ParentFaction = this;;
    }
    
    protected override void CitiesCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.NewItems.OfType<CityViewModel>()) item.ParentFaction = this;;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class CityViewModelBase : ViewModel {
    
    public P<String> _NameProperty;
    
    public P<Hex> _HexLocationProperty;
    
    public P<Int32> _PopulationProperty;
    
    public P<Single> _PopulationGrowthProperty;
    
    public P<Int32> _FoodProperty;
    
    public P<Int32> _ProductionProperty;
    
    public P<Int32> _KnowledgeProperty;
    
    public P<Int32> _GoldIncomeProperty;
    
    public P<Int32> _HappienessProperty;
    
    public ModelCollection<BuildingViewModel> _BuildingsProperty;
    
    public ModelCollection<UnitViewModel> _GarnisonProperty;
    
    protected CommandWithSender<CityViewModel> _NextTurnCalculation;
    
    protected CommandWithSender<CityViewModel> _CalcPopulation;
    
    protected CommandWithSender<CityViewModel> _CalcGoldIncome;
    
    protected CommandWithSender<CityViewModel> _CalcHappieness;
    
    protected CommandWithSender<CityViewModel> _CalcProduction;
    
    protected CommandWithSender<CityViewModel> _CalcConstruction;
    
    public CityViewModelBase(CityControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public CityViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _NameProperty = new P<String>(this, "Name");
        _HexLocationProperty = new P<Hex>(this, "HexLocation");
        _PopulationProperty = new P<Int32>(this, "Population");
        _PopulationGrowthProperty = new P<Single>(this, "PopulationGrowth");
        _FoodProperty = new P<Int32>(this, "Food");
        _ProductionProperty = new P<Int32>(this, "Production");
        _KnowledgeProperty = new P<Int32>(this, "Knowledge");
        _GoldIncomeProperty = new P<Int32>(this, "GoldIncome");
        _HappienessProperty = new P<Int32>(this, "Happieness");
        _BuildingsProperty = new ModelCollection<BuildingViewModel>(this, "Buildings");
        _BuildingsProperty.CollectionChanged += BuildingsCollectionChanged;
        _GarnisonProperty = new ModelCollection<UnitViewModel>(this, "Garnison");
        _GarnisonProperty.CollectionChanged += GarnisonCollectionChanged;
    }
    
    protected virtual void BuildingsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
    
    protected virtual void GarnisonCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
}

public partial class CityViewModel : CityViewModelBase {
    
    private PlayerViewModel _ParentPlayer;
    
    private UnitStackViewModel _ParentUnitStack;
    
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
    
    public virtual P<Hex> HexLocationProperty {
        get {
            return this._HexLocationProperty;
        }
    }
    
    public virtual Hex HexLocation {
        get {
            return _HexLocationProperty.Value;
        }
        set {
            _HexLocationProperty.Value = value;
        }
    }
    
    public virtual P<Int32> PopulationProperty {
        get {
            return this._PopulationProperty;
        }
    }
    
    public virtual Int32 Population {
        get {
            return _PopulationProperty.Value;
        }
        set {
            _PopulationProperty.Value = value;
        }
    }
    
    public virtual P<Single> PopulationGrowthProperty {
        get {
            return this._PopulationGrowthProperty;
        }
    }
    
    public virtual Single PopulationGrowth {
        get {
            return _PopulationGrowthProperty.Value;
        }
        set {
            _PopulationGrowthProperty.Value = value;
        }
    }
    
    public virtual P<Int32> FoodProperty {
        get {
            return this._FoodProperty;
        }
    }
    
    public virtual Int32 Food {
        get {
            return _FoodProperty.Value;
        }
        set {
            _FoodProperty.Value = value;
        }
    }
    
    public virtual P<Int32> ProductionProperty {
        get {
            return this._ProductionProperty;
        }
    }
    
    public virtual Int32 Production {
        get {
            return _ProductionProperty.Value;
        }
        set {
            _ProductionProperty.Value = value;
        }
    }
    
    public virtual P<Int32> KnowledgeProperty {
        get {
            return this._KnowledgeProperty;
        }
    }
    
    public virtual Int32 Knowledge {
        get {
            return _KnowledgeProperty.Value;
        }
        set {
            _KnowledgeProperty.Value = value;
        }
    }
    
    public virtual P<Int32> GoldIncomeProperty {
        get {
            return this._GoldIncomeProperty;
        }
    }
    
    public virtual Int32 GoldIncome {
        get {
            return _GoldIncomeProperty.Value;
        }
        set {
            _GoldIncomeProperty.Value = value;
        }
    }
    
    public virtual P<Int32> HappienessProperty {
        get {
            return this._HappienessProperty;
        }
    }
    
    public virtual Int32 Happieness {
        get {
            return _HappienessProperty.Value;
        }
        set {
            _HappienessProperty.Value = value;
        }
    }
    
    public virtual ModelCollection<BuildingViewModel> Buildings {
        get {
            return this._BuildingsProperty;
        }
    }
    
    public virtual ModelCollection<UnitViewModel> Garnison {
        get {
            return this._GarnisonProperty;
        }
    }
    
    public virtual CommandWithSender<CityViewModel> NextTurnCalculation {
        get {
            return _NextTurnCalculation;
        }
        set {
            _NextTurnCalculation = value;
        }
    }
    
    public virtual CommandWithSender<CityViewModel> CalcPopulation {
        get {
            return _CalcPopulation;
        }
        set {
            _CalcPopulation = value;
        }
    }
    
    public virtual CommandWithSender<CityViewModel> CalcGoldIncome {
        get {
            return _CalcGoldIncome;
        }
        set {
            _CalcGoldIncome = value;
        }
    }
    
    public virtual CommandWithSender<CityViewModel> CalcHappieness {
        get {
            return _CalcHappieness;
        }
        set {
            _CalcHappieness = value;
        }
    }
    
    public virtual CommandWithSender<CityViewModel> CalcProduction {
        get {
            return _CalcProduction;
        }
        set {
            _CalcProduction = value;
        }
    }
    
    public virtual CommandWithSender<CityViewModel> CalcConstruction {
        get {
            return _CalcConstruction;
        }
        set {
            _CalcConstruction = value;
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
    
    public virtual UnitStackViewModel ParentUnitStack {
        get {
            return this._ParentUnitStack;
        }
        set {
            _ParentUnitStack = value;
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
        var city = controller as CityControllerBase;
        this.NextTurnCalculation = new CommandWithSender<CityViewModel>(this, city.NextTurnCalculation);
        this.CalcPopulation = new CommandWithSender<CityViewModel>(this, city.CalcPopulation);
        this.CalcGoldIncome = new CommandWithSender<CityViewModel>(this, city.CalcGoldIncome);
        this.CalcHappieness = new CommandWithSender<CityViewModel>(this, city.CalcHappieness);
        this.CalcProduction = new CommandWithSender<CityViewModel>(this, city.CalcProduction);
        this.CalcConstruction = new CommandWithSender<CityViewModel>(this, city.CalcConstruction);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeString("Name", this.Name);
        stream.SerializeInt("Population", this.Population);
        stream.SerializeFloat("PopulationGrowth", this.PopulationGrowth);
        stream.SerializeInt("Food", this.Food);
        stream.SerializeInt("Production", this.Production);
        stream.SerializeInt("Knowledge", this.Knowledge);
        stream.SerializeInt("GoldIncome", this.GoldIncome);
        stream.SerializeInt("Happieness", this.Happieness);
        if (stream.DeepSerialize) stream.SerializeArray("Buildings", this.Buildings);
        if (stream.DeepSerialize) stream.SerializeArray("Garnison", this.Garnison);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.Name = stream.DeserializeString("Name");;
        		this.Population = stream.DeserializeInt("Population");;
        		this.PopulationGrowth = stream.DeserializeFloat("PopulationGrowth");;
        		this.Food = stream.DeserializeInt("Food");;
        		this.Production = stream.DeserializeInt("Production");;
        		this.Knowledge = stream.DeserializeInt("Knowledge");;
        		this.GoldIncome = stream.DeserializeInt("GoldIncome");;
        		this.Happieness = stream.DeserializeInt("Happieness");;
if (stream.DeepSerialize) {
        this.Buildings.Clear();
        this.Buildings.AddRange(stream.DeserializeObjectArray<BuildingViewModel>("Buildings"));
}
if (stream.DeepSerialize) {
        this.Garnison.Clear();
        this.Garnison.AddRange(stream.DeserializeObjectArray<UnitViewModel>("Garnison"));
}
    }
    
    public override void Unbind() {
        base.Unbind();
        _BuildingsProperty.CollectionChanged -= BuildingsCollectionChanged;
        _GarnisonProperty.CollectionChanged -= GarnisonCollectionChanged;
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_NameProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_HexLocationProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_PopulationProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_PopulationGrowthProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_FoodProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_ProductionProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_KnowledgeProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_GoldIncomeProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_HappienessProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_BuildingsProperty, true, true, false));
        list.Add(new ViewModelPropertyInfo(_GarnisonProperty, true, true, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("NextTurnCalculation", NextTurnCalculation) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("CalcPopulation", CalcPopulation) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("CalcGoldIncome", CalcGoldIncome) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("CalcHappieness", CalcHappieness) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("CalcProduction", CalcProduction) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("CalcConstruction", CalcConstruction) { ParameterType = typeof(void) });
    }
    
    protected override void BuildingsCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.NewItems.OfType<BuildingViewModel>()) item.ParentCity = this;;
    }
    
    protected override void GarnisonCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.NewItems.OfType<UnitViewModel>()) item.ParentCity = this;;
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
public class AIPlayerViewModelBase : PlayerViewModel {
    
    protected CommandWithSender<AIPlayerViewModel> _Think;
    
    public AIPlayerViewModelBase(AIPlayerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public AIPlayerViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
    }
}

public partial class AIPlayerViewModel : AIPlayerViewModelBase {
    
    public AIPlayerViewModel(AIPlayerControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public AIPlayerViewModel() : 
            base() {
    }
    
    public virtual CommandWithSender<AIPlayerViewModel> Think {
        get {
            return _Think;
        }
        set {
            _Think = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
        base.WireCommands(controller);
        var aIPlayer = controller as AIPlayerControllerBase;
        this.Think = new CommandWithSender<AIPlayerViewModel>(this, aIPlayer.Think);
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
        list.Add(new ViewModelCommandInfo("Think", Think) { ParameterType = typeof(void) });
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class UnitViewModelBase : ViewModel {
    
    public P<String> _NameProperty;
    
    public P<Int32> _UnitCountProperty;
    
    public P<Int32> _UnitCountMaxProperty;
    
    public P<PlayerViewModel> _OwnerProperty;
    
    public UnitViewModelBase(UnitControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public UnitViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _NameProperty = new P<String>(this, "Name");
        _UnitCountProperty = new P<Int32>(this, "UnitCount");
        _UnitCountMaxProperty = new P<Int32>(this, "UnitCountMax");
        _OwnerProperty = new P<PlayerViewModel>(this, "Owner");
    }
}

public partial class UnitViewModel : UnitViewModelBase {
    
    private PlayerViewModel _ParentPlayer;
    
    private UnitStackViewModel _ParentUnitStack;
    
    private FactionViewModel _ParentFaction;
    
    private CityViewModel _ParentCity;
    
    public UnitViewModel(UnitControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public UnitViewModel() : 
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
    
    public virtual P<Int32> UnitCountProperty {
        get {
            return this._UnitCountProperty;
        }
    }
    
    public virtual Int32 UnitCount {
        get {
            return _UnitCountProperty.Value;
        }
        set {
            _UnitCountProperty.Value = value;
        }
    }
    
    public virtual P<Int32> UnitCountMaxProperty {
        get {
            return this._UnitCountMaxProperty;
        }
    }
    
    public virtual Int32 UnitCountMax {
        get {
            return _UnitCountMaxProperty.Value;
        }
        set {
            _UnitCountMaxProperty.Value = value;
        }
    }
    
    public virtual P<PlayerViewModel> OwnerProperty {
        get {
            return this._OwnerProperty;
        }
    }
    
    public virtual PlayerViewModel Owner {
        get {
            return _OwnerProperty.Value;
        }
        set {
            _OwnerProperty.Value = value;
            if (value != null) value.ParentUnit = this;
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
    
    public virtual UnitStackViewModel ParentUnitStack {
        get {
            return this._ParentUnitStack;
        }
        set {
            _ParentUnitStack = value;
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
        stream.SerializeString("Name", this.Name);
        stream.SerializeInt("UnitCount", this.UnitCount);
        stream.SerializeInt("UnitCountMax", this.UnitCountMax);
		if (stream.DeepSerialize) stream.SerializeObject("Owner", this.Owner);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.Name = stream.DeserializeString("Name");;
        		this.UnitCount = stream.DeserializeInt("UnitCount");;
        		this.UnitCountMax = stream.DeserializeInt("UnitCountMax");;
		if (stream.DeepSerialize) this.Owner = stream.DeserializeObject<PlayerViewModel>("Owner");
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_NameProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_UnitCountProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_UnitCountMaxProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_OwnerProperty, true, false, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class SettlerUnitViewModelBase : UnitViewModel {
    
    public P<Int32> _PopulationProperty;
    
    protected CommandWithSender<SettlerUnitViewModel> _Settle;
    
    public SettlerUnitViewModelBase(SettlerUnitControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public SettlerUnitViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _PopulationProperty = new P<Int32>(this, "Population");
    }
}

public partial class SettlerUnitViewModel : SettlerUnitViewModelBase {
    
    public SettlerUnitViewModel(SettlerUnitControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public SettlerUnitViewModel() : 
            base() {
    }
    
    public virtual P<Int32> PopulationProperty {
        get {
            return this._PopulationProperty;
        }
    }
    
    public virtual Int32 Population {
        get {
            return _PopulationProperty.Value;
        }
        set {
            _PopulationProperty.Value = value;
        }
    }
    
    public virtual CommandWithSender<SettlerUnitViewModel> Settle {
        get {
            return _Settle;
        }
        set {
            _Settle = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
        base.WireCommands(controller);
        var settlerUnit = controller as SettlerUnitControllerBase;
        this.Settle = new CommandWithSender<SettlerUnitViewModel>(this, settlerUnit.Settle);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeInt("Population", this.Population);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.Population = stream.DeserializeInt("Population");;
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_PopulationProperty, false, false, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("Settle", Settle) { ParameterType = typeof(void) });
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class MeleeUnitViewModelBase : UnitViewModel {
    
    public MeleeUnitViewModelBase(MeleeUnitControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public MeleeUnitViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
    }
}

public partial class MeleeUnitViewModel : MeleeUnitViewModelBase {
    
    public MeleeUnitViewModel(MeleeUnitControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public MeleeUnitViewModel() : 
            base() {
    }
    
    protected override void WireCommands(Controller controller) {
        base.WireCommands(controller);
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
public class CharacterViewModelBase : ViewModel {
    
    public P<String> _NameProperty;
    
    public P<Int32> _AgeProperty;
    
    public ModelCollection<CharacterViewModel> _ChildrenProperty;
    
    public CharacterViewModelBase(CharacterControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public CharacterViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _NameProperty = new P<String>(this, "Name");
        _AgeProperty = new P<Int32>(this, "Age");
        _ChildrenProperty = new ModelCollection<CharacterViewModel>(this, "Children");
        _ChildrenProperty.CollectionChanged += ChildrenCollectionChanged;
    }
    
    protected virtual void ChildrenCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
    }
}

public partial class CharacterViewModel : CharacterViewModelBase {
    
    private UnitStackViewModel _ParentUnitStack;
    
    private CharacterViewModel _ParentCharacter;
    
    private CharacterUnitViewModel _ParentCharacterUnit;
    
    public CharacterViewModel(CharacterControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public CharacterViewModel() : 
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
    
    public virtual P<Int32> AgeProperty {
        get {
            return this._AgeProperty;
        }
    }
    
    public virtual Int32 Age {
        get {
            return _AgeProperty.Value;
        }
        set {
            _AgeProperty.Value = value;
        }
    }
    
    public virtual ModelCollection<CharacterViewModel> Children {
        get {
            return this._ChildrenProperty;
        }
    }
    
    public virtual UnitStackViewModel ParentUnitStack {
        get {
            return this._ParentUnitStack;
        }
        set {
            _ParentUnitStack = value;
        }
    }
    
    public virtual CharacterViewModel ParentCharacter {
        get {
            return this._ParentCharacter;
        }
        set {
            _ParentCharacter = value;
        }
    }
    
    public virtual CharacterUnitViewModel ParentCharacterUnit {
        get {
            return this._ParentCharacterUnit;
        }
        set {
            _ParentCharacterUnit = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
        stream.SerializeString("Name", this.Name);
        stream.SerializeInt("Age", this.Age);
        if (stream.DeepSerialize) stream.SerializeArray("Children", this.Children);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
        		this.Name = stream.DeserializeString("Name");;
        		this.Age = stream.DeserializeInt("Age");;
if (stream.DeepSerialize) {
        this.Children.Clear();
        this.Children.AddRange(stream.DeserializeObjectArray<CharacterViewModel>("Children"));
}
    }
    
    public override void Unbind() {
        base.Unbind();
        _ChildrenProperty.CollectionChanged -= ChildrenCollectionChanged;
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_NameProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_AgeProperty, false, false, false));
        list.Add(new ViewModelPropertyInfo(_ChildrenProperty, true, true, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
    
    protected override void ChildrenCollectionChanged(System.Collections.Specialized.NotifyCollectionChangedEventArgs args) {
        foreach (var item in args.NewItems.OfType<CharacterViewModel>()) item.ParentCharacter = this;;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class CharacterUnitViewModelBase : UnitViewModel {
    
    public P<CharacterViewModel> _CharacterProperty;
    
    public CharacterUnitViewModelBase(CharacterUnitControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public CharacterUnitViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _CharacterProperty = new P<CharacterViewModel>(this, "Character");
    }
}

public partial class CharacterUnitViewModel : CharacterUnitViewModelBase {
    
    public CharacterUnitViewModel(CharacterUnitControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public CharacterUnitViewModel() : 
            base() {
    }
    
    public virtual P<CharacterViewModel> CharacterProperty {
        get {
            return this._CharacterProperty;
        }
    }
    
    public virtual CharacterViewModel Character {
        get {
            return _CharacterProperty.Value;
        }
        set {
            _CharacterProperty.Value = value;
            if (value != null) value.ParentCharacterUnit = this;
        }
    }
    
    protected override void WireCommands(Controller controller) {
        base.WireCommands(controller);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
		if (stream.DeepSerialize) stream.SerializeObject("Character", this.Character);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
		if (stream.DeepSerialize) this.Character = stream.DeserializeObject<CharacterViewModel>("Character");
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_CharacterProperty, true, false, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
    }
}

[DiagramInfoAttribute("Ultimate Strategy Game")]
public class FogOfWarViewModelBase : ViewModel {
    
    public P<TerrainManagerViewModel> _TerrainManagerProperty;
    
    public P<Single> _HexBorderLegnthProperty;
    
    protected CommandWithSender<FogOfWarViewModel> _UpdateFOW;
    
    protected CommandWithSenderAndArgument<FogOfWarViewModel, UnitStackViewModel> _UpdateUnitView;
    
    public FogOfWarViewModelBase(FogOfWarControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public FogOfWarViewModelBase() : 
            base() {
    }
    
    public override void Bind() {
        base.Bind();
        _TerrainManagerProperty = new P<TerrainManagerViewModel>(this, "TerrainManager");
        _HexBorderLegnthProperty = new P<Single>(this, "HexBorderLegnth");
    }
}

public partial class FogOfWarViewModel : FogOfWarViewModelBase {
    
    public FogOfWarViewModel(FogOfWarControllerBase controller, bool initialize = true) : 
            base(controller, initialize) {
    }
    
    public FogOfWarViewModel() : 
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
            if (value != null) value.ParentFogOfWar = this;
        }
    }
    
    public virtual P<Single> HexBorderLegnthProperty {
        get {
            return this._HexBorderLegnthProperty;
        }
    }
    
    public virtual Single HexBorderLegnth {
        get {
            return _HexBorderLegnthProperty.Value;
        }
        set {
            _HexBorderLegnthProperty.Value = value;
        }
    }
    
    public virtual CommandWithSender<FogOfWarViewModel> UpdateFOW {
        get {
            return _UpdateFOW;
        }
        set {
            _UpdateFOW = value;
        }
    }
    
    public virtual CommandWithSenderAndArgument<FogOfWarViewModel, UnitStackViewModel> UpdateUnitView {
        get {
            return _UpdateUnitView;
        }
        set {
            _UpdateUnitView = value;
        }
    }
    
    protected override void WireCommands(Controller controller) {
        var fogOfWar = controller as FogOfWarControllerBase;
        this.UpdateFOW = new CommandWithSender<FogOfWarViewModel>(this, fogOfWar.UpdateFOW);
        this.UpdateUnitView = new CommandWithSenderAndArgument<FogOfWarViewModel, UnitStackViewModel>(this, fogOfWar.UpdateUnitView);
    }
    
    public override void Write(ISerializerStream stream) {
		base.Write(stream);
		if (stream.DeepSerialize) stream.SerializeObject("TerrainManager", this.TerrainManager);
        stream.SerializeFloat("HexBorderLegnth", this.HexBorderLegnth);
    }
    
    public override void Read(ISerializerStream stream) {
		base.Read(stream);
		if (stream.DeepSerialize) this.TerrainManager = stream.DeserializeObject<TerrainManagerViewModel>("TerrainManager");
        		this.HexBorderLegnth = stream.DeserializeFloat("HexBorderLegnth");;
    }
    
    public override void Unbind() {
        base.Unbind();
    }
    
    protected override void FillProperties(List<ViewModelPropertyInfo> list) {
        base.FillProperties(list);;
        list.Add(new ViewModelPropertyInfo(_TerrainManagerProperty, true, false, false));
        list.Add(new ViewModelPropertyInfo(_HexBorderLegnthProperty, false, false, false));
    }
    
    protected override void FillCommands(List<ViewModelCommandInfo> list) {
        base.FillCommands(list);;
        list.Add(new ViewModelCommandInfo("UpdateFOW", UpdateFOW) { ParameterType = typeof(void) });
        list.Add(new ViewModelCommandInfo("UpdateUnitView", UpdateUnitView) { ParameterType = typeof(UnitStackViewModel) });
    }
}

public enum TerrainType {
    
    None,
    
    Jungle,
    
    Forest,
    
    Desert,
    
    TemperatRainforest,
    
    TemperateForest,
    
    Grassland,
    
    AlpineTundra,
    
    Tundra,
    
    Arctic,
    
    Water,
}

public enum Seasons {
    
    Spring,
    
    Summer,
    
    Autum,
    
    Winter,
}

public enum GameState {
    
    MainMenu,
    
    GeneratingMap,
    
    Playing,
    
    Paused,
}

public enum StackState {
    
    Idling,
    
    Moving,
    
    Settling,
}

public enum PlanedAction {
    
    None,
    
    Move,
    
    Settle,
}
