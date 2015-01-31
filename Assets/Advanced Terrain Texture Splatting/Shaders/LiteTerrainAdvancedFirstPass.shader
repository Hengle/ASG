Shader "Nature/Terrain/Advanced Diffuse (Lite)" {
Properties {
	_Depth ("Blend Depth", Range(0.001, 1)) = 0.1
	[HideInInspector] _Control ("Control (RGBA)", 2D) = "red" {}
	[HideInInspector] _Splat3 ("Layer 3 (A)", 2D) = "black" {}
	[HideInInspector] _Splat2 ("Layer 2 (B)", 2D) = "black" {}
	[HideInInspector] _Splat1 ("Layer 1 (G)", 2D) = "black" {}
	[HideInInspector] _Splat0 ("Layer 0 (R)", 2D) = "black" {}
	// used in fallback on old cards & base map
	[HideInInspector] _MainTex ("BaseMap (RGB)", 2D) = "white" {}
	[HideInInspector] _Color ("Main Color", Color) = (1,1,1,1)
}
	
SubShader {
	Tags {
		"SplatCount" = "4"
		"Queue" = "Geometry-100"
		"RenderType" = "Opaque"
	}
CGPROGRAM
#pragma surface surf Lambert
#pragma target 3.0

struct Input {
	float2 uv_Control : TEXCOORD0;
	float2 uv_Splat0 : TEXCOORD1;
	float2 uv_Splat1 : TEXCOORD2;
	float2 uv_Splat2 : TEXCOORD3;
	float2 uv_Splat3 : TEXCOORD4;
};

float _Depth;
sampler2D _Control;
sampler2D _Splat0,_Splat1,_Splat2,_Splat3;

float4 normalized(float4 val) {
	return val / dot(val, 1);
}

float maximized(float4 val) {
	return max(val[0], max(val[1], max(val[2], val[3])));
}

void surf (Input IN, inout SurfaceOutput o) {
	fixed4 sc = tex2D (_Control, IN.uv_Control);

	fixed4 t0 = tex2D (_Splat0, IN.uv_Splat0);
	fixed4 t1 = tex2D (_Splat1, IN.uv_Splat1);
	fixed4 t2 = tex2D (_Splat2, IN.uv_Splat2);
	fixed4 t3 = tex2D (_Splat3, IN.uv_Splat3);

	float4 blend;
	blend[0] = t0.a + sc.r;
	blend[1] = t1.a + sc.g;
	blend[2] = t2.a + sc.b;
	blend[3] = t3.a + sc.a;

	float a = maximized(blend);
	blend = normalized(max(blend - a + _Depth, 0));

	fixed3 col;
	col  = blend.r * t0;
	col += blend.g * t1;
	col += blend.b * t2;
	col += blend.a * t3;

	o.Albedo = col * dot(sc, 1);
	o.Alpha = 0;
}
ENDCG
}

Dependency "AddPassShader" = "Hidden/TerrainEngine/Splatmap/Lightmap-AddPass-Advanced-Lite"
Dependency "BaseMapShader" = "Diffuse"
Dependency "Details0"      = "Hidden/TerrainEngine/Details/Vertexlit"
Dependency "Details1"      = "Hidden/TerrainEngine/Details/WavingDoublePass"
Dependency "Details2"      = "Hidden/TerrainEngine/Details/BillboardWavingDoublePass"
Dependency "Tree0"         = "Hidden/TerrainEngine/BillboardTree"

// Fallback to Default shader
Fallback "Nature/Terrain/Diffuse"
}
