// Compiled shader for all platforms, uncompressed size: 559.1KB

Shader "Nature/Terrain/Advanced Diffuse (Pro)" {
Properties {
 _Depth ("Blend Depth", Range(0.001,1)) = 0.1
[HideInInspector]  _Control ("Control (RGBA)", 2D) = "red" {}
[HideInInspector]  _Splat3 ("Layer 3 (A)", 2D) = "black" {}
[HideInInspector]  _Splat2 ("Layer 2 (B)", 2D) = "black" {}
[HideInInspector]  _Splat1 ("Layer 1 (G)", 2D) = "black" {}
[HideInInspector]  _Splat0 ("Layer 0 (R)", 2D) = "black" {}
[HideInInspector]  _MainTex ("BaseMap (RGB)", 2D) = "white" {}
[HideInInspector]  _Color ("Main Color", Color) = (1,1,1,1)
}
SubShader { 
 Tags { "QUEUE"="Geometry-100" "RenderType"="Opaque" "SplatCount"="4" }


 // Stats for Vertex shader:
 //       d3d11 : 24 avg math (10..51)
 //        d3d9 : 30 avg math (10..67)
 //      opengl : 30 avg math (10..67)
 // Stats for Fragment shader:
 //       d3d11 : 25 avg math (22..28), 6 avg texture (5..7)
 //        d3d9 : 30 avg math (28..33), 6 avg texture (5..7)
 //      opengl : 37 avg math (35..41), 6 avg texture (5..7)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry-100" "RenderType"="Opaque" "SplatCount"="4" }
Program "vp" {
SubProgram "opengl " {
// Stats: 31 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [unity_SHAr]
Vector 10 [unity_SHAg]
Vector 11 [unity_SHAb]
Vector 12 [unity_SHBr]
Vector 13 [unity_SHBg]
Vector 14 [unity_SHBb]
Vector 15 [unity_SHC]
Vector 16 [unity_Scale]
Vector 17 [_Control_ST]
Vector 18 [_Splat0_ST]
Vector 19 [_Splat1_ST]
Vector 20 [_Splat2_ST]
Vector 21 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[16].w;
DP3 R3.w, R1, c[6];
DP3 R2.w, R1, c[7];
DP3 R0.x, R1, c[5];
MOV R0.y, R3.w;
MOV R0.z, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.y, R0, c[10];
DP4 R2.x, R0, c[9];
MUL R0.y, R3.w, R3.w;
DP4 R3.z, R1, c[14];
DP4 R3.y, R1, c[13];
DP4 R3.x, R1, c[12];
MAD R0.y, R0.x, R0.x, -R0;
MUL R1.xyz, R0.y, c[15];
ADD R2.xyz, R2, R3;
ADD result.texcoord[4].xyz, R2, R1;
MOV result.texcoord[3].z, R2.w;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[20].xyxy, c[20];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[21], c[21].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 31 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 31 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_SHAr]
Vector 9 [unity_SHAg]
Vector 10 [unity_SHAb]
Vector 11 [unity_SHBr]
Vector 12 [unity_SHBg]
Vector 13 [unity_SHBb]
Vector 14 [unity_SHC]
Vector 15 [unity_Scale]
Vector 16 [_Control_ST]
Vector 17 [_Splat0_ST]
Vector 18 [_Splat1_ST]
Vector 19 [_Splat2_ST]
Vector 20 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c15.w
dp3 r3.w, r1, c5
dp3 r2.w, r1, c6
dp3 r0.x, r1, c4
mov r0.y, r3.w
mov r0.z, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c21.x
dp4 r2.z, r0, c10
dp4 r2.y, r0, c9
dp4 r2.x, r0, c8
mul r0.y, r3.w, r3.w
dp4 r3.z, r1, c13
dp4 r3.y, r1, c12
dp4 r3.x, r1, c11
mad r0.y, r0.x, r0.x, -r0
mul r1.xyz, r0.y, c14
add r2.xyz, r2, r3
add o5.xyz, r2, r1
mov o4.z, r2.w
mov o4.y, r3.w
mov o4.x, r0
mad o1.zw, v2.xyxy, c17.xyxy, c17
mad o1.xy, v2, c16, c16.zwzw
mad o2.zw, v2.xyxy, c19.xyxy, c19
mad o2.xy, v2, c18, c18.zwzw
mad o3.xy, v2, c20, c20.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 24 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 64 [_Control_ST]
Vector 80 [_Splat0_ST]
Vector 96 [_Splat1_ST]
Vector 112 [_Splat2_ST]
Vector 128 [_Splat3_ST]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedbmmcdjhegdpncglbeappilehbiflcfjoabaaaaaapiafaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefceeaeaaaaeaaaabaabbabaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaa
aaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaahaaaaaa
kgiocaaaaaaaaaaaahaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaaf
icaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaa
abaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaa
abaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaa
abaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaa
aaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaabaaaaaa
cjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaabaaaaaa
ckaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaabaaaaaa
claaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaa
cmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD4));
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD4));
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD4));
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 10 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [unity_LightmapST]
Vector 10 [_Control_ST]
Vector 11 [_Splat0_ST]
Vector 12 [_Splat1_ST]
Vector 13 [_Splat2_ST]
Vector 14 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[15] = { program.local[0],
		state.matrix.mvp,
		program.local[5..14] };
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[9], c[9].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 10 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 10 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [unity_LightmapST]
Vector 9 [_Control_ST]
Vector 10 [_Splat0_ST]
Vector 11 [_Splat1_ST]
Vector 12 [_Splat2_ST]
Vector 13 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
mad o1.zw, v2.xyxy, c10.xyxy, c10
mad o1.xy, v2, c9, c9.zwzw
mad o2.zw, v2.xyxy, c12.xyxy, c12
mad o2.xy, v2, c11, c11.zwzw
mad o3.xy, v2, c13, c13.zwzw
mad o4.xy, v3, c8, c8.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 10 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 64 [unity_LightmapST]
Vector 80 [_Control_ST]
Vector 96 [_Splat0_ST]
Vector 112 [_Splat1_ST]
Vector 128 [_Splat2_ST]
Vector 144 [_Splat3_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedjodjpfgiaedgmakejhkbocihjhkgbhodabaaaaaaneadaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcdiacaaaaeaaaabaa
ioaaaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
mccabaaaadaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaaaaaaaaaaagaaaaaa
dcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaa
ogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaa
adaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
aeaaaaaakgiocaaaaaaaaaaaaeaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  c_1.xyz = (col_3 * (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz));
  c_1.w = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
  c_1.xyz = (col_3 * ((8.0 * tmpvar_22.w) * tmpvar_22.xyz));
  c_1.w = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec2 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  c_1.xyz = (col_3 * (2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz));
  c_1.w = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 10 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [unity_LightmapST]
Vector 10 [_Control_ST]
Vector 11 [_Splat0_ST]
Vector 12 [_Splat1_ST]
Vector 13 [_Splat2_ST]
Vector 14 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[15] = { program.local[0],
		state.matrix.mvp,
		program.local[5..14] };
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[9], c[9].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 10 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 10 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [unity_LightmapST]
Vector 9 [_Control_ST]
Vector 10 [_Splat0_ST]
Vector 11 [_Splat1_ST]
Vector 12 [_Splat2_ST]
Vector 13 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
mad o1.zw, v2.xyxy, c10.xyxy, c10
mad o1.xy, v2, c9, c9.zwzw
mad o2.zw, v2.xyxy, c12.xyxy, c12
mad o2.xy, v2, c11, c11.zwzw
mad o3.xy, v2, c13, c13.zwzw
mad o4.xy, v3, c8, c8.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 10 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 64 [unity_LightmapST]
Vector 80 [_Control_ST]
Vector 96 [_Splat0_ST]
Vector 112 [_Splat1_ST]
Vector 128 [_Splat2_ST]
Vector 144 [_Splat3_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedjodjpfgiaedgmakejhkbocihjhkgbhodabaaaaaaneadaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcdiacaaaaeaaaabaa
ioaaaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
mccabaaaadaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaaaaaaaaaaagaaaaaa
dcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaa
ogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaa
adaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
aeaaaaaakgiocaaaaaaaaaaaaeaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  mediump vec3 lm_22;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_22 = tmpvar_23;
  mediump vec3 tmpvar_24;
  tmpvar_24 = (col_3 * lm_22);
  c_1.xyz = tmpvar_24;
  c_1.w = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
  mediump vec3 lm_23;
  lowp vec3 tmpvar_24;
  tmpvar_24 = ((8.0 * tmpvar_22.w) * tmpvar_22.xyz);
  lm_23 = tmpvar_24;
  mediump vec3 tmpvar_25;
  tmpvar_25 = (col_3 * lm_23);
  c_1.xyz = tmpvar_25;
  c_1.w = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec2 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  mediump vec3 lm_22;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_22 = tmpvar_23;
  mediump vec3 tmpvar_24;
  tmpvar_24 = (col_3 * lm_22);
  c_1.xyz = tmpvar_24;
  c_1.w = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 36 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_Control_ST]
Vector 19 [_Splat0_ST]
Vector 20 [_Splat1_ST]
Vector 21 [_Splat2_ST]
Vector 22 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[23] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, vertex.normal, c[17].w;
DP3 R3.w, R0, c[6];
DP3 R2.w, R0, c[7];
DP3 R1.w, R0, c[5];
MOV R1.x, R3.w;
MOV R1.y, R2.w;
MOV R1.z, c[0].x;
MUL R0, R1.wxyy, R1.xyyw;
DP4 R2.z, R1.wxyz, c[12];
DP4 R2.y, R1.wxyz, c[11];
DP4 R2.x, R1.wxyz, c[10];
DP4 R1.z, R0, c[15];
DP4 R1.y, R0, c[14];
DP4 R1.x, R0, c[13];
MUL R3.x, R3.w, R3.w;
MAD R0.x, R1.w, R1.w, -R3;
ADD R3.xyz, R2, R1;
MUL R2.xyz, R0.x, c[16];
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[9].x;
ADD result.texcoord[4].xyz, R3, R2;
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[3].z, R2.w;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R1.w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[22], c[22].zwzw;
END
# 36 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 36 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_Control_ST]
Vector 19 [_Splat0_ST]
Vector 20 [_Splat1_ST]
Vector 21 [_Splat2_ST]
Vector 22 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c23, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1, c17.w
dp3 r3.w, r0, c5
dp3 r2.w, r0, c6
dp3 r1.w, r0, c4
mov r1.x, r3.w
mov r1.y, r2.w
mov r1.z, c23.x
mul r0, r1.wxyy, r1.xyyw
dp4 r2.z, r1.wxyz, c12
dp4 r2.y, r1.wxyz, c11
dp4 r2.x, r1.wxyz, c10
dp4 r1.z, r0, c15
dp4 r1.y, r0, c14
dp4 r1.x, r0, c13
mul r3.x, r3.w, r3.w
mad r0.x, r1.w, r1.w, -r3
add r3.xyz, r2, r1
mul r2.xyz, r0.x, c16
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c23.y
mul r1.y, r1, c8.x
add o5.xyz, r3, r2
mad o6.xy, r1.z, c9.zwzw, r1
mov o0, r0
mov o6.zw, r0
mov o4.z, r2.w
mov o4.y, r3.w
mov o4.x, r1.w
mad o1.zw, v2.xyxy, c19.xyxy, c19
mad o1.xy, v2, c18, c18.zwzw
mad o2.zw, v2.xyxy, c21.xyxy, c21
mad o2.xy, v2, c20, c20.zwzw
mad o3.xy, v2, c22, c22.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 27 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Vector 128 [_Control_ST]
Vector 144 [_Splat0_ST]
Vector 160 [_Splat1_ST]
Vector 176 [_Splat2_ST]
Vector 192 [_Splat3_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedenniplhimnbeljppigjkppljjmoddcdcabaaaaaaliagaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcomaeaaaaeaaaabaadlabaaaafjaaaaaeegiocaaaaaaaaaaa
anaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaal
dccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadcaaaaaldccabaaaadaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaa
abaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
acaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaa
acaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaa
acaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaabkaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaakhccabaaaafaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
agaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  lowp vec4 c_28;
  c_28.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * tmpvar_22) * 2.0));
  c_28.w = tmpvar_2;
  c_1.w = c_28.w;
  c_1.xyz = (c_28.xyz + (col_3 * xlv_TEXCOORD4));
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_8;
  mediump vec3 tmpvar_10;
  mediump vec4 normal_11;
  normal_11 = tmpvar_9;
  highp float vC_12;
  mediump vec3 x3_13;
  mediump vec3 x2_14;
  mediump vec3 x1_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAr, normal_11);
  x1_15.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAg, normal_11);
  x1_15.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAb, normal_11);
  x1_15.z = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = (normal_11.xyzz * normal_11.yzzx);
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBr, tmpvar_19);
  x2_14.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBg, tmpvar_19);
  x2_14.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBb, tmpvar_19);
  x2_14.z = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y));
  vC_12 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_SHC.xyz * vC_12);
  x3_13 = tmpvar_24;
  tmpvar_10 = ((x1_15 + x2_14) + x3_13);
  shlight_1 = tmpvar_10;
  tmpvar_5 = shlight_1;
  highp vec4 o_25;
  highp vec4 tmpvar_26;
  tmpvar_26 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_27;
  tmpvar_27.x = tmpvar_26.x;
  tmpvar_27.y = (tmpvar_26.y * _ProjectionParams.x);
  o_25.xy = (tmpvar_27 + tmpvar_26.w);
  o_25.zw = tmpvar_6.zw;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = o_25;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD4));
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  lowp vec4 c_28;
  c_28.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * tmpvar_22) * 2.0));
  c_28.w = tmpvar_2;
  c_1.w = c_28.w;
  c_1.xyz = (c_28.xyz + (col_3 * xlv_TEXCOORD4));
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 15 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_ProjectionParams]
Vector 10 [unity_LightmapST]
Vector 11 [_Control_ST]
Vector 12 [_Splat0_ST]
Vector 13 [_Splat1_ST]
Vector 14 [_Splat2_ST]
Vector 15 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[16] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[9].x;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[12].xyxy, c[12];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[14].xyxy, c[14];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[10], c[10].zwzw;
END
# 15 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 15 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_LightmapST]
Vector 11 [_Control_ST]
Vector 12 [_Splat0_ST]
Vector 13 [_Splat1_ST]
Vector 14 [_Splat2_ST]
Vector 15 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c16, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c16.x
mul r1.y, r1, c8.x
mad o5.xy, r1.z, c9.zwzw, r1
mov o0, r0
mov o5.zw, r0
mad o1.zw, v2.xyxy, c12.xyxy, c12
mad o1.xy, v2, c11, c11.zwzw
mad o2.zw, v2.xyxy, c14.xyxy, c14
mad o2.xy, v2, c13, c13.zwzw
mad o3.xy, v2, c15, c15.zwzw
mad o4.xy, v3, c10, c10.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 13 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 224
Vector 128 [unity_LightmapST]
Vector 144 [_Control_ST]
Vector 160 [_Splat0_ST]
Vector 176 [_Splat1_ST]
Vector 192 [_Splat2_ST]
Vector 208 [_Splat3_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedffleoioiabiclfcfhmeddefjibeepdnaabaaaaaajeaeaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcoaacaaaaeaaaabaaliaaaaaafjaaaaae
egiocaaaaaaaaaaaaoaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadmccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaakaaaaaakgiocaaa
aaaaaaaaakaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadcaaaaalmccabaaaacaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaamaaaaaakgiocaaaaaaaaaaaamaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaanaaaaaa
ogikcaaaaaaaaaaaanaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD4.z / xlv_TEXCOORD4.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  c_1.xyz = (col_3 * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz), vec3((tmpvar_22 * 2.0))));
  c_1.w = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_6;
  tmpvar_6.x = tmpvar_5.x;
  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
  o_4.xy = (tmpvar_6 + tmpvar_5.w);
  o_4.zw = tmpvar_3.zw;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = o_4;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
  lowp vec3 tmpvar_24;
  tmpvar_24 = ((8.0 * tmpvar_23.w) * tmpvar_23.xyz);
  c_1.xyz = (col_3 * max (min (tmpvar_24, ((tmpvar_22.x * 2.0) * tmpvar_23.xyz)), (tmpvar_24 * tmpvar_22.x)));
  c_1.w = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec2 xlv_TEXCOORD3;
out highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = textureProj (_ShadowMapTexture, xlv_TEXCOORD4).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD4.z / xlv_TEXCOORD4.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  c_1.xyz = (col_3 * min ((2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz), vec3((tmpvar_22 * 2.0))));
  c_1.w = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 15 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_ProjectionParams]
