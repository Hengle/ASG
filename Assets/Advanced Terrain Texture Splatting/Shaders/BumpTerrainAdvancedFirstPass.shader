// Compiled shader for all platforms, uncompressed size: 714.0KB

Shader "Nature/Terrain/Advanced Bumped (Pro)" {
Properties {
 _Depth ("Blend Depth", Range(0.001,1)) = 0.1
[HideInInspector]  _Control ("Control (RGBA)", 2D) = "red" {}
[HideInInspector]  _Splat3 ("Layer 3 (A)", 2D) = "black" {}
[HideInInspector]  _Splat2 ("Layer 2 (B)", 2D) = "black" {}
[HideInInspector]  _Splat1 ("Layer 1 (G)", 2D) = "black" {}
[HideInInspector]  _Splat0 ("Layer 0 (R)", 2D) = "black" {}
[HideInInspector]  _Normal3 ("Normal 3 (A)", 2D) = "bump" {}
[HideInInspector]  _Normal2 ("Normal 2 (B)", 2D) = "bump" {}
[HideInInspector]  _Normal1 ("Normal 1 (G)", 2D) = "bump" {}
[HideInInspector]  _Normal0 ("Normal 0 (R)", 2D) = "bump" {}
[HideInInspector]  _MainTex ("BaseMap (RGB)", 2D) = "white" {}
[HideInInspector]  _Color ("Main Color", Color) = (1,1,1,1)
}
SubShader { 
 Tags { "QUEUE"="Geometry-100" "RenderType"="Opaque" "SplatCount"="4" }


 // Stats for Vertex shader:
 //       d3d11 : 30 avg math (10..62)
 //        d3d9 : 35 avg math (10..77)
 //      opengl : 34 avg math (10..75)
 // Stats for Fragment shader:
 //       d3d11 : 35 avg math (22..47), 9 avg texture (6..12)
 //        d3d9 : 44 avg math (28..56), 9 avg texture (6..12)
 //      opengl : 53 avg math (35..68), 9 avg texture (6..12)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry-100" "RenderType"="Opaque" "SplatCount"="4" }
Program "vp" {
SubProgram "opengl " {
// Stats: 38 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
Vector 22 [_Control_ST]
Vector 23 [_Splat0_ST]
Vector 24 [_Splat1_ST]
Vector 25 [_Splat2_ST]
Vector 26 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[27] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..26] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[21].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[16];
DP4 R2.y, R0, c[15];
DP4 R2.x, R0, c[14];
MUL R0.y, R2.w, R2.w;
MAD R0.x, R0, R0, -R0.y;
DP4 R3.z, R1, c[19];
DP4 R3.y, R1, c[18];
DP4 R3.x, R1, c[17];
MUL R1.xyz, -vertex.normal.zxyw, c[0].yxyw;
ADD R2.xyz, R2, R3;
MUL R0.xyz, R0.x, c[20];
ADD result.texcoord[4].xyz, R2, R0;
MOV R0, c[13];
MAD R1.xyz, vertex.normal.yzxw, c[0].xyyw, R1;
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP3 result.texcoord[3].y, R3, -R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, R3, R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[23].xyxy, c[23];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[25].xyxy, c[25];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[24], c[24].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[26], c[26].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 38 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 40 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_SHAr]
Vector 14 [unity_SHAg]
Vector 15 [unity_SHAb]
Vector 16 [unity_SHBr]
Vector 17 [unity_SHBg]
Vector 18 [unity_SHBb]
Vector 19 [unity_SHC]
Vector 20 [unity_Scale]
Vector 21 [_Control_ST]
Vector 22 [_Splat0_ST]
Vector 23 [_Splat1_ST]
Vector 24 [_Splat2_ST]
Vector 25 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c26, 0.00000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c20.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c26.y
dp4 r2.z, r0, c15
dp4 r2.y, r0, c14
dp4 r2.x, r0, c13
mul r0.y, r2.w, r2.w
mad r0.x, r0, r0, -r0.y
dp4 r3.z, r1, c18
dp4 r3.y, r1, c17
dp4 r3.x, r1, c16
add r1.xyz, r2, r3
mul r0.xyz, r0.x, c19
add o5.xyz, r1, r0
mov r0, c10
dp4 r4.z, c12, r0
mul r2.xyz, -v2.zxyw, c26.xyxw
mad r2.xyz, v2.yzxw, c26.yxxw, r2
mul r1.xyz, v2.zxyw, r2.yzxw
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
mov r0, c9
mov r1, c8
dp4 r4.y, c12, r0
dp4 r4.x, c12, r1
dp3 o4.y, r4, -r3
dp3 o4.z, v2, r4
dp3 o4.x, r4, r2
mad o1.zw, v3.xyxy, c22.xyxy, c22
mad o1.xy, v3, c21, c21.zwzw
mad o2.zw, v3.xyxy, c24.xyxy, c24
mad o2.xy, v3, c23, c23.zwzw
mad o3.xy, v3, c25, c25.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 35 math
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
Vector 0 [_WorldSpaceLightPos0]
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
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedbledapiojfcoeonbbfdkobpdcnneaagnabaaaaaaieahaaaaadaaaaaa
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
feeffiedepepfceeaaklklklfdeieefcnaafaaaaeaaaabaaheabaaaafjaaaaae
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
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaakhcaabaaa
aaaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaa
dcaaaaanhcaabaaaaaaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaiadpaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaaaaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaa
acaaaaaajgaebaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaajhcaabaaa
acaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaa
baaaaaaicccabaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaaacaaaaaa
baaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaaapaaaaah
bccabaaaaeaaaaaacgakbaaaaaaaaaaaegaabaaaacaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
afaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_7.xyz;
  tmpvar_10 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_1.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_1.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_1.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_2 = tmpvar_14;
  tmpvar_6 = shlight_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec4 c_32;
  c_32.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD3)) * 2.0));
  c_32.w = tmpvar_2;
  c_1.w = c_32.w;
  c_1.xyz = (c_32.xyz + (col_4 * xlv_TEXCOORD4));
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
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_7.xyz;
  tmpvar_10 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_1.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_1.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_1.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_2 = tmpvar_14;
  tmpvar_6 = shlight_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 normal_32;
  normal_32.xy = ((tmpvar_30.wy * 2.0) - 1.0);
  normal_32.z = sqrt((1.0 - clamp (dot (normal_32.xy, normal_32.xy), 0.0, 1.0)));
  lowp vec4 c_33;
  c_33.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (normal_32, xlv_TEXCOORD3)) * 2.0));
  c_33.w = tmpvar_2;
  c_1.w = c_33.w;
  c_1.xyz = (c_33.xyz + (col_4 * xlv_TEXCOORD4));
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
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_7.xyz;
  tmpvar_10 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_1.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_1.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_1.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_2 = tmpvar_14;
  tmpvar_6 = shlight_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec4 c_32;
  c_32.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD3)) * 2.0));
  c_32.w = tmpvar_2;
  c_1.w = c_32.w;
  c_1.xyz = (c_32.xyz + (col_4 * xlv_TEXCOORD4));
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
Vector 14 [unity_LightmapST]
Vector 15 [_Control_ST]
Vector 16 [_Splat0_ST]
Vector 17 [_Splat1_ST]
Vector 18 [_Splat2_ST]
Vector 19 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[14], c[14].zwzw;
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
Vector 12 [unity_LightmapST]
Vector 13 [_Control_ST]
Vector 14 [_Splat0_ST]
Vector 15 [_Splat1_ST]
Vector 16 [_Splat2_ST]
Vector 17 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
mad o1.zw, v3.xyxy, c14.xyxy, c14
mad o1.xy, v3, c13, c13.zwzw
mad o2.zw, v3.xyxy, c16.xyxy, c16
mad o2.xy, v3, c15, c15.zwzw
mad o3.xy, v3, c17, c17.zwzw
mad o4.xy, v4, c12, c12.zwzw
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  nrm_3 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_30;
  tmpvar_30 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_30;
  c_1.xyz = (col_4 * (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz));
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 normal_32;
  normal_32.xy = ((tmpvar_30.wy * 2.0) - 1.0);
  normal_32.z = sqrt((1.0 - clamp (dot (normal_32.xy, normal_32.xy), 0.0, 1.0)));
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
  c_1.xyz = (col_4 * ((8.0 * tmpvar_33.w) * tmpvar_33.xyz));
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D unity_Lightmap;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  nrm_3 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_30;
  tmpvar_30 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_30;
  c_1.xyz = (col_4 * (2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz));
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
Vector 14 [unity_LightmapST]
Vector 15 [_Control_ST]
Vector 16 [_Splat0_ST]
Vector 17 [_Splat1_ST]
Vector 18 [_Splat2_ST]
Vector 19 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[14], c[14].zwzw;
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
Vector 12 [unity_LightmapST]
Vector 13 [_Control_ST]
Vector 14 [_Splat0_ST]
Vector 15 [_Splat1_ST]
Vector 16 [_Splat2_ST]
Vector 17 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
mad o1.zw, v3.xyxy, c14.xyxy, c14
mad o1.xy, v3, c13, c13.zwzw
mad o2.zw, v3.xyxy, c16.xyxy, c16
mad o2.xy, v3, c15, c15.zwzw
mad o3.xy, v3, c17, c17.zwzw
mad o4.xy, v4, c12, c12.zwzw
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((tmpvar_30.xyz * 2.0) - 1.0);
  mat3 tmpvar_33;
  tmpvar_33[0].x = 0.816497;
  tmpvar_33[0].y = -0.408248;
  tmpvar_33[0].z = -0.408248;
  tmpvar_33[1].x = 0.0;
  tmpvar_33[1].y = 0.707107;
  tmpvar_33[1].z = -0.707107;
  tmpvar_33[2].x = 0.57735;
  tmpvar_33[2].y = 0.57735;
  tmpvar_33[2].z = 0.57735;
  mediump vec3 normal_34;
  normal_34 = tmpvar_32;
  mediump vec3 scalePerBasisVector_35;
  mediump vec3 lm_36;
  lowp vec3 tmpvar_37;
  tmpvar_37 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_36 = tmpvar_37;
  lowp vec3 tmpvar_38;
  tmpvar_38 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  scalePerBasisVector_35 = tmpvar_38;
  lm_36 = (lm_36 * dot (clamp ((tmpvar_33 * normal_34), 0.0, 1.0), scalePerBasisVector_35));
  mediump vec3 tmpvar_39;
  tmpvar_39 = (col_4 * lm_36);
  c_1.xyz = tmpvar_39;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 normal_32;
  normal_32.xy = ((tmpvar_30.wy * 2.0) - 1.0);
  normal_32.z = sqrt((1.0 - clamp (dot (normal_32.xy, normal_32.xy), 0.0, 1.0)));
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (unity_LightmapInd, xlv_TEXCOORD3);
  mat3 tmpvar_35;
  tmpvar_35[0].x = 0.816497;
  tmpvar_35[0].y = -0.408248;
  tmpvar_35[0].z = -0.408248;
  tmpvar_35[1].x = 0.0;
  tmpvar_35[1].y = 0.707107;
  tmpvar_35[1].z = -0.707107;
  tmpvar_35[2].x = 0.57735;
  tmpvar_35[2].y = 0.57735;
  tmpvar_35[2].z = 0.57735;
  mediump vec3 normal_36;
  normal_36 = normal_32;
  mediump vec3 scalePerBasisVector_37;
  mediump vec3 lm_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = ((8.0 * tmpvar_33.w) * tmpvar_33.xyz);
  lm_38 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = ((8.0 * tmpvar_34.w) * tmpvar_34.xyz);
  scalePerBasisVector_37 = tmpvar_40;
  lm_38 = (lm_38 * dot (clamp ((tmpvar_35 * normal_36), 0.0, 1.0), scalePerBasisVector_37));
  mediump vec3 tmpvar_41;
  tmpvar_41 = (col_4 * lm_38);
  c_1.xyz = tmpvar_41;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((tmpvar_30.xyz * 2.0) - 1.0);
  mat3 tmpvar_33;
  tmpvar_33[0].x = 0.816497;
  tmpvar_33[0].y = -0.408248;
  tmpvar_33[0].z = -0.408248;
  tmpvar_33[1].x = 0.0;
  tmpvar_33[1].y = 0.707107;
  tmpvar_33[1].z = -0.707107;
  tmpvar_33[2].x = 0.57735;
  tmpvar_33[2].y = 0.57735;
  tmpvar_33[2].z = 0.57735;
  mediump vec3 normal_34;
  normal_34 = tmpvar_32;
  mediump vec3 scalePerBasisVector_35;
  mediump vec3 lm_36;
  lowp vec3 tmpvar_37;
  tmpvar_37 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_36 = tmpvar_37;
  lowp vec3 tmpvar_38;
  tmpvar_38 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  scalePerBasisVector_35 = tmpvar_38;
  lm_36 = (lm_36 * dot (clamp ((tmpvar_33 * normal_34), 0.0, 1.0), scalePerBasisVector_35));
  mediump vec3 tmpvar_39;
  tmpvar_39 = (col_4 * lm_36);
  c_1.xyz = tmpvar_39;
  c_1.w = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 44 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_Control_ST]
Vector 24 [_Splat0_ST]
Vector 25 [_Splat1_ST]
Vector 26 [_Splat2_ST]
Vector 27 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[28] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..27] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[22].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[17];
DP4 R2.y, R0, c[16];
DP4 R2.x, R0, c[15];
MUL R0.y, R2.w, R2.w;
MAD R0.x, R0, R0, -R0.y;
DP4 R3.z, R1, c[20];
DP4 R3.y, R1, c[19];
DP4 R3.x, R1, c[18];
MUL R1.xyz, -vertex.normal.zxyw, c[0].yxyw;
ADD R2.xyz, R2, R3;
MUL R0.xyz, R0.x, c[21];
ADD result.texcoord[4].xyz, R2, R0;
MOV R0, c[14];
MAD R1.xyz, vertex.normal.yzxw, c[0].xyyw, R1;
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[3].y, R3, -R2;
MUL R2.xyz, R0.xyww, c[0].z;
DP3 result.texcoord[3].x, R3, R1;
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
DP3 result.texcoord[3].z, vertex.normal, R3;
ADD result.texcoord[5].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[26].xyxy, c[26];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[27], c[27].zwzw;
END
# 44 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 45 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_Control_ST]
Vector 24 [_Splat0_ST]
Vector 25 [_Splat1_ST]
Vector 26 [_Splat2_ST]
Vector 27 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c28, 0.00000000, 1.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c22.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c28.y
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.y, r2.w, r2.w
mad r0.x, r0, r0, -r0.y
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
add r1.xyz, r2, r3
mul r0.xyz, r0.x, c21
add o5.xyz, r1, r0
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
dp4 r4.y, c14, r0
mul r2.xyz, -v2.zxyw, c28.xyxw
mad r2.xyz, v2.yzxw, c28.yxxw, r2
mul r1.xyz, v2.zxyw, r2.yzxw
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
mov r1, c8
dp4 r4.x, c14, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c28.z
mul r1.y, r1, c12.x
dp3 o4.y, r4, -r3
dp3 o4.z, v2, r4
dp3 o4.x, r4, r2
mad o6.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o6.zw, r0
mad o1.zw, v3.xyxy, c24.xyxy, c24
mad o1.xy, v3, c23, c23.zwzw
mad o2.zw, v3.xyxy, c26.xyxy, c26
mad o2.xy, v3, c25, c25.zwzw
mad o3.xy, v3, c27, c27.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 38 math
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
Vector 0 [_WorldSpaceLightPos0]
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
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedlkiaccceigcclkkeaabcpgpabkankeihabaaaaaaeeaiaaaaadaaaaaa
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
aaklklklfdeieefchiagaaaaeaaaabaajoabaaaafjaaaaaeegiocaaaaaaaaaaa
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
diaaaaakhcaabaaaabaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaa
aaaaaaaaaaaaaaaadcaaaaanhcaabaaaabaaaaaacgbjbaaaacaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaiadpaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaajgbebaaaacaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
diaaaaajhcaabaaaadaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaadaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaadaaaaaadcaaaaalhcaabaaaadaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaadaaaaaadcaaaaal
hcaabaaaadaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaaicccabaaaaeaaaaaaegacbaiaebaaaaaaacaaaaaa
egacbaaaadaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaa
adaaaaaaapaaaaahbccabaaaaeaaaaaacgakbaaaabaaaaaaegaabaaaadaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
abaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
abaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaa
bbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaa
bbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaa
bbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaa
aaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaah
ccaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakbcaabaaa
abaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaa
dcaaaaakhccabaaaafaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
doaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform lowp vec4 _WorldSpaceLightPos0;
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
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_7.xyz;
  tmpvar_10 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_1.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_1.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_1.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_2 = tmpvar_14;
  tmpvar_6 = shlight_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp float tmpvar_32;
  mediump float lightShadowDataX_33;
  highp float dist_34;
  lowp float tmpvar_35;
  tmpvar_35 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_34 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = _LightShadowData.x;
  lightShadowDataX_33 = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = max (float((dist_34 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_33);
  tmpvar_32 = tmpvar_37;
  lowp vec4 c_38;
  c_38.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD3)) * tmpvar_32) * 2.0));
  c_38.w = tmpvar_2;
  c_1.w = c_38.w;
  c_1.xyz = (c_38.xyz + (col_4 * xlv_TEXCOORD4));
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
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  highp vec4 tmpvar_8;
  tmpvar_8 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_10 = tmpvar_7.xyz;
  tmpvar_11 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_10.x;
  tmpvar_12[0].y = tmpvar_11.x;
  tmpvar_12[0].z = tmpvar_1.x;
  tmpvar_12[1].x = tmpvar_10.y;
  tmpvar_12[1].y = tmpvar_11.y;
  tmpvar_12[1].z = tmpvar_1.y;
  tmpvar_12[2].x = tmpvar_10.z;
  tmpvar_12[2].y = tmpvar_11.z;
  tmpvar_12[2].z = tmpvar_1.z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = (tmpvar_9 * (tmpvar_1 * unity_Scale.w));
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_2 = tmpvar_15;
  tmpvar_6 = shlight_2;
  highp vec4 o_30;
  highp vec4 tmpvar_31;
  tmpvar_31 = (tmpvar_8 * 0.5);
  highp vec2 tmpvar_32;
  tmpvar_32.x = tmpvar_31.x;
  tmpvar_32.y = (tmpvar_31.y * _ProjectionParams.x);
  o_30.xy = (tmpvar_32 + tmpvar_31.w);
  o_30.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = o_30;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 normal_32;
  normal_32.xy = ((tmpvar_30.wy * 2.0) - 1.0);
  normal_32.z = sqrt((1.0 - clamp (dot (normal_32.xy, normal_32.xy), 0.0, 1.0)));
  lowp vec4 c_33;
  c_33.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (normal_32, xlv_TEXCOORD3)) * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x) * 2.0));
  c_33.w = tmpvar_2;
  c_1.w = c_33.w;
  c_1.xyz = (c_33.xyz + (col_4 * xlv_TEXCOORD4));
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
uniform lowp vec4 _WorldSpaceLightPos0;
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
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_7.xyz;
  tmpvar_10 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_1.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_1.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_1.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_2 = tmpvar_14;
  tmpvar_6 = shlight_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp float tmpvar_32;
  mediump float lightShadowDataX_33;
  highp float dist_34;
  lowp float tmpvar_35;
  tmpvar_35 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_34 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = _LightShadowData.x;
  lightShadowDataX_33 = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = max (float((dist_34 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_33);
  tmpvar_32 = tmpvar_37;
  lowp vec4 c_38;
  c_38.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD3)) * tmpvar_32) * 2.0));
  c_38.w = tmpvar_2;
  c_1.w = c_38.w;
  c_1.xyz = (c_38.xyz + (col_4 * xlv_TEXCOORD4));
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
Vector 13 [_ProjectionParams]
Vector 15 [unity_LightmapST]
Vector 16 [_Control_ST]
Vector 17 [_Splat0_ST]
Vector 18 [_Splat1_ST]
Vector 19 [_Splat2_ST]
Vector 20 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[21] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[17].xyxy, c[17];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[15], c[15].zwzw;
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
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_LightmapST]
Vector 15 [_Control_ST]
Vector 16 [_Splat0_ST]
Vector 17 [_Splat1_ST]
Vector 18 [_Splat2_ST]
Vector 19 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c20, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c20.x
mul r1.y, r1, c12.x
mad o5.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o5.zw, r0
mad o1.zw, v3.xyxy, c16.xyxy, c16
mad o1.xy, v3, c15, c15.zwzw
mad o2.zw, v3.xyxy, c18.xyxy, c18
mad o2.xy, v3, c17, c17.zwzw
mad o3.xy, v3, c19, c19.zwzw
mad o4.xy, v4, c14, c14.zwzw
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  nrm_3 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_30;
  tmpvar_30 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_30;
  lowp float tmpvar_31;
  mediump float lightShadowDataX_32;
  highp float dist_33;
  lowp float tmpvar_34;
  tmpvar_34 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4).x;
  dist_33 = tmpvar_34;
  highp float tmpvar_35;
  tmpvar_35 = _LightShadowData.x;
  lightShadowDataX_32 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = max (float((dist_33 > (xlv_TEXCOORD4.z / xlv_TEXCOORD4.w))), lightShadowDataX_32);
  tmpvar_31 = tmpvar_36;
  c_1.xyz = (col_4 * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz), vec3((tmpvar_31 * 2.0))));
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 normal_32;
  normal_32.xy = ((tmpvar_30.wy * 2.0) - 1.0);
  normal_32.z = sqrt((1.0 - clamp (dot (normal_32.xy, normal_32.xy), 0.0, 1.0)));
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4);
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
  lowp vec3 tmpvar_35;
  tmpvar_35 = ((8.0 * tmpvar_34.w) * tmpvar_34.xyz);
  c_1.xyz = (col_4 * max (min (tmpvar_35, ((tmpvar_33.x * 2.0) * tmpvar_34.xyz)), (tmpvar_35 * tmpvar_33.x)));
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  nrm_3 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_30;
  tmpvar_30 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_30;
  lowp float tmpvar_31;
  mediump float lightShadowDataX_32;
  highp float dist_33;
  lowp float tmpvar_34;
  tmpvar_34 = textureProj (_ShadowMapTexture, xlv_TEXCOORD4).x;
  dist_33 = tmpvar_34;
  highp float tmpvar_35;
  tmpvar_35 = _LightShadowData.x;
  lightShadowDataX_32 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = max (float((dist_33 > (xlv_TEXCOORD4.z / xlv_TEXCOORD4.w))), lightShadowDataX_32);
  tmpvar_31 = tmpvar_36;
  c_1.xyz = (col_4 * min ((2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz), vec3((tmpvar_31 * 2.0))));
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
Vector 13 [_ProjectionParams]
Vector 15 [unity_LightmapST]
Vector 16 [_Control_ST]
Vector 17 [_Splat0_ST]
Vector 18 [_Splat1_ST]
Vector 19 [_Splat2_ST]
Vector 20 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[21] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[17].xyxy, c[17];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[15], c[15].zwzw;
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
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_LightmapST]
Vector 15 [_Control_ST]
Vector 16 [_Splat0_ST]
Vector 17 [_Splat1_ST]
Vector 18 [_Splat2_ST]
Vector 19 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c20, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c20.x
mul r1.y, r1, c12.x
mad o5.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o5.zw, r0
mad o1.zw, v3.xyxy, c16.xyxy, c16
mad o1.xy, v3, c15, c15.zwzw
mad o2.zw, v3.xyxy, c18.xyxy, c18
mad o2.xy, v3, c17, c17.zwzw
mad o3.xy, v3, c19, c19.zwzw
mad o4.xy, v4, c14, c14.zwzw
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((tmpvar_30.xyz * 2.0) - 1.0);
  lowp float tmpvar_33;
  mediump float lightShadowDataX_34;
  highp float dist_35;
  lowp float tmpvar_36;
  tmpvar_36 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4).x;
  dist_35 = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = _LightShadowData.x;
  lightShadowDataX_34 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = max (float((dist_35 > (xlv_TEXCOORD4.z / xlv_TEXCOORD4.w))), lightShadowDataX_34);
  tmpvar_33 = tmpvar_38;
  mat3 tmpvar_39;
  tmpvar_39[0].x = 0.816497;
  tmpvar_39[0].y = -0.408248;
  tmpvar_39[0].z = -0.408248;
  tmpvar_39[1].x = 0.0;
  tmpvar_39[1].y = 0.707107;
  tmpvar_39[1].z = -0.707107;
  tmpvar_39[2].x = 0.57735;
  tmpvar_39[2].y = 0.57735;
  tmpvar_39[2].z = 0.57735;
  mediump vec3 normal_40;
  normal_40 = tmpvar_32;
  mediump vec3 scalePerBasisVector_41;
  mediump vec3 lm_42;
  lowp vec3 tmpvar_43;
  tmpvar_43 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_42 = tmpvar_43;
  lowp vec3 tmpvar_44;
  tmpvar_44 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  scalePerBasisVector_41 = tmpvar_44;
  lm_42 = (lm_42 * dot (clamp ((tmpvar_39 * normal_40), 0.0, 1.0), scalePerBasisVector_41));
  lowp vec3 tmpvar_45;
  tmpvar_45 = vec3((tmpvar_33 * 2.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (col_4 * min (lm_42, tmpvar_45));
  c_1.xyz = tmpvar_46;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 normal_32;
  normal_32.xy = ((tmpvar_30.wy * 2.0) - 1.0);
  normal_32.z = sqrt((1.0 - clamp (dot (normal_32.xy, normal_32.xy), 0.0, 1.0)));
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4);
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (unity_LightmapInd, xlv_TEXCOORD3);
  mat3 tmpvar_36;
  tmpvar_36[0].x = 0.816497;
  tmpvar_36[0].y = -0.408248;
  tmpvar_36[0].z = -0.408248;
  tmpvar_36[1].x = 0.0;
  tmpvar_36[1].y = 0.707107;
  tmpvar_36[1].z = -0.707107;
  tmpvar_36[2].x = 0.57735;
  tmpvar_36[2].y = 0.57735;
  tmpvar_36[2].z = 0.57735;
  mediump vec3 normal_37;
  normal_37 = normal_32;
  mediump vec3 scalePerBasisVector_38;
  mediump vec3 lm_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = ((8.0 * tmpvar_34.w) * tmpvar_34.xyz);
  lm_39 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = ((8.0 * tmpvar_35.w) * tmpvar_35.xyz);
  scalePerBasisVector_38 = tmpvar_41;
  lm_39 = (lm_39 * dot (clamp ((tmpvar_36 * normal_37), 0.0, 1.0), scalePerBasisVector_38));
  lowp vec3 arg1_42;
  arg1_42 = ((tmpvar_33.x * 2.0) * tmpvar_34.xyz);
  mediump vec3 tmpvar_43;
  tmpvar_43 = (col_4 * max (min (lm_39, arg1_42), (lm_39 * tmpvar_33.x)));
  c_1.xyz = tmpvar_43;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((tmpvar_30.xyz * 2.0) - 1.0);
  lowp float tmpvar_33;
  mediump float lightShadowDataX_34;
  highp float dist_35;
  lowp float tmpvar_36;
  tmpvar_36 = textureProj (_ShadowMapTexture, xlv_TEXCOORD4).x;
  dist_35 = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = _LightShadowData.x;
  lightShadowDataX_34 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = max (float((dist_35 > (xlv_TEXCOORD4.z / xlv_TEXCOORD4.w))), lightShadowDataX_34);
  tmpvar_33 = tmpvar_38;
  mat3 tmpvar_39;
  tmpvar_39[0].x = 0.816497;
  tmpvar_39[0].y = -0.408248;
  tmpvar_39[0].z = -0.408248;
  tmpvar_39[1].x = 0.0;
  tmpvar_39[1].y = 0.707107;
  tmpvar_39[1].z = -0.707107;
  tmpvar_39[2].x = 0.57735;
  tmpvar_39[2].y = 0.57735;
  tmpvar_39[2].z = 0.57735;
  mediump vec3 normal_40;
  normal_40 = tmpvar_32;
  mediump vec3 scalePerBasisVector_41;
  mediump vec3 lm_42;
  lowp vec3 tmpvar_43;
  tmpvar_43 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_42 = tmpvar_43;
  lowp vec3 tmpvar_44;
  tmpvar_44 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  scalePerBasisVector_41 = tmpvar_44;
  lm_42 = (lm_42 * dot (clamp ((tmpvar_39 * normal_40), 0.0, 1.0), scalePerBasisVector_41));
  lowp vec3 tmpvar_45;
  tmpvar_45 = vec3((tmpvar_33 * 2.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (col_4 * min (lm_42, tmpvar_45));
  c_1.xyz = tmpvar_46;
  c_1.w = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 69 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_4LightPosX0]
Vector 15 [unity_4LightPosY0]
Vector 16 [unity_4LightPosZ0]
Vector 17 [unity_4LightAtten0]
Vector 18 [unity_LightColor0]
Vector 19 [unity_LightColor1]
Vector 20 [unity_LightColor2]
Vector 21 [unity_LightColor3]
Vector 22 [unity_SHAr]
Vector 23 [unity_SHAg]
Vector 24 [unity_SHAb]
Vector 25 [unity_SHBr]
Vector 26 [unity_SHBg]
Vector 27 [unity_SHBb]
Vector 28 [unity_SHC]
Vector 29 [unity_Scale]
Vector 30 [_Control_ST]
Vector 31 [_Splat0_ST]
Vector 32 [_Splat1_ST]
Vector 33 [_Splat2_ST]
Vector 34 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[35] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..34] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[29].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[15];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[14];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[16];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[17];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[19];
MAD R1.xyz, R0.x, c[18], R1;
MAD R0.xyz, R0.z, c[20], R1;
MAD R1.xyz, R0.w, c[21], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[27];
DP4 R3.y, R0, c[26];
DP4 R3.x, R0, c[25];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[24];
DP4 R2.y, R4, c[23];
DP4 R2.x, R4, c[22];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[28];
ADD R2.xyz, R2, R3;
ADD result.texcoord[4].xyz, R2, R1;
MOV R1, c[13];
MUL R0.xyz, -vertex.normal.zxyw, c[0].yxyw;
MAD R0.xyz, vertex.normal.yzxw, c[0].xyyw, R0;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
DP4 R3.z, R1, c[11];
DP4 R3.y, R1, c[10];
DP4 R3.x, R1, c[9];
MAD R2.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
DP3 result.texcoord[3].y, R3, -R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, R3, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[31].xyxy, c[31];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[30], c[30].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[33].xyxy, c[33];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[32], c[32].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[34], c[34].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 69 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 71 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_4LightPosX0]
Vector 14 [unity_4LightPosY0]
Vector 15 [unity_4LightPosZ0]
Vector 16 [unity_4LightAtten0]
Vector 17 [unity_LightColor0]
Vector 18 [unity_LightColor1]
Vector 19 [unity_LightColor2]
Vector 20 [unity_LightColor3]
Vector 21 [unity_SHAr]
Vector 22 [unity_SHAg]
Vector 23 [unity_SHAb]
Vector 24 [unity_SHBr]
Vector 25 [unity_SHBg]
Vector 26 [unity_SHBb]
Vector 27 [unity_SHC]
Vector 28 [unity_Scale]
Vector 29 [_Control_ST]
Vector 30 [_Splat0_ST]
Vector 31 [_Splat1_ST]
Vector 32 [_Splat2_ST]
Vector 33 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c34, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c28.w
dp4 r0.x, v0, c5
add r1, -r0.x, c14
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c13
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c34.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c15
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c16
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c34.x
dp4 r2.z, r4, c23
dp4 r2.y, r4, c22
dp4 r2.x, r4, c21
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c34.y
mul r0, r0, r1
mul r1.xyz, r0.y, c18
mad r1.xyz, r0.x, c17, r1
mad r0.xyz, r0.z, c19, r1
mad r1.xyz, r0.w, c20, r0
mul r0, r4.xyzz, r4.yzzx
dp4 r3.z, r0, c26
dp4 r3.y, r0, c25
dp4 r3.x, r0, c24
mul r1.w, r3, r3
mad r0.x, r4, r4, -r1.w
add r2.xyz, r2, r3
mul r3.xyz, r0.x, c27
add r2.xyz, r2, r3
add o5.xyz, r2, r1
mov r1, c10
dp4 r4.z, c12, r1
mul r0.xyz, -v2.zxyw, c34.yxyw
mad r0.xyz, v2.yzxw, c34.xyyw, r0
mul r2.xyz, v2.zxyw, r0.yzxw
mad r3.xyz, v2.yzxw, r0.zxyw, -r2
mov r1, c9
mov r2, c8
dp4 r4.y, c12, r1
dp4 r4.x, c12, r2
dp3 o4.y, r4, -r3
dp3 o4.z, v2, r4
dp3 o4.x, r4, r0
mad o1.zw, v3.xyxy, c30.xyxy, c30
mad o1.xy, v3, c29, c29.zwzw
mad o2.zw, v3.xyxy, c32.xyxy, c32
mad o2.xy, v3, c31, c31.zwzw
mad o3.xy, v3, c33, c33.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 59 math
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
Vector 0 [_WorldSpaceLightPos0]
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
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecednckonkimacmmkeplehfajmkpffmgnfbdabaaaaaaneakaaaaadaaaaaa
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
feeffiedepepfceeaaklklklfdeieefccaajaaaaeaaaabaaeiacaaaafjaaaaae
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
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaakhcaabaaa
aaaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaa
dcaaaaanhcaabaaaaaaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaiadpaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaaaaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaa
acaaaaaajgaebaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaajhcaabaaa
acaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaa
baaaaaaicccabaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaaacaaaaaa
baaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaaapaaaaah
bccabaaaaeaaaaaacgakbaaaaaaaaaaaegaabaaaacaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaabbaaaaai
bcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaa
adaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaah
pcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaa
agaabaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaa
acaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaa
egaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaa
dcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaabaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaa
ajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaafaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform lowp vec4 _WorldSpaceLightPos0;
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
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_10 = tmpvar_7.xyz;
  tmpvar_11 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_10.x;
  tmpvar_12[0].y = tmpvar_11.x;
  tmpvar_12[0].z = tmpvar_1.x;
  tmpvar_12[1].x = tmpvar_10.y;
  tmpvar_12[1].y = tmpvar_11.y;
  tmpvar_12[1].z = tmpvar_1.y;
  tmpvar_12[2].x = tmpvar_10.z;
  tmpvar_12[2].y = tmpvar_11.z;
  tmpvar_12[2].z = tmpvar_1.z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_9;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_2 = tmpvar_15;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_9.x) + (tmpvar_32 * tmpvar_9.y)) + (tmpvar_33 * tmpvar_9.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec4 c_32;
  c_32.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD3)) * 2.0));
  c_32.w = tmpvar_2;
  c_1.w = c_32.w;
  c_1.xyz = (c_32.xyz + (col_4 * xlv_TEXCOORD4));
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
uniform lowp vec4 _WorldSpaceLightPos0;
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
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_10 = tmpvar_7.xyz;
  tmpvar_11 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_10.x;
  tmpvar_12[0].y = tmpvar_11.x;
  tmpvar_12[0].z = tmpvar_1.x;
  tmpvar_12[1].x = tmpvar_10.y;
  tmpvar_12[1].y = tmpvar_11.y;
  tmpvar_12[1].z = tmpvar_1.y;
  tmpvar_12[2].x = tmpvar_10.z;
  tmpvar_12[2].y = tmpvar_11.z;
  tmpvar_12[2].z = tmpvar_1.z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_9;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_2 = tmpvar_15;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_9.x) + (tmpvar_32 * tmpvar_9.y)) + (tmpvar_33 * tmpvar_9.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 normal_32;
  normal_32.xy = ((tmpvar_30.wy * 2.0) - 1.0);
  normal_32.z = sqrt((1.0 - clamp (dot (normal_32.xy, normal_32.xy), 0.0, 1.0)));
  lowp vec4 c_33;
  c_33.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (normal_32, xlv_TEXCOORD3)) * 2.0));
  c_33.w = tmpvar_2;
  c_1.w = c_33.w;
  c_1.xyz = (c_33.xyz + (col_4 * xlv_TEXCOORD4));
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
uniform lowp vec4 _WorldSpaceLightPos0;
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
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_10 = tmpvar_7.xyz;
  tmpvar_11 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_10.x;
  tmpvar_12[0].y = tmpvar_11.x;
  tmpvar_12[0].z = tmpvar_1.x;
  tmpvar_12[1].x = tmpvar_10.y;
  tmpvar_12[1].y = tmpvar_11.y;
  tmpvar_12[1].z = tmpvar_1.y;
  tmpvar_12[2].x = tmpvar_10.z;
  tmpvar_12[2].y = tmpvar_11.z;
  tmpvar_12[2].z = tmpvar_1.z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_9;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_2 = tmpvar_15;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_9.x) + (tmpvar_32 * tmpvar_9.y)) + (tmpvar_33 * tmpvar_9.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec4 c_32;
  c_32.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD3)) * 2.0));
  c_32.w = tmpvar_2;
  c_1.w = c_32.w;
  c_1.xyz = (c_32.xyz + (col_4 * xlv_TEXCOORD4));
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 75 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [unity_Scale]
Vector 31 [_Control_ST]
Vector 32 [_Splat0_ST]
Vector 33 [_Splat1_ST]
Vector 34 [_Splat2_ST]
Vector 35 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[36] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..35] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[30].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[16];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[15];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[17];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[18];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MAD R1.xyz, R0.w, c[22], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[28];
DP4 R3.y, R0, c[27];
DP4 R3.x, R0, c[26];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[25];
DP4 R2.y, R4, c[24];
DP4 R2.x, R4, c[23];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[29];
ADD R2.xyz, R2, R3;
ADD result.texcoord[4].xyz, R2, R1;
MOV R1, c[14];
MUL R0.xyz, -vertex.normal.zxyw, c[0].yxyw;
MAD R0.xyz, vertex.normal.yzxw, c[0].xyyw, R0;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
DP4 R3.z, R1, c[11];
DP4 R3.y, R1, c[10];
DP4 R3.x, R1, c[9];
MAD R2.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
DP3 result.texcoord[3].y, R3, -R2;
MUL R2.xyz, R1.xyww, c[0].z;
DP3 result.texcoord[3].x, R3, R0;
MOV R0.x, R2;
MUL R0.y, R2, c[13].x;
DP3 result.texcoord[3].z, vertex.normal, R3;
ADD result.texcoord[5].xy, R0, R2.z;
MOV result.position, R1;
MOV result.texcoord[5].zw, R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[32].xyxy, c[32];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[34].xyxy, c[34];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[33], c[33].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[35], c[35].zwzw;
END
# 75 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 77 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [unity_Scale]
Vector 31 [_Control_ST]
Vector 32 [_Splat0_ST]
Vector 33 [_Splat1_ST]
Vector 34 [_Splat2_ST]
Vector 35 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c36, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c30.w
dp4 r0.x, v0, c5
add r1, -r0.x, c16
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c15
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c36.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c17
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c18
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c36.x
dp4 r2.z, r4, c25
dp4 r2.y, r4, c24
dp4 r2.x, r4, c23
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c36.y
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r0.xyz, r0.z, c21, r1
mad r1.xyz, r0.w, c22, r0
mul r0, r4.xyzz, r4.yzzx
dp4 r3.z, r0, c28
dp4 r3.y, r0, c27
dp4 r3.x, r0, c26
mul r1.w, r3, r3
mad r0.x, r4, r4, -r1.w
add r2.xyz, r2, r3
mul r3.xyz, r0.x, c29
add r2.xyz, r2, r3
add o5.xyz, r2, r1
mov r1, c10
dp4 r4.z, c14, r1
mov r1, c9
dp4 r4.y, c14, r1
mul r0.xyz, -v2.zxyw, c36.yxyw
mad r0.xyz, v2.yzxw, c36.xyyw, r0
mul r2.xyz, v2.zxyw, r0.yzxw
mad r3.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r4.x, c14, r2
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r2.xyz, r1.xyww, c36.z
dp3 o4.x, r4, r0
mov r0.x, r2
mul r0.y, r2, c12.x
dp3 o4.y, r4, -r3
dp3 o4.z, v2, r4
mad o6.xy, r2.z, c13.zwzw, r0
mov o0, r1
mov o6.zw, r1
mad o1.zw, v3.xyxy, c32.xyxy, c32
mad o1.xy, v3, c31, c31.zwzw
mad o2.zw, v3.xyxy, c34.xyxy, c34
mad o2.xy, v3, c33, c33.zwzw
mad o3.xy, v3, c35, c35.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 62 math
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
Vector 0 [_WorldSpaceLightPos0]
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
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedmmpmhkjkakakfabaggebgmmlonackddlabaaaaaajealaaaaadaaaaaa
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
aaklklklfdeieefcmiajaaaaeaaaabaahcacaaaafjaaaaaeegiocaaaaaaaaaaa
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
diaaaaakhcaabaaaabaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaa
aaaaaaaaaaaaaaaadcaaaaanhcaabaaaabaaaaaacgbjbaaaacaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaiadpaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaajgbebaaaacaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
diaaaaajhcaabaaaadaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaadaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaadaaaaaadcaaaaalhcaabaaaadaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaadaaaaaadcaaaaal
hcaabaaaadaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaaicccabaaaaeaaaaaaegacbaiaebaaaaaaacaaaaaa
egacbaaaadaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaa
adaaaaaaapaaaaahbccabaaaaeaaaaaacgakbaaaabaaaaaaegaabaaaadaaaaaa
dgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaacaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaadaaaaaa
fgafbaaaacaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaacaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaacaaaaaaegadbaaa
acaaaaaabbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
abaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
abaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaa
bbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaa
bbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaa
bbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaa
aaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaah
icaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaa
abaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaa
adaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaa
diaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaaaaaaaaj
pcaabaaaagaaaaaaagaabaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaacaaaaaa
aaaaaaajpcaabaaaadaaaaaakgakbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaa
aeaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaagaaaaaaagaabaaaabaaaaaa
egaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaa
abaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaagaaaaaa
egaobaaaagaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaaaeaaaaaa
egaobaaaadaaaaaadcaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaa
acaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaak
pcaabaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaa
adaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaadaaaaaaegaobaaa
abaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaa
ahaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaa
abaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
aiaaaaaakgakbaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaajaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaah
hccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform lowp vec4 _WorldSpaceLightPos0;
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
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_10 = tmpvar_7.xyz;
  tmpvar_11 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_10.x;
  tmpvar_12[0].y = tmpvar_11.x;
  tmpvar_12[0].z = tmpvar_1.x;
  tmpvar_12[1].x = tmpvar_10.y;
  tmpvar_12[1].y = tmpvar_11.y;
  tmpvar_12[1].z = tmpvar_1.y;
  tmpvar_12[2].x = tmpvar_10.z;
  tmpvar_12[2].y = tmpvar_11.z;
  tmpvar_12[2].z = tmpvar_1.z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_9;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_2 = tmpvar_15;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_9.x) + (tmpvar_32 * tmpvar_9.y)) + (tmpvar_33 * tmpvar_9.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp float tmpvar_32;
  mediump float lightShadowDataX_33;
  highp float dist_34;
  lowp float tmpvar_35;
  tmpvar_35 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_34 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = _LightShadowData.x;
  lightShadowDataX_33 = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = max (float((dist_34 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_33);
  tmpvar_32 = tmpvar_37;
  lowp vec4 c_38;
  c_38.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD3)) * tmpvar_32) * 2.0));
  c_38.w = tmpvar_2;
  c_1.w = c_38.w;
  c_1.xyz = (c_38.xyz + (col_4 * xlv_TEXCOORD4));
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
uniform lowp vec4 _WorldSpaceLightPos0;
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
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  highp vec4 tmpvar_8;
  tmpvar_8 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_11 = tmpvar_7.xyz;
  tmpvar_12 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_11.x;
  tmpvar_13[0].y = tmpvar_12.x;
  tmpvar_13[0].z = tmpvar_1.x;
  tmpvar_13[1].x = tmpvar_11.y;
  tmpvar_13[1].y = tmpvar_12.y;
  tmpvar_13[1].z = tmpvar_1.y;
  tmpvar_13[2].x = tmpvar_11.z;
  tmpvar_13[2].y = tmpvar_12.z;
  tmpvar_13[2].z = tmpvar_1.z;
  highp vec3 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = tmpvar_10;
  mediump vec3 tmpvar_16;
  mediump vec4 normal_17;
  normal_17 = tmpvar_15;
  highp float vC_18;
  mediump vec3 x3_19;
  mediump vec3 x2_20;
  mediump vec3 x1_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAr, normal_17);
  x1_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAg, normal_17);
  x1_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAb, normal_17);
  x1_21.z = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = (normal_17.xyzz * normal_17.yzzx);
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBr, tmpvar_25);
  x2_20.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBg, tmpvar_25);
  x2_20.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBb, tmpvar_25);
  x2_20.z = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = ((normal_17.x * normal_17.x) - (normal_17.y * normal_17.y));
  vC_18 = tmpvar_29;
  highp vec3 tmpvar_30;
  tmpvar_30 = (unity_SHC.xyz * vC_18);
  x3_19 = tmpvar_30;
  tmpvar_16 = ((x1_21 + x2_20) + x3_19);
  shlight_2 = tmpvar_16;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosX0 - tmpvar_31.x);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosY0 - tmpvar_31.y);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosZ0 - tmpvar_31.z);
  highp vec4 tmpvar_35;
  tmpvar_35 = (((tmpvar_32 * tmpvar_32) + (tmpvar_33 * tmpvar_33)) + (tmpvar_34 * tmpvar_34));
  highp vec4 tmpvar_36;
  tmpvar_36 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_32 * tmpvar_10.x) + (tmpvar_33 * tmpvar_10.y)) + (tmpvar_34 * tmpvar_10.z)) * inversesqrt(tmpvar_35))) * (1.0/((1.0 + (tmpvar_35 * unity_4LightAtten0)))));
  highp vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_36.x) + (unity_LightColor[1].xyz * tmpvar_36.y)) + (unity_LightColor[2].xyz * tmpvar_36.z)) + (unity_LightColor[3].xyz * tmpvar_36.w)));
  tmpvar_6 = tmpvar_37;
  highp vec4 o_38;
  highp vec4 tmpvar_39;
  tmpvar_39 = (tmpvar_8 * 0.5);
  highp vec2 tmpvar_40;
  tmpvar_40.x = tmpvar_39.x;
  tmpvar_40.y = (tmpvar_39.y * _ProjectionParams.x);
  o_38.xy = (tmpvar_40 + tmpvar_39.w);
  o_38.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = o_38;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 normal_32;
  normal_32.xy = ((tmpvar_30.wy * 2.0) - 1.0);
  normal_32.z = sqrt((1.0 - clamp (dot (normal_32.xy, normal_32.xy), 0.0, 1.0)));
  lowp vec4 c_33;
  c_33.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (normal_32, xlv_TEXCOORD3)) * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x) * 2.0));
  c_33.w = tmpvar_2;
  c_1.w = c_33.w;
  c_1.xyz = (c_33.xyz + (col_4 * xlv_TEXCOORD4));
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
uniform lowp vec4 _WorldSpaceLightPos0;
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
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_10 = tmpvar_7.xyz;
  tmpvar_11 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_10.x;
  tmpvar_12[0].y = tmpvar_11.x;
  tmpvar_12[0].z = tmpvar_1.x;
  tmpvar_12[1].x = tmpvar_10.y;
  tmpvar_12[1].y = tmpvar_11.y;
  tmpvar_12[1].z = tmpvar_1.y;
  tmpvar_12[2].x = tmpvar_10.z;
  tmpvar_12[2].y = tmpvar_11.z;
  tmpvar_12[2].z = tmpvar_1.z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_9;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_2 = tmpvar_15;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_9.x) + (tmpvar_32 * tmpvar_9.y)) + (tmpvar_33 * tmpvar_9.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp float tmpvar_32;
  mediump float lightShadowDataX_33;
  highp float dist_34;
  lowp float tmpvar_35;
  tmpvar_35 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_34 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = _LightShadowData.x;
  lightShadowDataX_33 = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = max (float((dist_34 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_33);
  tmpvar_32 = tmpvar_37;
  lowp vec4 c_38;
  c_38.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD3)) * tmpvar_32) * 2.0));
  c_38.w = tmpvar_2;
  c_1.w = c_38.w;
  c_1.xyz = (c_38.xyz + (col_4 * xlv_TEXCOORD4));
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
uniform lowp vec4 _WorldSpaceLightPos0;
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
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_7.xyz;
  tmpvar_10 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_1.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_1.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_1.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_2 = tmpvar_14;
  tmpvar_6 = shlight_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp float shadow_32;
  lowp float tmpvar_33;
  tmpvar_33 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_34;
  tmpvar_34 = (_LightShadowData.x + (tmpvar_33 * (1.0 - _LightShadowData.x)));
  shadow_32 = tmpvar_34;
  lowp vec4 c_35;
  c_35.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD3)) * shadow_32) * 2.0));
  c_35.w = tmpvar_2;
  c_1.w = c_35.w;
  c_1.xyz = (c_35.xyz + (col_4 * xlv_TEXCOORD4));
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
uniform lowp vec4 _WorldSpaceLightPos0;
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
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_7.xyz;
  tmpvar_10 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_1.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_1.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_1.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_2 = tmpvar_14;
  tmpvar_6 = shlight_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp float shadow_32;
  mediump float tmpvar_33;
  tmpvar_33 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_32 = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (_LightShadowData.x + (shadow_32 * (1.0 - _LightShadowData.x)));
  shadow_32 = tmpvar_34;
  lowp vec4 c_35;
  c_35.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD3)) * shadow_32) * 2.0));
  c_35.w = tmpvar_2;
  c_1.w = c_35.w;
  c_1.xyz = (c_35.xyz + (col_4 * xlv_TEXCOORD4));
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  nrm_3 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_30;
  tmpvar_30 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_30;
  lowp float shadow_31;
  lowp float tmpvar_32;
  tmpvar_32 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD4.xyz);
  highp float tmpvar_33;
  tmpvar_33 = (_LightShadowData.x + (tmpvar_32 * (1.0 - _LightShadowData.x)));
  shadow_31 = tmpvar_33;
  c_1.xyz = (col_4 * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz), vec3((shadow_31 * 2.0))));
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  nrm_3 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_30;
  tmpvar_30 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_30;
  lowp float shadow_31;
  mediump float tmpvar_32;
  tmpvar_32 = texture (_ShadowMapTexture, xlv_TEXCOORD4.xyz);
  shadow_31 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (_LightShadowData.x + (shadow_31 * (1.0 - _LightShadowData.x)));
  shadow_31 = tmpvar_33;
  c_1.xyz = (col_4 * min ((2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz), vec3((shadow_31 * 2.0))));
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((tmpvar_30.xyz * 2.0) - 1.0);
  lowp float shadow_33;
  lowp float tmpvar_34;
  tmpvar_34 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD4.xyz);
  highp float tmpvar_35;
  tmpvar_35 = (_LightShadowData.x + (tmpvar_34 * (1.0 - _LightShadowData.x)));
  shadow_33 = tmpvar_35;
  mat3 tmpvar_36;
  tmpvar_36[0].x = 0.816497;
  tmpvar_36[0].y = -0.408248;
  tmpvar_36[0].z = -0.408248;
  tmpvar_36[1].x = 0.0;
  tmpvar_36[1].y = 0.707107;
  tmpvar_36[1].z = -0.707107;
  tmpvar_36[2].x = 0.57735;
  tmpvar_36[2].y = 0.57735;
  tmpvar_36[2].z = 0.57735;
  mediump vec3 normal_37;
  normal_37 = tmpvar_32;
  mediump vec3 scalePerBasisVector_38;
  mediump vec3 lm_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_39 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  scalePerBasisVector_38 = tmpvar_41;
  lm_39 = (lm_39 * dot (clamp ((tmpvar_36 * normal_37), 0.0, 1.0), scalePerBasisVector_38));
  lowp vec3 tmpvar_42;
  tmpvar_42 = vec3((shadow_33 * 2.0));
  mediump vec3 tmpvar_43;
  tmpvar_43 = (col_4 * min (lm_39, tmpvar_42));
  c_1.xyz = tmpvar_43;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp float tmpvar_2;
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((tmpvar_30.xyz * 2.0) - 1.0);
  lowp float shadow_33;
  mediump float tmpvar_34;
  tmpvar_34 = texture (_ShadowMapTexture, xlv_TEXCOORD4.xyz);
  shadow_33 = tmpvar_34;
  highp float tmpvar_35;
  tmpvar_35 = (_LightShadowData.x + (shadow_33 * (1.0 - _LightShadowData.x)));
  shadow_33 = tmpvar_35;
  mat3 tmpvar_36;
  tmpvar_36[0].x = 0.816497;
  tmpvar_36[0].y = -0.408248;
  tmpvar_36[0].z = -0.408248;
  tmpvar_36[1].x = 0.0;
  tmpvar_36[1].y = 0.707107;
  tmpvar_36[1].z = -0.707107;
  tmpvar_36[2].x = 0.57735;
  tmpvar_36[2].y = 0.57735;
  tmpvar_36[2].z = 0.57735;
  mediump vec3 normal_37;
  normal_37 = tmpvar_32;
  mediump vec3 scalePerBasisVector_38;
  mediump vec3 lm_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_39 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  scalePerBasisVector_38 = tmpvar_41;
  lm_39 = (lm_39 * dot (clamp ((tmpvar_36 * normal_37), 0.0, 1.0), scalePerBasisVector_38));
  lowp vec3 tmpvar_42;
  tmpvar_42 = vec3((shadow_33 * 2.0));
  mediump vec3 tmpvar_43;
  tmpvar_43 = (col_4 * min (lm_39, tmpvar_42));
  c_1.xyz = tmpvar_43;
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
uniform lowp vec4 _WorldSpaceLightPos0;
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
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_10 = tmpvar_7.xyz;
  tmpvar_11 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_10.x;
  tmpvar_12[0].y = tmpvar_11.x;
  tmpvar_12[0].z = tmpvar_1.x;
  tmpvar_12[1].x = tmpvar_10.y;
  tmpvar_12[1].y = tmpvar_11.y;
  tmpvar_12[1].z = tmpvar_1.y;
  tmpvar_12[2].x = tmpvar_10.z;
  tmpvar_12[2].y = tmpvar_11.z;
  tmpvar_12[2].z = tmpvar_1.z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_9;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_2 = tmpvar_15;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_9.x) + (tmpvar_32 * tmpvar_9.y)) + (tmpvar_33 * tmpvar_9.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp float shadow_32;
  lowp float tmpvar_33;
  tmpvar_33 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_34;
  tmpvar_34 = (_LightShadowData.x + (tmpvar_33 * (1.0 - _LightShadowData.x)));
  shadow_32 = tmpvar_34;
  lowp vec4 c_35;
  c_35.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD3)) * shadow_32) * 2.0));
  c_35.w = tmpvar_2;
  c_1.w = c_35.w;
  c_1.xyz = (c_35.xyz + (col_4 * xlv_TEXCOORD4));
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
uniform lowp vec4 _WorldSpaceLightPos0;
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
uniform highp mat4 _World2Object;
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
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec3 shlight_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_10 = tmpvar_7.xyz;
  tmpvar_11 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_10.x;
  tmpvar_12[0].y = tmpvar_11.x;
  tmpvar_12[0].z = tmpvar_1.x;
  tmpvar_12[1].x = tmpvar_10.y;
  tmpvar_12[1].y = tmpvar_11.y;
  tmpvar_12[1].z = tmpvar_1.y;
  tmpvar_12[2].x = tmpvar_10.z;
  tmpvar_12[2].y = tmpvar_11.z;
  tmpvar_12[2].z = tmpvar_1.z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_9;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_2 = tmpvar_15;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_9.x) + (tmpvar_32 * tmpvar_9.y)) + (tmpvar_33 * tmpvar_9.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_3;
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
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_17.x * tmpvar_22);
  nrm_3 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_25;
  tmpvar_25 = (nrm_3 + (tmpvar_17.y * tmpvar_24));
  nrm_3 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_3 + (tmpvar_17.z * tmpvar_26));
  nrm_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_3 + (tmpvar_17.w * tmpvar_28));
  nrm_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_31;
  lowp float shadow_32;
  mediump float tmpvar_33;
  tmpvar_33 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_32 = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (_LightShadowData.x + (shadow_32 * (1.0 - _LightShadowData.x)));
  shadow_32 = tmpvar_34;
  lowp vec4 c_35;
  c_35.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD3)) * shadow_32) * 2.0));
  c_35.w = tmpvar_2;
  c_1.w = c_35.w;
  c_1.xyz = (c_35.xyz + (col_4 * xlv_TEXCOORD4));
  _glesFragData[0] = c_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 57 math, 9 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 1, 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[2], texture[4], 2D;