Vector 10 [unity_LightmapST]
Vector 11 [_Control_ST]
Vector 12 [_Splat0_ST]
Vector 13 [_Splat1_ST]
Vector 14 [_Splat2_ST]
Vector 15 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[16] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[9].x;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[12].xyxy, c[12];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[14].xyxy, c[14];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[10], c[10].zwzw;
END
# 15 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 15 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_LightmapST]
Vector 11 [_Control_ST]
Vector 12 [_Splat0_ST]
Vector 13 [_Splat1_ST]
Vector 14 [_Splat2_ST]
Vector 15 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c16, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c16.x
mul r1.y, r1, c8.x
mad o5.xy, r1.z, c9.zwzw, r1
mov o0, r0
mov o5.zw, r0
mad o1.zw, v2.xyxy, c12.xyxy, c12
mad o1.xy, v2, c11, c11.zwzw
mad o2.zw, v2.xyxy, c14.xyxy, c14
mad o2.xy, v2, c13, c13.zwzw
mad o3.xy, v2, c15, c15.zwzw
mad o4.xy, v3, c10, c10.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 13 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 224
Vector 128 [unity_LightmapST]
Vector 144 [_Control_ST]
Vector 160 [_Splat0_ST]
Vector 176 [_Splat1_ST]
Vector 192 [_Splat2_ST]
Vector 208 [_Splat3_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedffleoioiabiclfcfhmeddefjibeepdnaabaaaaaajeaeaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcoaacaaaaeaaaabaaliaaaaaafjaaaaae
egiocaaaaaaaaaaaaoaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadmccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaakaaaaaakgiocaaa
aaaaaaaaakaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadcaaaaalmccabaaaacaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaamaaaaaakgiocaaaaaaaaaaaamaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaanaaaaaa
ogikcaaaaaaaaaaaanaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD4.z / xlv_TEXCOORD4.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  mediump vec3 lm_28;
  lowp vec3 tmpvar_29;
  tmpvar_29 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_28 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = vec3((tmpvar_22 * 2.0));
  mediump vec3 tmpvar_31;
  tmpvar_31 = (col_3 * min (lm_28, tmpvar_30));
  c_1.xyz = tmpvar_31;
  c_1.w = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_6;
  tmpvar_6.x = tmpvar_5.x;
  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
  o_4.xy = (tmpvar_6 + tmpvar_5.w);
  o_4.zw = tmpvar_3.zw;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = o_4;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
  mediump vec3 lm_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = ((8.0 * tmpvar_23.w) * tmpvar_23.xyz);
  lm_24 = tmpvar_25;
  lowp vec3 arg1_26;
  arg1_26 = ((tmpvar_22.x * 2.0) * tmpvar_23.xyz);
  mediump vec3 tmpvar_27;
  tmpvar_27 = (col_3 * max (min (lm_24, arg1_26), (lm_24 * tmpvar_22.x)));
  c_1.xyz = tmpvar_27;
  c_1.w = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec2 xlv_TEXCOORD3;
out highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = textureProj (_ShadowMapTexture, xlv_TEXCOORD4).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD4.z / xlv_TEXCOORD4.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  mediump vec3 lm_28;
  lowp vec3 tmpvar_29;
  tmpvar_29 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_28 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = vec3((tmpvar_22 * 2.0));
  mediump vec3 tmpvar_31;
  tmpvar_31 = (col_3 * min (lm_28, tmpvar_30));
  c_1.xyz = tmpvar_31;
  c_1.w = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 61 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [unity_4LightPosX0]
Vector 10 [unity_4LightPosY0]
Vector 11 [unity_4LightPosZ0]
Vector 12 [unity_4LightAtten0]
Vector 13 [unity_LightColor0]
Vector 14 [unity_LightColor1]
Vector 15 [unity_LightColor2]
Vector 16 [unity_LightColor3]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [unity_Scale]
Vector 25 [_Control_ST]
Vector 26 [_Splat0_ST]
Vector 27 [_Splat1_ST]
Vector 28 [_Splat2_ST]
Vector 29 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[30] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..29] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[24].w;
DP3 R4.x, R3, c[5];
DP3 R3.w, R3, c[6];
DP3 R3.x, R3, c[7];
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[10];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[9];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MOV R4.w, c[0].x;
MAD R2, R4.x, R0, R2;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[11];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[12];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[19];
DP4 R2.y, R4, c[18];
DP4 R2.x, R4, c[17];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[14];
MAD R1.xyz, R0.x, c[13], R1;
MAD R0.xyz, R0.z, c[15], R1;
MAD R1.xyz, R0.w, c[16], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R4.w, R0, c[22];
DP4 R4.z, R0, c[21];
DP4 R4.y, R0, c[20];
MAD R1.w, R4.x, R4.x, -R1;
MUL R0.xyz, R1.w, c[23];
ADD R2.xyz, R2, R4.yzww;
ADD R0.xyz, R2, R0;
ADD result.texcoord[4].xyz, R0, R1;
MOV result.texcoord[3].z, R3.x;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R4;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[26].xyxy, c[26];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[28].xyxy, c[28];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[27], c[27].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[29], c[29].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 61 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 61 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_4LightPosX0]
Vector 9 [unity_4LightPosY0]
Vector 10 [unity_4LightPosZ0]
Vector 11 [unity_4LightAtten0]
Vector 12 [unity_LightColor0]
Vector 13 [unity_LightColor1]
Vector 14 [unity_LightColor2]
Vector 15 [unity_LightColor3]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Vector 24 [_Control_ST]
Vector 25 [_Splat0_ST]
Vector 26 [_Splat1_ST]
Vector 27 [_Splat2_ST]
Vector 28 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c29, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r3.xyz, v1, c23.w
dp3 r4.x, r3, c4
dp3 r3.w, r3, c5
dp3 r3.x, r3, c6
dp4 r0.x, v0, c5
add r1, -r0.x, c9
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c8
mul r1, r1, r1
mov r4.z, r3.x
mov r4.w, c29.x
mad r2, r4.x, r0, r2
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c10
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c11
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c29.x
dp4 r2.z, r4, c18
dp4 r2.y, r4, c17
dp4 r2.x, r4, c16
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c29.y
mul r0, r0, r1
mul r1.xyz, r0.y, c13
mad r1.xyz, r0.x, c12, r1
mad r0.xyz, r0.z, c14, r1
mad r1.xyz, r0.w, c15, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r4.w, r0, c21
dp4 r4.z, r0, c20
dp4 r4.y, r0, c19
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c22
add r2.xyz, r2, r4.yzww
add r0.xyz, r2, r0
add o5.xyz, r0, r1
mov o4.z, r3.x
mov o4.y, r3.w
mov o4.x, r4
mad o1.zw, v2.xyxy, c25.xyxy, c25
mad o1.xy, v2, c24, c24.zwzw
mad o2.zw, v2.xyxy, c27.xyxy, c27
mad o2.xy, v2, c26, c26.zwzw
mad o3.xy, v2, c28, c28.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 48 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 64 [_Control_ST]
Vector 80 [_Splat0_ST]
Vector 96 [_Splat1_ST]
Vector 112 [_Splat2_ST]
Vector 128 [_Splat3_ST]
ConstBuffer "UnityLighting" 720
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedmiemgigdndnbdmfdcmkfmkbmjoedicaiabaaaaaaeiajaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcjeahaaaaeaaaabaaofabaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
agaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaa
aaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaahaaaaaa
kgiocaaaaaaaaaaaahaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaaf
icaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaa
abaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaa
abaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaa
abaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaa
aaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaabaaaaaa
cjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaabaaaaaa
ckaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaabaaaaaa
claaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaa
cmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaafgafbaiaebaaaaaa
acaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaafgafbaaa
aaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaa
egaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaaacaaaaaa
egiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaakgakbaiaebaaaaaa
acaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaa
afaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaaaaaaaa
egaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
adaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaaadaaaaaadcaaaaaj
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
eeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaanpcaabaaaacaaaaaa
egaobaaaacaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
aaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
abaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_24;
  tmpvar_24 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_24.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_24.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_24.z);
  highp vec4 tmpvar_28;
  tmpvar_28 = (((tmpvar_25 * tmpvar_25) + (tmpvar_26 * tmpvar_26)) + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_29;
  tmpvar_29 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_25 * tmpvar_7.x) + (tmpvar_26 * tmpvar_7.y)) + (tmpvar_27 * tmpvar_7.z)) * inversesqrt(tmpvar_28))) * (1.0/((1.0 + (tmpvar_28 * unity_4LightAtten0)))));
  highp vec3 tmpvar_30;
  tmpvar_30 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_29.x) + (unity_LightColor[1].xyz * tmpvar_29.y)) + (unity_LightColor[2].xyz * tmpvar_29.z)) + (unity_LightColor[3].xyz * tmpvar_29.w)));
  tmpvar_5 = tmpvar_30;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD4));
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_24;
  tmpvar_24 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_24.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_24.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_24.z);
  highp vec4 tmpvar_28;
  tmpvar_28 = (((tmpvar_25 * tmpvar_25) + (tmpvar_26 * tmpvar_26)) + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_29;
  tmpvar_29 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_25 * tmpvar_7.x) + (tmpvar_26 * tmpvar_7.y)) + (tmpvar_27 * tmpvar_7.z)) * inversesqrt(tmpvar_28))) * (1.0/((1.0 + (tmpvar_28 * unity_4LightAtten0)))));
  highp vec3 tmpvar_30;
  tmpvar_30 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_29.x) + (unity_LightColor[1].xyz * tmpvar_29.y)) + (unity_LightColor[2].xyz * tmpvar_29.z)) + (unity_LightColor[3].xyz * tmpvar_29.w)));
  tmpvar_5 = tmpvar_30;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD4));
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_24;
  tmpvar_24 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_24.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_24.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_24.z);
  highp vec4 tmpvar_28;
  tmpvar_28 = (((tmpvar_25 * tmpvar_25) + (tmpvar_26 * tmpvar_26)) + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_29;
  tmpvar_29 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_25 * tmpvar_7.x) + (tmpvar_26 * tmpvar_7.y)) + (tmpvar_27 * tmpvar_7.z)) * inversesqrt(tmpvar_28))) * (1.0/((1.0 + (tmpvar_28 * unity_4LightAtten0)))));
  highp vec3 tmpvar_30;
  tmpvar_30 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_29.x) + (unity_LightColor[1].xyz * tmpvar_29.y)) + (unity_LightColor[2].xyz * tmpvar_29.z)) + (unity_LightColor[3].xyz * tmpvar_29.w)));
  tmpvar_5 = tmpvar_30;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD4));
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 67 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [unity_4LightPosX0]
Vector 11 [unity_4LightPosY0]
Vector 12 [unity_4LightPosZ0]
Vector 13 [unity_4LightAtten0]
Vector 14 [unity_LightColor0]
Vector 15 [unity_LightColor1]
Vector 16 [unity_LightColor2]
Vector 17 [unity_LightColor3]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
Vector 26 [_Control_ST]
Vector 27 [_Splat0_ST]
Vector 28 [_Splat1_ST]
Vector 29 [_Splat2_ST]
Vector 30 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[31] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..30] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[25].w;
DP3 R4.x, R3, c[5];
DP3 R3.w, R3, c[6];
DP3 R3.x, R3, c[7];
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[11];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[10];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MOV R4.w, c[0].x;
MAD R2, R4.x, R0, R2;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[12];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[13];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[20];
DP4 R2.y, R4, c[19];
DP4 R2.x, R4, c[18];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[15];
MAD R1.xyz, R0.x, c[14], R1;
MAD R0.xyz, R0.z, c[16], R1;
MAD R1.xyz, R0.w, c[17], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R4.w, R0, c[23];
DP4 R4.z, R0, c[22];
DP4 R4.y, R0, c[21];
MAD R1.w, R4.x, R4.x, -R1;
MUL R0.xyz, R1.w, c[24];
ADD R2.xyz, R2, R4.yzww;
ADD R4.yzw, R2.xxyz, R0.xxyz;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].z;
ADD result.texcoord[4].xyz, R4.yzww, R1;
MOV R1.x, R2;
MUL R1.y, R2, c[9].x;
ADD result.texcoord[5].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[3].z, R3.x;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R4;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[27].xyxy, c[27];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[26], c[26].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[29].xyxy, c[29];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[28], c[28].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[30], c[30].zwzw;
END
# 67 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 67 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_4LightPosX0]
Vector 11 [unity_4LightPosY0]
Vector 12 [unity_4LightPosZ0]
Vector 13 [unity_4LightAtten0]
Vector 14 [unity_LightColor0]
Vector 15 [unity_LightColor1]
Vector 16 [unity_LightColor2]
Vector 17 [unity_LightColor3]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
Vector 26 [_Control_ST]
Vector 27 [_Splat0_ST]
Vector 28 [_Splat1_ST]
Vector 29 [_Splat2_ST]
Vector 30 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c31, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r3.xyz, v1, c25.w
dp3 r4.x, r3, c4
dp3 r3.w, r3, c5
dp3 r3.x, r3, c6
dp4 r0.x, v0, c5
add r1, -r0.x, c11
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c10
mul r1, r1, r1
mov r4.z, r3.x
mov r4.w, c31.x
mad r2, r4.x, r0, r2
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c12
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c13
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c31.x
dp4 r2.z, r4, c20
dp4 r2.y, r4, c19
dp4 r2.x, r4, c18
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c31.y
mul r0, r0, r1
mul r1.xyz, r0.y, c15
mad r1.xyz, r0.x, c14, r1
mad r0.xyz, r0.z, c16, r1
mad r1.xyz, r0.w, c17, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r4.w, r0, c23
dp4 r4.z, r0, c22
dp4 r4.y, r0, c21
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c24
add r2.xyz, r2, r4.yzww
add r4.yzw, r2.xxyz, r0.xxyz
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c31.z
add o5.xyz, r4.yzww, r1
mov r1.x, r2
mul r1.y, r2, c8.x
mad o6.xy, r2.z, c9.zwzw, r1
mov o0, r0
mov o6.zw, r0
mov o4.z, r3.x
mov o4.y, r3.w
mov o4.x, r4
mad o1.zw, v2.xyxy, c27.xyxy, c27
mad o1.xy, v2, c26, c26.zwzw
mad o2.zw, v2.xyxy, c29.xyxy, c29
mad o2.xy, v2, c28, c28.zwzw
mad o3.xy, v2, c30, c30.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 51 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Vector 128 [_Control_ST]
Vector 144 [_Splat0_ST]
Vector 160 [_Splat1_ST]
Vector 176 [_Splat2_ST]
Vector 192 [_Splat3_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedcaclfjbjdjlknolaiibkblmflaiojjbaabaaaaaaaiakaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcdmaiaaaaeaaaabaaapacaaaafjaaaaaeegiocaaaaaaaaaaa
anaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacahaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaal
dccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadcaaaaaldccabaaaadaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaa
abaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
acaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaa
acaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaa
acaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaa
abaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaaabaaaaaaakaabaaaabaaaaaa
akaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaacmaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaadaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaa
fgafbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaa
afaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaa
egaobaaaaeaaaaaaegaobaaaaeaaaaaaaaaaaaajpcaabaaaagaaaaaaagaabaia
ebaaaaaaadaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaa
kgakbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaa
afaaaaaaegaobaaaagaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaaafaaaaaa
dcaaaaajpcaabaaaaeaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaa
egaobaaaaeaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaadaaaaaadcaaaaan
pcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaadaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaa
adaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaabaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaajaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_24;
  tmpvar_24 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_24.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_24.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_24.z);
  highp vec4 tmpvar_28;
  tmpvar_28 = (((tmpvar_25 * tmpvar_25) + (tmpvar_26 * tmpvar_26)) + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_29;
  tmpvar_29 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_25 * tmpvar_7.x) + (tmpvar_26 * tmpvar_7.y)) + (tmpvar_27 * tmpvar_7.z)) * inversesqrt(tmpvar_28))) * (1.0/((1.0 + (tmpvar_28 * unity_4LightAtten0)))));
  highp vec3 tmpvar_30;
  tmpvar_30 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_29.x) + (unity_LightColor[1].xyz * tmpvar_29.y)) + (unity_LightColor[2].xyz * tmpvar_29.z)) + (unity_LightColor[3].xyz * tmpvar_29.w)));
  tmpvar_5 = tmpvar_30;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  lowp vec4 c_28;
  c_28.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * tmpvar_22) * 2.0));
  c_28.w = tmpvar_2;
  c_1.w = c_28.w;
  c_1.xyz = (c_28.xyz + (col_3 * xlv_TEXCOORD4));
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = tmpvar_8;
  mediump vec3 tmpvar_10;
  mediump vec4 normal_11;
  normal_11 = tmpvar_9;
  highp float vC_12;
  mediump vec3 x3_13;
  mediump vec3 x2_14;
  mediump vec3 x1_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAr, normal_11);
  x1_15.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAg, normal_11);
  x1_15.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAb, normal_11);
  x1_15.z = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = (normal_11.xyzz * normal_11.yzzx);
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBr, tmpvar_19);
  x2_14.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBg, tmpvar_19);
  x2_14.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBb, tmpvar_19);
  x2_14.z = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y));
  vC_12 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_SHC.xyz * vC_12);
  x3_13 = tmpvar_24;
  tmpvar_10 = ((x1_15 + x2_14) + x3_13);
  shlight_1 = tmpvar_10;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_25;
  tmpvar_25 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_25.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_25.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_25.z);
  highp vec4 tmpvar_29;
  tmpvar_29 = (((tmpvar_26 * tmpvar_26) + (tmpvar_27 * tmpvar_27)) + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_30;
  tmpvar_30 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_26 * tmpvar_8.x) + (tmpvar_27 * tmpvar_8.y)) + (tmpvar_28 * tmpvar_8.z)) * inversesqrt(tmpvar_29))) * (1.0/((1.0 + (tmpvar_29 * unity_4LightAtten0)))));
  highp vec3 tmpvar_31;
  tmpvar_31 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_30.x) + (unity_LightColor[1].xyz * tmpvar_30.y)) + (unity_LightColor[2].xyz * tmpvar_30.z)) + (unity_LightColor[3].xyz * tmpvar_30.w)));
  tmpvar_5 = tmpvar_31;
  highp vec4 o_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_34;
  tmpvar_34.x = tmpvar_33.x;
  tmpvar_34.y = (tmpvar_33.y * _ProjectionParams.x);
  o_32.xy = (tmpvar_34 + tmpvar_33.w);
  o_32.zw = tmpvar_6.zw;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = o_32;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD4));
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_24;
  tmpvar_24 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_24.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_24.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_24.z);
  highp vec4 tmpvar_28;
  tmpvar_28 = (((tmpvar_25 * tmpvar_25) + (tmpvar_26 * tmpvar_26)) + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_29;
  tmpvar_29 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_25 * tmpvar_7.x) + (tmpvar_26 * tmpvar_7.y)) + (tmpvar_27 * tmpvar_7.z)) * inversesqrt(tmpvar_28))) * (1.0/((1.0 + (tmpvar_28 * unity_4LightAtten0)))));
  highp vec3 tmpvar_30;
  tmpvar_30 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_29.x) + (unity_LightColor[1].xyz * tmpvar_29.y)) + (unity_LightColor[2].xyz * tmpvar_29.z)) + (unity_LightColor[3].xyz * tmpvar_29.w)));
  tmpvar_5 = tmpvar_30;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  lowp vec4 c_28;
  c_28.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * tmpvar_22) * 2.0));
  c_28.w = tmpvar_2;
  c_1.w = c_28.w;
  c_1.xyz = (c_28.xyz + (col_3 * xlv_TEXCOORD4));
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float shadow_22;
  lowp float tmpvar_23;
  tmpvar_23 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (tmpvar_23 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  lowp vec4 c_25;
  c_25.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * shadow_22) * 2.0));
  c_25.w = tmpvar_2;
  c_1.w = c_25.w;
  c_1.xyz = (c_25.xyz + (col_3 * xlv_TEXCOORD4));
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float shadow_22;
  mediump float tmpvar_23;
  tmpvar_23 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_22 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (shadow_22 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  lowp vec4 c_25;
  c_25.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * shadow_22) * 2.0));
  c_25.w = tmpvar_2;
  c_1.w = c_25.w;
  c_1.xyz = (c_25.xyz + (col_3 * xlv_TEXCOORD4));
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float shadow_22;
  lowp float tmpvar_23;
  tmpvar_23 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD4.xyz);
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (tmpvar_23 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  c_1.xyz = (col_3 * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz), vec3((shadow_22 * 2.0))));
  c_1.w = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec2 xlv_TEXCOORD3;
out highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float shadow_22;
  mediump float tmpvar_23;
  tmpvar_23 = texture (_ShadowMapTexture, xlv_TEXCOORD4.xyz);
  shadow_22 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (shadow_22 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  c_1.xyz = (col_3 * min ((2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz), vec3((shadow_22 * 2.0))));
  c_1.w = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float shadow_22;
  lowp float tmpvar_23;
  tmpvar_23 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD4.xyz);
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (tmpvar_23 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  mediump vec3 lm_25;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_25 = tmpvar_26;
  lowp vec3 tmpvar_27;
  tmpvar_27 = vec3((shadow_22 * 2.0));
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_3 * min (lm_25, tmpvar_27));
  c_1.xyz = tmpvar_28;
  c_1.w = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec2 xlv_TEXCOORD3;
out highp vec4 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D unity_Lightmap;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float shadow_22;
  mediump float tmpvar_23;
  tmpvar_23 = texture (_ShadowMapTexture, xlv_TEXCOORD4.xyz);
  shadow_22 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (shadow_22 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  mediump vec3 lm_25;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_25 = tmpvar_26;
  lowp vec3 tmpvar_27;
  tmpvar_27 = vec3((shadow_22 * 2.0));
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_3 * min (lm_25, tmpvar_27));
  c_1.xyz = tmpvar_28;
  c_1.w = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_24;
  tmpvar_24 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_24.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_24.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_24.z);
  highp vec4 tmpvar_28;
  tmpvar_28 = (((tmpvar_25 * tmpvar_25) + (tmpvar_26 * tmpvar_26)) + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_29;
  tmpvar_29 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_25 * tmpvar_7.x) + (tmpvar_26 * tmpvar_7.y)) + (tmpvar_27 * tmpvar_7.z)) * inversesqrt(tmpvar_28))) * (1.0/((1.0 + (tmpvar_28 * unity_4LightAtten0)))));
  highp vec3 tmpvar_30;
  tmpvar_30 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_29.x) + (unity_LightColor[1].xyz * tmpvar_29.y)) + (unity_LightColor[2].xyz * tmpvar_29.z)) + (unity_LightColor[3].xyz * tmpvar_29.w)));
  tmpvar_5 = tmpvar_30;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float shadow_22;
  lowp float tmpvar_23;
  tmpvar_23 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (tmpvar_23 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  lowp vec4 c_25;
  c_25.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * shadow_22) * 2.0));
  c_25.w = tmpvar_2;
  c_1.w = c_25.w;
  c_1.xyz = (c_25.xyz + (col_3 * xlv_TEXCOORD4));
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  mediump vec4 normal_10;
  normal_10 = tmpvar_8;
  highp float vC_11;
  mediump vec3 x3_12;
  mediump vec3 x2_13;
  mediump vec3 x1_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal_10);
  x1_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal_10);
  x1_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal_10);
  x1_14.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal_10.xyzz * normal_10.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2_13.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2_13.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2_13.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal_10.x * normal_10.x) - (normal_10.y * normal_10.y));
  vC_11 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC_11);
  x3_12 = tmpvar_23;
  tmpvar_9 = ((x1_14 + x2_13) + x3_12);
  shlight_1 = tmpvar_9;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_24;
  tmpvar_24 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_24.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_24.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_24.z);
  highp vec4 tmpvar_28;
  tmpvar_28 = (((tmpvar_25 * tmpvar_25) + (tmpvar_26 * tmpvar_26)) + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_29;
  tmpvar_29 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_25 * tmpvar_7.x) + (tmpvar_26 * tmpvar_7.y)) + (tmpvar_27 * tmpvar_7.z)) * inversesqrt(tmpvar_28))) * (1.0/((1.0 + (tmpvar_28 * unity_4LightAtten0)))));
  highp vec3 tmpvar_30;
  tmpvar_30 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_29.x) + (unity_LightColor[1].xyz * tmpvar_29.y)) + (unity_LightColor[2].xyz * tmpvar_29.z)) + (unity_LightColor[3].xyz * tmpvar_29.w)));
  tmpvar_5 = tmpvar_30;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec3 col_3;
  highp vec4 blend_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_10;
  tmpvar_10 = (tmpvar_6.w + tmpvar_5.x);
  blend_4.x = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_5.y);
  blend_4.y = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_5.z);
  blend_4.z = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_5.w);
  blend_4.w = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (blend_4.x, max (blend_4.y, max (blend_4.z, blend_4.w)));
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_4 - tmpvar_14) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_4 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_6).xyz;
  col_3 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_3 + (tmpvar_16.y * tmpvar_7).xyz);
  col_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_3 + (tmpvar_16.z * tmpvar_8).xyz);
  col_3 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_3 + (tmpvar_16.w * tmpvar_9).xyz);
  col_3 = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = (tmpvar_14 * 0.5);
  tmpvar_2 = tmpvar_21;
  lowp float shadow_22;
  mediump float tmpvar_23;
  tmpvar_23 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_22 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (shadow_22 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  lowp vec4 c_25;
  c_25.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, _WorldSpaceLightPos0.xyz)) * shadow_22) * 2.0));
  c_25.w = tmpvar_2;
  c_1.w = c_25.w;
  c_1.xyz = (c_25.xyz + (col_3 * xlv_TEXCOORD4));
  _glesFragData[0] = c_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 36 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
"3.0-!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0.5, 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R1.w, R4.z, R1;
ADD R4.w, R0, R4;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
MAX R0.w, R4, R1;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R4.x, R4, R3.w;
MAX R0.w, R2, R0;
MAX R0.w, R4.x, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R0.w;
ADD R4, R4, c[2].x;
MAX R4, R4, c[3].y;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
DP3 R1.w, fragment.texcoord[3], c[0];
MUL R0.xyz, R4.w, R0;
MUL R2.xyz, R4.y, R2;
MUL R3.xyz, R4.x, R3;
ADD R2.xyz, R3, R2;
MUL R1.xyz, R4.z, R1;
ADD R1.xyz, R2, R1;
ADD R1.xyz, R1, R0;
MUL R0.xyz, R1, fragment.texcoord[4];
MUL R1.xyz, R1, c[1];
MAX R1.w, R1, c[3].y;
MUL R1.xyz, R1.w, R1;
MAD result.color.xyz, R1, c[3].z, R0;
MUL result.color.w, R0, c[3].x;
END
# 36 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 31 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c3, 0.00000000, 0.50000000, 2.00000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
texld r4, v0, s0
texld r0, v1.zwzw, s3
texld r1, v2, s4
add_pp r1.w, r1, r4
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r1, r4.z
texld r2, v0.zwzw, s1
add_pp r4.x, r4, r2.w
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, r4, -r0.w
add r4, r4, c2.x
max r4, r4, c3.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r3.xyz, r4.y, r3
mul r2.xyz, r4.x, r2
add_pp r2.xyz, r2, r3
mul r0.xyz, r4.z, r0
add_pp r0.xyz, r2, r0
mul r1.xyz, r4.w, r1
add_pp r1.xyz, r0, r1
mul_pp r0.xyz, r1, v4
mul_pp r2.xyz, r1, c1
dp3_pp r1.w, v3, c0
max_pp r1.x, r1.w, c3
mul_pp r1.xyz, r1.x, r2
mad_pp oC0.xyz, r1, c3.z, r0
mul oC0.w, r0, c3.y
"
}
SubProgram "d3d11 " {
// Stats: 25 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 48 [_Depth]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedbpdjdlednmgmickbdjaaeeimiclgchapabaaaaaaneafaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcleaeaaaa
eaaaaaaacnabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
agaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaa
aagabaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahecaabaaaacaaaaaadkaabaaaaaaaaaaa
ckaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaaeaaaaaaaaaaaaahicaabaaaacaaaaaadkaabaaaabaaaaaa
dkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaacaaaaaackaabaaa
acaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaaaaaaaaahccaabaaaacaaaaaabkaabaaaabaaaaaadkaabaaa
aeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaacaaaaaa
efaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaaabaaaaaadkaabaaaafaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaacaaaaaaaaaaaaai
pcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaaacaaaaaadiaaaaah
iccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaaipcaabaaa
abaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaadaaaaaadeaaaaakpcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaaaaaaaaah
icaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaaaaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaa
aeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaaacaaaaaaagaabaaaabaaaaaa
egacbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaakgakbaaa
abaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaa
pgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaabaaaaaaiicaabaaaaaaaaaaa
egbcbaaaaeaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 35 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [unity_Lightmap] 2D 5
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5, 0, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R1.w, R4.z, R1;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R4.z, R4.w, R0.w;
MAX R0.w, R1, R4.z;
MOV R4.w, R4.z;
MAX R0.w, R2, R0;
ADD R4.x, R3.w, R4;
MAX R0.w, R4.x, R0;
MOV R4.y, R2.w;
MOV R4.z, R1.w;
ADD R4, -R0.w, R4;
ADD R4, R4, c[0].x;
MAX R4, R4, c[1].y;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R1.xyz, R1, R4.z;
MUL R2.xyz, R2, R4.y;
MUL R3.xyz, R3, R4.x;
ADD R2.xyz, R3, R2;
ADD R1.xyz, R2, R1;
MUL R0.xyz, R0, R4.w;
ADD R0.xyz, R1, R0;
TEX R2, fragment.texcoord[3], texture[5], 2D;
MUL R1.xyz, R2.w, R2;
MUL R0.xyz, R1, R0;
MUL result.color.xyz, R0, c[1].z;
MUL result.color.w, R0, c[1].x;
END
# 35 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 28 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [unity_Lightmap] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c1, 0.00000000, 0.50000000, 8.00000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xy
texld r4, v0, s0
texld r1, v2, s4
add_pp r1.w, r4, r1
texld r0, v1.zwzw, s3
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r4.z, r1
texld r2, v0.zwzw, s1
add_pp r4.x, r2.w, r4
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, -r0.w, r4
add r4, r4, c0.x
max r4, r4, c1.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r0.xyz, r0, r4.z
mul r3.xyz, r3, r4.y
mul r2.xyz, r2, r4.x
add_pp r2.xyz, r2, r3
add_pp r0.xyz, r2, r0
mul r2.xyz, r1, r4.w
texld r1, v3, s5
add_pp r0.xyz, r0, r2
mul_pp r1.xyz, r1.w, r1
mul_pp r0.xyz, r1, r0
mul_pp oC0.xyz, r0, c1.z
mul oC0.w, r0, c1.y
"
}
SubProgram "d3d11 " {
// Stats: 22 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [unity_Lightmap] 2D 5
ConstBuffer "$Globals" 160
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmoddehikchimhikddfpfpeapcpbepgbfabaaaaaahmafaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcheaeaaaaeaaaaaaabnabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahecaabaaaacaaaaaa
dkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaaaaaaaahicaabaaaacaaaaaa
dkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
acaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaaacaaaaaabkaabaaa
abaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaaabaaaaaa
dkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
acaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaa
acaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaadaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaaaoaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaaacaaaaaa
agaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaa
aaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaaj
hcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaaafaaaaaaaagabaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaeb
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 35 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [unity_Lightmap] 2D 5
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5, 0, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R1.w, R4.z, R1;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R4.z, R4.w, R0.w;
MAX R0.w, R1, R4.z;
MOV R4.w, R4.z;
MAX R0.w, R2, R0;
ADD R4.x, R3.w, R4;
MAX R0.w, R4.x, R0;
MOV R4.y, R2.w;
MOV R4.z, R1.w;
ADD R4, -R0.w, R4;
ADD R4, R4, c[0].x;
MAX R4, R4, c[1].y;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R1.xyz, R1, R4.z;
MUL R2.xyz, R2, R4.y;
MUL R3.xyz, R3, R4.x;
ADD R2.xyz, R3, R2;
ADD R1.xyz, R2, R1;
MUL R0.xyz, R0, R4.w;
ADD R0.xyz, R1, R0;
TEX R2, fragment.texcoord[3], texture[5], 2D;
MUL R1.xyz, R2.w, R2;
MUL R0.xyz, R1, R0;
MUL result.color.xyz, R0, c[1].z;
MUL result.color.w, R0, c[1].x;
END
# 35 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 28 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [unity_Lightmap] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c1, 0.00000000, 0.50000000, 8.00000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xy
texld r4, v0, s0
texld r1, v2, s4
add_pp r1.w, r4, r1
texld r0, v1.zwzw, s3
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r4.z, r1
texld r2, v0.zwzw, s1
add_pp r4.x, r2.w, r4
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, -r0.w, r4
add r4, r4, c0.x
max r4, r4, c1.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r0.xyz, r0, r4.z
mul r3.xyz, r3, r4.y
mul r2.xyz, r2, r4.x
add_pp r2.xyz, r2, r3
add_pp r0.xyz, r2, r0
mul r2.xyz, r1, r4.w
texld r1, v3, s5
add_pp r0.xyz, r0, r2
mul_pp r1.xyz, r1.w, r1
mul_pp r0.xyz, r1, r0
mul_pp oC0.xyz, r0, c1.z
mul oC0.w, r0, c1.y
"
}
SubProgram "d3d11 " {
// Stats: 22 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [unity_Lightmap] 2D 5
ConstBuffer "$Globals" 160
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmoddehikchimhikddfpfpeapcpbepgbfabaaaaaahmafaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcheaeaaaaeaaaaaaabnabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahecaabaaaacaaaaaa
dkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaaaaaaaahicaabaaaacaaaaaa
dkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
acaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaaacaaaaaabkaabaaa
abaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaaabaaaaaa
dkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
acaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaa
acaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaadaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaaaoaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaaacaaaaaa
agaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaa
aaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaaj
hcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaaafaaaaaaaagabaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaeb
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 38 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_ShadowMapTexture] 2D 5
"3.0-!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0.5, 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R1.w, R4.z, R1;
ADD R4.w, R0, R4;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
MAX R0.w, R4, R1;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R4.x, R4, R3.w;
MAX R0.w, R2, R0;
MAX R0.w, R4.x, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R0.w;
ADD R4, R4, c[2].x;
MAX R4, R4, c[3].y;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R2.xyz, R4.y, R2;
MUL R3.xyz, R4.x, R3;
ADD R2.xyz, R3, R2;
MUL R1.xyz, R4.z, R1;
ADD R1.xyz, R2, R1;
MUL R0.xyz, R4.w, R0;
ADD R0.xyz, R1, R0;
MUL R1.xyz, R0, fragment.texcoord[4];
MUL R2.xyz, R0, c[1];
DP3 R0.y, fragment.texcoord[3], c[0];
MAX R0.y, R0, c[3];
TXP R0.x, fragment.texcoord[5], texture[5], 2D;
MUL R0.x, R0.y, R0;
MUL R0.xyz, R0.x, R2;
MAD result.color.xyz, R0, c[3].z, R1;
MUL result.color.w, R0, c[3].x;
END
# 38 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 32 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_ShadowMapTexture] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c3, 0.00000000, 0.50000000, 2.00000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
texld r4, v0, s0
texld r0, v1.zwzw, s3
texld r1, v2, s4
add_pp r1.w, r1, r4
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r1, r4.z
texld r2, v0.zwzw, s1
add_pp r4.x, r4, r2.w
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, r4, -r0.w
add r4, r4, c2.x
max r4, r4, c3.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r1.xyz, r4.w, r1
mul r3.xyz, r4.y, r3
mul r2.xyz, r4.x, r2
add_pp r2.xyz, r2, r3
mul r0.xyz, r4.z, r0
add_pp r0.xyz, r2, r0
add_pp r0.xyz, r0, r1
mul_pp r1.xyz, r0, v4
mul_pp r2.xyz, r0, c1
dp3_pp r0.y, v3, c0
max_pp r0.y, r0, c3.x
texldp r0.x, v5, s5
mul_pp r0.x, r0.y, r0
mul_pp r0.xyz, r0.x, r2
mad_pp oC0.xyz, r0, c3.z, r1
mul oC0.w, r0, c3.y
"
}
SubProgram "d3d11 " {
// Stats: 26 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedhgdpocnpgnippajkmnpjcofmleciabfcabaaaaaafeagaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbmafaaaaeaaaaaaaehabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
agaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaa
aagabaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaaaaaaaaahecaabaaaacaaaaaadkaabaaaaaaaaaaa
ckaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaafaaaaaaaaaaaaahicaabaaaacaaaaaadkaabaaaabaaaaaa
dkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaacaaaaaackaabaaa
acaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaa
aagabaaaadaaaaaaaaaaaaahccaabaaaacaaaaaabkaabaaaabaaaaaadkaabaaa
aeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaacaaaaaa
efaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
acaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaaabaaaaaadkaabaaaafaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaacaaaaaaaaaaaaai
pcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaaacaaaaaadiaaaaah
iccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaaipcaabaaa
abaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaahaaaaaadeaaaaakpcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaaaaaaaaah
icaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaaaaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaa
aeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaaacaaaaaaagaabaaaabaaaaaa
egacbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaakgakbaaa
abaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaa
pgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaoaaaaahdcaabaaaacaaaaaa
egbabaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
acaaaaaaeghobaaaafaaaaaaaagabaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaa
egbcbaaaaeaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaa
aaaaaaaaagaabaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 41 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_ShadowMapTexture] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5, 0, 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R1.w, R4.z, R1;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R4.z, R4.w, R0.w;
MAX R0.w, R1, R4.z;
MOV R4.w, R4.z;
MAX R0.w, R2, R0;
ADD R4.x, R3.w, R4;
MAX R0.w, R4.x, R0;
MOV R4.y, R2.w;
MOV R4.z, R1.w;
ADD R4, -R0.w, R4;
ADD R4, R4, c[0].x;
MAX R4, R4, c[1].y;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R3.xyz, R3, R4.x;
MUL R2.xyz, R2, R4.y;
MUL R1.xyz, R1, R4.z;
ADD R2.xyz, R3, R2;
ADD R1.xyz, R2, R1;
TEX R2, fragment.texcoord[3], texture[6], 2D;
MUL R3.xyz, R2.w, R2;
TXP R4.x, fragment.texcoord[4], texture[5], 2D;
MUL R2.xyz, R2, R4.x;
MUL R3.xyz, R3, c[1].z;
MUL R0.xyz, R0, R4.w;
MUL R2.xyz, R2, c[1].w;
MUL R4.xyz, R3, R4.x;
MIN R2.xyz, R3, R2;
MAX R2.xyz, R2, R4;
ADD R0.xyz, R1, R0;
MUL result.color.xyz, R0, R2;
MUL result.color.w, R0, c[1].x;
END
# 41 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 33 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_ShadowMapTexture] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c1, 0.00000000, 0.50000000, 8.00000000, 2.00000000
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xy
dcl_texcoord4 v4
texld r4, v0, s0
texld r1, v2, s4
add_pp r1.w, r4, r1
texld r0, v1.zwzw, s3
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r4.z, r1
texld r2, v0.zwzw, s1
add_pp r4.x, r2.w, r4
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, -r0.w, r4
add r4, r4, c0.x
max r4, r4, c1.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r2.xyz, r2, r4.x
mul r3.xyz, r3, r4.y
add_pp r2.xyz, r2, r3
mul r0.xyz, r0, r4.z
add_pp r0.xyz, r2, r0
mul r2.xyz, r1, r4.w
texld r1, v3, s6
mul_pp r3.xyz, r1.w, r1
texldp r4.x, v4, s5
mul_pp r1.xyz, r1, r4.x
mul_pp r3.xyz, r3, c1.z
mul_pp r1.xyz, r1, c1.w
mul_pp r4.xyz, r3, r4.x
min_pp r1.xyz, r3, r1
max_pp r1.xyz, r1, r4
add_pp r0.xyz, r0, r2
mul_pp oC0.xyz, r0, r1
mul oC0.w, r0, c1.y
"
}
SubProgram "d3d11 " {
// Stats: 28 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_ShadowMapTexture] 2D 0
SetTexture 6 [unity_Lightmap] 2D 6
ConstBuffer "$Globals" 224
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedgldgknikhmgiokmagmodngppecgnkacdabaaaaaaiiagaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgiafaaaa
eaaaaaaafkabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaahecaabaaaacaaaaaa
dkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaahicaabaaaacaaaaaa
dkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
acaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaahccaabaaaacaaaaaabkaabaaa
abaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaacaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaaabaaaaaa
dkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
acaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaa
acaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaahaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaaaoaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaaacaaaaaa
agaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaa
aaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaaj
hcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaogbkbaaaadaaaaaaeghobaaaagaaaaaaaagabaaaagaaaaaa
diaaaaahocaabaaaabaaaaaapgapbaaaaaaaaaaaagajbaaaacaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaaddaaaaahocaabaaaabaaaaaa
fgaobaaaabaaaaaaagajbaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaadeaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 41 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_ShadowMapTexture] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5, 0, 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R1.w, R4.z, R1;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R4.z, R4.w, R0.w;
MAX R0.w, R1, R4.z;
MOV R4.w, R4.z;
MAX R0.w, R2, R0;
ADD R4.x, R3.w, R4;
MAX R0.w, R4.x, R0;
MOV R4.y, R2.w;
MOV R4.z, R1.w;
ADD R4, -R0.w, R4;
ADD R4, R4, c[0].x;
MAX R4, R4, c[1].y;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R3.xyz, R3, R4.x;
MUL R2.xyz, R2, R4.y;
MUL R1.xyz, R1, R4.z;
ADD R2.xyz, R3, R2;
ADD R1.xyz, R2, R1;
TEX R2, fragment.texcoord[3], texture[6], 2D;
MUL R3.xyz, R2.w, R2;
TXP R4.x, fragment.texcoord[4], texture[5], 2D;
MUL R2.xyz, R2, R4.x;
MUL R3.xyz, R3, c[1].z;
MUL R0.xyz, R0, R4.w;
MUL R2.xyz, R2, c[1].w;
MUL R4.xyz, R3, R4.x;
MIN R2.xyz, R3, R2;
MAX R2.xyz, R2, R4;
ADD R0.xyz, R1, R0;
MUL result.color.xyz, R0, R2;
MUL result.color.w, R0, c[1].x;
END
# 41 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 33 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_ShadowMapTexture] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c1, 0.00000000, 0.50000000, 8.00000000, 2.00000000
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xy
dcl_texcoord4 v4
texld r4, v0, s0
texld r1, v2, s4
add_pp r1.w, r4, r1
texld r0, v1.zwzw, s3
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r4.z, r1
texld r2, v0.zwzw, s1
add_pp r4.x, r2.w, r4
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, -r0.w, r4
add r4, r4, c0.x
max r4, r4, c1.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r2.xyz, r2, r4.x
mul r3.xyz, r3, r4.y
add_pp r2.xyz, r2, r3
mul r0.xyz, r0, r4.z
add_pp r0.xyz, r2, r0
mul r2.xyz, r1, r4.w
texld r1, v3, s6
mul_pp r3.xyz, r1.w, r1
texldp r4.x, v4, s5
mul_pp r1.xyz, r1, r4.x
mul_pp r3.xyz, r3, c1.z
mul_pp r1.xyz, r1, c1.w
mul_pp r4.xyz, r3, r4.x
min_pp r1.xyz, r3, r1
max_pp r1.xyz, r1, r4
add_pp r0.xyz, r0, r2
mul_pp oC0.xyz, r0, r1
mul oC0.w, r0, c1.y
"
}
SubProgram "d3d11 " {
// Stats: 28 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_ShadowMapTexture] 2D 0
SetTexture 6 [unity_Lightmap] 2D 6
ConstBuffer "$Globals" 224
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedgldgknikhmgiokmagmodngppecgnkacdabaaaaaaiiagaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgiafaaaa
eaaaaaaafkabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaahecaabaaaacaaaaaa
dkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaahicaabaaaacaaaaaa
dkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
acaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaahccaabaaaacaaaaaabkaabaaa
abaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaacaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaaabaaaaaa
dkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
acaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaa
acaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaahaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaaaoaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaaacaaaaaa
agaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaa
aaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaaj
hcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaogbkbaaaadaaaaaaeghobaaaagaaaaaaaagabaaaagaaaaaa
diaaaaahocaabaaaabaaaaaapgapbaaaaaaaaaaaagajbaaaacaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaaddaaaaahocaabaaaabaaaaaa
fgaobaaaabaaaaaaagajbaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaadeaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 22 avg math (13..26)
 //        d3d9 : 19 avg math (14..22)
 //      opengl : 19 avg math (14..22)
 // Stats for Fragment shader:
 //       d3d11 : 26 avg math (23..33), 6 avg texture (5..7)
 //        d3d9 : 35 avg math (32..41), 6 avg texture (5..7)
 //      opengl : 42 avg math (37..48), 6 avg texture (5..7)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Geometry-100" "RenderType"="Opaque" "SplatCount"="4" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
// Stats: 21 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_Control_ST]
Vector 16 [_Splat0_ST]
Vector 17 [_Splat1_ST]
Vector 18 [_Splat2_ST]
Vector 19 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[5].z, R0, c[11];
DP4 result.texcoord[5].y, R0, c[10];
DP4 result.texcoord[5].x, R0, c[9];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
ADD result.texcoord[4].xyz, -R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 21 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_Control_ST]
Vector 15 [_Splat0_ST]
Vector 16 [_Splat1_ST]
Vector 17 [_Splat2_ST]
Vector 18 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 o6.z, r0, c10
dp4 o6.y, r0, c9
dp4 o6.x, r0, c8
dp3 o4.z, r1, c6
dp3 o4.y, r1, c5
dp3 o4.x, r1, c4
add o5.xyz, -r0, c12
mad o1.zw, v2.xyxy, c15.xyxy, c15
mad o1.xy, v2, c14, c14.zwzw
mad o2.zw, v2.xyxy, c17.xyxy, c17
mad o2.xy, v2, c16, c16.zwzw
mad o3.xy, v2, c18, c18.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 26 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 128 [_Control_ST]
Vector 144 [_Splat0_ST]
Vector 160 [_Splat1_ST]
Vector 176 [_Splat2_ST]
Vector 192 [_Splat3_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedbldodjlgdnigeffacmhmlkflamgbilooabaaaaaahmagaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefclaaeaaaaeaaaabaacmabaaaafjaaaaaeegiocaaaaaaaaaaa
anaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
alaaaaaakgiocaaaaaaaaaaaalaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhccabaaaafaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaa
abaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaagaaaaaaegiccaaa
aaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23 = normalize(xlv_TEXCOORD4);
  lightDir_2 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 c_25;
  c_25.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * texture2D (_LightTexture0, vec2(tmpvar_24)).w) * 2.0));
  c_25.w = tmpvar_3;
  c_1.xyz = c_25.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "POINT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23 = normalize(xlv_TEXCOORD4);
  lightDir_2 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 c_25;
  c_25.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * texture2D (_LightTexture0, vec2(tmpvar_24)).w) * 2.0));
  c_25.w = tmpvar_3;
  c_1.xyz = c_25.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "POINT" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out mediump vec3 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in mediump vec3 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23 = normalize(xlv_TEXCOORD4);
  lightDir_2 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 c_25;
  c_25.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * texture (_LightTexture0, vec2(tmpvar_24)).w) * 2.0));
  c_25.w = tmpvar_3;
  c_1.xyz = c_25.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 14 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [unity_Scale]