ADD R5.y, R0.w, R1.w;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R0.z, R2;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R0, R4.w;
DP4 R0.x, R0, c[2].x;
MAX R1.w, R5.y, R2;
ADD R3.w, R0.y, R3;
MOV R5.w, R5.y;
MAX R1.w, R3, R1;
MAX R1.w, R5.x, R1;
MOV R5.z, R2.w;
MOV R5.y, R3.w;
ADD R5, R5, -R1.w;
ADD R5, R5, c[1].x;
MAX R5, R5, c[2].y;
ADD R2.w, R5.x, R5.y;
ADD R2.w, R5.z, R2;
ADD R2.w, R5, R2;
RCP R2.w, R2.w;
MUL R5, R5, R2.w;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[2].z;
MAD R0.xy, R0.x, R6, c[2].z;
MAD R6.xy, R0.yxzw, c[2].w, -c[2].x;
MUL R0.xyz, R5.y, R3;
MUL R3.xyz, R5.x, R4;
ADD R0.xyz, R3, R0;
MUL R3.xy, R6, R6;
MUL R2.xyz, R5.z, R2;
ADD_SAT R0.w, R3.x, R3.y;
ADD R0.w, -R0, c[2].x;
RSQ R0.w, R0.w;
RCP R6.z, R0.w;
DP3 R0.w, R6, fragment.texcoord[3];
ADD R0.xyz, R0, R2;
MUL R1.xyz, R5.w, R1;
ADD R1.xyz, R0, R1;
MUL R0.xyz, R1, fragment.texcoord[4];
MUL R1.xyz, R1, c[0];
MAX R0.w, R0, c[2].y;
MUL R1.xyz, R0.w, R1;
MAD result.color.xyz, R1, c[2].w, R0;
MUL result.color.w, R1, c[2].z;
END
# 57 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 48 math, 9 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
dcl_2d s8
def c2, 1.00000000, 0.00000000, -0.50000000, 0.50000000
def c3, 2.00000000, -1.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
texld r0, v0, s0
texld r1, v2, s4
add_pp r5.y, r0.w, r1.w
texld r3, v1, s2
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r4, v0.zwzw, s1
add_pp r5.x, r0, r4.w
dp4_pp r0.x, r0, c2.x
max r1.w, r5.y, r2
add_pp r3.w, r0.y, r3
mov r5.w, r5.y
max r1.w, r3, r1
max r1.w, r5.x, r1
mov r5.z, r2.w
mov r5.y, r3.w
add r5, r5, -r1.w
add r5, r5, c1.x
max r5, r5, c2.y
add r2.w, r5.x, r5.y
add r2.w, r5.z, r2
add r2.w, r5, r2
rcp r2.w, r2.w
mul r5, r5, r2.w
texld r7.yw, v1, s6
texld r6.yw, v0.zwzw, s5
mul r7.xy, r5.y, r7.ywzw
mul r6.xy, r5.x, r6.ywzw
add_pp r6.xz, r6.xyyw, r7.xyyw
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
add_pp r6.xy, r6.xzzw, r6.ywzw
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c2.z
mad_pp r0.xy, r0.x, r6, c2.w
mad_pp r6.xy, r0.yxzw, c3.x, c3.y
mul r0.xyz, r5.y, r3
mul r3.xyz, r5.x, r4
add_pp r0.xyz, r3, r0
mul_pp r3.xy, r6, r6
mul r2.xyz, r5.z, r2
add_pp_sat r0.w, r3.x, r3.y
add_pp r0.w, -r0, c2.x
rsq_pp r0.w, r0.w
rcp_pp r6.z, r0.w
dp3_pp r0.w, r6, v3
add_pp r0.xyz, r0, r2
mul r1.xyz, r5.w, r1
add_pp r1.xyz, r0, r1
mul_pp r0.xyz, r1, v4
mul_pp r1.xyz, r1, c0
max_pp r0.w, r0, c2.y
mul_pp r1.xyz, r0.w, r1
mad_pp oC0.xyz, r1, c3.x, r0
mul oC0.w, r1, c2
"
}
SubProgram "d3d11 " {
// Stats: 37 math, 9 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedjbohdemonafjnnppmkajbchgiecfhlehabaaaaaahaaiaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfaahaaaa
eaaaaaaaneabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaa
aiaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaa
ffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ajaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaaeghobaaaahaaaaaa
aagabaaaahaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
afaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaa
eghobaaaagaaaaaaaagabaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaogbkbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahecaabaaa
afaaaaaadkaabaaaadaaaaaackaabaaaaeaaaaaaefaaaaajpcaabaaaagaaaaaa
egbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaaaaaaaahicaabaaa
afaaaaaadkaabaaaaeaaaaaadkaabaaaagaaaaaadeaaaaahbcaabaaaaaaaaaaa
dkaabaaaafaaaaaackaabaaaafaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaaafaaaaaa
bkaabaaaaeaaaaaadkaabaaaahaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaaaafaaaaaaefaaaaajpcaabaaaaiaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaahbcaabaaaafaaaaaaakaabaaa
aeaaaaaadkaabaaaaiaaaaaabbaaaaakecaabaaaaaaaaaaaegaobaaaaeaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaafaaaaaaaaaaaaaipcaabaaaaeaaaaaaagaabaia
ebaaaaaaaaaaaaaaegaobaaaafaaaaaadiaaaaahiccabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaadpaaaaaaaipcaabaaaaeaaaaaaegaobaaaaeaaaaaa
agiacaaaaaaaaaaaadaaaaaadeaaaaakpcaabaaaaeaaaaaaegaobaaaaeaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaa
bkaabaaaaeaaaaaaakaabaaaaeaaaaaaaaaaaaahbcaabaaaaaaaaaaackaabaaa
aeaaaaaaakaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaadkaabaaaaeaaaaaa
akaabaaaaaaaaaaaaoaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaagaabaaa
aaaaaaaadiaaaaahfcaabaaaabaaaaaapganbaaaacaaaaaafgafbaaaaeaaaaaa
dcaaaaajdcaabaaaabaaaaaaagaabaaaaeaaaaaahgapbaaaabaaaaaaigaabaaa
abaaaaaadcaaaaajdcaabaaaaaaaaaaakgakbaaaaeaaaaaahgapbaaaaaaaaaaa
egaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaa
aiaaaaaaaagabaaaaiaaaaaadcaaaaajdcaabaaaaaaaaaaapgapbaaaaeaaaaaa
hgapbaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadcaaaaamdcaabaaa
aaaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadcaaaaapdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaa
ddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaaeaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaahaaaaaafgafbaaaaeaaaaaa
dcaaaaajocaabaaaaaaaaaaaagaabaaaaeaaaaaaagajbaaaaiaaaaaafgaobaaa
aaaaaaaadcaaaaajocaabaaaaaaaaaaakgakbaaaaeaaaaaaagajbaaaadaaaaaa
fgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaaaeaaaaaaagajbaaa
agaaaaaafgaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaajgahbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agbjbaaaafaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadoaaaaab"
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
SetTexture 9 [unity_Lightmap] 2D 9
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
TEX R2, fragment.texcoord[3], texture[9], 2D;
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
SetTexture 9 [unity_Lightmap] 2D 9
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s9
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
texld r1, v3, s9
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
// Stats: 62 math, 11 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [unity_Lightmap] 2D 9
SetTexture 10 [unity_LightmapInd] 2D 10
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0],
		{ 0.5, 1, 0, 2 },
		{ -0.40824828, -0.70710677, 0.57735026, 8 },
		{ -0.40824831, 0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2, fragment.texcoord[2], texture[4], 2D;
ADD R5.y, R0.w, R2.w;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R5.z, R0, R1.w;
TEX R4, fragment.texcoord[1], texture[2], 2D;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R3.w, R0;
ADD R2.w, R0.y, R4;
MAX R1.w, R5.z, R5.y;
MAX R1.w, R2, R1;
MAX R1.w, R5.x, R1;
MOV R5.w, R5.y;
MOV R5.y, R2.w;
ADD R5, -R1.w, R5;
ADD R5, R5, c[0].x;
MAX R5, R5, c[1].z;
ADD R2.w, R5.x, R5.y;
ADD R2.w, R5.z, R2;
ADD R2.w, R5, R2;
RCP R2.w, R2.w;
MUL R5, R5, R2.w;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
DP4 R0.x, R0, c[1].y;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6.xzzw, R6.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[1].x;
MAD R0.xy, R0.x, R6, c[1].x;
MAD R7.xy, R0.yxzw, c[1].w, -c[1].y;
MUL R0.xy, R7, R7;
ADD_SAT R0.x, R0, R0.y;
ADD R0.x, -R0, c[1].y;
RSQ R0.x, R0.x;
RCP R7.z, R0.x;
TEX R0, fragment.texcoord[3], texture[10], 2D;
MUL R0.xyz, R0.w, R0;
DP3_SAT R6.z, R7, c[2];
DP3_SAT R6.y, R7, c[3];
DP3_SAT R6.x, R7, c[4];
MUL R0.xyz, R0, R6;
DP3 R0.w, R0, c[2].w;
MUL R0.xyz, R1, R5.z;
MUL R1.xyz, R4, R5.y;
MUL R3.xyz, R3, R5.x;
ADD R1.xyz, R3, R1;
ADD R0.xyz, R1, R0;
MUL R1.xyz, R2, R5.w;
ADD R0.xyz, R0, R1;
TEX R2, fragment.texcoord[3], texture[9], 2D;
MUL R1.xyz, R2.w, R2;
MUL R1.xyz, R1, R0.w;
MUL R0.xyz, R1, R0;
MUL result.color.xyz, R0, c[2].w;
MUL result.color.w, R1, c[1].x;
END
# 62 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 51 math, 11 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [unity_Lightmap] 2D 9
SetTexture 10 [unity_LightmapInd] 2D 10
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
dcl_2d s8
dcl_2d s9
dcl_2d s10
def c1, 0.50000000, 1.00000000, 0.00000000, -0.50000000
def c2, 2.00000000, -1.00000000, 8.00000000, 0
def c3, -0.40824828, -0.70710677, 0.57735026, 0
def c4, -0.40824831, 0.70710677, 0.57735026, 0
def c5, 0.81649655, 0.00000000, 0.57735026, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xy
texld r0, v0, s0
texld r2, v2, s4
add_pp r5.y, r0.w, r2.w
texld r1, v1.zwzw, s3
add_pp r5.z, r0, r1.w
texld r4, v1, s2
texld r3, v0.zwzw, s1
add_pp r5.x, r3.w, r0
add_pp r2.w, r0.y, r4
max r1.w, r5.z, r5.y
max r1.w, r2, r1
max r1.w, r5.x, r1
mov r5.w, r5.y
mov r5.y, r2.w
add r5, -r1.w, r5
add r5, r5, c0.x
max r5, r5, c1.z
add r2.w, r5.x, r5.y
add r2.w, r5.z, r2
add r2.w, r5, r2
rcp r2.w, r2.w
mul r5, r5, r2.w
texld r7.yw, v1, s6
texld r6.yw, v0.zwzw, s5
mul r7.xy, r5.y, r7.ywzw
mul r6.xy, r5.x, r6.ywzw
add_pp r6.xz, r6.xyyw, r7.xyyw
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
dp4_pp r0.x, r0, c1.y
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6.xzzw, r6.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c1.w
mad_pp r0.xy, r0.x, r6, c1.x
mad_pp r7.xy, r0.yxzw, c2.x, c2.y
mul_pp r0.xy, r7, r7
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c1.y
rsq_pp r0.x, r0.x
rcp_pp r7.z, r0.x
texld r0, v3, s10
mul_pp r0.xyz, r0.w, r0
dp3_pp_sat r6.z, r7, c3
dp3_pp_sat r6.y, r7, c4
dp3_pp_sat r6.x, r7, c5
mul_pp r0.xyz, r0, r6
dp3_pp r0.w, r0, c2.z
mul r0.xyz, r1, r5.z
mul r1.xyz, r4, r5.y
mul r3.xyz, r3, r5.x
add_pp r1.xyz, r3, r1
add_pp r0.xyz, r1, r0
mul r1.xyz, r2, r5.w
add_pp r0.xyz, r0, r1
texld r2, v3, s9
mul_pp r1.xyz, r2.w, r2
mul_pp r1.xyz, r1, r0.w
mul_pp r0.xyz, r1, r0
mul_pp oC0.xyz, r0, c2.z
mul oC0.w, r1, c1.x
"
}
SubProgram "d3d11 " {
// Stats: 41 math, 11 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [unity_Lightmap] 2D 9
SetTexture 10 [unity_LightmapInd] 2D 10
ConstBuffer "$Globals" 160
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedcapacbhofdngfgleipninlmeknceflooabaaaaaafeajaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcemaiaaaaeaaaaaaabdacaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaa
fkaaaaadaagabaaaaiaaaaaafkaaaaadaagabaaaajaaaaaafkaaaaadaagabaaa
akaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaa
ffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaaeaahabaaaajaaaaaa
ffffaaaafibiaaaeaahabaaaakaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacakaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaadaaaaaaeghobaaaakaaaaaaaagabaaaakaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaacaaaaaaeghobaaaahaaaaaaaagabaaaahaaaaaaefaaaaajpcaabaaa
acaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaaaagabaaaafaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaacaaaaaaeghobaaaagaaaaaaaagabaaaagaaaaaa
efaaaaajpcaabaaaaeaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
adaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaaaaaaaahecaabaaaagaaaaaadkaabaaaaeaaaaaackaabaaa
afaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaa
aagabaaaaeaaaaaaaaaaaaahicaabaaaagaaaaaadkaabaaaafaaaaaadkaabaaa
ahaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaagaaaaaackaabaaaagaaaaaa
efaaaaajpcaabaaaaiaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaaaaaaaaahccaabaaaagaaaaaabkaabaaaafaaaaaadkaabaaaaiaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaagaaaaaaefaaaaaj
pcaabaaaajaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
aaaaaaahbcaabaaaagaaaaaaakaabaaaafaaaaaadkaabaaaajaaaaaabbaaaaak
bcaabaaaabaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaagaaaaaa
aaaaaaaipcaabaaaafaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaaagaaaaaa
diaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaai
pcaabaaaafaaaaaaegaobaaaafaaaaaaagiacaaaaaaaaaaaadaaaaaadeaaaaak
pcaabaaaafaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaafaaaaaaakaabaaaafaaaaaa
aaaaaaahicaabaaaaaaaaaaackaabaaaafaaaaaadkaabaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaadkaabaaaafaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaa
afaaaaaaegaobaaaafaaaaaapgapbaaaaaaaaaaadiaaaaahfcaabaaaacaaaaaa
pganbaaaadaaaaaafgafbaaaafaaaaaadcaaaaajdcaabaaaacaaaaaaagaabaaa
afaaaaaahgapbaaaacaaaaaaigaabaaaacaaaaaadcaaaaajgcaabaaaabaaaaaa
kgakbaaaafaaaaaapganbaaaabaaaaaaagabbaaaacaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaadaaaaaaeghobaaaaiaaaaaaaagabaaaaiaaaaaadcaaaaaj
gcaabaaaabaaaaaapgapbaaaafaaaaaapganbaaaacaaaaaafgagbaaaabaaaaaa
aaaaaaakgcaabaaaabaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaalp
aaaaaalpaaaaaaaadcaaaaamdcaabaaaabaaaaaaagaabaaaabaaaaaajgafbaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadcaaaaapdcaabaaa
abaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaa
apcaaaakbcaabaaaacaaaaaaaceaaaaaolaffbdpdkmnbddpaaaaaaaaaaaaaaaa
igaabaaaabaaaaaabacaaaakccaabaaaacaaaaaaaceaaaaaomafnblopdaedfdp
dkmnbddpaaaaaaaaegacbaaaabaaaaaabacaaaakecaabaaaacaaaaaaaceaaaaa
olafnblopdaedflpdkmnbddpaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaadaaaaaaeghobaaaajaaaaaaaagabaaaajaaaaaadiaaaaahccaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaa
agajbaaaabaaaaaafgafbaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaaiaaaaaa
fgafbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaaagaabaaaafaaaaaaegacbaaa
ajaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaabaaaaaakgakbaaaafaaaaaa
egacbaaaaeaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaabaaaaaapgapbaaa
afaaaaaaegacbaaaahaaaaaaegacbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
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
// Stats: 59 math, 10 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_ShadowMapTexture] 2D 9
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 1, 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[2], texture[4], 2D;
ADD R5.y, R0.w, R1.w;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R0.z, R2;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R0, R4.w;
ADD R3.w, R0.y, R3;
MAX R1.w, R5.y, R2;
MAX R1.w, R3, R1;
MAX R1.w, R5.x, R1;
MOV R5.w, R5.y;
DP4 R0.x, R0, c[2].x;
MOV R5.z, R2.w;
MOV R5.y, R3.w;
ADD R5, R5, -R1.w;
ADD R5, R5, c[1].x;
MAX R5, R5, c[2].y;
ADD R2.w, R5.x, R5.y;
ADD R2.w, R5.z, R2;
ADD R2.w, R5, R2;
RCP R2.w, R2.w;
MUL R5, R5, R2.w;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
MUL R2.xyz, R5.z, R2;
MUL R1.xyz, R5.w, R1;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6.xzzw, R6.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[2].z;
MAD R6.xy, R0.x, R6, c[2].z;
MUL R0.xyz, R5.y, R3;
MUL R3.xyz, R5.x, R4;
ADD R0.xyz, R3, R0;
ADD R0.xyz, R0, R2;
ADD R2.xyz, R0, R1;
MAD R3.xy, R6.yxzw, c[2].w, -c[2].x;
MUL R3.zw, R3.xyxy, R3.xyxy;
ADD_SAT R0.w, R3.z, R3;
MUL R1.xyz, R2, fragment.texcoord[4];
ADD R0.w, -R0, c[2].x;
RSQ R0.x, R0.w;
RCP R3.z, R0.x;
DP3 R0.y, R3, fragment.texcoord[3];
MAX R0.y, R0, c[2];
TXP R0.x, fragment.texcoord[5], texture[9], 2D;
MUL R2.xyz, R2, c[0];
MUL R0.x, R0.y, R0;
MUL R0.xyz, R0.x, R2;
MAD result.color.xyz, R0, c[2].w, R1;
MUL result.color.w, R1, c[2].z;
END
# 59 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 49 math, 10 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_ShadowMapTexture] 2D 9
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
dcl_2d s8
dcl_2d s9
def c2, 1.00000000, 0.00000000, -0.50000000, 0.50000000
def c3, 2.00000000, -1.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
texld r0, v0, s0
texld r1, v2, s4
add_pp r5.y, r0.w, r1.w
texld r3, v1, s2
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r4, v0.zwzw, s1
add_pp r5.x, r0, r4.w
add_pp r3.w, r0.y, r3
max r1.w, r5.y, r2
max r1.w, r3, r1
max r1.w, r5.x, r1
mov r5.w, r5.y
dp4_pp r0.x, r0, c2.x
mov r5.z, r2.w
mov r5.y, r3.w
add r5, r5, -r1.w
add r5, r5, c1.x
max r5, r5, c2.y
add r2.w, r5.x, r5.y
add r2.w, r5.z, r2
add r2.w, r5, r2
rcp r2.w, r2.w
mul r5, r5, r2.w
texld r7.yw, v1, s6
texld r6.yw, v0.zwzw, s5
mul r7.xy, r5.y, r7.ywzw
mul r6.xy, r5.x, r6.ywzw
add_pp r6.xz, r6.xyyw, r7.xyyw
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
mul r2.xyz, r5.z, r2
mul r1.xyz, r5.w, r1
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6.xzzw, r6.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c2.z
mad_pp r6.xy, r0.x, r6, c2.w
mul r0.xyz, r5.y, r3
mul r3.xyz, r5.x, r4
add_pp r0.xyz, r3, r0
add_pp r0.xyz, r0, r2
add_pp r2.xyz, r0, r1
mad_pp r3.xy, r6.yxzw, c3.x, c3.y
mul_pp r3.zw, r3.xyxy, r3.xyxy
add_pp_sat r0.w, r3.z, r3
mul_pp r1.xyz, r2, v4
add_pp r0.w, -r0, c2.x
rsq_pp r0.x, r0.w
rcp_pp r3.z, r0.x
dp3_pp r0.y, r3, v3
max_pp r0.y, r0, c2
texldp r0.x, v5, s9
mul_pp r2.xyz, r2, c0
mul_pp r0.x, r0.y, r0
mul_pp r0.xyz, r0.x, r2
mad_pp oC0.xyz, r0, c3.x, r1
mul oC0.w, r1, c2
"
}
SubProgram "d3d11 " {
// Stats: 38 math, 10 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_Normal0] 2D 6
SetTexture 6 [_Normal1] 2D 7
SetTexture 7 [_Normal2] 2D 8
SetTexture 8 [_Normal3] 2D 9
SetTexture 9 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedffcbclibinidlfledaabmphgckakmpkcabaaaaaapaaiaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcliahaaaaeaaaaaaaooabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafkaaaaad
aagabaaaajaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaa
ahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaaeaahabaaa
ajaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ajaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaaeghobaaaahaaaaaa
aagabaaaaiaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
afaaaaaaaagabaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaa
eghobaaaagaaaaaaaagabaaaahaaaaaaefaaaaajpcaabaaaadaaaaaaogbkbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaahecaabaaa
afaaaaaadkaabaaaadaaaaaackaabaaaaeaaaaaaefaaaaajpcaabaaaagaaaaaa
egbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaahicaabaaa
afaaaaaadkaabaaaaeaaaaaadkaabaaaagaaaaaadeaaaaahbcaabaaaaaaaaaaa
dkaabaaaafaaaaaackaabaaaafaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaahccaabaaaafaaaaaa
bkaabaaaaeaaaaaadkaabaaaahaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaaaafaaaaaaefaaaaajpcaabaaaaiaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaaaaaaaaahbcaabaaaafaaaaaaakaabaaa
aeaaaaaadkaabaaaaiaaaaaabbaaaaakecaabaaaaaaaaaaaegaobaaaaeaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaafaaaaaaaaaaaaaipcaabaaaaeaaaaaaagaabaia
ebaaaaaaaaaaaaaaegaobaaaafaaaaaadiaaaaahiccabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaadpaaaaaaaipcaabaaaaeaaaaaaegaobaaaaeaaaaaa
agiacaaaaaaaaaaaahaaaaaadeaaaaakpcaabaaaaeaaaaaaegaobaaaaeaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaa
bkaabaaaaeaaaaaaakaabaaaaeaaaaaaaaaaaaahbcaabaaaaaaaaaaackaabaaa
aeaaaaaaakaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaadkaabaaaaeaaaaaa
akaabaaaaaaaaaaaaoaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaagaabaaa
aaaaaaaadiaaaaahfcaabaaaabaaaaaapganbaaaacaaaaaafgafbaaaaeaaaaaa
dcaaaaajdcaabaaaabaaaaaaagaabaaaaeaaaaaahgapbaaaabaaaaaaigaabaaa
abaaaaaadcaaaaajdcaabaaaaaaaaaaakgakbaaaaeaaaaaahgapbaaaaaaaaaaa
egaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaa
aiaaaaaaaagabaaaajaaaaaadcaaaaajdcaabaaaaaaaaaaapgapbaaaaeaaaaaa
hgapbaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadcaaaaamdcaabaaa
aaaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadcaaaaapdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaa
ddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaaeaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaaoaaaaahgcaabaaaaaaaaaaaagbbbaaaagaaaaaapgbpbaaa
agaaaaaaefaaaaajpcaabaaaabaaaaaajgafbaaaaaaaaaaaeghobaaaajaaaaaa
aagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaaagaabaaa
abaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaahaaaaaafgafbaaaaeaaaaaa
dcaaaaajocaabaaaaaaaaaaaagaabaaaaeaaaaaaagajbaaaaiaaaaaafgaobaaa
aaaaaaaadcaaaaajocaabaaaaaaaaaaakgakbaaaaeaaaaaaagajbaaaadaaaaaa
fgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaaaeaaaaaaagajbaaa
agaaaaaafgaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaajgahbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agbjbaaaafaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadoaaaaab"
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
SetTexture 9 [_ShadowMapTexture] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
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
TEX R2, fragment.texcoord[3], texture[10], 2D;
MUL R3.xyz, R2.w, R2;
TXP R4.x, fragment.texcoord[4], texture[9], 2D;
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
SetTexture 9 [_ShadowMapTexture] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s9
dcl_2d s10
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
texld r1, v3, s10
mul_pp r3.xyz, r1.w, r1
texldp r4.x, v4, s9
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
// Stats: 68 math, 12 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_ShadowMapTexture] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0],
		{ 0.5, 0, 1, 2 },
		{ -0.40824828, -0.70710677, 0.57735026, 8 },
		{ -0.40824831, 0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2, fragment.texcoord[2], texture[4], 2D;
ADD R5.y, R0.w, R2.w;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R5.z, R0, R1.w;
TEX R4, fragment.texcoord[1], texture[2], 2D;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R3.w, R0;
ADD R2.w, R0.y, R4;
MAX R1.w, R5.z, R5.y;
MAX R1.w, R2, R1;
MAX R1.w, R5.x, R1;
MOV R5.w, R5.y;
MOV R5.y, R2.w;
ADD R5, -R1.w, R5;
ADD R5, R5, c[0].x;
MAX R5, R5, c[1].y;
ADD R2.w, R5.x, R5.y;
ADD R2.w, R5.z, R2;
ADD R2.w, R5, R2;
RCP R2.w, R2.w;
MUL R5, R5, R2.w;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[1].x;
DP4 R0.x, R0, c[1].z;
MAD R0.xy, R0.x, R6, c[1].x;
MAD R7.xy, R0.yxzw, c[1].w, -c[1].z;
MUL R0.xy, R7, R7;
ADD_SAT R0.x, R0, R0.y;
ADD R0.x, -R0, c[1].z;
RSQ R0.x, R0.x;
RCP R7.z, R0.x;
TEX R0, fragment.texcoord[3], texture[11], 2D;
DP3_SAT R6.z, R7, c[2];
DP3_SAT R6.y, R7, c[3];
DP3_SAT R6.x, R7, c[4];
MUL R0.xyz, R0.w, R0;
MUL R6.xyz, R0, R6;
TEX R0, fragment.texcoord[3], texture[10], 2D;
DP3 R2.w, R6, c[2].w;
MUL R6.xyz, R0.w, R0;
TXP R7.x, fragment.texcoord[4], texture[9], 2D;
MUL R0.xyz, R0, R7.x;
MUL R6.xyz, R6, R2.w;
MUL R6.xyz, R6, c[2].w;
MUL R0.xyz, R0, c[1].w;
MUL R7.xyz, R6, R7.x;
MIN R0.xyz, R6, R0;
MAX R0.xyz, R0, R7;
MUL R4.xyz, R4, R5.y;
MUL R3.xyz, R3, R5.x;
ADD R3.xyz, R3, R4;
MUL R1.xyz, R1, R5.z;
MUL R2.xyz, R2, R5.w;
ADD R1.xyz, R3, R1;
ADD R1.xyz, R1, R2;
MUL result.color.xyz, R1, R0;
MUL result.color.w, R1, c[1].x;
END
# 68 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 56 math, 12 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_ShadowMapTexture] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
dcl_2d s8
dcl_2d s9
dcl_2d s10
dcl_2d s11
def c1, 0.50000000, 0.00000000, 1.00000000, -0.50000000
def c2, 2.00000000, -1.00000000, 8.00000000, 0
def c3, -0.40824828, -0.70710677, 0.57735026, 0
def c4, -0.40824831, 0.70710677, 0.57735026, 0
def c5, 0.81649655, 0.00000000, 0.57735026, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xy
dcl_texcoord4 v4
texld r0, v0, s0
texld r2, v2, s4
add_pp r5.y, r0.w, r2.w
texld r1, v1.zwzw, s3
add_pp r5.z, r0, r1.w
texld r4, v1, s2
texld r3, v0.zwzw, s1
add_pp r5.x, r3.w, r0
add_pp r2.w, r0.y, r4
max r1.w, r5.z, r5.y
max r1.w, r2, r1
max r1.w, r5.x, r1
mov r5.w, r5.y
mov r5.y, r2.w
add r5, -r1.w, r5
add r5, r5, c0.x
max r5, r5, c1.y
add r2.w, r5.x, r5.y
add r2.w, r5.z, r2
add r2.w, r5, r2
rcp r2.w, r2.w
mul r5, r5, r2.w
texld r7.yw, v1, s6
texld r6.yw, v0.zwzw, s5
mul r7.xy, r5.y, r7.ywzw
mul r6.xy, r5.x, r6.ywzw
add_pp r6.xz, r6.xyyw, r7.xyyw
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
add_pp r6.xy, r6.xzzw, r6.ywzw
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c1.w
dp4_pp r0.x, r0, c1.z
mad_pp r0.xy, r0.x, r6, c1.x
mad_pp r7.xy, r0.yxzw, c2.x, c2.y
mul_pp r0.xy, r7, r7
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c1.z
rsq_pp r0.x, r0.x
rcp_pp r7.z, r0.x
texld r0, v3, s11
dp3_pp_sat r6.z, r7, c3
dp3_pp_sat r6.y, r7, c4
dp3_pp_sat r6.x, r7, c5
mul_pp r0.xyz, r0.w, r0
mul_pp r6.xyz, r0, r6
texld r0, v3, s10
dp3_pp r2.w, r6, c2.z
mul_pp r6.xyz, r0.w, r0
texldp r7.x, v4, s9
mul_pp r0.xyz, r0, r7.x
mul_pp r6.xyz, r6, r2.w
mul_pp r6.xyz, r6, c2.z
mul_pp r0.xyz, r0, c2.x
mul_pp r7.xyz, r6, r7.x
min_pp r0.xyz, r6, r0
max_pp r0.xyz, r0, r7
mul r4.xyz, r4, r5.y
mul r3.xyz, r3, r5.x
add_pp r3.xyz, r3, r4
mul r1.xyz, r1, r5.z
mul r2.xyz, r2, r5.w
add_pp r1.xyz, r3, r1
add_pp r1.xyz, r1, r2
mul_pp oC0.xyz, r1, r0
mul oC0.w, r1, c1.x
"
}
SubProgram "d3d11 " {
// Stats: 47 math, 12 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_Normal0] 2D 6
SetTexture 6 [_Normal1] 2D 7
SetTexture 7 [_Normal2] 2D 8
SetTexture 8 [_Normal3] 2D 9
SetTexture 9 [_ShadowMapTexture] 2D 0
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
ConstBuffer "$Globals" 224
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedindfohiidoaggokambkbhgbebabiepjfabaaaaaagaakaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceaajaaaa
eaaaaaaafaacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaa
aiaaaaaafkaaaaadaagabaaaajaaaaaafkaaaaadaagabaaaakaaaaaafkaaaaad
aagabaaaalaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaa
ahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaaeaahabaaa
ajaaaaaaffffaaaafibiaaaeaahabaaaakaaaaaaffffaaaafibiaaaeaahabaaa
alaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacakaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaadaaaaaaeghobaaaalaaaaaaaagabaaaalaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaacaaaaaaeghobaaaahaaaaaaaagabaaaaiaaaaaaefaaaaajpcaabaaa
acaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaaaagabaaaagaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaacaaaaaaeghobaaaagaaaaaaaagabaaaahaaaaaa
efaaaaajpcaabaaaaeaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
aeaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaaaaaaaaahecaabaaaagaaaaaadkaabaaaaeaaaaaackaabaaa
afaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaa
aagabaaaafaaaaaaaaaaaaahicaabaaaagaaaaaadkaabaaaafaaaaaadkaabaaa
ahaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaagaaaaaackaabaaaagaaaaaa
efaaaaajpcaabaaaaiaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaa
adaaaaaaaaaaaaahccaabaaaagaaaaaabkaabaaaafaaaaaadkaabaaaaiaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaagaaaaaaefaaaaaj
pcaabaaaajaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaa
aaaaaaahbcaabaaaagaaaaaaakaabaaaafaaaaaadkaabaaaajaaaaaabbaaaaak
bcaabaaaabaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaagaaaaaa
aaaaaaaipcaabaaaafaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaaagaaaaaa
diaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaai
pcaabaaaafaaaaaaegaobaaaafaaaaaaagiacaaaaaaaaaaaahaaaaaadeaaaaak
pcaabaaaafaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaafaaaaaaakaabaaaafaaaaaa
aaaaaaahicaabaaaaaaaaaaackaabaaaafaaaaaadkaabaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaadkaabaaaafaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaa
afaaaaaaegaobaaaafaaaaaapgapbaaaaaaaaaaadiaaaaahfcaabaaaacaaaaaa
pganbaaaadaaaaaafgafbaaaafaaaaaadcaaaaajdcaabaaaacaaaaaaagaabaaa
afaaaaaahgapbaaaacaaaaaaigaabaaaacaaaaaadcaaaaajgcaabaaaabaaaaaa
kgakbaaaafaaaaaapganbaaaabaaaaaaagabbaaaacaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaadaaaaaaeghobaaaaiaaaaaaaagabaaaajaaaaaadcaaaaaj
gcaabaaaabaaaaaapgapbaaaafaaaaaapganbaaaacaaaaaafgagbaaaabaaaaaa
aaaaaaakgcaabaaaabaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaalp
aaaaaalpaaaaaaaadcaaaaamdcaabaaaabaaaaaaagaabaaaabaaaaaajgafbaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadcaaaaapdcaabaaa
abaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaa
apcaaaakbcaabaaaacaaaaaaaceaaaaaolaffbdpdkmnbddpaaaaaaaaaaaaaaaa
igaabaaaabaaaaaabacaaaakccaabaaaacaaaaaaaceaaaaaomafnblopdaedfdp
dkmnbddpaaaaaaaaegacbaaaabaaaaaabacaaaakecaabaaaacaaaaaaaceaaaaa
olafnblopdaedflpdkmnbddpaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaadaaaaaaeghobaaaakaaaaaaaagabaaaakaaaaaadiaaaaahccaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaa
agajbaaaabaaaaaafgafbaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaacaaaaaaegbabaaaaeaaaaaa
pgbpbaaaaeaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
ajaaaaaaaagabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaaakaabaaaacaaaaaa
akaabaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaaaaaaaaaagaabaaa
acaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
ddaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadeaaaaah
hcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaaiaaaaaafgafbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaa
agaabaaaafaaaaaaegacbaaaajaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaa
abaaaaaakgakbaaaafaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaadcaaaaaj
hcaabaaaabaaaaaapgapbaaaafaaaaaaegacbaaaahaaaaaaegacbaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
"
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
 //       d3d11 : 27 avg math (20..29)
 //        d3d9 : 28 avg math (22..31)
 //      opengl : 26 avg math (20..29)
 // Stats for Fragment shader:
 //       d3d11 : 38 avg math (35..45), 10 avg texture (9..11)
 //        d3d9 : 51 avg math (47..57), 10 avg texture (9..11)
 //      opengl : 61 avg math (56..68), 10 avg texture (9..11)
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
// Stats: 28 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_Control_ST]
Vector 20 [_Splat0_ST]
Vector 21 [_Splat1_ST]
Vector 22 [_Splat2_ST]
Vector 23 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[24] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, -vertex.normal.zxyw, c[0].yxyw;
MAD R1.xyz, vertex.normal.yzxw, c[0].xyyw, R0;
MOV R0, c[17];
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[18].w, -vertex.position;
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP3 result.texcoord[3].y, R0, -R2;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[20].xyxy, c[20];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[22].xyxy, c[22];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[21], c[21].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[23], c[23].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 30 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceLightPos0]
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
def c23, 0.00000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r0.xyz, -v2.zxyw, c23.xyxw
mad r2.xyz, v2.yzxw, c23.yxxw, r0
mul r1.xyz, v2.zxyw, r2.yzxw
mov r0, c10
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1, c8
dp4 r4.x, c16, r1
mad r0.xyz, r4, c17.w, -v0
dp3 o4.y, r0, -r3
dp3 o4.z, v2, r0
dp3 o4.x, r0, r2
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 o5.z, r0, c14
dp4 o5.y, r0, c13
dp4 o5.x, r0, c12
mad o1.zw, v3.xyxy, c19.xyxy, c19
mad o1.xy, v3, c18, c18.zwzw
mad o2.zw, v3.xyxy, c21.xyxy, c21
mad o2.xy, v3, c20, c20.zwzw
mad o3.xy, v3, c22, c22.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 29 math
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
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedkpfdglldeaafnhdiokjamailkcjmaamfabaaaaaaniagaaaaadaaaaaa
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
feeffiedepepfceeaaklklklfdeieefcceafaaaaeaaaabaaejabaaaafjaaaaae
egiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
adaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaa
kgiocaaaaaaaaaaaalaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaadiaaaaakhcaabaaa
aaaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaa
dcaaaaanhcaabaaaaaaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaiadpaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaaaaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaa
acaaaaaajgaebaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaajhcaabaaa
acaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaaicccabaaaaeaaaaaaegacbaiaebaaaaaa
abaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaa
egacbaaaacaaaaaaapaaaaahbccabaaaaeaaaaaacgakbaaaaaaaaaaaegaabaaa
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
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
uniform highp mat4 _World2Object;
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
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize(xlv_TEXCOORD3);
  lightDir_2 = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = dot (xlv_TEXCOORD4, xlv_TEXCOORD4);
  lowp vec4 c_35;
  c_35.xyz = ((col_5 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_31.xyz * 2.0) - 1.0), lightDir_2)) * texture2D (_LightTexture0, vec2(tmpvar_34)).w) * 2.0));
  c_35.w = tmpvar_3;
  c_1.xyz = c_35.xyz;
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
uniform highp mat4 _World2Object;
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
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  lowp vec3 normal_33;
  normal_33.xy = ((tmpvar_31.wy * 2.0) - 1.0);
  normal_33.z = sqrt((1.0 - clamp (dot (normal_33.xy, normal_33.xy), 0.0, 1.0)));
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize(xlv_TEXCOORD3);
  lightDir_2 = tmpvar_34;
  highp float tmpvar_35;
  tmpvar_35 = dot (xlv_TEXCOORD4, xlv_TEXCOORD4);
  lowp vec4 c_36;
  c_36.xyz = ((col_5 * _LightColor0.xyz) * ((max (0.0, dot (normal_33, lightDir_2)) * texture2D (_LightTexture0, vec2(tmpvar_35)).w) * 2.0));
  c_36.w = tmpvar_3;
  c_1.xyz = c_36.xyz;
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
uniform highp mat4 _World2Object;
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
out mediump vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in mediump vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize(xlv_TEXCOORD3);
  lightDir_2 = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = dot (xlv_TEXCOORD4, xlv_TEXCOORD4);
  lowp vec4 c_35;
  c_35.xyz = ((col_5 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_31.xyz * 2.0) - 1.0), lightDir_2)) * texture (_LightTexture0, vec2(tmpvar_34)).w) * 2.0));
  c_35.w = tmpvar_3;
  c_1.xyz = c_35.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 20 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_World2Object]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [_Control_ST]
Vector 11 [_Splat0_ST]
Vector 12 [_Splat1_ST]
Vector 13 [_Splat2_ST]
Vector 14 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[15] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, -vertex.normal.zxyw, c[0].yxyw;
MAD R1.xyz, vertex.normal.yzxw, c[0].xyyw, R0;
MOV R0, c[9];
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
DP4 R3.z, R0, c[7];
DP4 R3.y, R0, c[6];
DP4 R3.x, R0, c[5];
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP3 result.texcoord[3].y, R3, -R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, R3, R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[14], c[14].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 20 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 22 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_World2Object]
Vector 8 [_WorldSpaceLightPos0]
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
def c14, 0.00000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r0.xyz, -v2.zxyw, c14.xyxw
mad r2.xyz, v2.yzxw, c14.yxxw, r0
mul r1.xyz, v2.zxyw, r2.yzxw
mov r0, c6
dp4 r4.z, c8, r0
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
mov r0, c5
mov r1, c4
dp4 r4.y, c8, r0
dp4 r4.x, c8, r1
dp3 o4.y, r4, -r3
dp3 o4.z, v2, r4
dp3 o4.x, r4, r2
mad o1.zw, v3.xyxy, c10.xyxy, c10
mad o1.xy, v3, c9, c9.zwzw
mad o2.zw, v3.xyxy, c12.xyxy, c12
mad o2.xy, v3, c11, c11.zwzw
mad o3.xy, v3, c13, c13.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 20 math
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
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedonnldaddmddoljmmcimoponngodeodmjabaaaaaafiafaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefclmadaaaaeaaaabaa
opaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaabeaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacadaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaa
aeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
afaaaaaakgiocaaaaaaaaaaaafaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaal
mccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaa
aaaaaaaaahaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaakhcaabaaaaaaaaaaa
egbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaadcaaaaan
hcaabaaaaaaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadp
aaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
aaaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaa
jgaebaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaajhcaabaaaacaaaaaa
fgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
acaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaai
cccabaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaaacaaaaaabaaaaaah
eccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaaapaaaaahbccabaaa
aeaaaaaacgakbaaaaaaaaaaaegaabaaaacaaaaaadoaaaaab"
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
uniform highp mat4 _World2Object;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  lightDir_2 = xlv_TEXCOORD3;
  lowp vec4 c_33;
  c_33.xyz = ((col_5 * _LightColor0.xyz) * (max (0.0, dot (((tmpvar_31.xyz * 2.0) - 1.0), lightDir_2)) * 2.0));
  c_33.w = tmpvar_3;
  c_1.xyz = c_33.xyz;
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
uniform highp mat4 _World2Object;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  lowp vec3 normal_33;
  normal_33.xy = ((tmpvar_31.wy * 2.0) - 1.0);
  normal_33.z = sqrt((1.0 - clamp (dot (normal_33.xy, normal_33.xy), 0.0, 1.0)));
  lightDir_2 = xlv_TEXCOORD3;
  lowp vec4 c_34;
  c_34.xyz = ((col_5 * _LightColor0.xyz) * (max (0.0, dot (normal_33, lightDir_2)) * 2.0));
  c_34.w = tmpvar_3;
  c_1.xyz = c_34.xyz;
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
uniform highp mat4 _World2Object;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out mediump vec3 xlv_TEXCOORD3;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in mediump vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  lightDir_2 = xlv_TEXCOORD3;
  lowp vec4 c_33;
  c_33.xyz = ((col_5 * _LightColor0.xyz) * (max (0.0, dot (((tmpvar_31.xyz * 2.0) - 1.0), lightDir_2)) * 2.0));
  c_33.w = tmpvar_3;
  c_1.xyz = c_33.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 29 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_Control_ST]
Vector 20 [_Splat0_ST]
Vector 21 [_Splat1_ST]
Vector 22 [_Splat2_ST]
Vector 23 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[24] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, -vertex.normal.zxyw, c[0].yxyw;
MAD R1.xyz, vertex.normal.yzxw, c[0].xyyw, R0;
MOV R0, c[17];
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[18].w, -vertex.position;
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[3].y, R0, -R2;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, R1;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[4].w, R0, c[16];
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[20].xyxy, c[20];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[22].xyxy, c[22];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[21], c[21].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[23], c[23].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 31 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceLightPos0]
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
def c23, 0.00000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r0.xyz, -v2.zxyw, c23.xyxw
mad r2.xyz, v2.yzxw, c23.yxxw, r0
mul r1.xyz, v2.zxyw, r2.yzxw
mov r0, c10
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1, c8
dp4 r4.x, c16, r1
mad r0.xyz, r4, c17.w, -v0
dp4 r0.w, v0, c7
dp3 o4.y, r0, -r3
dp3 o4.z, v2, r0
dp3 o4.x, r0, r2
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 o5.w, r0, c15
dp4 o5.z, r0, c14
dp4 o5.y, r0, c13
dp4 o5.x, r0, c12
mad o1.zw, v3.xyxy, c19.xyxy, c19
mad o1.xy, v3, c18, c18.zwzw
mad o2.zw, v3.xyxy, c21.xyxy, c21
mad o2.xy, v3, c20, c20.zwzw
mad o3.xy, v3, c22, c22.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 29 math
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
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecednfodhfekidaajibimgnhdfechglmlfooabaaaaaaniagaaaaadaaaaaa
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
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcceafaaaaeaaaabaaejabaaaafjaaaaae
egiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
adaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaa
kgiocaaaaaaaaaaaalaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaadiaaaaakhcaabaaa
aaaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaa
dcaaaaanhcaabaaaaaaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaiadpaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaaaaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaa
acaaaaaajgaebaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaajhcaabaaa
acaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaaicccabaaaaeaaaaaaegacbaiaebaaaaaa
abaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaa
egacbaaaacaaaaaaapaaaaahbccabaaaaeaaaaaacgakbaaaaaaaaaaaegaabaaa
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
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
uniform highp mat4 _World2Object;
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
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex));
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize(xlv_TEXCOORD3);
  lightDir_2 = tmpvar_33;
  highp vec2 P_34;
  P_34 = ((xlv_TEXCOORD4.xy / xlv_TEXCOORD4.w) + 0.5);
  highp float tmpvar_35;
  tmpvar_35 = dot (xlv_TEXCOORD4.xyz, xlv_TEXCOORD4.xyz);
  lowp float atten_36;
  atten_36 = ((float((xlv_TEXCOORD4.z > 0.0)) * texture2D (_LightTexture0, P_34).w) * texture2D (_LightTextureB0, vec2(tmpvar_35)).w);
  lowp vec4 c_37;
  c_37.xyz = ((col_5 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_31.xyz * 2.0) - 1.0), lightDir_2)) * atten_36) * 2.0));
  c_37.w = tmpvar_3;
  c_1.xyz = c_37.xyz;
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
uniform highp mat4 _World2Object;
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
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex));
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  lowp vec3 normal_33;
  normal_33.xy = ((tmpvar_31.wy * 2.0) - 1.0);
  normal_33.z = sqrt((1.0 - clamp (dot (normal_33.xy, normal_33.xy), 0.0, 1.0)));
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize(xlv_TEXCOORD3);
  lightDir_2 = tmpvar_34;
  highp vec2 P_35;
  P_35 = ((xlv_TEXCOORD4.xy / xlv_TEXCOORD4.w) + 0.5);
  highp float tmpvar_36;
  tmpvar_36 = dot (xlv_TEXCOORD4.xyz, xlv_TEXCOORD4.xyz);
  lowp float atten_37;
  atten_37 = ((float((xlv_TEXCOORD4.z > 0.0)) * texture2D (_LightTexture0, P_35).w) * texture2D (_LightTextureB0, vec2(tmpvar_36)).w);
  lowp vec4 c_38;
  c_38.xyz = ((col_5 * _LightColor0.xyz) * ((max (0.0, dot (normal_33, lightDir_2)) * atten_37) * 2.0));
  c_38.w = tmpvar_3;
  c_1.xyz = c_38.xyz;
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
uniform highp mat4 _World2Object;
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
out mediump vec3 xlv_TEXCOORD3;
out highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex));
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in mediump vec3 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize(xlv_TEXCOORD3);
  lightDir_2 = tmpvar_33;
  highp vec2 P_34;
  P_34 = ((xlv_TEXCOORD4.xy / xlv_TEXCOORD4.w) + 0.5);
  highp float tmpvar_35;
  tmpvar_35 = dot (xlv_TEXCOORD4.xyz, xlv_TEXCOORD4.xyz);
  lowp float atten_36;
  atten_36 = ((float((xlv_TEXCOORD4.z > 0.0)) * texture (_LightTexture0, P_34).w) * texture (_LightTextureB0, vec2(tmpvar_35)).w);
  lowp vec4 c_37;
  c_37.xyz = ((col_5 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_31.xyz * 2.0) - 1.0), lightDir_2)) * atten_36) * 2.0));
  c_37.w = tmpvar_3;
  c_1.xyz = c_37.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 28 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_Control_ST]
Vector 20 [_Splat0_ST]
Vector 21 [_Splat1_ST]
Vector 22 [_Splat2_ST]
Vector 23 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[24] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, -vertex.normal.zxyw, c[0].yxyw;
MAD R1.xyz, vertex.normal.yzxw, c[0].xyyw, R0;
MOV R0, c[17];
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[18].w, -vertex.position;
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP3 result.texcoord[3].y, R0, -R2;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[20].xyxy, c[20];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[22].xyxy, c[22];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[21], c[21].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[23], c[23].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 30 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceLightPos0]
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
def c23, 0.00000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r0.xyz, -v2.zxyw, c23.xyxw
mad r2.xyz, v2.yzxw, c23.yxxw, r0
mul r1.xyz, v2.zxyw, r2.yzxw
mov r0, c10
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1, c8
dp4 r4.x, c16, r1
mad r0.xyz, r4, c17.w, -v0
dp3 o4.y, r0, -r3
dp3 o4.z, v2, r0
dp3 o4.x, r0, r2
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 o5.z, r0, c14
dp4 o5.y, r0, c13
dp4 o5.x, r0, c12
mad o1.zw, v3.xyxy, c19.xyxy, c19
mad o1.xy, v3, c18, c18.zwzw
mad o2.zw, v3.xyxy, c21.xyxy, c21
mad o2.xy, v3, c20, c20.zwzw
mad o3.xy, v3, c22, c22.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 29 math
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
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedkpfdglldeaafnhdiokjamailkcjmaamfabaaaaaaniagaaaaadaaaaaa
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
feeffiedepepfceeaaklklklfdeieefcceafaaaaeaaaabaaejabaaaafjaaaaae
egiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
adaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaa
kgiocaaaaaaaaaaaalaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaadiaaaaakhcaabaaa
aaaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaa
dcaaaaanhcaabaaaaaaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaiadpaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaaaaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaa
acaaaaaajgaebaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaajhcaabaaa
acaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaaicccabaaaaeaaaaaaegacbaiaebaaaaaa
abaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaa
egacbaaaacaaaaaaapaaaaahbccabaaaaeaaaaaacgakbaaaaaaaaaaaegaabaaa
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
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
uniform highp mat4 _World2Object;
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
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize(xlv_TEXCOORD3);
  lightDir_2 = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = dot (xlv_TEXCOORD4, xlv_TEXCOORD4);
  lowp vec4 c_35;
  c_35.xyz = ((col_5 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_31.xyz * 2.0) - 1.0), lightDir_2)) * (texture2D (_LightTextureB0, vec2(tmpvar_34)).w * textureCube (_LightTexture0, xlv_TEXCOORD4).w)) * 2.0));
  c_35.w = tmpvar_3;
  c_1.xyz = c_35.xyz;
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
uniform highp mat4 _World2Object;
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
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  lowp vec3 normal_33;
  normal_33.xy = ((tmpvar_31.wy * 2.0) - 1.0);
  normal_33.z = sqrt((1.0 - clamp (dot (normal_33.xy, normal_33.xy), 0.0, 1.0)));
  mediump vec3 tmpvar_34;
  tmpvar_34 = normalize(xlv_TEXCOORD3);
  lightDir_2 = tmpvar_34;
  highp float tmpvar_35;
  tmpvar_35 = dot (xlv_TEXCOORD4, xlv_TEXCOORD4);
  lowp vec4 c_36;
  c_36.xyz = ((col_5 * _LightColor0.xyz) * ((max (0.0, dot (normal_33, lightDir_2)) * (texture2D (_LightTextureB0, vec2(tmpvar_35)).w * textureCube (_LightTexture0, xlv_TEXCOORD4).w)) * 2.0));
  c_36.w = tmpvar_3;
  c_1.xyz = c_36.xyz;
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
uniform highp mat4 _World2Object;
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
out mediump vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in mediump vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize(xlv_TEXCOORD3);
  lightDir_2 = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = dot (xlv_TEXCOORD4, xlv_TEXCOORD4);
  lowp vec4 c_35;
  c_35.xyz = ((col_5 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_31.xyz * 2.0) - 1.0), lightDir_2)) * (texture (_LightTextureB0, vec2(tmpvar_34)).w * texture (_LightTexture0, xlv_TEXCOORD4).w)) * 2.0));
  c_35.w = tmpvar_3;
  c_1.xyz = c_35.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 26 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [_Control_ST]
Vector 19 [_Splat0_ST]
Vector 20 [_Splat1_ST]
Vector 21 [_Splat2_ST]
Vector 22 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[23] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, -vertex.normal.zxyw, c[0].yxyw;
MAD R1.xyz, vertex.normal.yzxw, c[0].xyyw, R0;
MOV R0, c[17];
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R3, -R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, R3, R1;
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[22], c[22].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 26 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 28 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [_Control_ST]
Vector 18 [_Splat0_ST]
Vector 19 [_Splat1_ST]
Vector 20 [_Splat2_ST]
Vector 21 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c22, 0.00000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r0.xyz, -v2.zxyw, c22.xyxw
mad r2.xyz, v2.yzxw, c22.yxxw, r0
mul r1.xyz, v2.zxyw, r2.yzxw
mov r0, c10
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
mov r1, c8
dp4 r4.x, c16, r1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o4.y, r4, -r3
dp3 o4.z, v2, r4
dp3 o4.x, r4, r2
dp4 o5.y, r0, c13
dp4 o5.x, r0, c12
mad o1.zw, v3.xyxy, c18.xyxy, c18
mad o1.xy, v3, c17, c17.zwzw
mad o2.zw, v3.xyxy, c20.xyxy, c20
mad o2.xy, v3, c19, c19.zwzw
mad o3.xy, v3, c21, c21.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 28 math
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
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedppjkndlbeilfmcjcllffkmdgfckmneenabaaaaaakmagaaaaadaaaaaa
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
adamaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcpiaeaaaaeaaaabaadoabaaaafjaaaaae
egiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadmccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
adaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaa
kgiocaaaaaaaaaaaalaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaa
aeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakmccabaaaadaaaaaa
agiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaaaaaaaaaadcaaaaal
dccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaa
aaaaaaaaamaaaaaadiaaaaakhcaabaaaaaaaaaaaegbcbaaaacaaaaaaaceaaaaa
aaaaiadpaaaaaaaaaaaaaaaaaaaaaaaadcaaaaanhcaabaaaaaaaaaaacgbjbaaa
acaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadpaaaaaaaaegacbaiaebaaaaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaaaaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaajgaebaaaaaaaaaaaegacbaia
ebaaaaaaabaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaa
egiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaa
baaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaa
abaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaaicccabaaaaeaaaaaaegacbaia
ebaaaaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaa
acaaaaaaegacbaaaacaaaaaaapaaaaahbccabaaaaeaaaaaacgakbaaaaaaaaaaa
egaabaaaacaaaaaadoaaaaab"
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
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  lightDir_2 = xlv_TEXCOORD3;
  lowp vec4 c_33;
  c_33.xyz = ((col_5 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_31.xyz * 2.0) - 1.0), lightDir_2)) * texture2D (_LightTexture0, xlv_TEXCOORD4).w) * 2.0));
  c_33.w = tmpvar_3;
  c_1.xyz = c_33.xyz;
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
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  lowp vec3 normal_33;
  normal_33.xy = ((tmpvar_31.wy * 2.0) - 1.0);
  normal_33.z = sqrt((1.0 - clamp (dot (normal_33.xy, normal_33.xy), 0.0, 1.0)));
  lightDir_2 = xlv_TEXCOORD3;
  lowp vec4 c_34;
  c_34.xyz = ((col_5 * _LightColor0.xyz) * ((max (0.0, dot (normal_33, lightDir_2)) * texture2D (_LightTexture0, xlv_TEXCOORD4).w) * 2.0));
  c_34.w = tmpvar_3;
  c_1.xyz = c_34.xyz;
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
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _Control_ST;
uniform highp vec4 _Splat0_ST;
uniform highp vec4 _Splat1_ST;
uniform highp vec4 _Splat2_ST;
uniform highp vec4 _Splat3_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out mediump vec3 xlv_TEXCOORD3;
out highp vec2 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_5.xyz;
  tmpvar_7 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_1.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_1.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_1.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in mediump vec3 xlv_TEXCOORD3;