Vector 11 [_Control_ST]
Vector 12 [_Splat0_ST]
Vector 13 [_Splat1_ST]
Vector 14 [_Splat2_ST]
Vector 15 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[16] = { program.local[0],
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
MUL R0.xyz, vertex.normal, c[10].w;
DP3 result.texcoord[3].z, R0, c[7];
DP3 result.texcoord[3].y, R0, c[6];
DP3 result.texcoord[3].x, R0, c[5];
MOV result.texcoord[4].xyz, c[9];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[12].xyxy, c[12];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[14].xyxy, c[14];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 14 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 14 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceLightPos0]
Vector 9 [unity_Scale]
Vector 10 [_Control_ST]
Vector 11 [_Splat0_ST]
Vector 12 [_Splat1_ST]
Vector 13 [_Splat2_ST]
Vector 14 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1, c9.w
dp3 o4.z, r0, c6
dp3 o4.y, r0, c5
dp3 o4.x, r0, c4
mov o5.xyz, c8
mad o1.zw, v2.xyxy, c11.xyxy, c11
mad o1.xy, v2, c10, c10.zwzw
mad o2.zw, v2.xyxy, c13.xyxy, c13
mad o2.xy, v2, c12, c12.zwzw
mad o3.xy, v2, c14, c14.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 13 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 64 [_Control_ST]
Vector 80 [_Splat0_ST]
Vector 96 [_Splat1_ST]
Vector 112 [_Splat2_ST]
Vector 128 [_Splat3_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedhidobhmgcjhioogooeccegigajempfmkabaaaaaaieaeaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcnaacaaaaeaaaabaaleaaaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaa
aaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaahaaaaaa
kgiocaaaaaaaaaaaahaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaghccabaaaafaaaaaaegiccaaaabaaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  lightDir_2 = xlv_TEXCOORD4;
  lowp vec4 c_23;
  c_23.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * 2.0));
  c_23.w = tmpvar_3;
  c_1.xyz = c_23.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  lightDir_2 = xlv_TEXCOORD4;
  lowp vec4 c_23;
  c_23.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * 2.0));
  c_23.w = tmpvar_3;
  c_1.xyz = c_23.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out mediump vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  lightDir_2 = xlv_TEXCOORD4;
  lowp vec4 c_23;
  c_23.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * 2.0));
  c_23.w = tmpvar_3;
  c_1.xyz = c_23.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 22 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_Control_ST]
Vector 16 [_Splat0_ST]
Vector 17 [_Splat1_ST]
Vector 18 [_Splat2_ST]
Vector 19 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[5].w, R0, c[12];
DP4 result.texcoord[5].z, R0, c[11];
DP4 result.texcoord[5].y, R0, c[10];
DP4 result.texcoord[5].x, R0, c[9];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
ADD result.texcoord[4].xyz, -R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 22 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_Control_ST]
Vector 15 [_Splat0_ST]
Vector 16 [_Splat1_ST]
Vector 17 [_Splat2_ST]
Vector 18 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 o6.w, r0, c11
dp4 o6.z, r0, c10
dp4 o6.y, r0, c9
dp4 o6.x, r0, c8
dp3 o4.z, r1, c6
dp3 o4.y, r1, c5
dp3 o4.x, r1, c4
add o5.xyz, -r0, c12
mad o1.zw, v2.xyxy, c15.xyxy, c15
mad o1.xy, v2, c14, c14.zwzw
mad o2.zw, v2.xyxy, c17.xyxy, c17
mad o2.xy, v2, c16, c16.zwzw
mad o3.xy, v2, c18, c18.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 26 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 128 [_Control_ST]
Vector 144 [_Splat0_ST]
Vector 160 [_Splat1_ST]
Vector 176 [_Splat2_ST]
Vector 192 [_Splat3_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedjbpodjmbjleingfigdigfnlkfmbfibdfabaaaaaahmagaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefclaaeaaaaeaaaabaacmabaaaafjaaaaaeegiocaaaaaaaaaaa
anaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
alaaaaaakgiocaaaaaaaaaaaalaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhccabaaaafaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaa
abaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaagaaaaaaegiocaaa
aaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23 = normalize(xlv_TEXCOORD4);
  lightDir_2 = tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  highp float tmpvar_25;
  tmpvar_25 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp float atten_26;
  atten_26 = ((float((xlv_TEXCOORD5.z > 0.0)) * texture2D (_LightTexture0, P_24).w) * texture2D (_LightTextureB0, vec2(tmpvar_25)).w);
  lowp vec4 c_27;
  c_27.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * atten_26) * 2.0));
  c_27.w = tmpvar_3;
  c_1.xyz = c_27.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "SPOT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23 = normalize(xlv_TEXCOORD4);
  lightDir_2 = tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  highp float tmpvar_25;
  tmpvar_25 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp float atten_26;
  atten_26 = ((float((xlv_TEXCOORD5.z > 0.0)) * texture2D (_LightTexture0, P_24).w) * texture2D (_LightTextureB0, vec2(tmpvar_25)).w);
  lowp vec4 c_27;
  c_27.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * atten_26) * 2.0));
  c_27.w = tmpvar_3;
  c_1.xyz = c_27.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "SPOT" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out mediump vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in mediump vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23 = normalize(xlv_TEXCOORD4);
  lightDir_2 = tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  highp float tmpvar_25;
  tmpvar_25 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp float atten_26;
  atten_26 = ((float((xlv_TEXCOORD5.z > 0.0)) * texture (_LightTexture0, P_24).w) * texture (_LightTextureB0, vec2(tmpvar_25)).w);
  lowp vec4 c_27;
  c_27.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * atten_26) * 2.0));
  c_27.w = tmpvar_3;
  c_1.xyz = c_27.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 21 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_Control_ST]
Vector 16 [_Splat0_ST]
Vector 17 [_Splat1_ST]
Vector 18 [_Splat2_ST]
Vector 19 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[5].z, R0, c[11];
DP4 result.texcoord[5].y, R0, c[10];
DP4 result.texcoord[5].x, R0, c[9];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
ADD result.texcoord[4].xyz, -R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 21 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_Control_ST]
Vector 15 [_Splat0_ST]
Vector 16 [_Splat1_ST]
Vector 17 [_Splat2_ST]
Vector 18 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 o6.z, r0, c10
dp4 o6.y, r0, c9
dp4 o6.x, r0, c8
dp3 o4.z, r1, c6
dp3 o4.y, r1, c5
dp3 o4.x, r1, c4
add o5.xyz, -r0, c12
mad o1.zw, v2.xyxy, c15.xyxy, c15
mad o1.xy, v2, c14, c14.zwzw
mad o2.zw, v2.xyxy, c17.xyxy, c17
mad o2.xy, v2, c16, c16.zwzw
mad o3.xy, v2, c18, c18.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 26 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 128 [_Control_ST]
Vector 144 [_Splat0_ST]
Vector 160 [_Splat1_ST]
Vector 176 [_Splat2_ST]
Vector 192 [_Splat3_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedbldodjlgdnigeffacmhmlkflamgbilooabaaaaaahmagaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefclaaeaaaaeaaaabaacmabaaaafjaaaaaeegiocaaaaaaaaaaa
anaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
alaaaaaakgiocaaaaaaaaaaaalaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhccabaaaafaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaa
abaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaagaaaaaaegiccaaa
aaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23 = normalize(xlv_TEXCOORD4);
  lightDir_2 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 c_25;
  c_25.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * (texture2D (_LightTextureB0, vec2(tmpvar_24)).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w)) * 2.0));
  c_25.w = tmpvar_3;
  c_1.xyz = c_25.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23 = normalize(xlv_TEXCOORD4);
  lightDir_2 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 c_25;
  c_25.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * (texture2D (_LightTextureB0, vec2(tmpvar_24)).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w)) * 2.0));
  c_25.w = tmpvar_3;
  c_1.xyz = c_25.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out mediump vec3 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in mediump vec3 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23 = normalize(xlv_TEXCOORD4);
  lightDir_2 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 c_25;
  c_25.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * (texture (_LightTextureB0, vec2(tmpvar_24)).w * texture (_LightTexture0, xlv_TEXCOORD5).w)) * 2.0));
  c_25.w = tmpvar_3;
  c_1.xyz = c_25.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 20 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_Control_ST]
Vector 16 [_Splat0_ST]
Vector 17 [_Splat1_ST]
Vector 18 [_Splat2_ST]
Vector 19 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[5].y, R0, c[10];
DP4 result.texcoord[5].x, R0, c[9];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
MOV result.texcoord[4].xyz, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 20 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_Control_ST]
Vector 15 [_Splat0_ST]
Vector 16 [_Splat1_ST]
Vector 17 [_Splat2_ST]
Vector 18 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c13.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 o6.y, r0, c9
dp4 o6.x, r0, c8
dp3 o4.z, r1, c6
dp3 o4.y, r1, c5
dp3 o4.x, r1, c4
mov o5.xyz, c12
mad o1.zw, v2.xyxy, c15.xyxy, c15
mad o1.xy, v2, c14, c14.zwzw
mad o2.zw, v2.xyxy, c17.xyxy, c17
mad o2.xy, v2, c16, c16.zwzw
mad o3.xy, v2, c18, c18.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 21 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 128 [_Control_ST]
Vector 144 [_Splat0_ST]
Vector 160 [_Splat1_ST]
Vector 176 [_Splat2_ST]
Vector 192 [_Splat3_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedjbdpbhfflcalfogpncbdhmeefkmijninabaaaaaaniafaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcamaeaaaaeaaaabaaadabaaaafjaaaaaeegiocaaaaaaaaaaa
anaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
mccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
alaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaa
aaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakmccabaaa
adaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaaaaaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaag
hccabaaaafaaaaaaegiccaaaabaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  lightDir_2 = xlv_TEXCOORD4;
  lowp vec4 c_23;
  c_23.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * texture2D (_LightTexture0, xlv_TEXCOORD5).w) * 2.0));
  c_23.w = tmpvar_3;
  c_1.xyz = c_23.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  lightDir_2 = xlv_TEXCOORD4;
  lowp vec4 c_23;
  c_23.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * texture2D (_LightTexture0, xlv_TEXCOORD5).w) * 2.0));
  c_23.w = tmpvar_3;
  c_1.xyz = c_23.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out mediump vec3 xlv_TEXCOORD4;
out highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_5;
  tmpvar_5[0] = _Object2World[0].xyz;
  tmpvar_5[1] = _Object2World[1].xyz;
  tmpvar_5[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = _WorldSpaceLightPos0.xyz;
  tmpvar_4 = tmpvar_7;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in mediump vec3 xlv_TEXCOORD4;
in highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec3 col_4;
  highp vec4 blend_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_11;
  tmpvar_11 = (tmpvar_7.w + tmpvar_6.x);
  blend_5.x = tmpvar_11;
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_6.y);
  blend_5.y = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_6.z);
  blend_5.z = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_6.w);
  blend_5.w = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)));
  highp vec4 tmpvar_16;
  tmpvar_16 = max (((blend_5 - tmpvar_15) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 / (((tmpvar_16.x + tmpvar_16.y) + tmpvar_16.z) + tmpvar_16.w));
  blend_5 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17.x * tmpvar_7).xyz;
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_17.y * tmpvar_8).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_17.z * tmpvar_9).xyz);
  col_4 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_4 + (tmpvar_17.w * tmpvar_10).xyz);
  col_4 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (tmpvar_15 * 0.5);
  tmpvar_3 = tmpvar_22;
  lightDir_2 = xlv_TEXCOORD4;
  lowp vec4 c_23;
  c_23.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD3, lightDir_2)) * texture (_LightTexture0, xlv_TEXCOORD5).w) * 2.0));
  c_23.w = tmpvar_3;
  c_1.xyz = c_23.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 42 math, 6 textures
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightTexture0] 2D 5
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R0.w, R0, R4;
ADD R1.w, R4.z, R1;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R4.x, R4, R3.w;
MAX R4.z, R0.w, R1.w;
ADD R2.w, R4.y, R2;
MAX R4.y, R2.w, R4.z;
MAX R3.w, R4.x, R4.y;
MOV R4.w, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R3.w;
ADD R4, R4, c[1].x;
MAX R4, R4, c[2].x;
ADD R0.w, R4.x, R4.y;
ADD R0.w, R4.z, R0;
ADD R0.w, R4, R0;
RCP R0.w, R0.w;
MUL R4, R4, R0.w;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.w, R0.w;
MUL R1.xyz, R4.z, R1;
MUL R2.xyz, R4.y, R2;
MUL R3.xyz, R4.x, R3;
ADD R2.xyz, R3, R2;
ADD R1.xyz, R2, R1;
MUL R0.xyz, R4.w, R0;
ADD R0.xyz, R1, R0;
MUL R1.xyz, R0.w, fragment.texcoord[4];
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
DP3 R1.x, fragment.texcoord[3], R1;
MUL R0.xyz, R0, c[0];
TEX R0.w, R0.w, texture[5], 2D;
MAX R1.x, R1, c[2];
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
MOV result.color.w, c[2].x;
END
# 42 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 36 math, 6 textures
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightTexture0] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c2, 0.00000000, 2.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
texld r4, v0, s0
texld r2, v0.zwzw, s1
texld r0, v1.zwzw, s3
texld r1, v2, s4
add_pp r1.w, r1, r4
add_pp r0.w, r4.z, r0
texld r3, v1, s2
add_pp r4.x, r4, r2.w
max r4.z, r1.w, r0.w
add_pp r3.w, r4.y, r3
max r4.y, r3.w, r4.z
max r2.w, r4.x, r4.y
mov r4.z, r0.w
mov r4.w, r1
mov r4.y, r3.w
add r4, r4, -r2.w
add r4, r4, c1.x
max r4, r4, c2.x
add r0.w, r4.x, r4.y
add r0.w, r4.z, r0
add r0.w, r4, r0
rcp r0.w, r0.w
mul r4, r4, r0.w
dp3_pp r0.w, v4, v4
mul r1.xyz, r4.w, r1
mul r0.xyz, r4.z, r0
mul r3.xyz, r4.y, r3
mul r2.xyz, r4.x, r2
add_pp r2.xyz, r2, r3
add_pp r0.xyz, r2, r0
add_pp r0.xyz, r0, r1
mul_pp r1.xyz, r0, c0
rsq_pp r0.w, r0.w
mul_pp r2.xyz, r0.w, v4
dp3 r0.x, v5, v5
dp3_pp r0.y, v3, r2
max_pp r0.y, r0, c2.x
texld r0.x, r0.x, s5
mul_pp r0.x, r0.y, r0
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c2.y
mov_pp oC0.w, c2.x
"
}
SubProgram "d3d11 " {
// Stats: 27 math, 6 textures
Keywords { "POINT" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedehgbhloaaodnhmfbobimgpgefjjmbkffabaaaaaagaagaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcciafaaaaeaaaaaaaekabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaa
ogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaah
ecaabaaaacaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaa
adaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaah
icaabaaaacaaaaaadkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaacaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaahccaabaaa
acaaaaaabkaabaaaabaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaabkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaaaaaaaahbcaabaaaacaaaaaa
akaabaaaabaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaakaabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegaobaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaa
agiacaaaaaaaaaaaahaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
bkaabaaaabaaaaaaakaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaa
abaaaaaadkaabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaa
dkaabaaaaaaaaaaaaoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaa
dcaaaaajhcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaa
acaaaaaadcaaaaajhcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaafaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
agaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaa
eghobaaaafaaaaaaaagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaa
aaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "POINT" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "POINT" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "POINT" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 37 math, 5 textures
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R0.w, R0, R4;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R1.w, R4.z, R1;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R4.x, R4, R3.w;
MAX R4.z, R0.w, R1.w;
ADD R2.w, R4.y, R2;
MAX R4.y, R2.w, R4.z;
MAX R3.w, R4.x, R4.y;
MOV R4.w, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R3.w;
ADD R4, R4, c[1].x;
MAX R4, R4, c[2].x;
ADD R0.w, R4.x, R4.y;
ADD R0.w, R4.z, R0;
ADD R0.w, R4, R0;
RCP R0.w, R0.w;
MUL R4, R4, R0.w;
MUL R1.xyz, R4.z, R1;
MUL R2.xyz, R4.y, R2;
MUL R3.xyz, R4.x, R3;
ADD R2.xyz, R3, R2;
ADD R1.xyz, R2, R1;
MUL R2.xyz, R4.w, R0;
MOV R0.xyz, fragment.texcoord[4];
DP3 R0.w, fragment.texcoord[3], R0;
ADD R1.xyz, R1, R2;
MUL R0.xyz, R1, c[0];
MAX R0.w, R0, c[2].x;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
MOV result.color.w, c[2].x;
END
# 37 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 32 math, 5 textures
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c2, 0.00000000, 2.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
texld r4, v0, s0
texld r1, v2, s4
texld r2, v0.zwzw, s1
texld r0, v1.zwzw, s3
add_pp r1.w, r1, r4
add_pp r0.w, r4.z, r0
texld r3, v1, s2
add_pp r4.x, r4, r2.w
max r4.z, r1.w, r0.w
add_pp r3.w, r4.y, r3
max r4.y, r3.w, r4.z
max r2.w, r4.x, r4.y
mov r4.z, r0.w
mov r4.w, r1
mov r4.y, r3.w
add r4, r4, -r2.w
add r4, r4, c1.x
max r4, r4, c2.x
add r0.w, r4.x, r4.y
add r0.w, r4.z, r0
add r0.w, r4, r0
rcp r0.w, r0.w
mul r4, r4, r0.w
mul r0.xyz, r4.z, r0
mul r3.xyz, r4.y, r3
mul r2.xyz, r4.x, r2
add_pp r2.xyz, r2, r3
add_pp r0.xyz, r2, r0
mul r2.xyz, r4.w, r1
mov_pp r1.xyz, v4
add_pp r0.xyz, r0, r2
dp3_pp r0.w, v3, r1
mul_pp r1.xyz, r0, c0
max_pp r0.x, r0.w, c2
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c2.y
mov_pp oC0.w, c2.x
"
}
SubProgram "d3d11 " {
// Stats: 23 math, 5 textures
Keywords { "DIRECTIONAL" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedaofmklnlpmbpjibdajhickddohmnpidfabaaaaaajeafaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcheaeaaaa
eaaaaaaabnabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
dcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaa
ogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaah
ecaabaaaacaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaa
adaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaaaaaaaah
icaabaaaacaaaaaadkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaacaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaa
acaaaaaabkaabaaaabaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaabkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaahbcaabaaaacaaaaaa
akaabaaaabaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaakaabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegaobaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaa
agiacaaaaaaaaaaaadaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
bkaabaaaabaaaaaaakaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaa
abaaaaaadkaabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaa
dkaabaaaaaaaaaaaaoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaa
dcaaaaajhcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaa
acaaaaaadcaaaaajhcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 48 math, 7 textures
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightTexture0] 2D 5
SetTexture 6 [_LightTextureB0] 2D 6
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R0.w, R0, R4;
ADD R1.w, R4.z, R1;
TEX R2, fragment.texcoord[1], texture[2], 2D;
MAX R4.z, R0.w, R1.w;
ADD R2.w, R4.y, R2;
MAX R4.y, R2.w, R4.z;
ADD R4.x, R4, R3.w;
MAX R3.w, R4.x, R4.y;
MOV R4.w, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R3.w;
ADD R4, R4, c[1].x;
MAX R4, R4, c[2].x;
ADD R0.w, R4.x, R4.y;
ADD R0.w, R4.z, R0;
ADD R0.w, R4, R0;
RCP R0.w, R0.w;
MUL R4, R4, R0.w;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.w, R0.w;
MUL R1.xyz, R4.z, R1;
MUL R2.xyz, R4.y, R2;
MUL R3.xyz, R4.x, R3;
ADD R2.xyz, R3, R2;
ADD R1.xyz, R2, R1;
MUL R0.xyz, R4.w, R0;
ADD R0.xyz, R1, R0;
MUL R1.xyz, R0.w, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[3], R1;
RCP R0.w, fragment.texcoord[5].w;
MAD R1.zw, fragment.texcoord[5].xyxy, R0.w, c[2].y;
DP3 R1.y, fragment.texcoord[5], fragment.texcoord[5];
TEX R0.w, R1.zwzw, texture[5], 2D;
TEX R1.w, R1.y, texture[6], 2D;
SLT R1.y, c[2].x, fragment.texcoord[5].z;
MUL R0.w, R1.y, R0;
MUL R1.y, R0.w, R1.w;
MAX R0.w, R1.x, c[2].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].z;
MOV result.color.w, c[2].x;
END
# 48 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 41 math, 7 textures
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightTexture0] 2D 5
SetTexture 6 [_LightTextureB0] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c2, 0.00000000, 0.50000000, 1.00000000, 2.00000000
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
texld r4, v0, s0
texld r2, v0.zwzw, s1
texld r0, v1.zwzw, s3
texld r1, v2, s4
add_pp r1.w, r1, r4
add_pp r0.w, r4.z, r0
texld r3, v1, s2
add_pp r4.x, r4, r2.w
max r4.z, r1.w, r0.w
add_pp r3.w, r4.y, r3
max r4.y, r3.w, r4.z
max r2.w, r4.x, r4.y
mov r4.z, r0.w
mov r4.w, r1
mov r4.y, r3.w
add r4, r4, -r2.w
add r4, r4, c1.x
max r4, r4, c2.x
add r0.w, r4.x, r4.y
add r0.w, r4.z, r0
add r0.w, r4, r0
rcp r0.w, r0.w
mul r4, r4, r0.w
dp3_pp r0.w, v4, v4
mul r1.xyz, r4.w, r1
rsq_pp r0.w, r0.w
mul r0.xyz, r4.z, r0
mul r3.xyz, r4.y, r3
mul r2.xyz, r4.x, r2
add_pp r2.xyz, r2, r3
add_pp r0.xyz, r2, r0
add_pp r0.xyz, r0, r1
mul_pp r2.xyz, r0, c0
mul_pp r0.xyz, r0.w, v4
dp3_pp r0.z, v3, r0
rcp r0.w, v5.w
mad r1.xy, v5, r0.w, c2.y
dp3 r0.x, v5, v5
texld r0.w, r1, s5
cmp r0.y, -v5.z, c2.x, c2.z
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s6
mul_pp r0.x, r0.y, r0
max_pp r0.y, r0.z, c2.x
mul_pp r0.x, r0.y, r0
mul_pp r0.xyz, r0.x, r2
mul_pp oC0.xyz, r0, c2.w
mov_pp oC0.w, c2.x
"
}
SubProgram "d3d11 " {
// Stats: 33 math, 7 textures
Keywords { "SPOT" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Splat0] 2D 3
SetTexture 2 [_Splat1] 2D 4
SetTexture 3 [_Splat2] 2D 5
SetTexture 4 [_Splat3] 2D 6
SetTexture 5 [_LightTexture0] 2D 0
SetTexture 6 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedijnhfphcdfnmbpglocbpjamcjeimbpobabaaaaaafeahaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbmagaaaaeaaaaaaaihabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaahecaabaaa
acaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaa
egbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaahicaabaaa
acaaaaaadkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaacaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaahccaabaaaacaaaaaa
bkaabaaaabaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaabkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaa
abaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egaobaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaa
aaaaaaaaahaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaa
dkaabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaa
aaaaaaaaaoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaaj
hcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaagaaaaaapgbpbaaa
agaaaaaaaaaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaafaaaaaaaagabaaaaaaaaaaadbaaaaahicaabaaaaaaaaaaaabeaaaaa
aaaaaaaackbabaaaagaaaaaaabaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaa
efaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaaagaaaaaaaagabaaa
abaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaa
abaaaaaaegbcbaaaafaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaa
egacbaaaabaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaapaaaaahicaabaaaaaaaaaaaagaabaaaabaaaaaapgapbaaaaaaaaaaa
diaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "SPOT" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SPOT" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 44 math, 7 textures
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightTextureB0] 2D 5
SetTexture 6 [_LightTexture0] CUBE 6
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R0.w, R0, R4;
ADD R1.w, R4.z, R1;
TEX R2, fragment.texcoord[1], texture[2], 2D;
MAX R4.z, R0.w, R1.w;
ADD R2.w, R4.y, R2;
MAX R4.y, R2.w, R4.z;
ADD R4.x, R4, R3.w;
MAX R3.w, R4.x, R4.y;
MOV R4.w, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R3.w;
ADD R4, R4, c[1].x;
MAX R4, R4, c[2].x;
ADD R0.w, R4.x, R4.y;
ADD R0.w, R4.z, R0;
ADD R0.w, R4, R0;
RCP R0.w, R0.w;
MUL R4, R4, R0.w;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.w, R0.w;
MUL R1.xyz, R4.z, R1;
MUL R2.xyz, R4.y, R2;
MUL R3.xyz, R4.x, R3;
ADD R2.xyz, R3, R2;
ADD R1.xyz, R2, R1;
MUL R0.xyz, R4.w, R0;
ADD R0.xyz, R1, R0;
MUL R1.xyz, R0.w, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[3], R1;
DP3 R1.y, fragment.texcoord[5], fragment.texcoord[5];
TEX R0.w, fragment.texcoord[5], texture[6], CUBE;
TEX R1.w, R1.y, texture[5], 2D;
MUL R1.y, R1.w, R0.w;
MAX R0.w, R1.x, c[2].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
MOV result.color.w, c[2].x;
END
# 44 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 37 math, 7 textures
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightTextureB0] 2D 5
SetTexture 6 [_LightTexture0] CUBE 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_cube s6
def c2, 0.00000000, 2.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
texld r4, v0, s0
texld r2, v0.zwzw, s1
texld r0, v1.zwzw, s3
texld r1, v2, s4
add_pp r1.w, r1, r4
add_pp r0.w, r4.z, r0
texld r3, v1, s2
add_pp r4.x, r4, r2.w
max r4.z, r1.w, r0.w
add_pp r3.w, r4.y, r3
max r4.y, r3.w, r4.z
max r2.w, r4.x, r4.y
mov r4.z, r0.w
mov r4.w, r1
mov r4.y, r3.w
add r4, r4, -r2.w
add r4, r4, c1.x
max r4, r4, c2.x
add r0.w, r4.x, r4.y
add r0.w, r4.z, r0
add r0.w, r4, r0
rcp r0.w, r0.w
mul r4, r4, r0.w
dp3_pp r0.w, v4, v4
mul r1.xyz, r4.w, r1
rsq_pp r0.w, r0.w
mul r0.xyz, r4.z, r0
mul r3.xyz, r4.y, r3
mul r2.xyz, r4.x, r2
add_pp r2.xyz, r2, r3
add_pp r0.xyz, r2, r0
add_pp r0.xyz, r0, r1
mul_pp r1.xyz, r0, c0
mul_pp r2.xyz, r0.w, v4
dp3_pp r0.y, v3, r2
dp3 r0.x, v5, v5
max_pp r0.y, r0, c2.x
texld r0.w, v5, s6
texld r0.x, r0.x, s5
mul r0.x, r0, r0.w
mul_pp r0.x, r0.y, r0
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c2.y
mov_pp oC0.w, c2.x
"
}
SubProgram "d3d11 " {
// Stats: 28 math, 7 textures
Keywords { "POINT_COOKIE" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Splat0] 2D 3
SetTexture 2 [_Splat1] 2D 4
SetTexture 3 [_Splat2] 2D 5
SetTexture 4 [_Splat3] 2D 6
SetTexture 5 [_LightTextureB0] 2D 1
SetTexture 6 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlcpbecfmdlbbnglmpokbpagcgmedamfgabaaaaaalmagaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcieafaaaaeaaaaaaagbabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafidaaaaeaahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaahecaabaaa
acaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaa
egbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaahicaabaaa
acaaaaaadkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaacaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaahccaabaaaacaaaaaa
bkaabaaaabaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaabkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaa
abaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egaobaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaa
aaaaaaaaahaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaa
dkaabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaa
aaaaaaaaaoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaaj
hcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegbcbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaaeaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaagaaaaaa
egbcbaaaagaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaa
afaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaagaaaaaa
eghobaaaagaaaaaaaagabaaaaaaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaadkaabaaaacaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaa
agaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 39 math, 6 textures
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightTexture0] 2D 5
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R0.w, R0, R4;
ADD R1.w, R4.z, R1;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R4.x, R4, R3.w;
MAX R4.z, R0.w, R1.w;
ADD R2.w, R4.y, R2;
MAX R4.y, R2.w, R4.z;
MAX R3.w, R4.x, R4.y;
MOV R4.w, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R3.w;
ADD R4, R4, c[1].x;
MAX R4, R4, c[2].x;
ADD R0.w, R4.x, R4.y;
ADD R0.w, R4.z, R0;
ADD R0.w, R4, R0;
RCP R0.w, R0.w;
MUL R4, R4, R0.w;
MUL R2.xyz, R4.y, R2;
MUL R3.xyz, R4.x, R3;
ADD R2.xyz, R3, R2;
MUL R1.xyz, R4.z, R1;
ADD R1.xyz, R2, R1;
MUL R0.xyz, R4.w, R0;
ADD R0.xyz, R1, R0;
MOV R1.xyz, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[3], R1;
MUL R0.xyz, R0, c[0];
TEX R0.w, fragment.texcoord[5], texture[5], 2D;
MAX R1.x, R1, c[2];
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
MOV result.color.w, c[2].x;
END
# 39 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 33 math, 6 textures
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightTexture0] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c2, 0.00000000, 2.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xy
texld r4, v0, s0
texld r2, v0.zwzw, s1
texld r0, v1.zwzw, s3
texld r1, v2, s4
add_pp r1.w, r1, r4
add_pp r0.w, r4.z, r0
texld r3, v1, s2
add_pp r4.x, r4, r2.w
max r4.z, r1.w, r0.w
add_pp r3.w, r4.y, r3
max r4.y, r3.w, r4.z
max r2.w, r4.x, r4.y
mov r4.z, r0.w
mov r4.w, r1
mov r4.y, r3.w
add r4, r4, -r2.w
add r4, r4, c1.x
max r4, r4, c2.x
add r0.w, r4.x, r4.y
add r0.w, r4.z, r0
add r0.w, r4, r0
rcp r0.w, r0.w
mul r4, r4, r0.w
mul r1.xyz, r4.w, r1
mul r3.xyz, r4.y, r3
mul r2.xyz, r4.x, r2
add_pp r2.xyz, r2, r3
mul r0.xyz, r4.z, r0
add_pp r0.xyz, r2, r0
add_pp r0.xyz, r0, r1
mov_pp r1.xyz, v4
dp3_pp r1.x, v3, r1
mul_pp r0.xyz, r0, c0
texld r0.w, v5, s5
max_pp r1.x, r1, c2
mul_pp r0.w, r1.x, r0
mul_pp r0.xyz, r0.w, r0
mul_pp oC0.xyz, r0, c2.y
mov_pp oC0.w, c2.x
"
}
SubProgram "d3d11 " {
// Stats: 23 math, 6 textures
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedkcjpknojakioeddhbgpjbgbcndbcblbpabaaaaaapiafaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmaaeaaaaeaaaaaaadaabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaad
mcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaa
ogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaah
ecaabaaaacaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaa
adaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaah
icaabaaaacaaaaaadkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaacaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaahccaabaaa
acaaaaaabkaabaaaabaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaabkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaaaaaaaahbcaabaaaacaaaaaa
akaabaaaabaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaakaabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegaobaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaa
agiacaaaaaaaaaaaahaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
bkaabaaaabaaaaaaakaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaa
abaaaaaadkaabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaa
dkaabaaaaaaaaaaaaoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaa
dcaaaaajhcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaa
acaaaaaadcaaaaajhcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaaafaaaaaa
aagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaapgapbaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 8 math
 //        d3d9 : 8 math
 //      opengl : 8 math
 // Stats for Fragment shader:
 //       d3d11 : 1 math
 //        d3d9 : 2 math
 //      opengl : 2 math
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="Geometry-100" "RenderType"="Opaque" "SplatCount"="4" }
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 8 math
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Vector 9 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[10] = { program.local[0],
		state.matrix.mvp,
		program.local[5..9] };
TEMP R0;
MUL R0.xyz, vertex.normal, c[9].w;
DP3 result.texcoord[0].z, R0, c[7];
DP3 result.texcoord[0].y, R0, c[6];
DP3 result.texcoord[0].x, R0, c[5];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 8 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 8 math
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_position0 v0
dcl_normal0 v1
mul r0.xyz, v1, c8.w
dp3 o1.z, r0, c6
dp3 o1.y, r0, c5
dp3 o1.x, r0, c4
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 8 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefieceddgoflhcgfinoonoplgmdiabihpafgdafabaaaaaaneacaaaaadaaaaaa
cmaaaaaapeaaaaaaemabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheofaaaaaaaacaaaaaa
aiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefciaabaaaaeaaaabaagaaaaaaafjaaaaae
egiocaaaaaaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
aaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaaaaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaaaaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaaaaaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
varying lowp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec3 tmpvar_1;
  mat3 tmpvar_2;
  tmpvar_2[0] = _Object2World[0].xyz;
  tmpvar_2[1] = _Object2World[1].xyz;
  tmpvar_2[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying lowp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 res_1;
  highp vec2 tmpvar_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec2 tmpvar_6;
  lowp vec3 col_7;
  highp vec4 blend_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Control, tmpvar_2);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat0, tmpvar_3);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat1, tmpvar_4);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat2, tmpvar_5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat3, tmpvar_6);
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_9.x);
  blend_8.x = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_9.y);
  blend_8.y = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_9.z);
  blend_8.z = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_9.w);
  blend_8.w = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_8 - max (blend_8.x, max (blend_8.y, max (blend_8.z, blend_8.w)))) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_8 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_10).xyz;
  col_7 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_7 + (tmpvar_19.y * tmpvar_11).xyz);
  col_7 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_7 + (tmpvar_19.z * tmpvar_12).xyz);
  col_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_7 + (tmpvar_19.w * tmpvar_13).xyz);
  col_7 = tmpvar_23;
  res_1.xyz = ((xlv_TEXCOORD0 * 0.5) + 0.5);
  res_1.w = 0.0;
  gl_FragData[0] = res_1;
}



#endif"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
varying lowp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec3 tmpvar_1;
  mat3 tmpvar_2;
  tmpvar_2[0] = _Object2World[0].xyz;
  tmpvar_2[1] = _Object2World[1].xyz;
  tmpvar_2[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying lowp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 res_1;
  highp vec2 tmpvar_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec2 tmpvar_6;
  lowp vec3 col_7;
  highp vec4 blend_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Control, tmpvar_2);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat0, tmpvar_3);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat1, tmpvar_4);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat2, tmpvar_5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat3, tmpvar_6);
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_9.x);
  blend_8.x = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_9.y);
  blend_8.y = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_9.z);
  blend_8.z = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_9.w);
  blend_8.w = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_8 - max (blend_8.x, max (blend_8.y, max (blend_8.z, blend_8.w)))) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_8 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_10).xyz;
  col_7 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_7 + (tmpvar_19.y * tmpvar_11).xyz);
  col_7 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_7 + (tmpvar_19.z * tmpvar_12).xyz);
  col_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_7 + (tmpvar_19.w * tmpvar_13).xyz);
  col_7 = tmpvar_23;
  res_1.xyz = ((xlv_TEXCOORD0 * 0.5) + 0.5);
  res_1.w = 0.0;
  gl_FragData[0] = res_1;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
out lowp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec3 tmpvar_1;
  mat3 tmpvar_2;
  tmpvar_2[0] = _Object2World[0].xyz;
  tmpvar_2[1] = _Object2World[1].xyz;
  tmpvar_2[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
in lowp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 res_1;
  highp vec2 tmpvar_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec2 tmpvar_6;
  lowp vec3 col_7;
  highp vec4 blend_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Control, tmpvar_2);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat0, tmpvar_3);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat1, tmpvar_4);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_Splat2, tmpvar_5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Splat3, tmpvar_6);
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_9.x);
  blend_8.x = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_9.y);
  blend_8.y = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_9.z);
  blend_8.z = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_9.w);
  blend_8.w = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_8 - max (blend_8.x, max (blend_8.y, max (blend_8.z, blend_8.w)))) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_8 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_10).xyz;
  col_7 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_7 + (tmpvar_19.y * tmpvar_11).xyz);
  col_7 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_7 + (tmpvar_19.z * tmpvar_12).xyz);
  col_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_7 + (tmpvar_19.w * tmpvar_13).xyz);
  col_7 = tmpvar_23;
  res_1.xyz = ((xlv_TEXCOORD0 * 0.5) + 0.5);
  res_1.w = 0.0;
  _glesFragData[0] = res_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 2 math
"3.0-!!ARBfp1.0
PARAM c[1] = { { 0, 0.5 } };
MAD result.color.xyz, fragment.texcoord[0], c[0].y, c[0].y;
MOV result.color.w, c[0].x;
END
# 2 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 2 math
"ps_3_0
def c0, 0.50000000, 0.00000000, 0, 0
dcl_texcoord0 v0.xyz
mad_pp oC0.xyz, v0, c0.x, c0.x
mov_pp oC0.w, c0.y
"
}
SubProgram "d3d11 " {
// Stats: 1 math
"ps_4_0
eefiecedhbdiiogganilkmhhpogjlnaalcliljppabaaaaaadeabaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcheaaaaaa
eaaaaaaabnaaaaaagcbaaaadhcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaa
dcaaaaaphccabaaaaaaaaaaaegbcbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 21 avg math (13..27)
 //        d3d9 : 23 avg math (15..32)
 //      opengl : 23 avg math (15..32)
 // Stats for Fragment shader:
 //       d3d11 : 25 avg math (22..31), 7 avg texture (6..8)
 //        d3d9 : 31 avg math (27..39), 7 avg texture (6..8)
 //      opengl : 39 avg math (34..48), 7 avg texture (6..8)
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "QUEUE"="Geometry-100" "RenderType"="Opaque" "SplatCount"="4" }
  ZWrite Off