in highp vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_18.x * tmpvar_23);
  nrm_4 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_4 + (tmpvar_18.y * tmpvar_25));
  nrm_4 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_4 + (tmpvar_18.z * tmpvar_27));
  nrm_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_4 + (tmpvar_18.w * tmpvar_29));
  nrm_4 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_32;
  lightDir_2 = xlv_TEXCOORD3;
  lowp vec4 c_33;
  c_33.xyz = ((col_5 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_31.xyz * 2.0) - 1.0), lightDir_2)) * texture (_LightTexture0, xlv_TEXCOORD4).w) * 2.0));
  c_33.w = tmpvar_3;
  c_1.xyz = c_33.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 62 math, 10 textures
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightTexture0] 2D 9
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 1, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[2], texture[4], 2D;
ADD R1.w, R0, R1;
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R0.z, R2;
TEX R3, fragment.texcoord[1], texture[2], 2D;
MAX R5.x, R1.w, R2.w;
ADD R3.w, R0.y, R3;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
MAX R5.y, R3.w, R5.x;
ADD R5.x, R0, R4.w;
MAX R4.w, R5.x, R5.y;
DP4 R0.x, R0, c[2].y;
MOV R5.w, R1;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MOV R5.z, R2.w;
MOV R5.y, R3.w;
ADD R5, R5, -R4.w;
ADD R5, R5, c[1].x;
MAX R5, R5, c[2].x;
ADD R1.w, R5.x, R5.y;
ADD R1.w, R5.z, R1;
ADD R1.w, R5, R1;
RCP R1.w, R1.w;
MUL R5, R5, R1.w;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
MUL R2.xyz, R5.z, R2;
MUL R4.xyz, R5.x, R4;
MUL R3.xyz, R5.y, R3;
ADD R3.xyz, R4, R3;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6.xzzw, R6.ywzw;
ADD R6.xy, R6, R7;
ADD R4.xy, R6, -c[2].z;
MAD R4.xy, R0.x, R4, c[2].z;
ADD R0.xyz, R3, R2;
MUL R3.xyz, R5.w, R1;
MAD R2.xy, R4.yxzw, c[2].w, -c[2].y;
MUL R1.xy, R2, R2;
ADD_SAT R0.w, R1.x, R1.y;
ADD R0.xyz, R0, R3;
ADD R0.w, -R0, c[2].y;
RSQ R0.w, R0.w;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.x, R1.x;
MUL R0.xyz, R0, c[0];
RCP R2.z, R0.w;
MUL R1.xyz, R1.x, fragment.texcoord[3];
DP3 R0.w, R2, R1;
TEX R1.w, R1.w, texture[9], 2D;
MAX R0.w, R0, c[2].x;
MUL R0.w, R0, R1;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].w;
MOV result.color.w, c[2].x;
END
# 62 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 52 math, 10 textures
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightTexture0] 2D 9
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
dcl_2d s8
dcl_2d s9
def c2, 1.00000000, 0.00000000, -0.50000000, 0.50000000
def c3, 2.00000000, -1.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
texld r0, v0, s0
texld r1, v2, s4
add_pp r1.w, r0, r1
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r3, v1, s2
max r5.x, r1.w, r2.w
add_pp r3.w, r0.y, r3
texld r4, v0.zwzw, s1
max r5.y, r3.w, r5.x
add_pp r5.x, r0, r4.w
max r4.w, r5.x, r5.y
mov r5.w, r1
texld r7.yw, v1, s6
texld r6.yw, v0.zwzw, s5
dp4_pp r0.x, r0, c2.x
mov r5.z, r2.w
mov r5.y, r3.w
add r5, r5, -r4.w
add r5, r5, c1.x
max r5, r5, c2.y
add r1.w, r5.x, r5.y
add r1.w, r5.z, r1
add r1.w, r5, r1
rcp r1.w, r1.w
mul r5, r5, r1.w
mul r7.xy, r5.y, r7.ywzw
mul r6.xy, r5.x, r6.ywzw
add_pp r6.xz, r6.xyyw, r7.xyyw
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
mul r2.xyz, r5.z, r2
mul r4.xyz, r5.x, r4
mul r3.xyz, r5.y, r3
add_pp r3.xyz, r4, r3
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6.xzzw, r6.ywzw
add_pp r6.xy, r6, r7
add_pp r4.xy, r6, c2.z
mad_pp r4.xy, r0.x, r4, c2.w
add_pp r0.xyz, r3, r2
mul r3.xyz, r5.w, r1
add_pp r3.xyz, r0, r3
mad_pp r2.xy, r4.yxzw, c3.x, c3.y
mul_pp r1.xy, r2, r2
add_pp_sat r0.x, r1, r1.y
add_pp r0.x, -r0, c2
rsq_pp r0.x, r0.x
rcp_pp r2.z, r0.x
dp3_pp r0.y, v3, v3
dp3 r0.x, v4, v4
mul_pp r1.xyz, r3, c0
rsq_pp r0.y, r0.y
mul_pp r3.xyz, r0.y, v3
dp3_pp r0.y, r2, r3
max_pp r0.y, r0, c2
texld r0.x, r0.x, s9
mul_pp r0.x, r0.y, r0
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c3.x
mov_pp oC0.w, c2.y
"
}
SubProgram "d3d11 " {
// Stats: 39 math, 10 textures
Keywords { "POINT" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_Normal0] 2D 6
SetTexture 6 [_Normal1] 2D 7
SetTexture 7 [_Normal2] 2D 8
SetTexture 8 [_Normal3] 2D 9
SetTexture 9 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmpbhmhhccdikoefjjaccjfomphggofhlabaaaaaaomaiaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmmahaaaa
eaaaaaaapdabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaa
aiaaaaaafkaaaaadaagabaaaajaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
fibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaa
fibiaaaeaahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaa
fibiaaaeaahabaaaajaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacajaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegbcbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaa
eghobaaaafaaaaaaaagabaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
acaaaaaaeghobaaaagaaaaaaaagabaaaahaaaaaaefaaaaajpcaabaaaadaaaaaa
ogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaa
aeaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaah
ecaabaaaafaaaaaadkaabaaaadaaaaaackaabaaaaeaaaaaaefaaaaajpcaabaaa
agaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaah
icaabaaaafaaaaaadkaabaaaaeaaaaaadkaabaaaagaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaafaaaaaackaabaaaafaaaaaaefaaaaajpcaabaaaahaaaaaa
egbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaahccaabaaa
afaaaaaabkaabaaaaeaaaaaadkaabaaaahaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaabkaabaaaafaaaaaaefaaaaajpcaabaaaaiaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaaaaaaaahbcaabaaaafaaaaaa
akaabaaaaeaaaaaadkaabaaaaiaaaaaabbaaaaakbcaabaaaabaaaaaaegaobaaa
aeaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdeaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaakaabaaaafaaaaaaaaaaaaaipcaabaaaaeaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegaobaaaafaaaaaaaaaaaaaipcaabaaaaeaaaaaa
egaobaaaaeaaaaaaagiacaaaaaaaaaaaahaaaaaadeaaaaakpcaabaaaaeaaaaaa
egaobaaaaeaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaabkaabaaaaeaaaaaaakaabaaaaeaaaaaaaaaaaaahicaabaaa
aaaaaaaackaabaaaaeaaaaaadkaabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaeaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaaaeaaaaaaegaobaaa
aeaaaaaapgapbaaaaaaaaaaadiaaaaahdcaabaaaacaaaaaahgapbaaaacaaaaaa
fgafbaaaaeaaaaaadcaaaaajgcaabaaaabaaaaaaagaabaaaaeaaaaaapganbaaa
abaaaaaaagabbaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaacaaaaaa
eghobaaaahaaaaaaaagabaaaaiaaaaaadcaaaaajgcaabaaaabaaaaaakgakbaaa
aeaaaaaapganbaaaacaaaaaafgagbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaadaaaaaaeghobaaaaiaaaaaaaagabaaaajaaaaaadcaaaaajgcaabaaa
abaaaaaapgapbaaaaeaaaaaapganbaaaacaaaaaafgagbaaaabaaaaaaaaaaaaak
gcaabaaaabaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalp
aaaaaaaadcaaaaamdcaabaaaabaaaaaaagaabaaaabaaaaaajgafbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadcaaaaapdcaabaaaabaaaaaa
egaabaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaa
aaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaa
abaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadeaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaa
aaaaaaaaeghobaaaajaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaa
agaabaaaaaaaaaaaagaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaa
ahaaaaaafgafbaaaaeaaaaaadcaaaaajocaabaaaaaaaaaaaagaabaaaaeaaaaaa
agajbaaaaiaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaakgakbaaa
aeaaaaaaagajbaaaadaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaa
pgapbaaaaeaaaaaaagajbaaaagaaaaaafgaobaaaaaaaaaaadiaaaaaiocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 56 math, 9 textures
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 1, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R0.z, R2;
TEX R1, fragment.texcoord[2], texture[4], 2D;
ADD R1.w, R0, R1;
MAX R5.x, R1.w, R2.w;
ADD R3.w, R0.y, R3;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
MAX R5.y, R3.w, R5.x;
ADD R5.x, R0, R4.w;
MAX R4.w, R5.x, R5.y;
DP4 R0.x, R0, c[2].y;
MOV R5.w, R1;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MOV R5.z, R2.w;
MOV R5.y, R3.w;
ADD R5, R5, -R4.w;
ADD R5, R5, c[1].x;
MAX R5, R5, c[2].x;
ADD R1.w, R5.x, R5.y;
ADD R1.w, R5.z, R1;
ADD R1.w, R5, R1;
RCP R1.w, R1.w;
MUL R5, R5, R1.w;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
MUL R6.yw, R5.z, R6;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[2].z;
MAD R0.xy, R0.x, R6, c[2].z;
MAD R6.xy, R0.yxzw, c[2].w, -c[2].y;
MUL R6.zw, R6.xyxy, R6.xyxy;
MUL R0.xyz, R5.y, R3;
ADD_SAT R0.w, R6.z, R6;
MUL R3.xyz, R5.x, R4;
ADD R0.w, -R0, c[2].y;
RSQ R0.w, R0.w;
ADD R0.xyz, R3, R0;
MUL R2.xyz, R5.z, R2;
ADD R0.xyz, R0, R2;
MUL R1.xyz, R5.w, R1;
ADD R1.xyz, R0, R1;
RCP R6.z, R0.w;
DP3 R0.x, R6, fragment.texcoord[3];
MUL R1.xyz, R1, c[0];
MAX R0.x, R0, c[2];
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[2].w;
MOV result.color.w, c[2].x;
END
# 56 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 47 math, 9 textures
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
dcl_2d s8
def c2, 1.00000000, 0.00000000, -0.50000000, 0.50000000
def c3, 2.00000000, -1.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
texld r0, v0, s0
texld r3, v1, s2
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r1, v2, s4
add_pp r1.w, r0, r1
max r5.x, r1.w, r2.w
add_pp r3.w, r0.y, r3
texld r4, v0.zwzw, s1
max r5.y, r3.w, r5.x
add_pp r5.x, r0, r4.w
max r4.w, r5.x, r5.y
dp4_pp r0.x, r0, c2.x
mov r5.w, r1
texld r7.yw, v1, s6
texld r6.yw, v0.zwzw, s5
mov r5.z, r2.w
mov r5.y, r3.w
add r5, r5, -r4.w
add r5, r5, c1.x
max r5, r5, c2.y
add r1.w, r5.x, r5.y
add r1.w, r5.z, r1
add r1.w, r5, r1
rcp r1.w, r1.w
mul r5, r5, r1.w
mul r7.xy, r5.y, r7.ywzw
mul r6.xy, r5.x, r6.ywzw
add_pp r6.xz, r6.xyyw, r7.xyyw
texld r6.yw, v1.zwzw, s7
mul r6.yw, r5.z, r6
texld r7.yw, v2, s8
add_pp r6.xy, r6.xzzw, r6.ywzw
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c2.z
mad_pp r0.xy, r0.x, r6, c2.w
mad_pp r6.xy, r0.yxzw, c3.x, c3.y
mul_pp r6.zw, r6.xyxy, r6.xyxy
mul r0.xyz, r5.y, r3
add_pp_sat r0.w, r6.z, r6
mul r3.xyz, r5.x, r4
add_pp r0.w, -r0, c2.x
rsq_pp r0.w, r0.w
add_pp r0.xyz, r3, r0
mul r2.xyz, r5.z, r2
add_pp r0.xyz, r0, r2
mul r1.xyz, r5.w, r1
add_pp r1.xyz, r0, r1
rcp_pp r6.z, r0.w
dp3_pp r0.x, r6, v3
mul_pp r1.xyz, r1, c0
max_pp r0.x, r0, c2.y
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c3.x
mov_pp oC0.w, c2.y
"
}
SubProgram "d3d11 " {
// Stats: 35 math, 9 textures
Keywords { "DIRECTIONAL" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedalhggjlgjnomdokelenabioppehpbbmhabaaaaaacaaiaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcbiahaaaaeaaaaaaamgabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaa
fkaaaaadaagabaaaaiaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaae
aahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaiaaaaaa
efaaaaajpcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaaaagabaaa
afaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaaagaaaaaa
aagabaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaacaaaaaaeghobaaa
adaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahecaabaaaaeaaaaaadkaabaaa
acaaaaaackaabaaaadaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaadaaaaaa
eghobaaaaeaaaaaaaagabaaaaeaaaaaaaaaaaaahicaabaaaaeaaaaaadkaabaaa
adaaaaaadkaabaaaafaaaaaadeaaaaahbcaabaaaaaaaaaaadkaabaaaaeaaaaaa
ckaabaaaaeaaaaaaefaaaaajpcaabaaaagaaaaaaegbabaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaaaeaaaaaabkaabaaaadaaaaaa
dkaabaaaagaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaa
aeaaaaaaefaaaaajpcaabaaaahaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaaaaaaaaahbcaabaaaaeaaaaaaakaabaaaadaaaaaadkaabaaa
ahaaaaaabbaaaaakecaabaaaaaaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpdeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaeaaaaaaaaaaaaaipcaabaaaadaaaaaaagaabaiaebaaaaaaaaaaaaaa
egaobaaaaeaaaaaaaaaaaaaipcaabaaaadaaaaaaegaobaaaadaaaaaaagiacaaa
aaaaaaaaadaaaaaadeaaaaakpcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaa
adaaaaaaakaabaaaadaaaaaaaaaaaaahbcaabaaaaaaaaaaackaabaaaadaaaaaa
akaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaadkaabaaaadaaaaaaakaabaaa
aaaaaaaaaoaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaaagaabaaaaaaaaaaa
diaaaaahdcaabaaaabaaaaaahgapbaaaabaaaaaafgafbaaaadaaaaaadcaaaaaj
dcaabaaaaaaaaaaaagaabaaaadaaaaaahgapbaaaaaaaaaaaegaabaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaaahaaaaaaaagabaaa
ahaaaaaadcaaaaajdcaabaaaaaaaaaaakgakbaaaadaaaaaahgapbaaaabaaaaaa
egaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaa
aiaaaaaaaagabaaaaiaaaaaadcaaaaajdcaabaaaaaaaaaaapgapbaaaadaaaaaa
hgapbaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadcaaaaamdcaabaaa
aaaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadcaaaaapdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaa
ddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaaeaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaagaaaaaafgafbaaaadaaaaaa
dcaaaaajocaabaaaaaaaaaaaagaabaaaadaaaaaaagajbaaaahaaaaaafgaobaaa
aaaaaaaadcaaaaajocaabaaaaaaaaaaakgakbaaaadaaaaaaagajbaaaacaaaaaa
fgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaaadaaaaaaagajbaaa
afaaaaaafgaobaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
"
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
// Stats: 68 math, 11 textures
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightTexture0] 2D 9
SetTexture 10 [_LightTextureB0] 2D 10
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 1, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[2], texture[4], 2D;
ADD R1.w, R0, R1;
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R0.z, R2;
TEX R3, fragment.texcoord[1], texture[2], 2D;
MAX R5.x, R1.w, R2.w;
ADD R3.w, R0.y, R3;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
MAX R5.y, R3.w, R5.x;
ADD R5.x, R0, R4.w;
MAX R4.w, R5.x, R5.y;
DP4 R0.x, R0, c[2].y;
MOV R5.w, R1;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MOV R5.z, R2.w;
MOV R5.y, R3.w;
ADD R5, R5, -R4.w;
ADD R5, R5, c[1].x;
MAX R5, R5, c[2].x;
ADD R1.w, R5.x, R5.y;
ADD R1.w, R5.z, R1;
ADD R1.w, R5, R1;
RCP R1.w, R1.w;
MUL R5, R5, R1.w;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
MUL R2.xyz, R5.z, R2;
MUL R4.xyz, R5.x, R4;
MUL R3.xyz, R5.y, R3;
ADD R3.xyz, R4, R3;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6.xzzw, R6.ywzw;
ADD R6.xy, R6, R7;
ADD R4.xy, R6, -c[2].z;
MAD R4.xy, R0.x, R4, c[2].z;
ADD R0.xyz, R3, R2;
MUL R3.xyz, R5.w, R1;
MAD R2.xy, R4.yxzw, c[2].w, -c[2].y;
MUL R1.xy, R2, R2;
ADD_SAT R0.w, R1.x, R1.y;
ADD R0.xyz, R0, R3;
ADD R0.w, -R0, c[2].y;
RSQ R0.w, R0.w;
RCP R2.z, R0.w;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[3];
DP3 R1.x, R2, R1;
RCP R0.w, fragment.texcoord[4].w;
MAD R1.zw, fragment.texcoord[4].xyxy, R0.w, c[2].z;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
TEX R0.w, R1.zwzw, texture[9], 2D;
TEX R1.w, R1.y, texture[10], 2D;
SLT R1.y, c[2].x, fragment.texcoord[4].z;
MUL R0.w, R1.y, R0;
MUL R1.y, R0.w, R1.w;
MAX R0.w, R1.x, c[2].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].w;
MOV result.color.w, c[2].x;
END
# 68 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 57 math, 11 textures
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightTexture0] 2D 9
SetTexture 10 [_LightTextureB0] 2D 10
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
dcl_2d s8
dcl_2d s9
dcl_2d s10
def c2, 1.00000000, 0.00000000, -0.50000000, 0.50000000
def c3, 2.00000000, -1.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4
texld r0, v0, s0
texld r1, v2, s4
add_pp r1.w, r0, r1
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r3, v1, s2
max r5.x, r1.w, r2.w
add_pp r3.w, r0.y, r3
texld r4, v0.zwzw, s1
max r5.y, r3.w, r5.x
add_pp r5.x, r0, r4.w
max r4.w, r5.x, r5.y
dp4_pp r0.x, r0, c2.x
mov r5.w, r1
texld r7.yw, v1, s6
texld r6.yw, v0.zwzw, s5
rcp r0.w, v4.w
mov r5.z, r2.w
mov r5.y, r3.w
add r5, r5, -r4.w
add r5, r5, c1.x
max r5, r5, c2.y
add r1.w, r5.x, r5.y
add r1.w, r5.z, r1
add r1.w, r5, r1
rcp r1.w, r1.w
mul r5, r5, r1.w
mul r7.xy, r5.y, r7.ywzw
mul r6.xy, r5.x, r6.ywzw
add_pp r6.xz, r6.xyyw, r7.xyyw
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
mul r2.xyz, r5.z, r2
mul r4.xyz, r5.x, r4
mul r3.xyz, r5.y, r3
add_pp r3.xyz, r4, r3
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6.xzzw, r6.ywzw
add_pp r6.xy, r6, r7
add_pp r4.xy, r6, c2.z
mad_pp r4.xy, r0.x, r4, c2.w
add_pp r0.xyz, r3, r2
mul r3.xyz, r5.w, r1
add_pp r3.xyz, r0, r3
mad_pp r2.xy, r4.yxzw, c3.x, c3.y
mul_pp r1.xy, r2, r2
add_pp_sat r0.x, r1, r1.y
add_pp r0.x, -r0, c2
rsq_pp r0.x, r0.x
dp3_pp r0.y, v3, v3
mad r1.xy, v4, r0.w, c2.w
rcp_pp r2.z, r0.x
rsq_pp r0.y, r0.y
mul_pp r0.xyz, r0.y, v3
dp3_pp r0.y, r2, r0
dp3 r0.x, v4, v4
texld r0.x, r0.x, s10
mul_pp r3.xyz, r3, c0
texld r0.w, r1, s9
cmp r0.z, -v4, c2.y, c2.x
mul_pp r0.z, r0, r0.w
mul_pp r0.z, r0, r0.x
max_pp r0.x, r0.y, c2.y
mul_pp r0.x, r0, r0.z
mul_pp r0.xyz, r0.x, r3
mul_pp oC0.xyz, r0, c3.x
mov_pp oC0.w, c2.y
"
}
SubProgram "d3d11 " {
// Stats: 45 math, 11 textures
Keywords { "SPOT" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Splat0] 2D 3
SetTexture 2 [_Splat1] 2D 4
SetTexture 3 [_Splat2] 2D 5
SetTexture 4 [_Splat3] 2D 6
SetTexture 5 [_Normal0] 2D 7
SetTexture 6 [_Normal1] 2D 8
SetTexture 7 [_Normal2] 2D 9
SetTexture 8 [_Normal3] 2D 10
SetTexture 9 [_LightTexture0] 2D 0
SetTexture 10 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedemjdephmaikaijjhmnpabnmllapdmgngabaaaaaaoaajaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmaaiaaaa
eaaaaaaadaacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaa
aiaaaaaafkaaaaadaagabaaaajaaaaaafkaaaaadaagabaaaakaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaae
aahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaae
aahabaaaagaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaafibiaaae
aahabaaaaiaaaaaaffffaaaafibiaaaeaahabaaaajaaaaaaffffaaaafibiaaae
aahabaaaakaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaa
acaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
pcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacajaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaaaaaaaakdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaajaaaaaaaagabaaa
aaaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaa
abaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaah
bcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaa
aaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaeghobaaaakaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaaaagabaaa
ahaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaaagaaaaaa
aagabaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaogbkbaaaacaaaaaaeghobaaa
adaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaahecaabaaaafaaaaaadkaabaaa
adaaaaaackaabaaaaeaaaaaaefaaaaajpcaabaaaagaaaaaaegbabaaaadaaaaaa
eghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaahicaabaaaafaaaaaadkaabaaa
aeaaaaaadkaabaaaagaaaaaadeaaaaahbcaabaaaabaaaaaadkaabaaaafaaaaaa
ckaabaaaafaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaaeaaaaaaaaaaaaahccaabaaaafaaaaaabkaabaaaaeaaaaaa
dkaabaaaahaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaa
afaaaaaaefaaaaajpcaabaaaaiaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaadaaaaaaaaaaaaahbcaabaaaafaaaaaaakaabaaaaeaaaaaadkaabaaa
aiaaaaaabbaaaaakecaabaaaabaaaaaaegaobaaaaeaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpdeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
akaabaaaafaaaaaaaaaaaaaipcaabaaaaeaaaaaaagaabaiaebaaaaaaabaaaaaa
egaobaaaafaaaaaaaaaaaaaipcaabaaaaeaaaaaaegaobaaaaeaaaaaaagiacaaa
aaaaaaaaahaaaaaadeaaaaakpcaabaaaaeaaaaaaegaobaaaaeaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahbcaabaaaabaaaaaabkaabaaa
aeaaaaaaakaabaaaaeaaaaaaaaaaaaahbcaabaaaabaaaaaackaabaaaaeaaaaaa
akaabaaaabaaaaaaaaaaaaahbcaabaaaabaaaaaadkaabaaaaeaaaaaaakaabaaa
abaaaaaaaoaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaagaabaaaabaaaaaa
diaaaaahdcaabaaaacaaaaaahgapbaaaacaaaaaafgafbaaaaeaaaaaadcaaaaaj
dcaabaaaabaaaaaaagaabaaaaeaaaaaahgapbaaaabaaaaaaegaabaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaogbkbaaaacaaaaaaeghobaaaahaaaaaaaagabaaa
ajaaaaaadcaaaaajdcaabaaaabaaaaaakgakbaaaaeaaaaaahgapbaaaacaaaaaa
egaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaadaaaaaaeghobaaa
aiaaaaaaaagabaaaakaaaaaadcaaaaajdcaabaaaabaaaaaapgapbaaaaeaaaaaa
hgapbaaaacaaaaaaegaabaaaabaaaaaaaaaaaaakdcaabaaaabaaaaaaegaabaaa
abaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadcaaaaamdcaabaaa
abaaaaaakgakbaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadcaaaaapdcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahicaabaaaabaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaa
ddaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaai
icaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaabaaaaaadkaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
abaaaaaajgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaa
aaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaahaaaaaafgafbaaaaeaaaaaa
dcaaaaajocaabaaaaaaaaaaaagaabaaaaeaaaaaaagajbaaaaiaaaaaafgaobaaa
aaaaaaaadcaaaaajocaabaaaaaaaaaaakgakbaaaaeaaaaaaagajbaaaadaaaaaa
fgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaaaeaaaaaaagajbaaa
agaaaaaafgaobaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
"
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
// Stats: 64 math, 11 textures
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightTextureB0] 2D 9
SetTexture 10 [_LightTexture0] CUBE 10
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 1, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[2], texture[4], 2D;
ADD R1.w, R0, R1;
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R5.y, R0.z, R2.w;
TEX R3, fragment.texcoord[1], texture[2], 2D;
MAX R5.x, R1.w, R5.y;
ADD R2.w, R0.y, R3;
MOV R5.z, R5.y;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
MAX R3.w, R2, R5.x;
ADD R5.x, R0, R4.w;
DP4 R0.x, R0, c[2].y;
MOV R5.w, R1;
TEX R6.yw, fragment.texcoord[1], texture[6], 2D;
MAX R3.w, R5.x, R3;
MOV R5.y, R2.w;
ADD R5, R5, -R3.w;
ADD R5, R5, c[1].x;
MAX R5, R5, c[2].x;
ADD R1.w, R5.x, R5.y;
ADD R1.w, R5.z, R1;
ADD R1.w, R5, R1;
RCP R1.w, R1.w;
MUL R5, R5, R1.w;
MUL R4.xyz, R5.x, R4;
MUL R3.xyz, R5.y, R3;
ADD R3.xyz, R4, R3;
TEX R4.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MUL R4.xy, R5.x, R4.ywzw;
MUL R4.zw, R5.y, R6.xyyw;
MUL R2.xyz, R5.z, R2;
ADD R2.xyz, R3, R2;
ADD R4.xy, R4, R4.zwzw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
MUL R4.zw, R5.z, R6.xyyw;
ADD R4.xy, R4, R4.zwzw;
TEX R6.yw, fragment.texcoord[2], texture[8], 2D;
MUL R4.zw, R5.w, R6.xyyw;
ADD R4.xy, R4, R4.zwzw;
ADD R3.xy, R4, -c[2].z;
MAD R0.xy, R0.x, R3, c[2].z;
MUL R3.xyz, R5.w, R1;
MAD R1.xy, R0.yxzw, c[2].w, -c[2].y;
MUL R1.zw, R1.xyxy, R1.xyxy;
ADD_SAT R0.w, R1.z, R1;
ADD R0.xyz, R2, R3;
DP3 R1.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.z, R1.z;
ADD R0.w, -R0, c[2].y;
RSQ R0.w, R0.w;
MUL R2.xyz, R1.z, fragment.texcoord[3];
RCP R1.z, R0.w;
DP3 R1.x, R1, R2;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
TEX R0.w, fragment.texcoord[4], texture[10], CUBE;
TEX R1.w, R1.y, texture[9], 2D;
MUL R1.y, R1.w, R0.w;
MAX R0.w, R1.x, c[2].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].w;
MOV result.color.w, c[2].x;
END
# 64 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 53 math, 11 textures
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightTextureB0] 2D 9
SetTexture 10 [_LightTexture0] CUBE 10
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
dcl_2d s8
dcl_2d s9
dcl_cube s10
def c2, 1.00000000, 0.00000000, -0.50000000, 0.50000000
def c3, 2.00000000, -1.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
texld r0, v0, s0
texld r2, v1.zwzw, s3
add_pp r5.y, r0.z, r2.w
texld r3, v1, s2
texld r1, v2, s4
add_pp r1.w, r0, r1
max r5.x, r1.w, r5.y
add_pp r2.w, r0.y, r3
mov r5.z, r5.y
texld r4, v0.zwzw, s1
max r3.w, r2, r5.x
add_pp r5.x, r0, r4.w
mov r5.w, r1
texld r6.yw, v1, s6
dp4_pp r0.x, r0, c2.x
max r3.w, r5.x, r3
mov r5.y, r2.w
add r5, r5, -r3.w
add r5, r5, c1.x
max r5, r5, c2.y
add r1.w, r5.x, r5.y
add r1.w, r5.z, r1
add r1.w, r5, r1
rcp r1.w, r1.w
mul r5, r5, r1.w
mul r4.xyz, r5.x, r4
mul r3.xyz, r5.y, r3
add_pp r3.xyz, r4, r3
texld r4.yw, v0.zwzw, s5
mul r4.xy, r5.x, r4.ywzw
mul r4.zw, r5.y, r6.xyyw
mul r2.xyz, r5.z, r2
add_pp r4.xy, r4, r4.zwzw
texld r6.yw, v1.zwzw, s7
mul r4.zw, r5.z, r6.xyyw
add_pp r4.xy, r4, r4.zwzw
texld r6.yw, v2, s8
mul r4.zw, r5.w, r6.xyyw
add_pp r2.xyz, r3, r2
add_pp r4.xy, r4, r4.zwzw
add_pp r3.xy, r4, c2.z
mad_pp r0.xy, r0.x, r3, c2.w
mad_pp r0.xy, r0.yxzw, c3.x, c3.y
mul_pp r0.zw, r0.xyxy, r0.xyxy
add_pp_sat r0.z, r0, r0.w
mul r1.xyz, r5.w, r1
add_pp r1.xyz, r2, r1
dp3_pp r0.w, v3, v3
rsq_pp r0.w, r0.w
mul_pp r2.xyz, r0.w, v3
add_pp r0.z, -r0, c2.x
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.y, r0, r2
dp3 r0.x, v4, v4
texld r0.x, r0.x, s9
texld r0.w, v4, s10
mul r0.z, r0.x, r0.w
max_pp r0.x, r0.y, c2.y
mul_pp r1.xyz, r1, c0
mul_pp r0.x, r0, r0.z
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c3.x
mov_pp oC0.w, c2.y
"
}
SubProgram "d3d11 " {
// Stats: 40 math, 11 textures
Keywords { "POINT_COOKIE" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Splat0] 2D 3
SetTexture 2 [_Splat1] 2D 4
SetTexture 3 [_Splat2] 2D 5
SetTexture 4 [_Splat3] 2D 6
SetTexture 5 [_Normal0] 2D 7
SetTexture 6 [_Normal1] 2D 8
SetTexture 7 [_Normal2] 2D 9
SetTexture 8 [_Normal3] 2D 10
SetTexture 9 [_LightTextureB0] 2D 1
SetTexture 10 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedcdlaihfgffdljlknfijkopdiggcpboeaabaaaaaaeiajaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcciaiaaaa
eaaaaaaaakacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaa
aiaaaaaafkaaaaadaagabaaaajaaaaaafkaaaaadaagabaaaakaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaae
aahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaae
aahabaaaagaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaafibiaaae
aahabaaaaiaaaaaaffffaaaafibiaaaeaahabaaaajaaaaaaffffaaaafidaaaae
aahabaaaakaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaa
acaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacajaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaa
aaaaaaaaagaabaaaaaaaaaaaeghobaaaajaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbcbaaaafaaaaaaeghobaaaakaaaaaaaagabaaaaaaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaabaaaaaah
ccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agbjbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
afaaaaaaaagabaaaahaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaa
eghobaaaagaaaaaaaagabaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaogbkbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaahecaabaaa
afaaaaaadkaabaaaadaaaaaackaabaaaaeaaaaaaefaaaaajpcaabaaaagaaaaaa
egbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaahicaabaaa
afaaaaaadkaabaaaaeaaaaaadkaabaaaagaaaaaadeaaaaahbcaabaaaabaaaaaa
dkaabaaaafaaaaaackaabaaaafaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaahccaabaaaafaaaaaa
bkaabaaaaeaaaaaadkaabaaaahaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaabkaabaaaafaaaaaaefaaaaajpcaabaaaaiaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaaaaaaaaahbcaabaaaafaaaaaaakaabaaa
aeaaaaaadkaabaaaaiaaaaaabbaaaaakecaabaaaabaaaaaaegaobaaaaeaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaakaabaaaafaaaaaaaaaaaaaipcaabaaaaeaaaaaaagaabaia
ebaaaaaaabaaaaaaegaobaaaafaaaaaaaaaaaaaipcaabaaaaeaaaaaaegaobaaa
aeaaaaaaagiacaaaaaaaaaaaahaaaaaadeaaaaakpcaabaaaaeaaaaaaegaobaaa
aeaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahbcaabaaa
abaaaaaabkaabaaaaeaaaaaaakaabaaaaeaaaaaaaaaaaaahbcaabaaaabaaaaaa
ckaabaaaaeaaaaaaakaabaaaabaaaaaaaaaaaaahbcaabaaaabaaaaaadkaabaaa
aeaaaaaaakaabaaaabaaaaaaaoaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaa
agaabaaaabaaaaaadiaaaaahdcaabaaaacaaaaaahgapbaaaacaaaaaafgafbaaa
aeaaaaaadcaaaaajdcaabaaaabaaaaaaagaabaaaaeaaaaaahgapbaaaabaaaaaa
egaabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaacaaaaaaeghobaaa
ahaaaaaaaagabaaaajaaaaaadcaaaaajdcaabaaaabaaaaaakgakbaaaaeaaaaaa
hgapbaaaacaaaaaaegaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
adaaaaaaeghobaaaaiaaaaaaaagabaaaakaaaaaadcaaaaajdcaabaaaabaaaaaa
pgapbaaaaeaaaaaahgapbaaaacaaaaaaegaabaaaabaaaaaaaaaaaaakdcaabaaa
abaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaa
dcaaaaamdcaabaaaabaaaaaakgakbaaaabaaaaaaegaabaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaadcaaaaapdcaabaaaabaaaaaaegaabaaa
abaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaabaaaaaaegaabaaaabaaaaaa
egaabaaaabaaaaaaddaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaabaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaabaaaaaajgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaa
aaaaaaaaagaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaahaaaaaa
fgafbaaaaeaaaaaadcaaaaajocaabaaaaaaaaaaaagaabaaaaeaaaaaaagajbaaa
aiaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaakgakbaaaaeaaaaaa
agajbaaaadaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaa
aeaaaaaaagajbaaaagaaaaaafgaobaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
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
// Stats: 58 math, 10 textures
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightTexture0] 2D 9
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 1, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R0.z, R2;
TEX R1, fragment.texcoord[2], texture[4], 2D;
ADD R1.w, R0, R1;
MAX R5.x, R1.w, R2.w;
ADD R3.w, R0.y, R3;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
MAX R5.y, R3.w, R5.x;
ADD R5.x, R0, R4.w;
MAX R4.w, R5.x, R5.y;
DP4 R0.x, R0, c[2].y;
MOV R5.w, R1;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MOV R5.z, R2.w;
MOV R5.y, R3.w;
ADD R5, R5, -R4.w;
ADD R5, R5, c[1].x;
MAX R5, R5, c[2].x;
ADD R1.w, R5.x, R5.y;
ADD R1.w, R5.z, R1;
ADD R1.w, R5, R1;
RCP R1.w, R1.w;
MUL R5, R5, R1.w;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[2].z;
MAD R0.xy, R0.x, R6, c[2].z;
MAD R6.xy, R0.yxzw, c[2].w, -c[2].y;
MUL R0.xyz, R5.y, R3;
MUL R3.xyz, R5.x, R4;
ADD R0.xyz, R3, R0;
MUL R3.xy, R6, R6;
MUL R2.xyz, R5.z, R2;
ADD_SAT R0.w, R3.x, R3.y;
ADD R0.w, -R0, c[2].y;
RSQ R0.w, R0.w;
RCP R6.z, R0.w;
MUL R1.xyz, R5.w, R1;
ADD R0.xyz, R0, R2;
ADD R0.xyz, R0, R1;
MUL R1.xyz, R0, c[0];
DP3 R0.x, R6, fragment.texcoord[3];
TEX R0.w, fragment.texcoord[4], texture[9], 2D;
MAX R0.x, R0, c[2];
MUL R0.x, R0, R0.w;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[2].w;
MOV result.color.w, c[2].x;
END
# 58 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 48 math, 10 textures
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightTexture0] 2D 9
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
dcl_2d s8
dcl_2d s9
def c2, 1.00000000, 0.00000000, -0.50000000, 0.50000000
def c3, 2.00000000, -1.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xy
texld r0, v0, s0
texld r3, v1, s2
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r1, v2, s4
add_pp r1.w, r0, r1
max r5.x, r1.w, r2.w
add_pp r3.w, r0.y, r3
texld r4, v0.zwzw, s1
max r5.y, r3.w, r5.x
add_pp r5.x, r0, r4.w
max r4.w, r5.x, r5.y
dp4_pp r0.x, r0, c2.x
mov r5.w, r1
texld r7.yw, v1, s6
texld r6.yw, v0.zwzw, s5
mov r5.z, r2.w
mov r5.y, r3.w
add r5, r5, -r4.w
add r5, r5, c1.x
max r5, r5, c2.y
add r1.w, r5.x, r5.y
add r1.w, r5.z, r1
add r1.w, r5, r1
rcp r1.w, r1.w
mul r5, r5, r1.w
mul r7.xy, r5.y, r7.ywzw
mul r6.xy, r5.x, r6.ywzw
add_pp r6.xz, r6.xyyw, r7.xyyw
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
add_pp r6.xy, r6.xzzw, r6.ywzw
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c2.z
mad_pp r0.xy, r0.x, r6, c2.w
mad_pp r6.xy, r0.yxzw, c3.x, c3.y
mul r0.xyz, r5.y, r3
mul r3.xyz, r5.x, r4
add_pp r0.xyz, r3, r0
mul_pp r3.xy, r6, r6
mul r2.xyz, r5.z, r2
add_pp_sat r0.w, r3.x, r3.y
add_pp r0.w, -r0, c2.x
rsq_pp r0.w, r0.w
rcp_pp r6.z, r0.w
mul r1.xyz, r5.w, r1
add_pp r0.xyz, r0, r2
add_pp r0.xyz, r0, r1
mul_pp r1.xyz, r0, c0
dp3_pp r0.x, r6, v3
texld r0.w, v4, s9
max_pp r0.x, r0, c2.y
mul_pp r0.x, r0, r0.w
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c3.x
mov_pp oC0.w, c2.y
"
}
SubProgram "d3d11 " {
// Stats: 35 math, 10 textures
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_Normal0] 2D 6
SetTexture 6 [_Normal1] 2D 7
SetTexture 7 [_Normal2] 2D 8
SetTexture 8 [_Normal3] 2D 9
SetTexture 9 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedgoahffkknlcaeondofhjgijcbniflpjeabaaaaaaieaiaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgeahaaaa
eaaaaaaanjabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaa
aiaaaaaafkaaaaadaagabaaaajaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
fibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaa
fibiaaaeaahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaa
fibiaaaeaahabaaaajaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaiaaaaaa
efaaaaajpcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaaaagabaaa
agaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaaagaaaaaa
aagabaaaahaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaacaaaaaaeghobaaa
adaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaahecaabaaaaeaaaaaadkaabaaa
acaaaaaackaabaaaadaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaadaaaaaa
eghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaahicaabaaaaeaaaaaadkaabaaa
adaaaaaadkaabaaaafaaaaaadeaaaaahbcaabaaaaaaaaaaadkaabaaaaeaaaaaa
ckaabaaaaeaaaaaaefaaaaajpcaabaaaagaaaaaaegbabaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaadaaaaaaaaaaaaahccaabaaaaeaaaaaabkaabaaaadaaaaaa
dkaabaaaagaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaa
aeaaaaaaefaaaaajpcaabaaaahaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaacaaaaaaaaaaaaahbcaabaaaaeaaaaaaakaabaaaadaaaaaadkaabaaa
ahaaaaaabbaaaaakecaabaaaaaaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpdeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaeaaaaaaaaaaaaaipcaabaaaadaaaaaaagaabaiaebaaaaaaaaaaaaaa
egaobaaaaeaaaaaaaaaaaaaipcaabaaaadaaaaaaegaobaaaadaaaaaaagiacaaa
aaaaaaaaahaaaaaadeaaaaakpcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaa
adaaaaaaakaabaaaadaaaaaaaaaaaaahbcaabaaaaaaaaaaackaabaaaadaaaaaa
akaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaadkaabaaaadaaaaaaakaabaaa
aaaaaaaaaoaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaaagaabaaaaaaaaaaa
diaaaaahdcaabaaaabaaaaaahgapbaaaabaaaaaafgafbaaaadaaaaaadcaaaaaj
dcaabaaaaaaaaaaaagaabaaaadaaaaaahgapbaaaaaaaaaaaegaabaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaaahaaaaaaaagabaaa
aiaaaaaadcaaaaajdcaabaaaaaaaaaaakgakbaaaadaaaaaahgapbaaaabaaaaaa
egaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaa
aiaaaaaaaagabaaaajaaaaaadcaaaaajdcaabaaaaaaaaaaapgapbaaaadaaaaaa
hgapbaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadcaaaaamdcaabaaa
aaaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadcaaaaapdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaa
ddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaaeaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaa
ajaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaa
pgapbaaaabaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaagaaaaaafgafbaaa
adaaaaaadcaaaaajocaabaaaaaaaaaaaagaabaaaadaaaaaaagajbaaaahaaaaaa
fgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaakgakbaaaadaaaaaaagajbaaa
acaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaaadaaaaaa
agajbaaaafaaaaaafgaobaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
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
 //       d3d11 : 25 math
 //        d3d9 : 25 math
 //      opengl : 25 math
 // Stats for Fragment shader:
 //       d3d11 : 30 math, 9 texture
 //        d3d9 : 38 math, 9 texture
 //      opengl : 47 math, 9 texture
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="Geometry-100" "RenderType"="Opaque" "SplatCount"="4" }
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 25 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [unity_Scale]
Vector 10 [_Control_ST]
Vector 11 [_Splat0_ST]
Vector 12 [_Splat1_ST]
Vector 13 [_Splat2_ST]
Vector 14 [_Splat3_ST]
"3.0-!!ARBvp1.0
PARAM c[15] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
TEMP R2;
MUL R0.xyz, -vertex.normal.zxyw, c[0].yxyw;
MAD R1.xyz, vertex.normal.yzxw, c[0].xyyw, R0;
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
DP3 R0.y, -R2, c[5];
DP3 R0.x, R1, c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[3].xyz, R0, c[9].w;
DP3 R0.y, -R2, c[6];
DP3 R0.x, R1, c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[4].xyz, R0, c[9].w;
DP3 R0.y, -R2, c[7];
DP3 R0.x, R1, c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[5].xyz, R0, c[9].w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[14], c[14].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 25 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 25 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_Scale]
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
dcl_texcoord4 o5
dcl_texcoord5 o6
def c14, 0.00000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r0.xyz, -v2.zxyw, c14.xyxw
mad r1.xyz, v2.yzxw, c14.yxxw, r0
mul r0.xyz, v2.zxyw, r1.yzxw
mad r2.xyz, v2.yzxw, r1.zxyw, -r0
dp3 r0.y, -r2, c4
dp3 r0.x, r1, c4
dp3 r0.z, v2, c4
mul o4.xyz, r0, c8.w
dp3 r0.y, -r2, c5
dp3 r0.x, r1, c5
dp3 r0.z, v2, c5
mul o5.xyz, r0, c8.w
dp3 r0.y, -r2, c6
dp3 r0.x, r1, c6
dp3 r0.z, v2, c6
mul o6.xyz, r0, c8.w
mad o1.zw, v3.xyxy, c10.xyxy, c10
mad o1.xy, v3, c9, c9.zwzw
mad o2.zw, v3.xyxy, c12.xyxy, c12
mad o2.xy, v3, c11, c11.zwzw
mad o3.xy, v3, c13, c13.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 25 math
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
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedgkklemlnbnlhmhogeegpfofjioalcjccabaaaaaanaagaaaaadaaaaaa
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
aaklklklfdeieefcaeafaaaaeaaaabaaebabaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaa
aaaaaaaaafaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaacaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaaabaaaaaa
aoaaaaaadgaaaaagbcaabaaaaaaaaaaaakiacaaaabaaaaaaamaaaaaadgaaaaag
ccaabaaaaaaaaaaaakiacaaaabaaaaaaanaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaakhcaabaaaacaaaaaaegbcbaaa
acaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaadcaaaaanhcaabaaa
acaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadpaaaaaaaa
egacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaacaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgbebaaaacaaaaaajgaebaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaabaaaaaaiccaabaaaabaaaaaaegacbaia
ebaaaaaaadaaaaaaegacbaaaaaaaaaaaapaaaaahbcaabaaaabaaaaaacgakbaaa
acaaaaaaegaabaaaaaaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaaabaaaaaa
pgipcaaaabaaaaaabeaaaaaadgaaaaagbcaabaaaaaaaaaaabkiacaaaabaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaabkiacaaaabaaaaaaanaaaaaaapaaaaah
bcaabaaaabaaaaaacgakbaaaacaaaaaaegaabaaaaaaaaaaadgaaaaagecaabaaa
aaaaaaaabkiacaaaabaaaaaaaoaaaaaabaaaaaaiccaabaaaabaaaaaaegacbaia
ebaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadiaaaaaihccabaaaafaaaaaaegacbaaaabaaaaaa
pgipcaaaabaaaaaabeaaaaaadgaaaaagbcaabaaaaaaaaaaackiacaaaabaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaaabaaaaaaanaaaaaaapaaaaah
bcaabaaaabaaaaaacgakbaaaacaaaaaaegaabaaaaaaaaaaadgaaaaagecaabaaa
aaaaaaaackiacaaaabaaaaaaaoaaaaaabaaaaaaiccaabaaaabaaaaaaegacbaia
ebaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadiaaaaaihccabaaaagaaaaaaegacbaaaabaaaaaa
pgipcaaaabaaaaaabeaaaaaadoaaaaab"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
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
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_4.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_5 = tmpvar_4.xyz;
  tmpvar_6 = (((tmpvar_1.yzx * tmpvar_4.zxy) - (tmpvar_1.zxy * tmpvar_4.yzx)) * -1.0);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_5.x;
  tmpvar_7[0].y = tmpvar_6.x;
  tmpvar_7[0].z = tmpvar_1.x;
  tmpvar_7[1].x = tmpvar_5.y;
  tmpvar_7[1].y = tmpvar_6.y;
  tmpvar_7[1].z = tmpvar_1.y;
  tmpvar_7[2].x = tmpvar_5.z;
  tmpvar_7[2].y = tmpvar_6.z;
  tmpvar_7[2].z = tmpvar_1.z;
  vec3 v_8;
  v_8.x = _Object2World[0].x;
  v_8.y = _Object2World[1].x;
  v_8.z = _Object2World[2].x;
  vec3 v_9;
  v_9.x = _Object2World[0].y;
  v_9.y = _Object2World[1].y;
  v_9.z = _Object2World[2].y;
  vec3 v_10;
  v_10.x = _Object2World[0].z;
  v_10.y = _Object2World[1].z;
  v_10.z = _Object2World[2].z;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((tmpvar_7 * v_8) * unity_Scale.w);
  xlv_TEXCOORD4 = ((tmpvar_7 * v_9) * unity_Scale.w);
  xlv_TEXCOORD5 = ((tmpvar_7 * v_10) * unity_Scale.w);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 res_1;
  lowp vec3 worldN_2;
  lowp vec4 nrm_3;
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
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_5 - max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)))) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_5 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_7).xyz;
  col_4 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_4 + (tmpvar_16.y * tmpvar_8).xyz);
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_16.z * tmpvar_9).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_16.w * tmpvar_10).xyz);
  col_4 = tmpvar_20;
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_16.x * tmpvar_21);
  nrm_3 = tmpvar_22;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_24;
  tmpvar_24 = (nrm_3 + (tmpvar_16.y * tmpvar_23));
  nrm_3 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_3 + (tmpvar_16.z * tmpvar_25));
  nrm_3 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_3 + (tmpvar_16.w * tmpvar_27));
  nrm_3 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = ((tmpvar_29.xyz * 2.0) - 1.0);
  highp float tmpvar_31;
  tmpvar_31 = dot (xlv_TEXCOORD3, tmpvar_30);
  worldN_2.x = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = dot (xlv_TEXCOORD4, tmpvar_30);
  worldN_2.y = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = dot (xlv_TEXCOORD5, tmpvar_30);
  worldN_2.z = tmpvar_33;
  res_1.xyz = ((worldN_2 * 0.5) + 0.5);
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
attribute vec4 _glesMultiTexCoord0;
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
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_4.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_5 = tmpvar_4.xyz;
  tmpvar_6 = (((tmpvar_1.yzx * tmpvar_4.zxy) - (tmpvar_1.zxy * tmpvar_4.yzx)) * -1.0);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_5.x;
  tmpvar_7[0].y = tmpvar_6.x;
  tmpvar_7[0].z = tmpvar_1.x;
  tmpvar_7[1].x = tmpvar_5.y;
  tmpvar_7[1].y = tmpvar_6.y;
  tmpvar_7[1].z = tmpvar_1.y;
  tmpvar_7[2].x = tmpvar_5.z;
  tmpvar_7[2].y = tmpvar_6.z;
  tmpvar_7[2].z = tmpvar_1.z;
  vec3 v_8;
  v_8.x = _Object2World[0].x;
  v_8.y = _Object2World[1].x;
  v_8.z = _Object2World[2].x;
  vec3 v_9;
  v_9.x = _Object2World[0].y;
  v_9.y = _Object2World[1].y;
  v_9.z = _Object2World[2].y;
  vec3 v_10;
  v_10.x = _Object2World[0].z;
  v_10.y = _Object2World[1].z;
  v_10.z = _Object2World[2].z;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((tmpvar_7 * v_8) * unity_Scale.w);
  xlv_TEXCOORD4 = ((tmpvar_7 * v_9) * unity_Scale.w);
  xlv_TEXCOORD5 = ((tmpvar_7 * v_10) * unity_Scale.w);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 res_1;
  lowp vec3 worldN_2;
  lowp vec4 nrm_3;
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
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_5 - max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)))) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_5 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_7).xyz;
  col_4 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_4 + (tmpvar_16.y * tmpvar_8).xyz);
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_16.z * tmpvar_9).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_16.w * tmpvar_10).xyz);
  col_4 = tmpvar_20;
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_16.x * tmpvar_21);
  nrm_3 = tmpvar_22;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_24;
  tmpvar_24 = (nrm_3 + (tmpvar_16.y * tmpvar_23));
  nrm_3 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_3 + (tmpvar_16.z * tmpvar_25));
  nrm_3 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_3 + (tmpvar_16.w * tmpvar_27));
  nrm_3 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_29;
  lowp vec3 normal_30;
  normal_30.xy = ((tmpvar_29.wy * 2.0) - 1.0);
  normal_30.z = sqrt((1.0 - clamp (dot (normal_30.xy, normal_30.xy), 0.0, 1.0)));
  highp float tmpvar_31;
  tmpvar_31 = dot (xlv_TEXCOORD3, normal_30);
  worldN_2.x = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = dot (xlv_TEXCOORD4, normal_30);
  worldN_2.y = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = dot (xlv_TEXCOORD5, normal_30);
  worldN_2.z = tmpvar_33;
  res_1.xyz = ((worldN_2 * 0.5) + 0.5);
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
in vec4 _glesMultiTexCoord0;
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
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_4.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_5 = tmpvar_4.xyz;
  tmpvar_6 = (((tmpvar_1.yzx * tmpvar_4.zxy) - (tmpvar_1.zxy * tmpvar_4.yzx)) * -1.0);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_5.x;
  tmpvar_7[0].y = tmpvar_6.x;
  tmpvar_7[0].z = tmpvar_1.x;
  tmpvar_7[1].x = tmpvar_5.y;
  tmpvar_7[1].y = tmpvar_6.y;
  tmpvar_7[1].z = tmpvar_1.y;
  tmpvar_7[2].x = tmpvar_5.z;
  tmpvar_7[2].y = tmpvar_6.z;
  tmpvar_7[2].z = tmpvar_1.z;
  vec3 v_8;
  v_8.x = _Object2World[0].x;
  v_8.y = _Object2World[1].x;
  v_8.z = _Object2World[2].x;
  vec3 v_9;
  v_9.x = _Object2World[0].y;
  v_9.y = _Object2World[1].y;
  v_9.z = _Object2World[2].y;
  vec3 v_10;
  v_10.x = _Object2World[0].z;
  v_10.y = _Object2World[1].z;
  v_10.z = _Object2World[2].z;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = ((tmpvar_7 * v_8) * unity_Scale.w);
  xlv_TEXCOORD4 = ((tmpvar_7 * v_9) * unity_Scale.w);
  xlv_TEXCOORD5 = ((tmpvar_7 * v_10) * unity_Scale.w);
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 res_1;
  lowp vec3 worldN_2;
  lowp vec4 nrm_3;
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
  highp vec4 tmpvar_15;
  tmpvar_15 = max (((blend_5 - max (blend_5.x, max (blend_5.y, max (blend_5.z, blend_5.w)))) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 / (((tmpvar_15.x + tmpvar_15.y) + tmpvar_15.z) + tmpvar_15.w));
  blend_5 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.x * tmpvar_7).xyz;
  col_4 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (col_4 + (tmpvar_16.y * tmpvar_8).xyz);
  col_4 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (col_4 + (tmpvar_16.z * tmpvar_9).xyz);
  col_4 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (col_4 + (tmpvar_16.w * tmpvar_10).xyz);
  col_4 = tmpvar_20;
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_16.x * tmpvar_21);
  nrm_3 = tmpvar_22;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_24;
  tmpvar_24 = (nrm_3 + (tmpvar_16.y * tmpvar_23));
  nrm_3 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_26;
  tmpvar_26 = (nrm_3 + (tmpvar_16.z * tmpvar_25));
  nrm_3 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_28;
  tmpvar_28 = (nrm_3 + (tmpvar_16.w * tmpvar_27));
  nrm_3 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_3 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = ((tmpvar_29.xyz * 2.0) - 1.0);
  highp float tmpvar_31;
  tmpvar_31 = dot (xlv_TEXCOORD3, tmpvar_30);
  worldN_2.x = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = dot (xlv_TEXCOORD4, tmpvar_30);
  worldN_2.y = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = dot (xlv_TEXCOORD5, tmpvar_30);
  worldN_2.z = tmpvar_33;
  res_1.xyz = ((worldN_2 * 0.5) + 0.5);
  res_1.w = 0.0;
  _glesFragData[0] = res_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 47 math, 9 textures
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 1, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R1, fragment.texcoord[0], texture[0], 2D;
TEX R2.w, fragment.texcoord[2], texture[4], 2D;
TEX R0.w, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R0.z, R1, R0.w;
ADD R0.y, R1.w, R2.w;
TEX R0.w, fragment.texcoord[1], texture[2], 2D;
ADD R2.x, R1.y, R0.w;
MAX R0.x, R0.y, R0.z;
MAX R2.y, R2.x, R0.x;
TEX R0.w, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R0.x, R1, R0.w;
MOV R0.w, R0.y;
MAX R2.y, R0.x, R2;
MOV R0.y, R2.x;
ADD R0, R0, -R2.y;
ADD R0, R0, c[0].x;
MAX R0, R0, c[1].x;
ADD R2.x, R0, R0.y;
ADD R2.x, R0.z, R2;
ADD R2.x, R0.w, R2;
RCP R2.x, R2.x;
MUL R0, R0, R2.x;
TEX R3.yw, fragment.texcoord[1], texture[6], 2D;
MUL R3.xy, R0.y, R3.ywzw;
TEX R2.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MUL R0.xy, R0.x, R2.ywzw;
ADD R0.xy, R0, R3;
TEX R2.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
MUL R2.xy, R0.z, R2.ywzw;
TEX R3.yw, fragment.texcoord[2], texture[8], 2D;
MUL R0.zw, R0.w, R3.xyyw;
ADD R0.xy, R0, R2;
ADD R0.xy, R0, R0.zwzw;
ADD R0.zw, R0.xyxy, -c[1].z;
DP4 R0.x, R1, c[1].y;
MAD R0.xy, R0.x, R0.zwzw, c[1].z;
MAD R0.xy, R0.yxzw, c[1].w, -c[1].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[1].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.z, fragment.texcoord[5], R0;
DP3 R1.x, R0, fragment.texcoord[3];
DP3 R1.y, R0, fragment.texcoord[4];
MAD result.color.xyz, R1, c[1].z, c[1].z;
MOV result.color.w, c[1].x;
END
# 47 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 38 math, 9 textures
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
dcl_2d s8
def c1, 1.00000000, 0.00000000, -0.50000000, 0.50000000
def c2, 2.00000000, -1.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
texld r1, v0, s0
texld r2.w, v2, s4
texld r0.w, v1.zwzw, s3
add_pp r0.z, r1, r0.w
add_pp r0.y, r1.w, r2.w
texld r0.w, v1, s2
add_pp r2.x, r1.y, r0.w
max r0.x, r0.y, r0.z
max r2.y, r2.x, r0.x
texld r0.w, v0.zwzw, s1
add_pp r0.x, r1, r0.w
mov r0.w, r0.y
max r2.y, r0.x, r2
mov r0.y, r2.x
add r0, r0, -r2.y
add r0, r0, c0.x
max r0, r0, c1.y
add r2.x, r0, r0.y
add r2.x, r0.z, r2
add r2.x, r0.w, r2
rcp r2.x, r2.x
mul r0, r0, r2.x
texld r3.yw, v1, s6
mul r3.xy, r0.y, r3.ywzw
texld r2.yw, v0.zwzw, s5
mul r0.xy, r0.x, r2.ywzw
add_pp r0.xy, r0, r3
texld r2.yw, v1.zwzw, s7
mul r2.xy, r0.z, r2.ywzw
texld r3.yw, v2, s8
mul r0.zw, r0.w, r3.xyyw
add_pp r0.xy, r0, r2
add_pp r0.xy, r0, r0.zwzw
add_pp r0.zw, r0.xyxy, c1.z
dp4_pp r0.x, r1, c1.x
mad_pp r0.xy, r0.x, r0.zwzw, c1.w
mad_pp r0.xy, r0.yxzw, c2.x, c2.y
mul_pp r0.zw, r0.xyxy, r0.xyxy
add_pp_sat r0.z, r0, r0.w
add_pp r0.z, -r0, c1.x
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3 r1.z, v5, r0
dp3 r1.x, r0, v3
dp3 r1.y, r0, v4
mad_pp oC0.xyz, r1, c1.w, c1.w
mov_pp oC0.w, c1.y
"
}
SubProgram "d3d11 " {
// Stats: 30 math, 9 textures
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
ConstBuffer "$Globals" 144
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedffialpgfhiepojkglimooeholpdpabpdabaaaaaaoaahaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefckiagaaaaeaaaaaaakkabaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaae
aahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaae
aahabaaaagaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaafibiaaae
aahabaaaaiaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaa
acaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaaeghobaaa
adaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahecaabaaaaaaaaaaadkaabaaa
aaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaadaaaaaa
eghobaaaaeaaaaaaaagabaaaaeaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
abaaaaaadkaabaaaacaaaaaadeaaaaahbcaabaaaacaaaaaadkaabaaaaaaaaaaa
ckaabaaaaaaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaabaaaaaa
dkaabaaaadaaaaaadeaaaaahbcaabaaaacaaaaaaakaabaaaacaaaaaabkaabaaa
aaaaaaaaefaaaaajpcaabaaaadaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaa
adaaaaaabbaaaaakbcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpdeaaaaahccaabaaaabaaaaaaakaabaaaacaaaaaa
akaabaaaaaaaaaaaaaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaafgafbaia
ebaaaaaaabaaaaaaaaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaagiacaaa
aaaaaaaaadaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaackaabaaaaaaaaaaa
bkaabaaaabaaaaaaaaaaaaahccaabaaaabaaaaaadkaabaaaaaaaaaaabkaabaaa
abaaaaaaaoaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaafgafbaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaaagaaaaaaaagabaaa
agaaaaaadiaaaaahgcaabaaaabaaaaaafgafbaaaaaaaaaaapganbaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaaaagabaaa
afaaaaaadcaaaaajdcaabaaaaaaaaaaaagaabaaaaaaaaaaahgapbaaaacaaaaaa
jgafbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaacaaaaaaeghobaaa
ahaaaaaaaagabaaaahaaaaaadcaaaaajdcaabaaaaaaaaaaakgakbaaaaaaaaaaa
hgapbaaaacaaaaaaegaabaaaaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
adaaaaaaeghobaaaaiaaaaaaaagabaaaaiaaaaaadcaaaaajdcaabaaaaaaaaaaa
pgapbaaaaaaaaaaahgapbaaaacaaaaaaegaabaaaaaaaaaaaaaaaaaakdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaa
dcaaaaamdcaabaaaaaaaaaaaagaabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaadcaaaaapdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaa
egaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaaabaaaaaa
egbcbaaaafaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
agaaaaaaegacbaaaaaaaaaaadcaaaaaphccabaaaaaaaaaaaegacbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
"
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
 //       d3d11 : 31 avg math (22..43), 8 avg texture (6..12)
 //        d3d9 : 39 avg math (27..54), 8 avg texture (6..12)
 //      opengl : 48 avg math (34..66), 8 avg texture (6..12)
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
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c17.w
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
mad o1.zw, v3.xyxy, c19.xyxy, c19
mad o1.xy, v3, c18, c18.zwzw
mad o2.zw, v3.xyxy, c21.xyxy, c21
mad o2.xy, v3, c20, c20.zwzw
mad o3.xy, v3, c22, c22.zwzw
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_5;
  lowp vec3 col_6;
  highp vec4 blend_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_8.x);
  blend_7.x = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_8.y);
  blend_7.y = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_8.z);
  blend_7.z = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_8.w);
  blend_7.w = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (blend_7.x, max (blend_7.y, max (blend_7.z, blend_7.w)));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_7 - tmpvar_17) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_7 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_9).xyz;
  col_6 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_6 + (tmpvar_19.y * tmpvar_10).xyz);
  col_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_6 + (tmpvar_19.z * tmpvar_11).xyz);
  col_6 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_6 + (tmpvar_19.w * tmpvar_12).xyz);
  col_6 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_19.x * tmpvar_24);
  nrm_5 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_5 + (tmpvar_19.y * tmpvar_26));
  nrm_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_5 + (tmpvar_19.z * tmpvar_28));
  nrm_5 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_5 + (tmpvar_19.w * tmpvar_30));
  nrm_5 = tmpvar_31;
  nrm_5 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_5, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_17 * 0.5);
  tmpvar_4 = tmpvar_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_33;
  mediump vec4 tmpvar_34;
  tmpvar_34 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.w = tmpvar_34.w;
  highp vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34.xyz + xlv_TEXCOORD4);
  light_3.xyz = tmpvar_35;
  lowp vec4 c_36;
  mediump vec3 tmpvar_37;
  tmpvar_37 = (col_6 * light_3.xyz);
  c_36.xyz = tmpvar_37;
  c_36.w = tmpvar_4;
  c_2 = c_36;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_5;
  lowp vec3 col_6;
  highp vec4 blend_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_8.x);
  blend_7.x = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_8.y);
  blend_7.y = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_8.z);
  blend_7.z = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_8.w);
  blend_7.w = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (blend_7.x, max (blend_7.y, max (blend_7.z, blend_7.w)));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_7 - tmpvar_17) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_7 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_9).xyz;
  col_6 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_6 + (tmpvar_19.y * tmpvar_10).xyz);
  col_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_6 + (tmpvar_19.z * tmpvar_11).xyz);
  col_6 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_6 + (tmpvar_19.w * tmpvar_12).xyz);
  col_6 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_19.x * tmpvar_24);
  nrm_5 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_5 + (tmpvar_19.y * tmpvar_26));
  nrm_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_5 + (tmpvar_19.z * tmpvar_28));
  nrm_5 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_5 + (tmpvar_19.w * tmpvar_30));
  nrm_5 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_5, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_5 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (tmpvar_17 * 0.5);
  tmpvar_4 = tmpvar_33;
  lowp vec3 normal_34;
  normal_34.xy = ((tmpvar_32.wy * 2.0) - 1.0);
  normal_34.z = sqrt((1.0 - clamp (dot (normal_34.xy, normal_34.xy), 0.0, 1.0)));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.w = tmpvar_36.w;
  highp vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_36.xyz + xlv_TEXCOORD4);
  light_3.xyz = tmpvar_37;
  lowp vec4 c_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (col_6 * light_3.xyz);
  c_38.xyz = tmpvar_39;
  c_38.w = tmpvar_4;
  c_2 = c_38;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_5;
  lowp vec3 col_6;
  highp vec4 blend_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_8.x);
  blend_7.x = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_8.y);
  blend_7.y = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_8.z);
  blend_7.z = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_8.w);
  blend_7.w = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (blend_7.x, max (blend_7.y, max (blend_7.z, blend_7.w)));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_7 - tmpvar_17) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_7 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_9).xyz;
  col_6 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_6 + (tmpvar_19.y * tmpvar_10).xyz);
  col_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_6 + (tmpvar_19.z * tmpvar_11).xyz);
  col_6 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_6 + (tmpvar_19.w * tmpvar_12).xyz);
  col_6 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_19.x * tmpvar_24);
  nrm_5 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_5 + (tmpvar_19.y * tmpvar_26));
  nrm_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_5 + (tmpvar_19.z * tmpvar_28));
  nrm_5 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_5 + (tmpvar_19.w * tmpvar_30));
  nrm_5 = tmpvar_31;
  nrm_5 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_5, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_17 * 0.5);
  tmpvar_4 = tmpvar_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = textureProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_33;
  mediump vec4 tmpvar_34;
  tmpvar_34 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.w = tmpvar_34.w;
  highp vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34.xyz + xlv_TEXCOORD4);
  light_3.xyz = tmpvar_35;
  lowp vec4 c_36;
  mediump vec3 tmpvar_37;
  tmpvar_37 = (col_6 * light_3.xyz);
  c_36.xyz = tmpvar_37;
  c_36.w = tmpvar_4;
  c_2 = c_36;
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
dcl_texcoord0 v3
dcl_texcoord1 v4
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
mad o1.zw, v3.xyxy, c17.xyxy, c17
mad o1.xy, v3, c16, c16.zwzw
mad o2.zw, v3.xyxy, c19.xyxy, c19
mad o2.xy, v3, c18, c18.zwzw
mad o3.xy, v3, c20, c20.zwzw
mad o5.xy, v4, c15, c15.zwzw
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_8;
  lowp vec3 col_9;
  highp vec4 blend_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_11.x);
  blend_10.x = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_11.y);
  blend_10.y = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_14.w + tmpvar_11.z);
  blend_10.z = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_15.w + tmpvar_11.w);
  blend_10.w = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (blend_10.x, max (blend_10.y, max (blend_10.z, blend_10.w)));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (((blend_10 - tmpvar_20) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_21 / (((tmpvar_21.x + tmpvar_21.y) + tmpvar_21.z) + tmpvar_21.w));
  blend_10 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_22.x * tmpvar_12).xyz;
  col_9 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_9 + (tmpvar_22.y * tmpvar_13).xyz);
  col_9 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (col_9 + (tmpvar_22.z * tmpvar_14).xyz);
  col_9 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (col_9 + (tmpvar_22.w * tmpvar_15).xyz);
  col_9 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_22.x * tmpvar_27);
  nrm_8 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_8 + (tmpvar_22.y * tmpvar_29));
  nrm_8 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_32;
  tmpvar_32 = (nrm_8 + (tmpvar_22.z * tmpvar_31));
  nrm_8 = tmpvar_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_34;
  tmpvar_34 = (nrm_8 + (tmpvar_22.w * tmpvar_33));
  nrm_8 = tmpvar_34;
  nrm_8 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_8, vec4(dot (tmpvar_11, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_35;
  tmpvar_35 = (tmpvar_20 * 0.5);
  tmpvar_7 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_6 = tmpvar_36;
  mediump vec4 tmpvar_37;
  tmpvar_37 = -(log2(max (light_6, vec4(0.001, 0.001, 0.001, 0.001))));
  light_6.w = tmpvar_37.w;
  highp float tmpvar_38;
  tmpvar_38 = ((sqrt(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lmFull_4 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  lmIndirect_3 = tmpvar_40;
  light_6.xyz = (tmpvar_37.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_41;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (col_9 * light_6.xyz);
  c_41.xyz = tmpvar_42;
  c_41.w = tmpvar_7;
  c_2 = c_41;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_8;
  lowp vec3 col_9;
  highp vec4 blend_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_11.x);
  blend_10.x = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_11.y);
  blend_10.y = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_14.w + tmpvar_11.z);
  blend_10.z = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_15.w + tmpvar_11.w);
  blend_10.w = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (blend_10.x, max (blend_10.y, max (blend_10.z, blend_10.w)));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (((blend_10 - tmpvar_20) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_21 / (((tmpvar_21.x + tmpvar_21.y) + tmpvar_21.z) + tmpvar_21.w));
  blend_10 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_22.x * tmpvar_12).xyz;
  col_9 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_9 + (tmpvar_22.y * tmpvar_13).xyz);
  col_9 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (col_9 + (tmpvar_22.z * tmpvar_14).xyz);
  col_9 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (col_9 + (tmpvar_22.w * tmpvar_15).xyz);
  col_9 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_22.x * tmpvar_27);
  nrm_8 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_8 + (tmpvar_22.y * tmpvar_29));
  nrm_8 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_32;
  tmpvar_32 = (nrm_8 + (tmpvar_22.z * tmpvar_31));
  nrm_8 = tmpvar_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_34;
  tmpvar_34 = (nrm_8 + (tmpvar_22.w * tmpvar_33));
  nrm_8 = tmpvar_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_8, vec4(dot (tmpvar_11, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_8 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = (tmpvar_20 * 0.5);
  tmpvar_7 = tmpvar_36;
  lowp vec3 normal_37;
  normal_37.xy = ((tmpvar_35.wy * 2.0) - 1.0);
  normal_37.z = sqrt((1.0 - clamp (dot (normal_37.xy, normal_37.xy), 0.0, 1.0)));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_6 = tmpvar_38;
  mediump vec4 tmpvar_39;
  tmpvar_39 = -(log2(max (light_6, vec4(0.001, 0.001, 0.001, 0.001))));
  light_6.w = tmpvar_39.w;
  lowp vec4 tmpvar_40;
  tmpvar_40 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec4 tmpvar_41;
  tmpvar_41 = texture2D (unity_LightmapInd, xlv_TEXCOORD4);
  highp float tmpvar_42;
  tmpvar_42 = ((sqrt(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_42;
  lowp vec3 tmpvar_43;
  tmpvar_43 = ((8.0 * tmpvar_40.w) * tmpvar_40.xyz);
  lmFull_4 = tmpvar_43;
  lowp vec3 tmpvar_44;
  tmpvar_44 = ((8.0 * tmpvar_41.w) * tmpvar_41.xyz);
  lmIndirect_3 = tmpvar_44;
  light_6.xyz = (tmpvar_39.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_45;
  mediump vec3 tmpvar_46;
  tmpvar_46 = (col_9 * light_6.xyz);
  c_45.xyz = tmpvar_46;
  c_45.w = tmpvar_7;
  c_2 = c_45;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_8;
  lowp vec3 col_9;
  highp vec4 blend_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_11.x);
  blend_10.x = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_11.y);
  blend_10.y = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_14.w + tmpvar_11.z);
  blend_10.z = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_15.w + tmpvar_11.w);
  blend_10.w = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (blend_10.x, max (blend_10.y, max (blend_10.z, blend_10.w)));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (((blend_10 - tmpvar_20) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_21 / (((tmpvar_21.x + tmpvar_21.y) + tmpvar_21.z) + tmpvar_21.w));
  blend_10 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_22.x * tmpvar_12).xyz;
  col_9 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_9 + (tmpvar_22.y * tmpvar_13).xyz);
  col_9 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (col_9 + (tmpvar_22.z * tmpvar_14).xyz);
  col_9 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (col_9 + (tmpvar_22.w * tmpvar_15).xyz);
  col_9 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_22.x * tmpvar_27);
  nrm_8 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_8 + (tmpvar_22.y * tmpvar_29));
  nrm_8 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_32;
  tmpvar_32 = (nrm_8 + (tmpvar_22.z * tmpvar_31));
  nrm_8 = tmpvar_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_34;
  tmpvar_34 = (nrm_8 + (tmpvar_22.w * tmpvar_33));
  nrm_8 = tmpvar_34;
  nrm_8 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_8, vec4(dot (tmpvar_11, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_35;
  tmpvar_35 = (tmpvar_20 * 0.5);
  tmpvar_7 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = textureProj (_LightBuffer, xlv_TEXCOORD3);
  light_6 = tmpvar_36;
  mediump vec4 tmpvar_37;
  tmpvar_37 = -(log2(max (light_6, vec4(0.001, 0.001, 0.001, 0.001))));
  light_6.w = tmpvar_37.w;
  highp float tmpvar_38;
  tmpvar_38 = ((sqrt(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lmFull_4 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  lmIndirect_3 = tmpvar_40;
  light_6.xyz = (tmpvar_37.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_41;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (col_9 * light_6.xyz);
  c_41.xyz = tmpvar_42;
  c_41.w = tmpvar_7;
  c_2 = c_41;
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
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c12.x
mul r1.y, r1, c4.x
mad o4.xy, r1.z, c5.zwzw, r1
mov o0, r0
mov o4.zw, r0
mad o1.zw, v3.xyxy, c8.xyxy, c8
mad o1.xy, v3, c7, c7.zwzw
mad o2.zw, v3.xyxy, c10.xyxy, c10
mad o2.xy, v3, c9, c9.zwzw
mad o3.xy, v3, c11, c11.zwzw
mad o5.xy, v4, c6, c6.zwzw
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
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
  lowp vec4 nrm_5;
  lowp vec3 col_6;
  highp vec4 blend_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_8.x);
  blend_7.x = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_8.y);
  blend_7.y = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_8.z);
  blend_7.z = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_8.w);
  blend_7.w = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (blend_7.x, max (blend_7.y, max (blend_7.z, blend_7.w)));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_7 - tmpvar_17) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_7 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_9).xyz;
  col_6 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_6 + (tmpvar_19.y * tmpvar_10).xyz);
  col_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_6 + (tmpvar_19.z * tmpvar_11).xyz);
  col_6 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_6 + (tmpvar_19.w * tmpvar_12).xyz);
  col_6 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_19.x * tmpvar_24);
  nrm_5 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_5 + (tmpvar_19.y * tmpvar_26));
  nrm_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_5 + (tmpvar_19.z * tmpvar_28));
  nrm_5 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_5 + (tmpvar_19.w * tmpvar_30));
  nrm_5 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_5, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_5 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (tmpvar_17 * 0.5);
  tmpvar_4 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = ((tmpvar_32.xyz * 2.0) - 1.0);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_35;
  mat3 tmpvar_36;
  tmpvar_36[0].x = 0.816497;
  tmpvar_36[0].y = -0.408248;
  tmpvar_36[0].z = -0.408248;
  tmpvar_36[1].x = 0.0;
  tmpvar_36[1].y = 0.707107;
  tmpvar_36[1].z = -0.707107;
  tmpvar_36[2].x = 0.57735;
  tmpvar_36[2].y = 0.57735;
  tmpvar_36[2].z = 0.57735;
  mediump vec3 normal_37;
  normal_37 = tmpvar_34;
  mediump vec3 scalePerBasisVector_38;
  mediump vec3 lm_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_39 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  scalePerBasisVector_38 = tmpvar_41;
  lm_39 = (lm_39 * dot (clamp ((tmpvar_36 * normal_37), 0.0, 1.0), scalePerBasisVector_38));
  mediump vec4 tmpvar_42;
  tmpvar_42.w = 0.0;
  tmpvar_42.xyz = lm_39;
  mediump vec4 tmpvar_43;
  tmpvar_43 = (-(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_42);
  light_3 = tmpvar_43;
  lowp vec4 c_44;
  mediump vec3 tmpvar_45;
  tmpvar_45 = (col_6 * tmpvar_43.xyz);
  c_44.xyz = tmpvar_45;
  c_44.w = tmpvar_4;
  c_2 = c_44;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
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
  lowp vec4 nrm_5;
  lowp vec3 col_6;
  highp vec4 blend_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_8.x);
  blend_7.x = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_8.y);
  blend_7.y = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_8.z);
  blend_7.z = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_8.w);
  blend_7.w = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (blend_7.x, max (blend_7.y, max (blend_7.z, blend_7.w)));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_7 - tmpvar_17) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_7 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_9).xyz;
  col_6 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_6 + (tmpvar_19.y * tmpvar_10).xyz);
  col_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_6 + (tmpvar_19.z * tmpvar_11).xyz);
  col_6 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_6 + (tmpvar_19.w * tmpvar_12).xyz);
  col_6 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_19.x * tmpvar_24);
  nrm_5 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_5 + (tmpvar_19.y * tmpvar_26));
  nrm_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_5 + (tmpvar_19.z * tmpvar_28));
  nrm_5 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_5 + (tmpvar_19.w * tmpvar_30));
  nrm_5 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_5, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_5 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (tmpvar_17 * 0.5);
  tmpvar_4 = tmpvar_33;
  lowp vec3 normal_34;
  normal_34.xy = ((tmpvar_32.wy * 2.0) - 1.0);
  normal_34.z = sqrt((1.0 - clamp (dot (normal_34.xy, normal_34.xy), 0.0, 1.0)));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (unity_LightmapInd, xlv_TEXCOORD4);
  mat3 tmpvar_38;
  tmpvar_38[0].x = 0.816497;
  tmpvar_38[0].y = -0.408248;
  tmpvar_38[0].z = -0.408248;
  tmpvar_38[1].x = 0.0;
  tmpvar_38[1].y = 0.707107;
  tmpvar_38[1].z = -0.707107;
  tmpvar_38[2].x = 0.57735;
  tmpvar_38[2].y = 0.57735;
  tmpvar_38[2].z = 0.57735;
  mediump vec3 normal_39;
  normal_39 = normal_34;
  mediump vec3 scalePerBasisVector_40;
  mediump vec3 lm_41;
  lowp vec3 tmpvar_42;
  tmpvar_42 = ((8.0 * tmpvar_36.w) * tmpvar_36.xyz);
  lm_41 = tmpvar_42;
  lowp vec3 tmpvar_43;
  tmpvar_43 = ((8.0 * tmpvar_37.w) * tmpvar_37.xyz);
  scalePerBasisVector_40 = tmpvar_43;
  lm_41 = (lm_41 * dot (clamp ((tmpvar_38 * normal_39), 0.0, 1.0), scalePerBasisVector_40));
  mediump vec4 tmpvar_44;
  tmpvar_44.w = 0.0;
  tmpvar_44.xyz = lm_41;
  mediump vec4 tmpvar_45;
  tmpvar_45 = (-(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_44);
  light_3 = tmpvar_45;
  lowp vec4 c_46;
  mediump vec3 tmpvar_47;
  tmpvar_47 = (col_6 * tmpvar_45.xyz);
  c_46.xyz = tmpvar_47;
  c_46.w = tmpvar_4;
  c_2 = c_46;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
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
  lowp vec4 nrm_5;
  lowp vec3 col_6;
  highp vec4 blend_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_8.x);
  blend_7.x = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_8.y);
  blend_7.y = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_8.z);
  blend_7.z = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_8.w);
  blend_7.w = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (blend_7.x, max (blend_7.y, max (blend_7.z, blend_7.w)));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_7 - tmpvar_17) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_7 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_9).xyz;
  col_6 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_6 + (tmpvar_19.y * tmpvar_10).xyz);
  col_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_6 + (tmpvar_19.z * tmpvar_11).xyz);
  col_6 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_6 + (tmpvar_19.w * tmpvar_12).xyz);
  col_6 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_19.x * tmpvar_24);
  nrm_5 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_5 + (tmpvar_19.y * tmpvar_26));
  nrm_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_5 + (tmpvar_19.z * tmpvar_28));
  nrm_5 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_5 + (tmpvar_19.w * tmpvar_30));
  nrm_5 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_5, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_5 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (tmpvar_17 * 0.5);
  tmpvar_4 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = ((tmpvar_32.xyz * 2.0) - 1.0);
  lowp vec4 tmpvar_35;
  tmpvar_35 = textureProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_35;
  mat3 tmpvar_36;
  tmpvar_36[0].x = 0.816497;
  tmpvar_36[0].y = -0.408248;
  tmpvar_36[0].z = -0.408248;
  tmpvar_36[1].x = 0.0;
  tmpvar_36[1].y = 0.707107;
  tmpvar_36[1].z = -0.707107;
  tmpvar_36[2].x = 0.57735;
  tmpvar_36[2].y = 0.57735;
  tmpvar_36[2].z = 0.57735;
  mediump vec3 normal_37;
  normal_37 = tmpvar_34;
  mediump vec3 scalePerBasisVector_38;
  mediump vec3 lm_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_39 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  scalePerBasisVector_38 = tmpvar_41;
  lm_39 = (lm_39 * dot (clamp ((tmpvar_36 * normal_37), 0.0, 1.0), scalePerBasisVector_38));
  mediump vec4 tmpvar_42;
  tmpvar_42.w = 0.0;
  tmpvar_42.xyz = lm_39;
  mediump vec4 tmpvar_43;
  tmpvar_43 = (-(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_42);
  light_3 = tmpvar_43;
  lowp vec4 c_44;
  mediump vec3 tmpvar_45;
  tmpvar_45 = (col_6 * tmpvar_43.xyz);
  c_44.xyz = tmpvar_45;
  c_44.w = tmpvar_4;
  c_2 = c_44;
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
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c17.w
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
mad o1.zw, v3.xyxy, c19.xyxy, c19
mad o1.xy, v3, c18, c18.zwzw
mad o2.zw, v3.xyxy, c21.xyxy, c21
mad o2.xy, v3, c20, c20.zwzw
mad o3.xy, v3, c22, c22.zwzw
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_5;
  lowp vec3 col_6;
  highp vec4 blend_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_8.x);
  blend_7.x = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_8.y);
  blend_7.y = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_8.z);
  blend_7.z = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_8.w);
  blend_7.w = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (blend_7.x, max (blend_7.y, max (blend_7.z, blend_7.w)));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_7 - tmpvar_17) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_7 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_9).xyz;
  col_6 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_6 + (tmpvar_19.y * tmpvar_10).xyz);
  col_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_6 + (tmpvar_19.z * tmpvar_11).xyz);
  col_6 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_6 + (tmpvar_19.w * tmpvar_12).xyz);
  col_6 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_19.x * tmpvar_24);
  nrm_5 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_5 + (tmpvar_19.y * tmpvar_26));
  nrm_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_5 + (tmpvar_19.z * tmpvar_28));
  nrm_5 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_5 + (tmpvar_19.w * tmpvar_30));
  nrm_5 = tmpvar_31;
  nrm_5 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_5, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_17 * 0.5);
  tmpvar_4 = tmpvar_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_33;
  mediump vec4 tmpvar_34;
  tmpvar_34 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_34.w;
  highp vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34.xyz + xlv_TEXCOORD4);
  light_3.xyz = tmpvar_35;
  lowp vec4 c_36;
  mediump vec3 tmpvar_37;
  tmpvar_37 = (col_6 * light_3.xyz);
  c_36.xyz = tmpvar_37;
  c_36.w = tmpvar_4;
  c_2 = c_36;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_5;
  lowp vec3 col_6;
  highp vec4 blend_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_8.x);
  blend_7.x = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_8.y);
  blend_7.y = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_8.z);
  blend_7.z = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_8.w);
  blend_7.w = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (blend_7.x, max (blend_7.y, max (blend_7.z, blend_7.w)));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_7 - tmpvar_17) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_7 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_9).xyz;
  col_6 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_6 + (tmpvar_19.y * tmpvar_10).xyz);
  col_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_6 + (tmpvar_19.z * tmpvar_11).xyz);
  col_6 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_6 + (tmpvar_19.w * tmpvar_12).xyz);
  col_6 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_19.x * tmpvar_24);
  nrm_5 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_5 + (tmpvar_19.y * tmpvar_26));
  nrm_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_5 + (tmpvar_19.z * tmpvar_28));
  nrm_5 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_5 + (tmpvar_19.w * tmpvar_30));
  nrm_5 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_5, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_5 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (tmpvar_17 * 0.5);
  tmpvar_4 = tmpvar_33;
  lowp vec3 normal_34;
  normal_34.xy = ((tmpvar_32.wy * 2.0) - 1.0);
  normal_34.z = sqrt((1.0 - clamp (dot (normal_34.xy, normal_34.xy), 0.0, 1.0)));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_36.w;
  highp vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_36.xyz + xlv_TEXCOORD4);
  light_3.xyz = tmpvar_37;
  lowp vec4 c_38;
  mediump vec3 tmpvar_39;
  tmpvar_39 = (col_6 * light_3.xyz);
  c_38.xyz = tmpvar_39;
  c_38.w = tmpvar_4;
  c_2 = c_38;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_5;
  lowp vec3 col_6;
  highp vec4 blend_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_8.x);
  blend_7.x = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_8.y);
  blend_7.y = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_8.z);
  blend_7.z = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_8.w);
  blend_7.w = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (blend_7.x, max (blend_7.y, max (blend_7.z, blend_7.w)));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_7 - tmpvar_17) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_7 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_9).xyz;
  col_6 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_6 + (tmpvar_19.y * tmpvar_10).xyz);
  col_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_6 + (tmpvar_19.z * tmpvar_11).xyz);
  col_6 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_6 + (tmpvar_19.w * tmpvar_12).xyz);
  col_6 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_19.x * tmpvar_24);
  nrm_5 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_5 + (tmpvar_19.y * tmpvar_26));
  nrm_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_5 + (tmpvar_19.z * tmpvar_28));
  nrm_5 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_5 + (tmpvar_19.w * tmpvar_30));
  nrm_5 = tmpvar_31;
  nrm_5 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_5, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_17 * 0.5);
  tmpvar_4 = tmpvar_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = textureProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_33;
  mediump vec4 tmpvar_34;
  tmpvar_34 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_34.w;
  highp vec3 tmpvar_35;
  tmpvar_35 = (tmpvar_34.xyz + xlv_TEXCOORD4);
  light_3.xyz = tmpvar_35;
  lowp vec4 c_36;
  mediump vec3 tmpvar_37;
  tmpvar_37 = (col_6 * light_3.xyz);
  c_36.xyz = tmpvar_37;
  c_36.w = tmpvar_4;
  c_2 = c_36;
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
dcl_texcoord0 v3
dcl_texcoord1 v4
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
mad o1.zw, v3.xyxy, c17.xyxy, c17
mad o1.xy, v3, c16, c16.zwzw
mad o2.zw, v3.xyxy, c19.xyxy, c19
mad o2.xy, v3, c18, c18.zwzw
mad o3.xy, v3, c20, c20.zwzw
mad o5.xy, v4, c15, c15.zwzw
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_8;
  lowp vec3 col_9;
  highp vec4 blend_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_11.x);
  blend_10.x = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_11.y);
  blend_10.y = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_14.w + tmpvar_11.z);
  blend_10.z = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_15.w + tmpvar_11.w);
  blend_10.w = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (blend_10.x, max (blend_10.y, max (blend_10.z, blend_10.w)));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (((blend_10 - tmpvar_20) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_21 / (((tmpvar_21.x + tmpvar_21.y) + tmpvar_21.z) + tmpvar_21.w));
  blend_10 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_22.x * tmpvar_12).xyz;
  col_9 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_9 + (tmpvar_22.y * tmpvar_13).xyz);
  col_9 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (col_9 + (tmpvar_22.z * tmpvar_14).xyz);
  col_9 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (col_9 + (tmpvar_22.w * tmpvar_15).xyz);
  col_9 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_22.x * tmpvar_27);
  nrm_8 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_8 + (tmpvar_22.y * tmpvar_29));
  nrm_8 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_32;
  tmpvar_32 = (nrm_8 + (tmpvar_22.z * tmpvar_31));
  nrm_8 = tmpvar_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_34;
  tmpvar_34 = (nrm_8 + (tmpvar_22.w * tmpvar_33));
  nrm_8 = tmpvar_34;
  nrm_8 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_8, vec4(dot (tmpvar_11, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_35;
  tmpvar_35 = (tmpvar_20 * 0.5);
  tmpvar_7 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_6 = tmpvar_36;
  mediump vec4 tmpvar_37;
  tmpvar_37 = max (light_6, vec4(0.001, 0.001, 0.001, 0.001));
  light_6.w = tmpvar_37.w;
  highp float tmpvar_38;
  tmpvar_38 = ((sqrt(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lmFull_4 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  lmIndirect_3 = tmpvar_40;
  light_6.xyz = (tmpvar_37.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_41;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (col_9 * light_6.xyz);
  c_41.xyz = tmpvar_42;
  c_41.w = tmpvar_7;
  c_2 = c_41;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_8;
  lowp vec3 col_9;
  highp vec4 blend_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_11.x);
  blend_10.x = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_11.y);
  blend_10.y = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_14.w + tmpvar_11.z);
  blend_10.z = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_15.w + tmpvar_11.w);
  blend_10.w = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (blend_10.x, max (blend_10.y, max (blend_10.z, blend_10.w)));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (((blend_10 - tmpvar_20) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_21 / (((tmpvar_21.x + tmpvar_21.y) + tmpvar_21.z) + tmpvar_21.w));
  blend_10 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_22.x * tmpvar_12).xyz;
  col_9 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_9 + (tmpvar_22.y * tmpvar_13).xyz);
  col_9 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (col_9 + (tmpvar_22.z * tmpvar_14).xyz);
  col_9 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (col_9 + (tmpvar_22.w * tmpvar_15).xyz);
  col_9 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_22.x * tmpvar_27);
  nrm_8 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_8 + (tmpvar_22.y * tmpvar_29));
  nrm_8 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_32;
  tmpvar_32 = (nrm_8 + (tmpvar_22.z * tmpvar_31));
  nrm_8 = tmpvar_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_34;
  tmpvar_34 = (nrm_8 + (tmpvar_22.w * tmpvar_33));
  nrm_8 = tmpvar_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_8, vec4(dot (tmpvar_11, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_8 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = (tmpvar_20 * 0.5);
  tmpvar_7 = tmpvar_36;
  lowp vec3 normal_37;
  normal_37.xy = ((tmpvar_35.wy * 2.0) - 1.0);
  normal_37.z = sqrt((1.0 - clamp (dot (normal_37.xy, normal_37.xy), 0.0, 1.0)));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_6 = tmpvar_38;
  mediump vec4 tmpvar_39;
  tmpvar_39 = max (light_6, vec4(0.001, 0.001, 0.001, 0.001));
  light_6.w = tmpvar_39.w;
  lowp vec4 tmpvar_40;
  tmpvar_40 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec4 tmpvar_41;
  tmpvar_41 = texture2D (unity_LightmapInd, xlv_TEXCOORD4);
  highp float tmpvar_42;
  tmpvar_42 = ((sqrt(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_42;
  lowp vec3 tmpvar_43;
  tmpvar_43 = ((8.0 * tmpvar_40.w) * tmpvar_40.xyz);
  lmFull_4 = tmpvar_43;
  lowp vec3 tmpvar_44;
  tmpvar_44 = ((8.0 * tmpvar_41.w) * tmpvar_41.xyz);
  lmIndirect_3 = tmpvar_44;
  light_6.xyz = (tmpvar_39.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_45;
  mediump vec3 tmpvar_46;
  tmpvar_46 = (col_9 * light_6.xyz);
  c_45.xyz = tmpvar_46;
  c_45.w = tmpvar_7;
  c_2 = c_45;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
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
  lowp vec4 nrm_8;
  lowp vec3 col_9;
  highp vec4 blend_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_11.x);
  blend_10.x = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_13.w + tmpvar_11.y);
  blend_10.y = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_14.w + tmpvar_11.z);
  blend_10.z = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_15.w + tmpvar_11.w);
  blend_10.w = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (blend_10.x, max (blend_10.y, max (blend_10.z, blend_10.w)));
  highp vec4 tmpvar_21;
  tmpvar_21 = max (((blend_10 - tmpvar_20) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_21 / (((tmpvar_21.x + tmpvar_21.y) + tmpvar_21.z) + tmpvar_21.w));
  blend_10 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_22.x * tmpvar_12).xyz;
  col_9 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_9 + (tmpvar_22.y * tmpvar_13).xyz);
  col_9 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (col_9 + (tmpvar_22.z * tmpvar_14).xyz);
  col_9 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (col_9 + (tmpvar_22.w * tmpvar_15).xyz);
  col_9 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_22.x * tmpvar_27);
  nrm_8 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_30;
  tmpvar_30 = (nrm_8 + (tmpvar_22.y * tmpvar_29));
  nrm_8 = tmpvar_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_32;
  tmpvar_32 = (nrm_8 + (tmpvar_22.z * tmpvar_31));
  nrm_8 = tmpvar_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_34;
  tmpvar_34 = (nrm_8 + (tmpvar_22.w * tmpvar_33));
  nrm_8 = tmpvar_34;
  nrm_8 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_8, vec4(dot (tmpvar_11, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_35;
  tmpvar_35 = (tmpvar_20 * 0.5);
  tmpvar_7 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = textureProj (_LightBuffer, xlv_TEXCOORD3);
  light_6 = tmpvar_36;
  mediump vec4 tmpvar_37;
  tmpvar_37 = max (light_6, vec4(0.001, 0.001, 0.001, 0.001));
  light_6.w = tmpvar_37.w;
  highp float tmpvar_38;
  tmpvar_38 = ((sqrt(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lmFull_4 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  lmIndirect_3 = tmpvar_40;
  light_6.xyz = (tmpvar_37.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_41;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (col_9 * light_6.xyz);
  c_41.xyz = tmpvar_42;
  c_41.w = tmpvar_7;
  c_2 = c_41;
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
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c12.x
mul r1.y, r1, c4.x
mad o4.xy, r1.z, c5.zwzw, r1
mov o0, r0
mov o4.zw, r0
mad o1.zw, v3.xyxy, c8.xyxy, c8
mad o1.xy, v3, c7, c7.zwzw
mad o2.zw, v3.xyxy, c10.xyxy, c10
mad o2.xy, v3, c9, c9.zwzw
mad o3.xy, v3, c11, c11.zwzw
mad o5.xy, v4, c6, c6.zwzw
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
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
  lowp vec4 nrm_5;
  lowp vec3 col_6;
  highp vec4 blend_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_8.x);
  blend_7.x = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_8.y);
  blend_7.y = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_8.z);
  blend_7.z = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_8.w);
  blend_7.w = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (blend_7.x, max (blend_7.y, max (blend_7.z, blend_7.w)));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_7 - tmpvar_17) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_7 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_9).xyz;
  col_6 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_6 + (tmpvar_19.y * tmpvar_10).xyz);
  col_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_6 + (tmpvar_19.z * tmpvar_11).xyz);
  col_6 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_6 + (tmpvar_19.w * tmpvar_12).xyz);
  col_6 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_19.x * tmpvar_24);
  nrm_5 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_5 + (tmpvar_19.y * tmpvar_26));
  nrm_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_5 + (tmpvar_19.z * tmpvar_28));
  nrm_5 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_5 + (tmpvar_19.w * tmpvar_30));
  nrm_5 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_5, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_5 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (tmpvar_17 * 0.5);
  tmpvar_4 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = ((tmpvar_32.xyz * 2.0) - 1.0);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_35;
  mat3 tmpvar_36;
  tmpvar_36[0].x = 0.816497;
  tmpvar_36[0].y = -0.408248;
  tmpvar_36[0].z = -0.408248;
  tmpvar_36[1].x = 0.0;
  tmpvar_36[1].y = 0.707107;
  tmpvar_36[1].z = -0.707107;
  tmpvar_36[2].x = 0.57735;
  tmpvar_36[2].y = 0.57735;
  tmpvar_36[2].z = 0.57735;
  mediump vec3 normal_37;
  normal_37 = tmpvar_34;
  mediump vec3 scalePerBasisVector_38;
  mediump vec3 lm_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_39 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  scalePerBasisVector_38 = tmpvar_41;
  lm_39 = (lm_39 * dot (clamp ((tmpvar_36 * normal_37), 0.0, 1.0), scalePerBasisVector_38));
  mediump vec4 tmpvar_42;
  tmpvar_42.w = 0.0;
  tmpvar_42.xyz = lm_39;
  mediump vec4 tmpvar_43;
  tmpvar_43 = (max (light_3, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_42);
  light_3 = tmpvar_43;
  lowp vec4 c_44;
  mediump vec3 tmpvar_45;
  tmpvar_45 = (col_6 * tmpvar_43.xyz);
  c_44.xyz = tmpvar_45;
  c_44.w = tmpvar_4;
  c_2 = c_44;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
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
  lowp vec4 nrm_5;
  lowp vec3 col_6;
  highp vec4 blend_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_8.x);
  blend_7.x = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_8.y);
  blend_7.y = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_8.z);
  blend_7.z = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_8.w);
  blend_7.w = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (blend_7.x, max (blend_7.y, max (blend_7.z, blend_7.w)));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_7 - tmpvar_17) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_7 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_9).xyz;
  col_6 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_6 + (tmpvar_19.y * tmpvar_10).xyz);
  col_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_6 + (tmpvar_19.z * tmpvar_11).xyz);
  col_6 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_6 + (tmpvar_19.w * tmpvar_12).xyz);
  col_6 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_19.x * tmpvar_24);
  nrm_5 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_5 + (tmpvar_19.y * tmpvar_26));
  nrm_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_5 + (tmpvar_19.z * tmpvar_28));
  nrm_5 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_5 + (tmpvar_19.w * tmpvar_30));
  nrm_5 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_5, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_5 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (tmpvar_17 * 0.5);
  tmpvar_4 = tmpvar_33;
  lowp vec3 normal_34;
  normal_34.xy = ((tmpvar_32.wy * 2.0) - 1.0);
  normal_34.z = sqrt((1.0 - clamp (dot (normal_34.xy, normal_34.xy), 0.0, 1.0)));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (unity_LightmapInd, xlv_TEXCOORD4);
  mat3 tmpvar_38;
  tmpvar_38[0].x = 0.816497;
  tmpvar_38[0].y = -0.408248;
  tmpvar_38[0].z = -0.408248;
  tmpvar_38[1].x = 0.0;
  tmpvar_38[1].y = 0.707107;
  tmpvar_38[1].z = -0.707107;
  tmpvar_38[2].x = 0.57735;
  tmpvar_38[2].y = 0.57735;
  tmpvar_38[2].z = 0.57735;
  mediump vec3 normal_39;
  normal_39 = normal_34;
  mediump vec3 scalePerBasisVector_40;
  mediump vec3 lm_41;
  lowp vec3 tmpvar_42;
  tmpvar_42 = ((8.0 * tmpvar_36.w) * tmpvar_36.xyz);
  lm_41 = tmpvar_42;
  lowp vec3 tmpvar_43;
  tmpvar_43 = ((8.0 * tmpvar_37.w) * tmpvar_37.xyz);
  scalePerBasisVector_40 = tmpvar_43;
  lm_41 = (lm_41 * dot (clamp ((tmpvar_38 * normal_39), 0.0, 1.0), scalePerBasisVector_40));
  mediump vec4 tmpvar_44;
  tmpvar_44.w = 0.0;
  tmpvar_44.xyz = lm_41;
  mediump vec4 tmpvar_45;
  tmpvar_45 = (max (light_3, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_44);
  light_3 = tmpvar_45;
  lowp vec4 c_46;
  mediump vec3 tmpvar_47;
  tmpvar_47 = (col_6 * tmpvar_45.xyz);
  c_46.xyz = tmpvar_47;
  c_46.w = tmpvar_4;
  c_2 = c_46;
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
uniform sampler2D _Normal0;
uniform sampler2D _Normal1;
uniform sampler2D _Normal2;
uniform sampler2D _Normal3;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
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
  lowp vec4 nrm_5;
  lowp vec3 col_6;
  highp vec4 blend_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_Splat3, xlv_TEXCOORD2);
  lowp float tmpvar_13;
  tmpvar_13 = (tmpvar_9.w + tmpvar_8.x);
  blend_7.x = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (tmpvar_10.w + tmpvar_8.y);
  blend_7.y = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = (tmpvar_11.w + tmpvar_8.z);
  blend_7.z = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_12.w + tmpvar_8.w);
  blend_7.w = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (blend_7.x, max (blend_7.y, max (blend_7.z, blend_7.w)));
  highp vec4 tmpvar_18;
  tmpvar_18 = max (((blend_7 - tmpvar_17) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 / (((tmpvar_18.x + tmpvar_18.y) + tmpvar_18.z) + tmpvar_18.w));
  blend_7 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.x * tmpvar_9).xyz;
  col_6 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (col_6 + (tmpvar_19.y * tmpvar_10).xyz);
  col_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_6 + (tmpvar_19.z * tmpvar_11).xyz);
  col_6 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_6 + (tmpvar_19.w * tmpvar_12).xyz);
  col_6 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_19.x * tmpvar_24);
  nrm_5 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_27;
  tmpvar_27 = (nrm_5 + (tmpvar_19.y * tmpvar_26));
  nrm_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_5 + (tmpvar_19.z * tmpvar_28));
  nrm_5 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_5 + (tmpvar_19.w * tmpvar_30));
  nrm_5 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_5, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_5 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (tmpvar_17 * 0.5);
  tmpvar_4 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = ((tmpvar_32.xyz * 2.0) - 1.0);
  lowp vec4 tmpvar_35;
  tmpvar_35 = textureProj (_LightBuffer, xlv_TEXCOORD3);
  light_3 = tmpvar_35;
  mat3 tmpvar_36;
  tmpvar_36[0].x = 0.816497;
  tmpvar_36[0].y = -0.408248;
  tmpvar_36[0].z = -0.408248;
  tmpvar_36[1].x = 0.0;
  tmpvar_36[1].y = 0.707107;
  tmpvar_36[1].z = -0.707107;
  tmpvar_36[2].x = 0.57735;
  tmpvar_36[2].y = 0.57735;
  tmpvar_36[2].z = 0.57735;
  mediump vec3 normal_37;
  normal_37 = tmpvar_34;
  mediump vec3 scalePerBasisVector_38;
  mediump vec3 lm_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_39 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  scalePerBasisVector_38 = tmpvar_41;
  lm_39 = (lm_39 * dot (clamp ((tmpvar_36 * normal_37), 0.0, 1.0), scalePerBasisVector_38));
  mediump vec4 tmpvar_42;
  tmpvar_42.w = 0.0;
  tmpvar_42.xyz = lm_39;
  mediump vec4 tmpvar_43;
  tmpvar_43 = (max (light_3, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_42);
  light_3 = tmpvar_43;
  lowp vec4 c_44;
  mediump vec3 tmpvar_45;
  tmpvar_45 = (col_6 * tmpvar_43.xyz);
  c_44.xyz = tmpvar_45;
  c_44.w = tmpvar_4;
  c_2 = c_44;
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
SetTexture 9 [_LightBuffer] 2D 9
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
TXP R1.xyz, fragment.texcoord[3], texture[9], 2D;
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
SetTexture 9 [_LightBuffer] 2D 9
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s9
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
texldp r0.xyz, v3, s9
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
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
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
TEX R3, fragment.texcoord[4], texture[10], 2D;
TEX R2, fragment.texcoord[4], texture[11], 2D;
MUL R2.xyz, R2.w, R2;
MUL R3.xyz, R3.w, R3;
MUL R2.xyz, R2, c[2].z;
MAD R4.xyz, R3, c[2].z, -R2;
TXP R3.xyz, fragment.texcoord[3], texture[9], 2D;
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
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s9
dcl_2d s10
dcl_2d s11
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
texld r1, v4, s10
mul_pp r1.xyz, r1.w, r1
texld r2, v4, s11
mul_pp r2.xyz, r2.w, r2
mul_pp r2.xyz, r2, c2.z
mad_pp r4.xyz, r1, c2.z, -r2
texldp r1.xyz, v3, s9
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
// Stats: 66 math, 12 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0],
		{ 0.5, 0, 1, 2 },
		{ -0.40824828, -0.70710677, 0.57735026, 8 },
		{ -0.40824831, 0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2, fragment.texcoord[2], texture[4], 2D;
ADD R5.y, R0.w, R2.w;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R5.z, R0, R1.w;
TEX R4, fragment.texcoord[1], texture[2], 2D;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R3.w, R0;
ADD R2.w, R0.y, R4;
MAX R1.w, R5.z, R5.y;
MAX R1.w, R2, R1;
MAX R1.w, R5.x, R1;
MOV R5.w, R5.y;
MOV R5.y, R2.w;
ADD R5, -R1.w, R5;
ADD R5, R5, c[0].x;
MAX R5, R5, c[1].y;
ADD R2.w, R5.x, R5.y;
ADD R2.w, R5.z, R2;
ADD R2.w, R5, R2;
RCP R2.w, R2.w;
MUL R5, R5, R2.w;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[1].x;
DP4 R0.x, R0, c[1].z;
MAD R0.xy, R0.x, R6, c[1].x;
MAD R7.xy, R0.yxzw, c[1].w, -c[1].z;
MUL R0.xy, R7, R7;
ADD_SAT R0.x, R0, R0.y;
ADD R0.x, -R0, c[1].z;
RSQ R0.x, R0.x;
RCP R7.z, R0.x;
TEX R0, fragment.texcoord[4], texture[11], 2D;
MUL R0.xyz, R0.w, R0;
DP3_SAT R6.z, R7, c[2];
DP3_SAT R6.y, R7, c[3];
DP3_SAT R6.x, R7, c[4];
MUL R6.xyz, R0, R6;
TEX R0, fragment.texcoord[4], texture[10], 2D;
DP3 R2.w, R6, c[2].w;
MUL R6.xyz, R0.w, R0;
TXP R0.xyz, fragment.texcoord[3], texture[9], 2D;
MUL R6.xyz, R6, R2.w;
LG2 R0.x, R0.x;
LG2 R0.z, R0.z;
LG2 R0.y, R0.y;
MAD R0.xyz, R6, c[2].w, -R0;
MUL R4.xyz, R4, R5.y;
MUL R3.xyz, R3, R5.x;
ADD R3.xyz, R3, R4;
MUL R1.xyz, R1, R5.z;
MUL R2.xyz, R2, R5.w;
ADD R1.xyz, R3, R1;
ADD R1.xyz, R1, R2;
MUL result.color.xyz, R1, R0;
MUL result.color.w, R1, c[1].x;
END
# 66 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 54 math, 12 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
dcl_2d s8
dcl_2d s9
dcl_2d s10
dcl_2d s11
def c1, 0.50000000, 0.00000000, 1.00000000, -0.50000000
def c2, 2.00000000, -1.00000000, 8.00000000, 0
def c3, -0.40824828, -0.70710677, 0.57735026, 0
def c4, -0.40824831, 0.70710677, 0.57735026, 0
def c5, 0.81649655, 0.00000000, 0.57735026, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xy
texld r0, v0, s0
texld r2, v2, s4
add_pp r5.y, r0.w, r2.w
texld r1, v1.zwzw, s3
add_pp r5.z, r0, r1.w
texld r4, v1, s2
texld r3, v0.zwzw, s1
add_pp r5.x, r3.w, r0
add_pp r2.w, r0.y, r4
max r1.w, r5.z, r5.y
max r1.w, r2, r1
max r1.w, r5.x, r1
mov r5.w, r5.y
mov r5.y, r2.w
add r5, -r1.w, r5
add r5, r5, c0.x
max r5, r5, c1.y
add r2.w, r5.x, r5.y
add r2.w, r5.z, r2
add r2.w, r5, r2
rcp r2.w, r2.w
mul r5, r5, r2.w
texld r7.yw, v1, s6
texld r6.yw, v0.zwzw, s5
mul r7.xy, r5.y, r7.ywzw
mul r6.xy, r5.x, r6.ywzw
add_pp r6.xz, r6.xyyw, r7.xyyw
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
add_pp r6.xy, r6.xzzw, r6.ywzw
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c1.w
dp4_pp r0.x, r0, c1.z
mad_pp r0.xy, r0.x, r6, c1.x
mad_pp r7.xy, r0.yxzw, c2.x, c2.y
mul_pp r0.xy, r7, r7
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c1.z
rsq_pp r0.x, r0.x
rcp_pp r7.z, r0.x
texld r0, v4, s11
mul_pp r0.xyz, r0.w, r0
dp3_pp_sat r6.z, r7, c3
dp3_pp_sat r6.y, r7, c4
dp3_pp_sat r6.x, r7, c5
mul_pp r6.xyz, r0, r6
texld r0, v4, s10
dp3_pp r2.w, r6, c2.z
mul_pp r6.xyz, r0.w, r0
texldp r0.xyz, v3, s9
mul_pp r6.xyz, r6, r2.w
log_pp r0.x, r0.x
log_pp r0.z, r0.z
log_pp r0.y, r0.y
mad_pp r0.xyz, r6, c2.z, -r0
mul r4.xyz, r4, r5.y
mul r3.xyz, r3, r5.x
add_pp r3.xyz, r3, r4
mul r1.xyz, r1, r5.z
mul r2.xyz, r2, r5.w
add_pp r1.xyz, r3, r1
add_pp r1.xyz, r1, r2
mul_pp oC0.xyz, r1, r0
mul oC0.w, r1, c1.x
"
}
SubProgram "d3d11 " {
// Stats: 43 math, 12 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
ConstBuffer "$Globals" 192
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedoabbnmfhgmaaalmfakmmngngljjljijiabaaaaaapeajaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcneaiaaaa
eaaaaaaadfacaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaa
aiaaaaaafkaaaaadaagabaaaajaaaaaafkaaaaadaagabaaaakaaaaaafkaaaaad
aagabaaaalaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaa
ahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaaeaahabaaa
ajaaaaaaffffaaaafibiaaaeaahabaaaakaaaaaaffffaaaafibiaaaeaahabaaa
alaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacakaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaadaaaaaaeghobaaaalaaaaaaaagabaaaalaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaacaaaaaaeghobaaaahaaaaaaaagabaaaahaaaaaaefaaaaajpcaabaaa
acaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaaaagabaaaafaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaacaaaaaaeghobaaaagaaaaaaaagabaaaagaaaaaa
efaaaaajpcaabaaaaeaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
adaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaaaaaaaahecaabaaaagaaaaaadkaabaaaaeaaaaaackaabaaa
afaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaa
aagabaaaaeaaaaaaaaaaaaahicaabaaaagaaaaaadkaabaaaafaaaaaadkaabaaa
ahaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaagaaaaaackaabaaaagaaaaaa
efaaaaajpcaabaaaaiaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaaaaaaaaahccaabaaaagaaaaaabkaabaaaafaaaaaadkaabaaaaiaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaagaaaaaaefaaaaaj
pcaabaaaajaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
aaaaaaahbcaabaaaagaaaaaaakaabaaaafaaaaaadkaabaaaajaaaaaabbaaaaak
bcaabaaaabaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaagaaaaaa
aaaaaaaipcaabaaaafaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaaagaaaaaa
diaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaai
pcaabaaaafaaaaaaegaobaaaafaaaaaaagiacaaaaaaaaaaaadaaaaaadeaaaaak
pcaabaaaafaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaafaaaaaaakaabaaaafaaaaaa
aaaaaaahicaabaaaaaaaaaaackaabaaaafaaaaaadkaabaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaadkaabaaaafaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaa
afaaaaaaegaobaaaafaaaaaapgapbaaaaaaaaaaadiaaaaahfcaabaaaacaaaaaa
pganbaaaadaaaaaafgafbaaaafaaaaaadcaaaaajdcaabaaaacaaaaaaagaabaaa
afaaaaaahgapbaaaacaaaaaaigaabaaaacaaaaaadcaaaaajgcaabaaaabaaaaaa
kgakbaaaafaaaaaapganbaaaabaaaaaaagabbaaaacaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaadaaaaaaeghobaaaaiaaaaaaaagabaaaaiaaaaaadcaaaaaj
gcaabaaaabaaaaaapgapbaaaafaaaaaapganbaaaacaaaaaafgagbaaaabaaaaaa
aaaaaaakgcaabaaaabaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaalp
aaaaaalpaaaaaaaadcaaaaamdcaabaaaabaaaaaaagaabaaaabaaaaaajgafbaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadcaaaaapdcaabaaa
abaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaa
apcaaaakbcaabaaaacaaaaaaaceaaaaaolaffbdpdkmnbddpaaaaaaaaaaaaaaaa
igaabaaaabaaaaaabacaaaakccaabaaaacaaaaaaaceaaaaaomafnblopdaedfdp
dkmnbddpaaaaaaaaegacbaaaabaaaaaabacaaaakecaabaaaacaaaaaaaceaaaaa
olafnblopdaedflpdkmnbddpaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaaaoaaaaahgcaabaaaaaaaaaaa
agbbbaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaajgafbaaa
aaaaaaaaeghobaaaajaaaaaaaagabaaaajaaaaaacpaaaaafocaabaaaaaaaaaaa
agajbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaa
akaaaaaaaagabaaaakaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaa
jgahbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaaiaaaaaa
fgafbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaaagaabaaaafaaaaaaegacbaaa
ajaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaabaaaaaakgakbaaaafaaaaaa
egacbaaaaeaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaabaaaaaapgapbaaa
afaaaaaaegacbaaaahaaaaaaegacbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
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
SetTexture 9 [_LightBuffer] 2D 9
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
TXP R1.xyz, fragment.texcoord[3], texture[9], 2D;
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
SetTexture 9 [_LightBuffer] 2D 9
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s9
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
texldp r0.xyz, v3, s9
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
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
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
TEX R1, fragment.texcoord[4], texture[10], 2D;
MUL R3.xyz, R1.w, R1;
TEX R1, fragment.texcoord[4], texture[11], 2D;
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, c[2].z;
MUL R0.xyz, R0, R4.w;
DP4 R2.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R1.w, R2.w;
RCP R1.w, R1.w;
MAD R3.xyz, R3, c[2].z, -R1;
MAD_SAT R1.w, R1, c[1].z, c[1];
MAD R3.xyz, R1.w, R3, R1;
TXP R1.xyz, fragment.texcoord[3], texture[9], 2D;
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
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s9
dcl_2d s10
dcl_2d s11
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
texld r2, v4, s10
mul_pp r3.xyz, r2.w, r2
mul r1.xyz, r1, r4.w
texld r2, v4, s11
mul_pp r2.xyz, r2.w, r2
mul_pp r2.xyz, r2, c2.z
mad_pp r3.xyz, r3, c2.z, -r2
mad_sat r1.w, r1, c1.z, c1
mad_pp r3.xyz, r1.w, r3, r2
texldp r2.xyz, v3, s9
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
// Stats: 63 math, 12 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0],
		{ 0.5, 0, 1, 2 },
		{ -0.40824828, -0.70710677, 0.57735026, 8 },
		{ -0.40824831, 0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2, fragment.texcoord[2], texture[4], 2D;
ADD R5.y, R0.w, R2.w;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R5.z, R0, R1.w;
TEX R4, fragment.texcoord[1], texture[2], 2D;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R3.w, R0;
ADD R2.w, R0.y, R4;
MAX R1.w, R5.z, R5.y;
MAX R1.w, R2, R1;
MAX R1.w, R5.x, R1;
MOV R5.w, R5.y;
MOV R5.y, R2.w;
ADD R5, -R1.w, R5;
ADD R5, R5, c[0].x;
MAX R5, R5, c[1].y;
ADD R2.w, R5.x, R5.y;
ADD R2.w, R5.z, R2;
ADD R2.w, R5, R2;
RCP R2.w, R2.w;
MUL R5, R5, R2.w;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[1].x;
DP4 R0.x, R0, c[1].z;
MAD R0.xy, R0.x, R6, c[1].x;
MAD R7.xy, R0.yxzw, c[1].w, -c[1].z;
MUL R0.xy, R7, R7;
ADD_SAT R0.x, R0, R0.y;
ADD R0.x, -R0, c[1].z;
RSQ R0.x, R0.x;
RCP R7.z, R0.x;
TEX R0, fragment.texcoord[4], texture[11], 2D;
MUL R0.xyz, R0.w, R0;
DP3_SAT R6.z, R7, c[2];
DP3_SAT R6.y, R7, c[3];
DP3_SAT R6.x, R7, c[4];
MUL R6.xyz, R0, R6;
TEX R0, fragment.texcoord[4], texture[10], 2D;
DP3 R2.w, R6, c[2].w;
MUL R6.xyz, R0.w, R0;
TXP R0.xyz, fragment.texcoord[3], texture[9], 2D;
MUL R6.xyz, R6, R2.w;
MAD R0.xyz, R6, c[2].w, R0;
MUL R4.xyz, R4, R5.y;
MUL R3.xyz, R3, R5.x;
ADD R3.xyz, R3, R4;
MUL R1.xyz, R1, R5.z;
MUL R2.xyz, R2, R5.w;
ADD R1.xyz, R3, R1;
ADD R1.xyz, R1, R2;
MUL result.color.xyz, R1, R0;
MUL result.color.w, R1, c[1].x;
END
# 63 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 51 math, 12 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
dcl_2d s8
dcl_2d s9
dcl_2d s10
dcl_2d s11
def c1, 0.50000000, 0.00000000, 1.00000000, -0.50000000
def c2, 2.00000000, -1.00000000, 8.00000000, 0
def c3, -0.40824828, -0.70710677, 0.57735026, 0
def c4, -0.40824831, 0.70710677, 0.57735026, 0
def c5, 0.81649655, 0.00000000, 0.57735026, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xy
texld r0, v0, s0
texld r2, v2, s4
add_pp r5.y, r0.w, r2.w
texld r1, v1.zwzw, s3
add_pp r5.z, r0, r1.w
texld r4, v1, s2
texld r3, v0.zwzw, s1
add_pp r5.x, r3.w, r0
add_pp r2.w, r0.y, r4
max r1.w, r5.z, r5.y
max r1.w, r2, r1
max r1.w, r5.x, r1
mov r5.w, r5.y
mov r5.y, r2.w
add r5, -r1.w, r5
add r5, r5, c0.x
max r5, r5, c1.y
add r2.w, r5.x, r5.y
add r2.w, r5.z, r2
add r2.w, r5, r2
rcp r2.w, r2.w
mul r5, r5, r2.w
texld r7.yw, v1, s6
texld r6.yw, v0.zwzw, s5
mul r7.xy, r5.y, r7.ywzw
mul r6.xy, r5.x, r6.ywzw
add_pp r6.xz, r6.xyyw, r7.xyyw
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
add_pp r6.xy, r6.xzzw, r6.ywzw
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c1.w
dp4_pp r0.x, r0, c1.z
mad_pp r0.xy, r0.x, r6, c1.x
mad_pp r7.xy, r0.yxzw, c2.x, c2.y
mul_pp r0.xy, r7, r7
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c1.z
rsq_pp r0.x, r0.x
rcp_pp r7.z, r0.x
texld r0, v4, s11
mul_pp r0.xyz, r0.w, r0
dp3_pp_sat r6.z, r7, c3
dp3_pp_sat r6.y, r7, c4
dp3_pp_sat r6.x, r7, c5
mul_pp r6.xyz, r0, r6
texld r0, v4, s10
dp3_pp r2.w, r6, c2.z
mul_pp r6.xyz, r0.w, r0
texldp r0.xyz, v3, s9
mul_pp r6.xyz, r6, r2.w
mad_pp r0.xyz, r6, c2.z, r0
mul r4.xyz, r4, r5.y
mul r3.xyz, r3, r5.x
add_pp r3.xyz, r3, r4
mul r1.xyz, r1, r5.z
mul r2.xyz, r2, r5.w
add_pp r1.xyz, r3, r1
add_pp r1.xyz, r1, r2
mul_pp oC0.xyz, r1, r0
mul oC0.w, r1, c1.x
"
}
SubProgram "d3d11 " {
// Stats: 42 math, 12 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_Normal0] 2D 5
SetTexture 6 [_Normal1] 2D 6
SetTexture 7 [_Normal2] 2D 7
SetTexture 8 [_Normal3] 2D 8
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [unity_LightmapInd] 2D 11
ConstBuffer "$Globals" 192
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecednkpgdljdbnomombjpfpkpgnbfgfjjgpeabaaaaaanmajaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefclmaiaaaa
eaaaaaaacpacaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaa
aiaaaaaafkaaaaadaagabaaaajaaaaaafkaaaaadaagabaaaakaaaaaafkaaaaad
aagabaaaalaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaa
ahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaaeaahabaaa
ajaaaaaaffffaaaafibiaaaeaahabaaaakaaaaaaffffaaaafibiaaaeaahabaaa
alaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacakaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaadaaaaaaeghobaaaalaaaaaaaagabaaaalaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaacaaaaaaeghobaaaahaaaaaaaagabaaaahaaaaaaefaaaaajpcaabaaa
acaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaaaagabaaaafaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaacaaaaaaeghobaaaagaaaaaaaagabaaaagaaaaaa
efaaaaajpcaabaaaaeaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
adaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaaaaaaaahecaabaaaagaaaaaadkaabaaaaeaaaaaackaabaaa
afaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaa
aagabaaaaeaaaaaaaaaaaaahicaabaaaagaaaaaadkaabaaaafaaaaaadkaabaaa
ahaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaagaaaaaackaabaaaagaaaaaa
efaaaaajpcaabaaaaiaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaaaaaaaaahccaabaaaagaaaaaabkaabaaaafaaaaaadkaabaaaaiaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaagaaaaaaefaaaaaj
pcaabaaaajaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
aaaaaaahbcaabaaaagaaaaaaakaabaaaafaaaaaadkaabaaaajaaaaaabbaaaaak
bcaabaaaabaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaagaaaaaa
aaaaaaaipcaabaaaafaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaaagaaaaaa
diaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaai
pcaabaaaafaaaaaaegaobaaaafaaaaaaagiacaaaaaaaaaaaadaaaaaadeaaaaak
pcaabaaaafaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaafaaaaaaakaabaaaafaaaaaa
aaaaaaahicaabaaaaaaaaaaackaabaaaafaaaaaadkaabaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaadkaabaaaafaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaa
afaaaaaaegaobaaaafaaaaaapgapbaaaaaaaaaaadiaaaaahfcaabaaaacaaaaaa
pganbaaaadaaaaaafgafbaaaafaaaaaadcaaaaajdcaabaaaacaaaaaaagaabaaa
afaaaaaahgapbaaaacaaaaaaigaabaaaacaaaaaadcaaaaajgcaabaaaabaaaaaa
kgakbaaaafaaaaaapganbaaaabaaaaaaagabbaaaacaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaadaaaaaaeghobaaaaiaaaaaaaagabaaaaiaaaaaadcaaaaaj
gcaabaaaabaaaaaapgapbaaaafaaaaaapganbaaaacaaaaaafgagbaaaabaaaaaa
aaaaaaakgcaabaaaabaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaalp
aaaaaalpaaaaaaaadcaaaaamdcaabaaaabaaaaaaagaabaaaabaaaaaajgafbaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadcaaaaapdcaabaaa
abaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaa
apcaaaakbcaabaaaacaaaaaaaceaaaaaolaffbdpdkmnbddpaaaaaaaaaaaaaaaa
igaabaaaabaaaaaabacaaaakccaabaaaacaaaaaaaceaaaaaomafnblopdaedfdp
dkmnbddpaaaaaaaaegacbaaaabaaaaaabacaaaakecaabaaaacaaaaaaaceaaaaa
olafnblopdaedflpdkmnbddpaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaadaaaaaaeghobaaaakaaaaaaaagabaaaakaaaaaadiaaaaahccaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaa
agajbaaaabaaaaaafgafbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
aeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaajaaaaaaaagabaaaajaaaaaadcaaaaajhcaabaaaaaaaaaaajgahbaaa
aaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaaiaaaaaafgafbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaaagaabaaa
afaaaaaaegacbaaaajaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaabaaaaaa
kgakbaaaafaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaa
abaaaaaapgapbaaaafaaaaaaegacbaaaahaaaaaaegacbaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
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
Dependency "AddPassShader" = "Hidden/TerrainEngine/Splatmap/Lightmap-AddPass-Advanced-Pro Bumped"
Dependency "BaseMapShader" = "Diffuse"
Dependency "Details0" = "Hidden/TerrainEngine/Details/Vertexlit"
Dependency "Details1" = "Hidden/TerrainEngine/Details/WavingDoublePass"
Dependency "Details2" = "Hidden/TerrainEngine/Details/BillboardWavingDoublePass"
Dependency "Tree0" = "Hidden/TerrainEngine/BillboardTree"
Fallback "Nature/Terrain/Diffuse"
}