Program "vp" {
SubProgram "opengl " {
// Stats: 32 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_Control_ST]
Vector 19 [_Splat0_ST]
Vector 20 [_Splat1_ST]
Vector 21 [_Splat2_ST]
Vector 22 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[23] = { { 0.5, 1 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[17].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[12];
DP4 R2.y, R0, c[11];
DP4 R2.x, R0, c[10];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
MAD R0.x, R0, R0, -R0.y;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.x, c[16];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
MUL R0.y, R0, c[9].x;
ADD result.texcoord[4].xyz, R3, R2;
ADD result.texcoord[3].xy, R0, R0.z;
MOV result.position, R1;
MOV result.texcoord[3].zw, R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[22], c[22].zwzw;
END
# 32 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 32 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_Control_ST]
Vector 19 [_Splat0_ST]
Vector 20 [_Splat1_ST]
Vector 21 [_Splat2_ST]
Vector 22 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c17.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c23.y
dp4 r2.z, r0, c12
dp4 r2.y, r0, c11
dp4 r2.x, r0, c10
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c15
dp4 r3.y, r1, c14
dp4 r3.x, r1, c13
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
mad r0.x, r0, r0, -r0.y
add r3.xyz, r2, r3
mul r2.xyz, r0.x, c16
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c23.x
mul r0.y, r0, c8.x
add o5.xyz, r3, r2
mad o4.xy, r0.z, c9.zwzw, r0
mov o0, r1
mov o4.zw, r1
mad o1.zw, v2.xyxy, c19.xyxy, c19
mad o1.xy, v2, c18, c18.zwzw
mad o2.zw, v2.xyxy, c21.xyxy, c21
mad o2.xy, v2, c20, c20.zwzw
mad o3.xy, v2, c22, c22.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 27 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Vector 64 [_Control_ST]
Vector 80 [_Splat0_ST]
Vector 96 [_Splat1_ST]
Vector 112 [_Splat2_ST]
Vector 128 [_Splat3_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedadgjdjhhcjaggdjejadeancehjmeclkbabaaaaaaiaagaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcmmaeaaaaeaaaabaaddabaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
ahaaaaaakgiocaaaaaaaaaaaahaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
aeaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaafaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_10;
  mediump vec4 normal_11;
  normal_11 = tmpvar_9;
  highp float vC_12;
  mediump vec3 x3_13;
  mediump vec3 x2_14;
  mediump vec3 x1_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAr, normal_11);
  x1_15.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAg, normal_11);
  x1_15.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAb, normal_11);
  x1_15.z = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = (normal_11.xyzz * normal_11.yzzx);
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBr, tmpvar_19);
  x2_14.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBg, tmpvar_19);
  x2_14.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBb, tmpvar_19);
  x2_14.z = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y));
  vC_12 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_SHC.xyz * vC_12);
  x3_13 = tmpvar_24;
  tmpvar_10 = ((x1_15 + x2_14) + x3_13);
  tmpvar_3 = tmpvar_10;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_5;
  xlv_TEXCOORD4 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp float tmpvar_4;
  lowp vec3 col_5;
  highp vec4 blend_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_7.x);
  blend_6.x = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_7.y);
  blend_6.y = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_7.z);
  blend_6.z = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_7.w);
  blend_6.w = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (blend_6.x, max (blend_6.y, max (blend_6.z, blend_6.w)));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (((blend_6 - tmpvar_16) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 / (((tmpvar_17.x + tmpvar_17.y) + tmpvar_17.z) + tmpvar_17.w));
  blend_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.x * tmpvar_8).xyz;
  col_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_5 + (tmpvar_18.y * tmpvar_9).xyz);
  col_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_5 + (tmpvar_18.z * tmpvar_10).xyz);
  col_5 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_5 + (tmpvar_18.w * tmpvar_11).xyz);
  col_5 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = (tmpvar_16 * 0.5);
  tmpvar_4 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.w = tmpvar_25.w;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz + xlv_TEXCOORD4);
  light_3.xyz = tmpvar_26;
  lowp vec4 c_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_5 * light_3.xyz);
  c_27.xyz = tmpvar_28;
  c_27.w = tmpvar_4;
  c_2 = c_27;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_10;
  mediump vec4 normal_11;
  normal_11 = tmpvar_9;
  highp float vC_12;
  mediump vec3 x3_13;
  mediump vec3 x2_14;
  mediump vec3 x1_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAr, normal_11);
  x1_15.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAg, normal_11);
  x1_15.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAb, normal_11);
  x1_15.z = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = (normal_11.xyzz * normal_11.yzzx);
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBr, tmpvar_19);
  x2_14.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBg, tmpvar_19);
  x2_14.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBb, tmpvar_19);
  x2_14.z = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y));
  vC_12 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_SHC.xyz * vC_12);
  x3_13 = tmpvar_24;
  tmpvar_10 = ((x1_15 + x2_14) + x3_13);
  tmpvar_3 = tmpvar_10;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_5;
  xlv_TEXCOORD4 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp float tmpvar_4;
  lowp vec3 col_5;
  highp vec4 blend_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_7.x);
  blend_6.x = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_7.y);
  blend_6.y = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_7.z);
  blend_6.z = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_7.w);
  blend_6.w = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (blend_6.x, max (blend_6.y, max (blend_6.z, blend_6.w)));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (((blend_6 - tmpvar_16) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 / (((tmpvar_17.x + tmpvar_17.y) + tmpvar_17.z) + tmpvar_17.w));
  blend_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.x * tmpvar_8).xyz;
  col_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_5 + (tmpvar_18.y * tmpvar_9).xyz);
  col_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_5 + (tmpvar_18.z * tmpvar_10).xyz);
  col_5 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_5 + (tmpvar_18.w * tmpvar_11).xyz);
  col_5 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = (tmpvar_16 * 0.5);
  tmpvar_4 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.w = tmpvar_25.w;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz + xlv_TEXCOORD4);
  light_3.xyz = tmpvar_26;
  lowp vec4 c_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_5 * light_3.xyz);
  c_27.xyz = tmpvar_28;
  c_27.w = tmpvar_4;
  c_2 = c_27;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_10;
  mediump vec4 normal_11;
  normal_11 = tmpvar_9;
  highp float vC_12;
  mediump vec3 x3_13;
  mediump vec3 x2_14;
  mediump vec3 x1_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAr, normal_11);
  x1_15.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAg, normal_11);
  x1_15.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAb, normal_11);
  x1_15.z = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = (normal_11.xyzz * normal_11.yzzx);
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBr, tmpvar_19);
  x2_14.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBg, tmpvar_19);
  x2_14.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBb, tmpvar_19);
  x2_14.z = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y));
  vC_12 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_SHC.xyz * vC_12);
  x3_13 = tmpvar_24;
  tmpvar_10 = ((x1_15 + x2_14) + x3_13);
  tmpvar_3 = tmpvar_10;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_5;
  xlv_TEXCOORD4 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp float tmpvar_4;
  lowp vec3 col_5;
  highp vec4 blend_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_7.x);
  blend_6.x = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_7.y);
  blend_6.y = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_7.z);
  blend_6.z = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_7.w);
  blend_6.w = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (blend_6.x, max (blend_6.y, max (blend_6.z, blend_6.w)));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (((blend_6 - tmpvar_16) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 / (((tmpvar_17.x + tmpvar_17.y) + tmpvar_17.z) + tmpvar_17.w));
  blend_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.x * tmpvar_8).xyz;
  col_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_5 + (tmpvar_18.y * tmpvar_9).xyz);
  col_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_5 + (tmpvar_18.z * tmpvar_10).xyz);
  col_5 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_5 + (tmpvar_18.w * tmpvar_11).xyz);
  col_5 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = (tmpvar_16 * 0.5);
  tmpvar_4 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.w = tmpvar_25.w;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz + xlv_TEXCOORD4);
  light_3.xyz = tmpvar_26;
  lowp vec4 c_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_5 * light_3.xyz);
  c_27.xyz = tmpvar_28;
  c_27.w = tmpvar_4;
  c_2 = c_27;
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 24 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [unity_LightmapST]
Vector 16 [_Control_ST]
Vector 17 [_Splat0_ST]
Vector 18 [_Splat1_ST]
Vector 19 [_Splat2_ST]
Vector 20 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[21] = { { 0.5, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..20] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV R0.x, c[0].y;
ADD R0.y, R0.x, -c[14].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[14];
MOV result.texcoord[3].zw, R0;
MUL result.texcoord[5].xyz, R1, c[14].w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[17].xyxy, c[17];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[15], c[15].zwzw;
MUL result.texcoord[5].w, -R0.x, R0.y;
END
# 24 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 24 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [unity_LightmapST]
Vector 16 [_Control_ST]
Vector 17 [_Splat0_ST]
Vector 18 [_Splat1_ST]
Vector 19 [_Splat2_ST]
Vector 20 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c21, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c21.x
mul r1.y, r1, c12.x
mad o4.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov r0.x, c14.w
add r0.y, c21, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c14
mov o4.zw, r0
mul o6.xyz, r1, c14.w
mad o1.zw, v1.xyxy, c17.xyxy, c17
mad o1.xy, v1, c16, c16.zwzw
mad o2.zw, v1.xyxy, c19.xyxy, c19
mad o2.xy, v1, c18, c18.zwzw
mad o3.xy, v1, c20, c20.zwzw
mad o5.xy, v2, c15, c15.zwzw
mul o6.w, -r0.x, r0.y
"
}
SubProgram "d3d11 " {
// Stats: 25 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 192
Vector 64 [unity_LightmapST]
Vector 80 [_Control_ST]
Vector 96 [_Splat0_ST]
Vector 112 [_Splat1_ST]
Vector 128 [_Splat2_ST]
Vector 144 [_Splat3_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedbffjcbonabbnkkaokdklnhfgecmnfjdgabaaaaaaiaagaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcleaeaaaaeaaaabaacnabaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
bkaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadmccabaaaadaaaaaagfaaaaadpccabaaa
aeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaaaaaaaaaaagaaaaaadcaaaaal
dccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaa
aaaaaaaaahaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaaadaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
dcaaaaalmccabaaaadaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaeaaaaaa
kgiocaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaaeaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaabjaaaaaa
diaaaaaihccabaaaafaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabjaaaaaa
diaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakbabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaa
ckbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
adaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaaaaaaiadpdiaaaaai
iccabaaaafaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  tmpvar_3.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_3.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_5;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  lowp float tmpvar_7;
  lowp vec3 col_8;
  highp vec4 blend_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_10.x);
  blend_9.x = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_10.y);
  blend_9.y = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_10.z);
  blend_9.z = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_14.w + tmpvar_10.w);
  blend_9.w = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = max (blend_9.x, max (blend_9.y, max (blend_9.z, blend_9.w)));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (((blend_9 - tmpvar_19) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_20 / (((tmpvar_20.x + tmpvar_20.y) + tmpvar_20.z) + tmpvar_20.w));
  blend_9 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.x * tmpvar_11).xyz;
  col_8 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_8 + (tmpvar_21.y * tmpvar_12).xyz);
  col_8 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_8 + (tmpvar_21.z * tmpvar_13).xyz);
  col_8 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (col_8 + (tmpvar_21.w * tmpvar_14).xyz);
  col_8 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (tmpvar_19 * 0.5);
  tmpvar_7 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_6 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = -(log2(max (light_6, vec4(0.001, 0.001, 0.001, 0.001))));
  light_6.w = tmpvar_28.w;
  highp float tmpvar_29;
  tmpvar_29 = ((sqrt(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lmFull_4 = tmpvar_30;
  lowp vec3 tmpvar_31;
  tmpvar_31 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  lmIndirect_3 = tmpvar_31;
  light_6.xyz = (tmpvar_28.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = (col_8 * light_6.xyz);
  c_32.xyz = tmpvar_33;
  c_32.w = tmpvar_7;
  c_2 = c_32;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  tmpvar_3.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_3.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_5;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  lowp float tmpvar_7;
  lowp vec3 col_8;
  highp vec4 blend_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_10.x);
  blend_9.x = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_10.y);
  blend_9.y = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_10.z);
  blend_9.z = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_14.w + tmpvar_10.w);
  blend_9.w = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = max (blend_9.x, max (blend_9.y, max (blend_9.z, blend_9.w)));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (((blend_9 - tmpvar_19) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_20 / (((tmpvar_20.x + tmpvar_20.y) + tmpvar_20.z) + tmpvar_20.w));
  blend_9 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.x * tmpvar_11).xyz;
  col_8 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_8 + (tmpvar_21.y * tmpvar_12).xyz);
  col_8 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_8 + (tmpvar_21.z * tmpvar_13).xyz);
  col_8 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (col_8 + (tmpvar_21.w * tmpvar_14).xyz);
  col_8 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (tmpvar_19 * 0.5);
  tmpvar_7 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_6 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = -(log2(max (light_6, vec4(0.001, 0.001, 0.001, 0.001))));
  light_6.w = tmpvar_28.w;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (unity_LightmapInd, xlv_TEXCOORD4);
  highp float tmpvar_31;
  tmpvar_31 = ((sqrt(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((8.0 * tmpvar_29.w) * tmpvar_29.xyz);
  lmFull_4 = tmpvar_32;
  lowp vec3 tmpvar_33;
  tmpvar_33 = ((8.0 * tmpvar_30.w) * tmpvar_30.xyz);
  lmIndirect_3 = tmpvar_33;
  light_6.xyz = (tmpvar_28.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = (col_8 * light_6.xyz);
  c_34.xyz = tmpvar_35;
  c_34.w = tmpvar_7;
  c_2 = c_34;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
out highp vec2 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  tmpvar_3.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_3.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_5;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
in highp vec2 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  lowp float tmpvar_7;
  lowp vec3 col_8;
  highp vec4 blend_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_10.x);
  blend_9.x = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_10.y);
  blend_9.y = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_10.z);
  blend_9.z = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_14.w + tmpvar_10.w);
  blend_9.w = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = max (blend_9.x, max (blend_9.y, max (blend_9.z, blend_9.w)));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (((blend_9 - tmpvar_19) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_20 / (((tmpvar_20.x + tmpvar_20.y) + tmpvar_20.z) + tmpvar_20.w));
  blend_9 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.x * tmpvar_11).xyz;
  col_8 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_8 + (tmpvar_21.y * tmpvar_12).xyz);
  col_8 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_8 + (tmpvar_21.z * tmpvar_13).xyz);
  col_8 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (col_8 + (tmpvar_21.w * tmpvar_14).xyz);
  col_8 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (tmpvar_19 * 0.5);
  tmpvar_7 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = textureProj (_LightBuffer, xlv_TEXCOORD3);
  light_6 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = -(log2(max (light_6, vec4(0.001, 0.001, 0.001, 0.001))));
  light_6.w = tmpvar_28.w;
  highp float tmpvar_29;
  tmpvar_29 = ((sqrt(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lmFull_4 = tmpvar_30;
  lowp vec3 tmpvar_31;
  tmpvar_31 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  lmIndirect_3 = tmpvar_31;
  light_6.xyz = (tmpvar_28.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = (col_8 * light_6.xyz);
  c_32.xyz = tmpvar_33;
  c_32.w = tmpvar_7;
  c_2 = c_32;
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 15 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [_ProjectionParams]
Vector 6 [unity_LightmapST]
Vector 7 [_Control_ST]
Vector 8 [_Splat0_ST]
Vector 9 [_Splat1_ST]
Vector 10 [_Splat2_ST]
Vector 11 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[12] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[5].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[8].xyxy, c[8];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[7], c[7].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[10].xyxy, c[10];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[9], c[9].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[6], c[6].zwzw;
END
# 15 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 15 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_ProjectionParams]
Vector 5 [_ScreenParams]
Vector 6 [unity_LightmapST]
Vector 7 [_Control_ST]
Vector 8 [_Splat0_ST]
Vector 9 [_Splat1_ST]
Vector 10 [_Splat2_ST]
Vector 11 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c12, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c12.x
mul r1.y, r1, c4.x
mad o4.xy, r1.z, c5.zwzw, r1
mov o0, r0
mov o4.zw, r0
mad o1.zw, v1.xyxy, c8.xyxy, c8
mad o1.xy, v1, c7, c7.zwzw
mad o2.zw, v1.xyxy, c10.xyxy, c10
mad o2.xy, v1, c9, c9.zwzw
mad o3.xy, v1, c11, c11.zwzw
mad o5.xy, v2, c6, c6.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 13 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 192
Vector 64 [unity_LightmapST]
Vector 80 [_Control_ST]
Vector 96 [_Splat0_ST]
Vector 112 [_Splat1_ST]
Vector 128 [_Splat2_ST]
Vector 144 [_Splat3_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedklllfoeamkohlddbccmbcjpnkheeeiigabaaaaaajeaeaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcoaacaaaaeaaaabaaliaaaaaafjaaaaae
egiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadmccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaa
aaaaaaaaagaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaacaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_6;
  tmpvar_6.x = tmpvar_5.x;
  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
  o_4.xy = (tmpvar_6 + tmpvar_5.w);
  o_4.zw = tmpvar_3.zw;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp float tmpvar_4;
  lowp vec3 col_5;
  highp vec4 blend_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_7.x);
  blend_6.x = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_7.y);
  blend_6.y = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_7.z);
  blend_6.z = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_7.w);
  blend_6.w = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (blend_6.x, max (blend_6.y, max (blend_6.z, blend_6.w)));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (((blend_6 - tmpvar_16) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 / (((tmpvar_17.x + tmpvar_17.y) + tmpvar_17.z) + tmpvar_17.w));
  blend_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.x * tmpvar_8).xyz;
  col_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_5 + (tmpvar_18.y * tmpvar_9).xyz);
  col_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_5 + (tmpvar_18.z * tmpvar_10).xyz);
  col_5 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_5 + (tmpvar_18.w * tmpvar_11).xyz);
  col_5 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = (tmpvar_16 * 0.5);
  tmpvar_4 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_24;
  mediump vec3 lm_25;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_25 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27.w = 0.0;
  tmpvar_27.xyz = lm_25;
  mediump vec4 tmpvar_28;
  tmpvar_28 = (-(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_27);
  light_3 = tmpvar_28;
  lowp vec4 c_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = (col_5 * tmpvar_28.xyz);
  c_29.xyz = tmpvar_30;
  c_29.w = tmpvar_4;
  c_2 = c_29;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_6;
  tmpvar_6.x = tmpvar_5.x;
  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
  o_4.xy = (tmpvar_6 + tmpvar_5.w);
  o_4.zw = tmpvar_3.zw;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp float tmpvar_4;
  lowp vec3 col_5;
  highp vec4 blend_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_7.x);
  blend_6.x = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_7.y);
  blend_6.y = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_7.z);
  blend_6.z = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_7.w);
  blend_6.w = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (blend_6.x, max (blend_6.y, max (blend_6.z, blend_6.w)));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (((blend_6 - tmpvar_16) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 / (((tmpvar_17.x + tmpvar_17.y) + tmpvar_17.z) + tmpvar_17.w));
  blend_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.x * tmpvar_8).xyz;
  col_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_5 + (tmpvar_18.y * tmpvar_9).xyz);
  col_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_5 + (tmpvar_18.z * tmpvar_10).xyz);
  col_5 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_5 + (tmpvar_18.w * tmpvar_11).xyz);
  col_5 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = (tmpvar_16 * 0.5);
  tmpvar_4 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  mediump vec3 lm_26;
  lowp vec3 tmpvar_27;
  tmpvar_27 = ((8.0 * tmpvar_25.w) * tmpvar_25.xyz);
  lm_26 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28.w = 0.0;
  tmpvar_28.xyz = lm_26;
  mediump vec4 tmpvar_29;
  tmpvar_29 = (-(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_28);
  light_3 = tmpvar_29;
  lowp vec4 c_30;
  mediump vec3 tmpvar_31;
  tmpvar_31 = (col_5 * tmpvar_29.xyz);
  c_30.xyz = tmpvar_31;
  c_30.w = tmpvar_4;
  c_2 = c_30;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
out highp vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_6;
  tmpvar_6.x = tmpvar_5.x;
  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
  o_4.xy = (tmpvar_6 + tmpvar_5.w);
  o_4.zw = tmpvar_3.zw;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
in highp vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp float tmpvar_4;
  lowp vec3 col_5;
  highp vec4 blend_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_7.x);
  blend_6.x = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_7.y);
  blend_6.y = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_7.z);
  blend_6.z = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_7.w);
  blend_6.w = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (blend_6.x, max (blend_6.y, max (blend_6.z, blend_6.w)));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (((blend_6 - tmpvar_16) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 / (((tmpvar_17.x + tmpvar_17.y) + tmpvar_17.z) + tmpvar_17.w));
  blend_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.x * tmpvar_8).xyz;
  col_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_5 + (tmpvar_18.y * tmpvar_9).xyz);
  col_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_5 + (tmpvar_18.z * tmpvar_10).xyz);
  col_5 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_5 + (tmpvar_18.w * tmpvar_11).xyz);
  col_5 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = (tmpvar_16 * 0.5);
  tmpvar_4 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_24;
  mediump vec3 lm_25;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_25 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27.w = 0.0;
  tmpvar_27.xyz = lm_25;
  mediump vec4 tmpvar_28;
  tmpvar_28 = (-(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_27);
  light_3 = tmpvar_28;
  lowp vec4 c_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = (col_5 * tmpvar_28.xyz);
  c_29.xyz = tmpvar_30;
  c_29.w = tmpvar_4;
  c_2 = c_29;
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 32 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_Control_ST]
Vector 19 [_Splat0_ST]
Vector 20 [_Splat1_ST]
Vector 21 [_Splat2_ST]
Vector 22 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[23] = { { 0.5, 1 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[17].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[12];
DP4 R2.y, R0, c[11];
DP4 R2.x, R0, c[10];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
MAD R0.x, R0, R0, -R0.y;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.x, c[16];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
MUL R0.y, R0, c[9].x;
ADD result.texcoord[4].xyz, R3, R2;
ADD result.texcoord[3].xy, R0, R0.z;
MOV result.position, R1;
MOV result.texcoord[3].zw, R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[22], c[22].zwzw;
END
# 32 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 32 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_Control_ST]
Vector 19 [_Splat0_ST]
Vector 20 [_Splat1_ST]
Vector 21 [_Splat2_ST]
Vector 22 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c17.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c23.y
dp4 r2.z, r0, c12
dp4 r2.y, r0, c11
dp4 r2.x, r0, c10
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c15
dp4 r3.y, r1, c14
dp4 r3.x, r1, c13
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
mad r0.x, r0, r0, -r0.y
add r3.xyz, r2, r3
mul r2.xyz, r0.x, c16
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c23.x
mul r0.y, r0, c8.x
add o5.xyz, r3, r2
mad o4.xy, r0.z, c9.zwzw, r0
mov o0, r1
mov o4.zw, r1
mad o1.zw, v2.xyxy, c19.xyxy, c19
mad o1.xy, v2, c18, c18.zwzw
mad o2.zw, v2.xyxy, c21.xyxy, c21
mad o2.xy, v2, c20, c20.zwzw
mad o3.xy, v2, c22, c22.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 27 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Vector 64 [_Control_ST]
Vector 80 [_Splat0_ST]
Vector 96 [_Splat1_ST]
Vector 112 [_Splat2_ST]
Vector 128 [_Splat3_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedadgjdjhhcjaggdjejadeancehjmeclkbabaaaaaaiaagaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcmmaeaaaaeaaaabaaddabaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
ahaaaaaakgiocaaaaaaaaaaaahaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
aeaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaafaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_10;
  mediump vec4 normal_11;
  normal_11 = tmpvar_9;
  highp float vC_12;
  mediump vec3 x3_13;
  mediump vec3 x2_14;
  mediump vec3 x1_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAr, normal_11);
  x1_15.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAg, normal_11);
  x1_15.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAb, normal_11);
  x1_15.z = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = (normal_11.xyzz * normal_11.yzzx);
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBr, tmpvar_19);
  x2_14.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBg, tmpvar_19);
  x2_14.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBb, tmpvar_19);
  x2_14.z = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y));
  vC_12 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_SHC.xyz * vC_12);
  x3_13 = tmpvar_24;
  tmpvar_10 = ((x1_15 + x2_14) + x3_13);
  tmpvar_3 = tmpvar_10;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_5;
  xlv_TEXCOORD4 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp float tmpvar_4;
  lowp vec3 col_5;
  highp vec4 blend_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_7.x);
  blend_6.x = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_7.y);
  blend_6.y = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_7.z);
  blend_6.z = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_7.w);
  blend_6.w = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (blend_6.x, max (blend_6.y, max (blend_6.z, blend_6.w)));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (((blend_6 - tmpvar_16) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 / (((tmpvar_17.x + tmpvar_17.y) + tmpvar_17.z) + tmpvar_17.w));
  blend_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.x * tmpvar_8).xyz;
  col_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_5 + (tmpvar_18.y * tmpvar_9).xyz);
  col_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_5 + (tmpvar_18.z * tmpvar_10).xyz);
  col_5 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_5 + (tmpvar_18.w * tmpvar_11).xyz);
  col_5 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = (tmpvar_16 * 0.5);
  tmpvar_4 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_25.w;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz + xlv_TEXCOORD4);
  light_3.xyz = tmpvar_26;
  lowp vec4 c_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_5 * light_3.xyz);
  c_27.xyz = tmpvar_28;
  c_27.w = tmpvar_4;
  c_2 = c_27;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_10;
  mediump vec4 normal_11;
  normal_11 = tmpvar_9;
  highp float vC_12;
  mediump vec3 x3_13;
  mediump vec3 x2_14;
  mediump vec3 x1_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAr, normal_11);
  x1_15.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAg, normal_11);
  x1_15.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAb, normal_11);
  x1_15.z = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = (normal_11.xyzz * normal_11.yzzx);
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBr, tmpvar_19);
  x2_14.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBg, tmpvar_19);
  x2_14.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBb, tmpvar_19);
  x2_14.z = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y));
  vC_12 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_SHC.xyz * vC_12);
  x3_13 = tmpvar_24;
  tmpvar_10 = ((x1_15 + x2_14) + x3_13);
  tmpvar_3 = tmpvar_10;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_5;
  xlv_TEXCOORD4 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp float tmpvar_4;
  lowp vec3 col_5;
  highp vec4 blend_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_7.x);
  blend_6.x = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_7.y);
  blend_6.y = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_7.z);
  blend_6.z = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_7.w);
  blend_6.w = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (blend_6.x, max (blend_6.y, max (blend_6.z, blend_6.w)));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (((blend_6 - tmpvar_16) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 / (((tmpvar_17.x + tmpvar_17.y) + tmpvar_17.z) + tmpvar_17.w));
  blend_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.x * tmpvar_8).xyz;
  col_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_5 + (tmpvar_18.y * tmpvar_9).xyz);
  col_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_5 + (tmpvar_18.z * tmpvar_10).xyz);
  col_5 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_5 + (tmpvar_18.w * tmpvar_11).xyz);
  col_5 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = (tmpvar_16 * 0.5);
  tmpvar_4 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_25.w;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz + xlv_TEXCOORD4);
  light_3.xyz = tmpvar_26;
  lowp vec4 c_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_5 * light_3.xyz);
  c_27.xyz = tmpvar_28;
  c_27.w = tmpvar_4;
  c_2 = c_27;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_10;
  mediump vec4 normal_11;
  normal_11 = tmpvar_9;
  highp float vC_12;
  mediump vec3 x3_13;
  mediump vec3 x2_14;
  mediump vec3 x1_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAr, normal_11);
  x1_15.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAg, normal_11);
  x1_15.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAb, normal_11);
  x1_15.z = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = (normal_11.xyzz * normal_11.yzzx);
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBr, tmpvar_19);
  x2_14.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBg, tmpvar_19);
  x2_14.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBb, tmpvar_19);
  x2_14.z = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y));
  vC_12 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_SHC.xyz * vC_12);
  x3_13 = tmpvar_24;
  tmpvar_10 = ((x1_15 + x2_14) + x3_13);
  tmpvar_3 = tmpvar_10;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_5;
  xlv_TEXCOORD4 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp float tmpvar_4;
  lowp vec3 col_5;
  highp vec4 blend_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_7.x);
  blend_6.x = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_7.y);
  blend_6.y = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_7.z);
  blend_6.z = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_7.w);
  blend_6.w = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (blend_6.x, max (blend_6.y, max (blend_6.z, blend_6.w)));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (((blend_6 - tmpvar_16) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 / (((tmpvar_17.x + tmpvar_17.y) + tmpvar_17.z) + tmpvar_17.w));
  blend_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.x * tmpvar_8).xyz;
  col_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_5 + (tmpvar_18.y * tmpvar_9).xyz);
  col_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_5 + (tmpvar_18.z * tmpvar_10).xyz);
  col_5 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_5 + (tmpvar_18.w * tmpvar_11).xyz);
  col_5 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = (tmpvar_16 * 0.5);
  tmpvar_4 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_25.w;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz + xlv_TEXCOORD4);
  light_3.xyz = tmpvar_26;
  lowp vec4 c_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_5 * light_3.xyz);
  c_27.xyz = tmpvar_28;
  c_27.w = tmpvar_4;
  c_2 = c_27;
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 24 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [unity_LightmapST]
Vector 16 [_Control_ST]
Vector 17 [_Splat0_ST]
Vector 18 [_Splat1_ST]
Vector 19 [_Splat2_ST]
Vector 20 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[21] = { { 0.5, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..20] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV R0.x, c[0].y;
ADD R0.y, R0.x, -c[14].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[14];
MOV result.texcoord[3].zw, R0;
MUL result.texcoord[5].xyz, R1, c[14].w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[17].xyxy, c[17];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[15], c[15].zwzw;
MUL result.texcoord[5].w, -R0.x, R0.y;
END
# 24 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 24 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [unity_LightmapST]
Vector 16 [_Control_ST]
Vector 17 [_Splat0_ST]
Vector 18 [_Splat1_ST]
Vector 19 [_Splat2_ST]
Vector 20 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c21, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c21.x
mul r1.y, r1, c12.x
mad o4.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov r0.x, c14.w
add r0.y, c21, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c14
mov o4.zw, r0
mul o6.xyz, r1, c14.w
mad o1.zw, v1.xyxy, c17.xyxy, c17
mad o1.xy, v1, c16, c16.zwzw
mad o2.zw, v1.xyxy, c19.xyxy, c19
mad o2.xy, v1, c18, c18.zwzw
mad o3.xy, v1, c20, c20.zwzw
mad o5.xy, v2, c15, c15.zwzw
mul o6.w, -r0.x, r0.y
"
}
SubProgram "d3d11 " {
// Stats: 25 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 192
Vector 64 [unity_LightmapST]
Vector 80 [_Control_ST]
Vector 96 [_Splat0_ST]
Vector 112 [_Splat1_ST]
Vector 128 [_Splat2_ST]
Vector 144 [_Splat3_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedbffjcbonabbnkkaokdklnhfgecmnfjdgabaaaaaaiaagaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcleaeaaaaeaaaabaacnabaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
bkaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadmccabaaaadaaaaaagfaaaaadpccabaaa
aeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaaaaaaaaaaagaaaaaadcaaaaal
dccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaa
aaaaaaaaahaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaaadaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
dcaaaaalmccabaaaadaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaeaaaaaa
kgiocaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaaeaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaabjaaaaaa
diaaaaaihccabaaaafaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabjaaaaaa
diaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakbabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaa
ckbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
adaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaaaaaaiadpdiaaaaai
iccabaaaafaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  tmpvar_3.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_3.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_5;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  lowp float tmpvar_7;
  lowp vec3 col_8;
  highp vec4 blend_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_10.x);
  blend_9.x = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_10.y);
  blend_9.y = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_10.z);
  blend_9.z = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_14.w + tmpvar_10.w);
  blend_9.w = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = max (blend_9.x, max (blend_9.y, max (blend_9.z, blend_9.w)));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (((blend_9 - tmpvar_19) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_20 / (((tmpvar_20.x + tmpvar_20.y) + tmpvar_20.z) + tmpvar_20.w));
  blend_9 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.x * tmpvar_11).xyz;
  col_8 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_8 + (tmpvar_21.y * tmpvar_12).xyz);
  col_8 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_8 + (tmpvar_21.z * tmpvar_13).xyz);
  col_8 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (col_8 + (tmpvar_21.w * tmpvar_14).xyz);
  col_8 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (tmpvar_19 * 0.5);
  tmpvar_7 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_6 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = max (light_6, vec4(0.001, 0.001, 0.001, 0.001));
  light_6.w = tmpvar_28.w;
  highp float tmpvar_29;
  tmpvar_29 = ((sqrt(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lmFull_4 = tmpvar_30;
  lowp vec3 tmpvar_31;
  tmpvar_31 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  lmIndirect_3 = tmpvar_31;
  light_6.xyz = (tmpvar_28.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = (col_8 * light_6.xyz);
  c_32.xyz = tmpvar_33;
  c_32.w = tmpvar_7;
  c_2 = c_32;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  tmpvar_3.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_3.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_5;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  lowp float tmpvar_7;
  lowp vec3 col_8;
  highp vec4 blend_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_10.x);
  blend_9.x = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_10.y);
  blend_9.y = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_10.z);
  blend_9.z = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_14.w + tmpvar_10.w);
  blend_9.w = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = max (blend_9.x, max (blend_9.y, max (blend_9.z, blend_9.w)));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (((blend_9 - tmpvar_19) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_20 / (((tmpvar_20.x + tmpvar_20.y) + tmpvar_20.z) + tmpvar_20.w));
  blend_9 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.x * tmpvar_11).xyz;
  col_8 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_8 + (tmpvar_21.y * tmpvar_12).xyz);
  col_8 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_8 + (tmpvar_21.z * tmpvar_13).xyz);
  col_8 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (col_8 + (tmpvar_21.w * tmpvar_14).xyz);
  col_8 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (tmpvar_19 * 0.5);
  tmpvar_7 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_6 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = max (light_6, vec4(0.001, 0.001, 0.001, 0.001));
  light_6.w = tmpvar_28.w;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (unity_LightmapInd, xlv_TEXCOORD4);
  highp float tmpvar_31;
  tmpvar_31 = ((sqrt(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((8.0 * tmpvar_29.w) * tmpvar_29.xyz);
  lmFull_4 = tmpvar_32;
  lowp vec3 tmpvar_33;
  tmpvar_33 = ((8.0 * tmpvar_30.w) * tmpvar_30.xyz);
  lmIndirect_3 = tmpvar_33;
  light_6.xyz = (tmpvar_28.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = (col_8 * light_6.xyz);
  c_34.xyz = tmpvar_35;
  c_34.w = tmpvar_7;
  c_2 = c_34;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
out highp vec2 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  tmpvar_3.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_3.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_5;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
in highp vec2 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  lowp float tmpvar_7;
  lowp vec3 col_8;
  highp vec4 blend_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_10.x);
  blend_9.x = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_10.y);
  blend_9.y = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_10.z);
  blend_9.z = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_14.w + tmpvar_10.w);
  blend_9.w = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = max (blend_9.x, max (blend_9.y, max (blend_9.z, blend_9.w)));
  highp vec4 tmpvar_20;
  tmpvar_20 = max (((blend_9 - tmpvar_19) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_20 / (((tmpvar_20.x + tmpvar_20.y) + tmpvar_20.z) + tmpvar_20.w));
  blend_9 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.x * tmpvar_11).xyz;
  col_8 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_8 + (tmpvar_21.y * tmpvar_12).xyz);
  col_8 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_8 + (tmpvar_21.z * tmpvar_13).xyz);
  col_8 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (col_8 + (tmpvar_21.w * tmpvar_14).xyz);
  col_8 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (tmpvar_19 * 0.5);
  tmpvar_7 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = textureProj (_LightBuffer, xlv_TEXCOORD3);
  light_6 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = max (light_6, vec4(0.001, 0.001, 0.001, 0.001));
  light_6.w = tmpvar_28.w;
  highp float tmpvar_29;
  tmpvar_29 = ((sqrt(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lmFull_4 = tmpvar_30;
  lowp vec3 tmpvar_31;
  tmpvar_31 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  lmIndirect_3 = tmpvar_31;
  light_6.xyz = (tmpvar_28.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = (col_8 * light_6.xyz);
  c_32.xyz = tmpvar_33;
  c_32.w = tmpvar_7;
  c_2 = c_32;
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 15 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [_ProjectionParams]
Vector 6 [unity_LightmapST]
Vector 7 [_Control_ST]
Vector 8 [_Splat0_ST]
Vector 9 [_Splat1_ST]
Vector 10 [_Splat2_ST]
Vector 11 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[12] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[5].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[8].xyxy, c[8];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[7], c[7].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[10].xyxy, c[10];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[9], c[9].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[6], c[6].zwzw;
END
# 15 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 15 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_ProjectionParams]
Vector 5 [_ScreenParams]
Vector 6 [unity_LightmapST]
Vector 7 [_Control_ST]
Vector 8 [_Splat0_ST]
Vector 9 [_Splat1_ST]
Vector 10 [_Splat2_ST]
Vector 11 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c12, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c12.x
mul r1.y, r1, c4.x
mad o4.xy, r1.z, c5.zwzw, r1
mov o0, r0
mov o4.zw, r0
mad o1.zw, v1.xyxy, c8.xyxy, c8
mad o1.xy, v1, c7, c7.zwzw
mad o2.zw, v1.xyxy, c10.xyxy, c10
mad o2.xy, v1, c9, c9.zwzw
mad o3.xy, v1, c11, c11.zwzw
mad o5.xy, v2, c6, c6.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 13 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 192
Vector 64 [unity_LightmapST]
Vector 80 [_Control_ST]
Vector 96 [_Splat0_ST]
Vector 112 [_Splat1_ST]
Vector 128 [_Splat2_ST]
Vector 144 [_Splat3_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedklllfoeamkohlddbccmbcjpnkheeeiigabaaaaaajeaeaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcoaacaaaaeaaaabaaliaaaaaafjaaaaae
egiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadmccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaa
aaaaaaaaagaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaacaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_6;
  tmpvar_6.x = tmpvar_5.x;
  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
  o_4.xy = (tmpvar_6 + tmpvar_5.w);
  o_4.zw = tmpvar_3.zw;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp float tmpvar_4;
  lowp vec3 col_5;
  highp vec4 blend_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_7.x);
  blend_6.x = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_7.y);
  blend_6.y = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_7.z);
  blend_6.z = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_7.w);
  blend_6.w = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (blend_6.x, max (blend_6.y, max (blend_6.z, blend_6.w)));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (((blend_6 - tmpvar_16) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 / (((tmpvar_17.x + tmpvar_17.y) + tmpvar_17.z) + tmpvar_17.w));
  blend_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.x * tmpvar_8).xyz;
  col_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_5 + (tmpvar_18.y * tmpvar_9).xyz);
  col_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_5 + (tmpvar_18.z * tmpvar_10).xyz);
  col_5 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_5 + (tmpvar_18.w * tmpvar_11).xyz);
  col_5 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = (tmpvar_16 * 0.5);
  tmpvar_4 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_24;
  mediump vec3 lm_25;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_25 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27.w = 0.0;
  tmpvar_27.xyz = lm_25;
  mediump vec4 tmpvar_28;
  tmpvar_28 = (max (light_3, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_27);
  light_3 = tmpvar_28;
  lowp vec4 c_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = (col_5 * tmpvar_28.xyz);
  c_29.xyz = tmpvar_30;
  c_29.w = tmpvar_4;
  c_2 = c_29;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_6;
  tmpvar_6.x = tmpvar_5.x;
  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
  o_4.xy = (tmpvar_6 + tmpvar_5.w);
  o_4.zw = tmpvar_3.zw;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp float tmpvar_4;
  lowp vec3 col_5;
  highp vec4 blend_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_7.x);
  blend_6.x = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_7.y);
  blend_6.y = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_7.z);
  blend_6.z = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_7.w);
  blend_6.w = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (blend_6.x, max (blend_6.y, max (blend_6.z, blend_6.w)));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (((blend_6 - tmpvar_16) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 / (((tmpvar_17.x + tmpvar_17.y) + tmpvar_17.z) + tmpvar_17.w));
  blend_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.x * tmpvar_8).xyz;
  col_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_5 + (tmpvar_18.y * tmpvar_9).xyz);
  col_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_5 + (tmpvar_18.z * tmpvar_10).xyz);
  col_5 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_5 + (tmpvar_18.w * tmpvar_11).xyz);
  col_5 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = (tmpvar_16 * 0.5);
  tmpvar_4 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  mediump vec3 lm_26;
  lowp vec3 tmpvar_27;
  tmpvar_27 = ((8.0 * tmpvar_25.w) * tmpvar_25.xyz);
  lm_26 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28.w = 0.0;
  tmpvar_28.xyz = lm_26;
  mediump vec4 tmpvar_29;
  tmpvar_29 = (max (light_3, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_28);
  light_3 = tmpvar_29;
  lowp vec4 c_30;
  mediump vec3 tmpvar_31;
  tmpvar_31 = (col_5 * tmpvar_29.xyz);
  c_30.xyz = tmpvar_31;
  c_30.w = tmpvar_4;
  c_2 = c_30;
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
out highp vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_6;
  tmpvar_6.x = tmpvar_5.x;
  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
  o_4.xy = (tmpvar_6 + tmpvar_5.w);
  o_4.zw = tmpvar_3.zw;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = o_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
in highp vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp float tmpvar_4;
  lowp vec3 col_5;
  highp vec4 blend_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_12;
  tmpvar_12 = (tmpvar_8.w + tmpvar_7.x);
  blend_6.x = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_7.y);
  blend_6.y = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_7.z);
  blend_6.z = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_7.w);
  blend_6.w = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (blend_6.x, max (blend_6.y, max (blend_6.z, blend_6.w)));
  highp vec4 tmpvar_17;
  tmpvar_17 = max (((blend_6 - tmpvar_16) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 / (((tmpvar_17.x + tmpvar_17.y) + tmpvar_17.z) + tmpvar_17.w));
  blend_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.x * tmpvar_8).xyz;
  col_5 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_5 + (tmpvar_18.y * tmpvar_9).xyz);
  col_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_5 + (tmpvar_18.z * tmpvar_10).xyz);
  col_5 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_5 + (tmpvar_18.w * tmpvar_11).xyz);
  col_5 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = (tmpvar_16 * 0.5);
  tmpvar_4 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_24;
  mediump vec3 lm_25;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_25 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27.w = 0.0;
  tmpvar_27.xyz = lm_25;
  mediump vec4 tmpvar_28;
  tmpvar_28 = (max (light_3, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_27);
  light_3 = tmpvar_28;
  lowp vec4 c_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = (col_5 * tmpvar_28.xyz);
  c_29.xyz = tmpvar_30;
  c_29.w = tmpvar_4;
  c_2 = c_29;
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 37 math, 6 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R1.w, R4.z, R1;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R4.z, R4.w, R0.w;
MAX R0.w, R1, R4.z;
MOV R4.w, R4.z;
ADD R4.x, R3.w, R4;
MAX R0.w, R2, R0;
MAX R0.w, R4.x, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, -R0.w, R4;
ADD R4, R4, c[0].x;
MAX R4, R4, c[1].y;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R1.xyz, R1, R4.z;
MUL R2.xyz, R2, R4.y;
MUL R3.xyz, R3, R4.x;
ADD R2.xyz, R3, R2;
ADD R2.xyz, R2, R1;
TXP R1.xyz, fragment.texcoord[3], texture[5], 2D;
MUL R0.xyz, R0, R4.w;
LG2 R1.x, R1.x;
LG2 R1.z, R1.z;
LG2 R1.y, R1.y;
ADD R1.xyz, -R1, fragment.texcoord[4];
ADD R0.xyz, R2, R0;
MUL result.color.xyz, R0, R1;
MUL result.color.w, R0, c[1].x;
END
# 37 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 30 math, 6 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c1, 0.00000000, 0.50000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
texld r4, v0, s0
texld r0, v1.zwzw, s3
texld r1, v2, s4
add_pp r1.w, r4, r1
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r4.z, r1
texld r2, v0.zwzw, s1
add_pp r4.x, r2.w, r4
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, -r0.w, r4
add r4, r4, c0.x
max r4, r4, c1.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r0.xyz, r0, r4.z
mul r3.xyz, r3, r4.y
mul r2.xyz, r2, r4.x
add_pp r2.xyz, r2, r3
add_pp r2.xyz, r2, r0
texldp r0.xyz, v3, s5
mul r1.xyz, r1, r4.w
log_pp r0.x, r0.x
log_pp r0.z, r0.z
log_pp r0.y, r0.y
add_pp r0.xyz, -r0, v4
add_pp r1.xyz, r2, r1
mul_pp oC0.xyz, r1, r0
mul oC0.w, r0, c1.y
"
}
SubProgram "d3d11 " {
// Stats: 23 math, 6 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
ConstBuffer "$Globals" 160
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedjijefdmnagakpmoepdbeakaljcgklnilabaaaaaaliafaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjiaeaaaa
eaaaaaaacgabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaa
adaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahecaabaaa
acaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaa
egbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaaaaaaaahicaabaaa
acaaaaaadkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaacaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaaacaaaaaa
bkaabaaaabaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaabkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaa
abaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egaobaaaacaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaadpaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaa
adaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaa
akaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaa
aoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaa
acaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
hcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaa
aaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaa
afaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaaafaaaaaadiaaaaahhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 48 math, 8 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Depth]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [unity_LightmapInd] 2D 7
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0.5, 0, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
ADD R1.w, R4.z, R1;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R4.z, R4.w, R0.w;
MAX R0.w, R1, R4.z;
MOV R4.w, R4.z;
ADD R4.x, R3.w, R4;
MAX R0.w, R2, R0;
MAX R0.w, R4.x, R0;
MOV R4.y, R2.w;
MOV R4.z, R1.w;
ADD R4, -R0.w, R4;
ADD R4, R4, c[0].x;
MAX R4, R4, c[2].y;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
DP4 R1.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R1.w, R1.w;
RCP R1.w, R1.w;
MUL R3.xyz, R3, R4.x;
MUL R2.xyz, R2, R4.y;
ADD R2.xyz, R3, R2;
MUL R1.xyz, R1, R4.z;
ADD R1.xyz, R2, R1;
MUL R0.xyz, R0, R4.w;
TEX R3, fragment.texcoord[4], texture[6], 2D;
TEX R2, fragment.texcoord[4], texture[7], 2D;
MUL R2.xyz, R2.w, R2;
MUL R3.xyz, R3.w, R3;
MUL R2.xyz, R2, c[2].z;
MAD R4.xyz, R3, c[2].z, -R2;
TXP R3.xyz, fragment.texcoord[3], texture[5], 2D;
MAD_SAT R1.w, R1, c[1].z, c[1];
MAD R2.xyz, R1.w, R4, R2;
LG2 R3.x, R3.x;
LG2 R3.y, R3.y;
LG2 R3.z, R3.z;
ADD R2.xyz, -R3, R2;
ADD R0.xyz, R1, R0;
MUL result.color.xyz, R0, R2;
MUL result.color.w, R0, c[2].x;
END
# 48 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 39 math, 8 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Depth]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [unity_LightmapInd] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c2, 0.00000000, 0.50000000, 8.00000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xy
dcl_texcoord5 v5
texld r4, v0, s0
texld r1, v2, s4
add_pp r1.w, r4, r1
texld r0, v1.zwzw, s3
add_pp r4.z, r4, r0.w
texld r2, v0.zwzw, s1
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r4.z, r1
add_pp r4.x, r2.w, r4
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, -r0.w, r4
add r4, r4, c0.x
max r4, r4, c2.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r3.xyz, r3, r4.y
mul r2.xyz, r2, r4.x
add_pp r2.xyz, r2, r3
mul r0.xyz, r0, r4.z
add_pp r0.xyz, r2, r0
mul r3.xyz, r1, r4.w
texld r1, v4, s6
mul_pp r1.xyz, r1.w, r1
texld r2, v4, s7
mul_pp r2.xyz, r2.w, r2
mul_pp r2.xyz, r2, c2.z
mad_pp r4.xyz, r1, c2.z, -r2
texldp r1.xyz, v3, s5
dp4 r1.w, v5, v5
rsq r1.w, r1.w
rcp r1.w, r1.w
mad_sat r1.w, r1, c1.z, c1
mad_pp r2.xyz, r1.w, r4, r2
log_pp r1.x, r1.x
log_pp r1.y, r1.y
log_pp r1.z, r1.z
add_pp r1.xyz, -r1, r2
add_pp r0.xyz, r0, r3
mul_pp oC0.xyz, r0, r1
mul oC0.w, r0, c2.y
"
}
SubProgram "d3d11 " {
// Stats: 31 math, 8 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [unity_LightmapInd] 2D 7
ConstBuffer "$Globals" 192
Float 48 [_Depth]
Vector 160 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0
eefiecedliecgchkaadpgadppcjkcojfblnlolddabaaaaaafiahaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefccaagaaaaeaaaaaaaiiabaaaa
fjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
fibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaa
fibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaa
gcbaaaadlcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacahaaaaaabbaaaaahbcaabaaaaaaaaaaaegbobaaaafaaaaaa
egbobaaaafaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadccaaaal
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaakaaaaaadkiacaaa
aaaaaaaaakaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaa
ahaaaaaaaagabaaaahaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaafgafbaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaaagaaaaaa
aagabaaaagaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaaaebdcaaaaakhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
jgahbaiaebaaaaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
aeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaafaaaaaaaagabaaaafaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaa
abaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaa
aagabaaaadaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahecaabaaaadaaaaaadkaabaaaabaaaaaa
ckaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaaeaaaaaaaaaaaaahicaabaaaadaaaaaadkaabaaaacaaaaaa
dkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaadaaaaaackaabaaa
adaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaaaaaaaaahccaabaaaadaaaaaabkaabaaaacaaaaaadkaabaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaadaaaaaa
efaaaaajpcaabaaaagaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaaaaaaaaahbcaabaaaadaaaaaaakaabaaaacaaaaaadkaabaaaagaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaadaaaaaaaaaaaaai
pcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaaadaaaaaadiaaaaah
iccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaaipcaabaaa
acaaaaaaegaobaaaacaaaaaaagiacaaaaaaaaaaaadaaaaaadeaaaaakpcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaaaaaaaaah
icaabaaaaaaaaaaackaabaaaacaaaaaadkaabaaaaaaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaacaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaa
afaaaaaafgafbaaaacaaaaaadcaaaaajhcaabaaaadaaaaaaagaabaaaacaaaaaa
egacbaaaagaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaakgakbaaa
acaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaa
pgapbaaaacaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 39 math, 7 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5, 0, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R1.w, R4.z, R1;
ADD R4.z, R4.w, R0.w;
MAX R0.w, R1, R4.z;
MOV R4.w, R4.z;
MAX R0.w, R2, R0;
ADD R4.x, R3.w, R4;
MAX R0.w, R4.x, R0;
MOV R4.y, R2.w;
MOV R4.z, R1.w;
ADD R4, -R0.w, R4;
ADD R4, R4, c[0].x;
MAX R4, R4, c[1].y;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R3.xyz, R3, R4.x;
MUL R2.xyz, R2, R4.y;
ADD R2.xyz, R3, R2;
MUL R3.xyz, R0, R4.w;
TXP R0.xyz, fragment.texcoord[3], texture[5], 2D;
MUL R1.xyz, R1, R4.z;
ADD R1.xyz, R2, R1;
TEX R2, fragment.texcoord[4], texture[6], 2D;
MUL R2.xyz, R2.w, R2;
LG2 R0.x, R0.x;
LG2 R0.z, R0.z;
LG2 R0.y, R0.y;
MAD R0.xyz, R2, c[1].z, -R0;
ADD R1.xyz, R1, R3;
MUL result.color.xyz, R1, R0;
MUL result.color.w, R0, c[1].x;
END
# 39 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 31 math, 7 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c1, 0.00000000, 0.50000000, 8.00000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xy
texld r4, v0, s0
texld r1, v2, s4
add_pp r1.w, r4, r1
texld r0, v1.zwzw, s3
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r4.z, r1
texld r2, v0.zwzw, s1
add_pp r4.x, r2.w, r4
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, -r0.w, r4
add r4, r4, c0.x
max r4, r4, c1.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r3.xyz, r3, r4.y
mul r2.xyz, r2, r4.x
add_pp r2.xyz, r2, r3
mul r3.xyz, r1, r4.w
mul r0.xyz, r0, r4.z
add_pp r0.xyz, r2, r0
texldp r2.xyz, v3, s5
texld r1, v4, s6
mul_pp r1.xyz, r1.w, r1
log_pp r2.x, r2.x
log_pp r2.z, r2.z
log_pp r2.y, r2.y
mad_pp r1.xyz, r1, c1.z, -r2
add_pp r0.xyz, r0, r3
mul_pp oC0.xyz, r0, r1
mul oC0.w, r0, c1.y
"
}
SubProgram "d3d11 " {
// Stats: 24 math, 7 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
ConstBuffer "$Globals" 192
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedcmokedjkohobjbcngnahpijneclidhfoabaaaaaabmagaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpmaeaaaa
eaaaaaaadpabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahecaabaaaacaaaaaa
dkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaaaaaaaahicaabaaaacaaaaaa
dkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
acaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaaacaaaaaabkaabaaa
abaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaaabaaaaaa
dkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
acaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaa
acaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaadaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaaaoaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaaacaaaaaa
agaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaa
aaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaaj
hcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaaafaaaaaa
cpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
ogbkbaaaadaaaaaaeghobaaaagaaaaaaaagabaaaagaaaaaadiaaaaahicaabaaa
aaaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaacaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 34 math, 6 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R1.w, R4.z, R1;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R4.z, R4.w, R0.w;
MAX R0.w, R1, R4.z;
MOV R4.w, R4.z;
ADD R4.x, R3.w, R4;
MAX R0.w, R2, R0;
MAX R0.w, R4.x, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, -R0.w, R4;
ADD R4, R4, c[0].x;
MAX R4, R4, c[1].y;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R1.xyz, R1, R4.z;
MUL R2.xyz, R2, R4.y;
MUL R3.xyz, R3, R4.x;
ADD R2.xyz, R3, R2;
ADD R2.xyz, R2, R1;
TXP R1.xyz, fragment.texcoord[3], texture[5], 2D;
MUL R0.xyz, R0, R4.w;
ADD R1.xyz, R1, fragment.texcoord[4];
ADD R0.xyz, R2, R0;
MUL result.color.xyz, R0, R1;
MUL result.color.w, R0, c[1].x;
END
# 34 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 27 math, 6 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c1, 0.00000000, 0.50000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
texld r4, v0, s0
texld r0, v1.zwzw, s3
texld r1, v2, s4
add_pp r1.w, r4, r1
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r4.z, r1
texld r2, v0.zwzw, s1
add_pp r4.x, r2.w, r4
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, -r0.w, r4
add r4, r4, c0.x
max r4, r4, c1.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r0.xyz, r0, r4.z
mul r3.xyz, r3, r4.y
mul r2.xyz, r2, r4.x
add_pp r2.xyz, r2, r3
add_pp r2.xyz, r2, r0
texldp r0.xyz, v3, s5
mul r1.xyz, r1, r4.w
add_pp r0.xyz, r0, v4
add_pp r1.xyz, r2, r1
mul_pp oC0.xyz, r1, r0
mul oC0.w, r0, c1.y
"
}
SubProgram "d3d11 " {
// Stats: 22 math, 6 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
ConstBuffer "$Globals" 160
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedoibgcjmidjjegbmjmolpagmpedaoppgiabaaaaaakaafaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefciaaeaaaa
eaaaaaaacaabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaa
adaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahecaabaaa
acaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaa
egbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaaaaaaaahicaabaaa
acaaaaaadkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaacaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaaacaaaaaa
bkaabaaaabaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaabkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaa
abaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egaobaaaacaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaadpaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaa
adaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaa
akaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaa
aoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaa
acaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
hcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaa
aaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaa
afaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaa
diaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 45 math, 8 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Depth]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [unity_LightmapInd] 2D 7
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0.5, 0, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R1.w, R4.z, R1;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R4.z, R4.w, R0.w;
MAX R0.w, R1, R4.z;
MOV R4.w, R4.z;
MAX R0.w, R2, R0;
ADD R4.x, R3.w, R4;
MAX R0.w, R4.x, R0;
MOV R4.y, R2.w;
MOV R4.z, R1.w;
ADD R4, -R0.w, R4;
ADD R4, R4, c[0].x;
MAX R4, R4, c[2].y;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R1.xyz, R1, R4.z;
MUL R3.xyz, R3, R4.x;
MUL R2.xyz, R2, R4.y;
ADD R2.xyz, R3, R2;
ADD R2.xyz, R2, R1;
TEX R1, fragment.texcoord[4], texture[6], 2D;
MUL R3.xyz, R1.w, R1;
TEX R1, fragment.texcoord[4], texture[7], 2D;
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, c[2].z;
MUL R0.xyz, R0, R4.w;
DP4 R2.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R1.w, R2.w;
RCP R1.w, R1.w;
MAD R3.xyz, R3, c[2].z, -R1;
MAD_SAT R1.w, R1, c[1].z, c[1];
MAD R3.xyz, R1.w, R3, R1;
TXP R1.xyz, fragment.texcoord[3], texture[5], 2D;
ADD R1.xyz, R1, R3;
ADD R0.xyz, R2, R0;
MUL result.color.xyz, R0, R1;
MUL result.color.w, R0, c[2].x;
END
# 45 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 36 math, 8 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Depth]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [unity_LightmapInd] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c2, 0.00000000, 0.50000000, 8.00000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xy
dcl_texcoord5 v5
texld r4, v0, s0
texld r0, v1.zwzw, s3
texld r2, v0.zwzw, s1
texld r1, v2, s4
add_pp r1.w, r4, r1
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r4.z, r1
add_pp r4.x, r2.w, r4
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, -r0.w, r4
add r4, r4, c0.x
max r4, r4, c2.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
dp4 r1.w, v5, v5
rsq r1.w, r1.w
rcp r1.w, r1.w
mul r3.xyz, r3, r4.y
mul r2.xyz, r2, r4.x
add_pp r2.xyz, r2, r3
mul r0.xyz, r0, r4.z
add_pp r0.xyz, r2, r0
texld r2, v4, s6
mul_pp r3.xyz, r2.w, r2
mul r1.xyz, r1, r4.w
texld r2, v4, s7
mul_pp r2.xyz, r2.w, r2
mul_pp r2.xyz, r2, c2.z
mad_pp r3.xyz, r3, c2.z, -r2
mad_sat r1.w, r1, c1.z, c1
mad_pp r3.xyz, r1.w, r3, r2
texldp r2.xyz, v3, s5
add_pp r2.xyz, r2, r3
add_pp r0.xyz, r0, r1
mul_pp oC0.xyz, r0, r2
mul oC0.w, r0, c2.y
"
}
SubProgram "d3d11 " {
// Stats: 30 math, 8 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [unity_LightmapInd] 2D 7
ConstBuffer "$Globals" 192
Float 48 [_Depth]
Vector 160 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0
eefiecedoefpcfgcbgibedmmnkinapnfbbeolbomabaaaaaaeaahaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcaiagaaaaeaaaaaaaicabaaaa
fjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
fibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaa
fibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaa
gcbaaaadlcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacahaaaaaabbaaaaahbcaabaaaaaaaaaaaegbobaaaafaaaaaa
egbobaaaafaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadccaaaal
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaakaaaaaadkiacaaa
aaaaaaaaakaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaa
ahaaaaaaaagabaaaahaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaafgafbaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaaagaaaaaa
aagabaaaagaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaaaebdcaaaaakhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
jgahbaiaebaaaaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
aeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaafaaaaaaaagabaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahecaabaaaadaaaaaa
dkaabaaaabaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaaaaaaaahicaabaaaadaaaaaa
dkaabaaaacaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
adaaaaaackaabaaaadaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaaadaaaaaabkaabaaa
acaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkaabaaaadaaaaaaefaaaaajpcaabaaaagaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaaaaaaaahbcaabaaaadaaaaaaakaabaaaacaaaaaa
dkaabaaaagaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
adaaaaaaaaaaaaaipcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaa
adaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaaagiacaaaaaaaaaaaadaaaaaa
deaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaaakaabaaa
acaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaacaaaaaadkaabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaacaaaaaadkaabaaaaaaaaaaaaoaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaa
adaaaaaaegacbaaaafaaaaaafgafbaaaacaaaaaadcaaaaajhcaabaaaadaaaaaa
agaabaaaacaaaaaaegacbaaaagaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaa
abaaaaaakgakbaaaacaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaapgapbaaaacaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 36 math, 7 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5, 0, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R1.w, R4.z, R1;
ADD R4.z, R4.w, R0.w;
MAX R0.w, R1, R4.z;
MOV R4.w, R4.z;
MAX R0.w, R2, R0;
ADD R4.x, R3.w, R4;
MAX R0.w, R4.x, R0;
MOV R4.y, R2.w;
MOV R4.z, R1.w;
ADD R4, -R0.w, R4;
ADD R4, R4, c[0].x;
MAX R4, R4, c[1].y;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R3.xyz, R3, R4.x;
MUL R2.xyz, R2, R4.y;
ADD R2.xyz, R3, R2;
MUL R3.xyz, R0, R4.w;
MUL R1.xyz, R1, R4.z;
ADD R1.xyz, R2, R1;
TEX R2, fragment.texcoord[4], texture[6], 2D;
TXP R0.xyz, fragment.texcoord[3], texture[5], 2D;
MUL R2.xyz, R2.w, R2;
MAD R0.xyz, R2, c[1].z, R0;
ADD R1.xyz, R1, R3;
MUL result.color.xyz, R1, R0;
MUL result.color.w, R0, c[1].x;
END
# 36 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 28 math, 7 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c1, 0.00000000, 0.50000000, 8.00000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xy
texld r4, v0, s0
texld r1, v2, s4
add_pp r1.w, r4, r1
texld r0, v1.zwzw, s3
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r4.z, r1
texld r2, v0.zwzw, s1
add_pp r4.x, r2.w, r4
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, -r0.w, r4
add r4, r4, c0.x
max r4, r4, c1.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r3.xyz, r3, r4.y
mul r2.xyz, r2, r4.x
add_pp r2.xyz, r2, r3
mul r3.xyz, r1, r4.w
mul r0.xyz, r0, r4.z
add_pp r0.xyz, r2, r0
texld r1, v4, s6
texldp r2.xyz, v3, s5
mul_pp r1.xyz, r1.w, r1
mad_pp r1.xyz, r1, c1.z, r2
add_pp r0.xyz, r0, r3
mul_pp oC0.xyz, r0, r1
mul oC0.w, r0, c1.y
"
}
SubProgram "d3d11 " {
// Stats: 23 math, 7 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
ConstBuffer "$Globals" 192
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmjnkdamddncpenamggljeglknbieganeabaaaaaaaeagaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcoeaeaaaa
eaaaaaaadjabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahecaabaaaacaaaaaa
dkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaaaaaaaahicaabaaaacaaaaaa
dkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
acaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaaacaaaaaabkaabaaa
abaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaaabaaaaaa
dkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
acaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaa
acaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaadaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaaaoaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaaacaaaaaa
agaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaa
aaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaaj
hcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaaafaaaaaa
efaaaaajpcaabaaaacaaaaaaogbkbaaaadaaaaaaeghobaaaagaaaaaaaagabaaa
agaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaeb
dcaaaaajhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3"
}
}
 }
}
Dependency "AddPassShader" = "Hidden/TerrainEngine/Splatmap/Lightmap-AddPass-Advanced-Pro"
Dependency "BaseMapShader" = "Diffuse"
Dependency "Details0" = "Hidden/TerrainEngine/Details/Vertexlit"
Dependency "Details1" = "Hidden/TerrainEngine/Details/WavingDoublePass"
Dependency "Details2" = "Hidden/TerrainEngine/Details/BillboardWavingDoublePass"
Dependency "Tree0" = "Hidden/TerrainEngine/BillboardTree"
Fallback "Nature/Terrain/Diffuse"
}