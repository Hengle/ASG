// Compiled shader for all platforms, uncompressed size: 819.4KB

Shader "Hidden/TerrainEngine/Splatmap/Lightmap-AddPass-Advanced-Pro Bumped" {
Properties {
 _Depth ("Blend Depth", Range(0.001,1)) = 0.1
 _Control ("Control (RGBA)", 2D) = "black" {}
 _Splat3 ("Layer 3 (A)", 2D) = "black" {}
 _Splat2 ("Layer 2 (B)", 2D) = "black" {}
 _Splat1 ("Layer 1 (G)", 2D) = "black" {}
 _Splat0 ("Layer 0 (R)", 2D) = "black" {}
 _Normal3 ("Normal 3 (A)", 2D) = "bump" {}
 _Normal2 ("Normal 2 (B)", 2D) = "bump" {}
 _Normal1 ("Normal 1 (G)", 2D) = "bump" {}
 _Normal0 ("Normal 0 (R)", 2D) = "bump" {}
}
SubShader { 
 Tags { "QUEUE"="Geometry-99" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" "SplatCount"="4" }
 GrabPass {
  Tags { "LIGHTMODE"="ForwardBase" }
 }
 GrabPass {
  Tags { "LIGHTMODE"="ForwardAdd" }
 }
 GrabPass {
  Tags { "LIGHTMODE"="PrePassBase" }
 }
 GrabPass {
  Tags { "LIGHTMODE"="PrePassFinal" }
 }


 // Stats for Vertex shader:
 //       d3d11 : 32 avg math (12..65)
 //        d3d9 : 43 avg math (19..86)
 //      opengl : 41 avg math (18..83)
 // Stats for Fragment shader:
 //       d3d11 : 44 avg math (31..56), 10 avg texture (7..13)
 //        d3d9 : 56 avg math (40..69), 10 avg texture (7..13)
 //      opengl : 66 avg math (47..82), 10 avg texture (7..13)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry-99" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" "SplatCount"="4" }
Program "vp" {
SubProgram "opengl " {
// Stats: 46 math
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
PARAM c[27] = { { 0.5, 1, 0 },
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
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[16];
DP4 R2.y, R0, c[15];
DP4 R2.x, R0, c[14];
MUL R0.y, R2.w, R2.w;
MAD R0.x, R0, R0, -R0.y;
DP4 R3.z, R1, c[19];
DP4 R3.y, R1, c[18];
DP4 R3.x, R1, c[17];
MUL R1.xyz, -vertex.normal.zxyw, c[0].zyzw;
ADD R2.xyz, R2, R3;
MUL R0.xyz, R0.x, c[20];
ADD result.texcoord[5].xyz, R2, R0;
MOV R0, c[13];
MAD R1.xyz, vertex.normal.yzxw, c[0].yzzw, R1;
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
DP4 R0.zw, vertex.position, c[4];
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP4 R0.y, vertex.position, c[2];
DP4 R0.x, vertex.position, c[1];
DP3 result.texcoord[4].x, R3, R1;
DP4 R1.z, vertex.position, c[3];
DP3 result.texcoord[4].y, R3, -R2;
ADD R2.xy, R0.z, R0;
MUL R1.xy, R2, c[0].x;
MOV R1.w, R0.z;
DP3 result.texcoord[4].z, vertex.normal, R3;
MOV result.texcoord[3], R1;
MOV result.position.w, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[23].xyxy, c[23];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[25].xyxy, c[25];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[24], c[24].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[26], c[26].zwzw;
MOV result.position.z, R1;
MOV result.position.y, R0;
MOV result.position.x, R0;
END
# 46 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 49 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ScreenParams]
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
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c27, 0.50000000, 0.00000000, 1.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c21.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
mov r0.y, r2.w
dp3 r0.z, r1, c6
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c27.z
dp4 r2.z, r0, c16
dp4 r2.y, r0, c15
dp4 r2.x, r0, c14
mul r0.y, r2.w, r2.w
mad r0.x, r0, r0, -r0.y
dp4 r3.z, r1, c19
dp4 r3.y, r1, c18
dp4 r3.x, r1, c17
add r1.xyz, r2, r3
mul r0.xyz, r0.x, c20
add o6.xyz, r1, r0
mov r0, c10
dp4 r4.z, c13, r0
mov r0, c9
dp4 r4.y, c13, r0
dp4 r0.zw, v0, c3
dp4 r0.x, v0, c0
mul r2.xyz, -v2.zxyw, c27.yzyw
mad r2.xyz, v2.yzxw, c27.zyyw, r2
mul r1.xyz, v2.zxyw, r2.yzxw
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
mov r1, c8
dp4 r4.x, c13, r1
dp4 r1.xy, v0, c1
dp3 o5.x, r4, r2
dp4 r2.z, v0, c2
mov r0.y, -r1.x
mad r1.zw, r0.z, c12, r0.xyxy
mul r2.xy, r1.zwzw, c27.x
mov r2.w, r0.z
dp3 o5.y, r4, -r3
dp3 o5.z, v2, r4
mov o4, r2
mov o0.w, r0
mov o0.y, r1
mad o1.zw, v3.xyxy, c23.xyxy, c23
mad o1.xy, v3, c22, c22.zwzw
mad o2.zw, v3.xyxy, c25.xyxy, c25
mad o2.xy, v3, c24, c24.zwzw
mad o3.xy, v3, c26, c26.zwzw
mov o0.z, r2
mov o0.x, r0
"
}
SubProgram "d3d11 " {
// Stats: 37 math
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
eefiecedekkebffbkgllcjamgmomaifiadiejomgabaaaaaaciaiaaaaadaaaaaa
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
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcfmagaaaaeaaaabaajhabaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaafaaaaaa
kgiocaaaaaaaaaaaafaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaa
acaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaa
ahaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaa
dgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaak
hcaabaaaaaaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaadcaaaaanhcaabaaaaaaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaiadpaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaaaaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
jgbebaaaacaaaaaajgaebaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaaj
hcaabaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaa
acaaaaaabaaaaaaicccabaaaafaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaa
acaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
apaaaaahbccabaaaafaaaaaacgakbaaaaaaaaaaaegaabaaaacaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaak
hccabaaaagaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
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
  tmpvar_15.xyz = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
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
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
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
  c_32.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD4)) * 2.0));
  c_32.w = tmpvar_2;
  c_1.w = c_32.w;
  c_1.xyz = (c_32.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_33;
  highp vec2 pblend_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_36;
  tmpvar_36 = c_1.w;
  pblend_34.x = tmpvar_36;
  lowp float tmpvar_37;
  tmpvar_37 = tmpvar_35.w;
  pblend_34.y = tmpvar_37;
  highp vec4 tmpvar_38;
  tmpvar_38.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_38.w = max (pblend_34.x, pblend_34.y);
  res_33 = tmpvar_38;
  highp vec2 tmpvar_39;
  tmpvar_39 = max (((pblend_34 - res_33.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_40;
  tmpvar_40 = (tmpvar_39 / (tmpvar_39.x + tmpvar_39.y));
  pblend_34 = tmpvar_40;
  highp vec3 tmpvar_41;
  tmpvar_41 = ((c_1.xyz * tmpvar_40.x) + (tmpvar_35.xyz * tmpvar_40.y));
  res_33.xyz = tmpvar_41;
  gl_FragData[0] = res_33;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
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
  tmpvar_15.xyz = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
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
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
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
  c_33.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (normal_32, xlv_TEXCOORD4)) * 2.0));
  c_33.w = tmpvar_2;
  c_1.w = c_33.w;
  c_1.xyz = (c_33.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_37;
  tmpvar_37 = c_1.w;
  pblend_35.x = tmpvar_37;
  lowp float tmpvar_38;
  tmpvar_38 = tmpvar_36.w;
  pblend_35.y = tmpvar_38;
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_39.w = max (pblend_35.x, pblend_35.y);
  res_34 = tmpvar_39;
  highp vec2 tmpvar_40;
  tmpvar_40 = max (((pblend_35 - res_34.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_41;
  tmpvar_41 = (tmpvar_40 / (tmpvar_40.x + tmpvar_40.y));
  pblend_35 = tmpvar_41;
  highp vec3 tmpvar_42;
  tmpvar_42 = ((c_1.xyz * tmpvar_41.x) + (tmpvar_36.xyz * tmpvar_41.y));
  res_34.xyz = tmpvar_42;
  gl_FragData[0] = res_34;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out lowp vec3 xlv_TEXCOORD5;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
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
  tmpvar_15.xyz = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
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
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in lowp vec3 xlv_TEXCOORD5;
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
  c_32.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD4)) * 2.0));
  c_32.w = tmpvar_2;
  c_1.w = c_32.w;
  c_1.xyz = (c_32.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_33;
  highp vec2 pblend_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_36;
  tmpvar_36 = c_1.w;
  pblend_34.x = tmpvar_36;
  lowp float tmpvar_37;
  tmpvar_37 = tmpvar_35.w;
  pblend_34.y = tmpvar_37;
  highp vec4 tmpvar_38;
  tmpvar_38.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_38.w = max (pblend_34.x, pblend_34.y);
  res_33 = tmpvar_38;
  highp vec2 tmpvar_39;
  tmpvar_39 = max (((pblend_34 - res_33.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_40;
  tmpvar_40 = (tmpvar_39 / (tmpvar_39.x + tmpvar_39.y));
  pblend_34 = tmpvar_40;
  highp vec3 tmpvar_41;
  tmpvar_41 = ((c_1.xyz * tmpvar_40.x) + (tmpvar_35.xyz * tmpvar_40.y));
  res_33.xyz = tmpvar_41;
  _glesFragData[0] = res_33;
}



#endif"
}
SubProgram "opengl " {
// Stats: 18 math
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
PARAM c[20] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
DP4 R1.zw, vertex.position, c[4];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MOV R0.z, R0.x;
MOV R0.w, R0.y;
ADD R1.xy, R0.zwzw, R1.z;
DP4 R0.z, vertex.position, c[3];
MOV R0.w, R1;
MOV result.position, R0;
MUL result.texcoord[3].xy, R1, c[0].x;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MOV result.texcoord[3].w, R1.z;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[14], c[14].zwzw;
MOV result.texcoord[3].z, R0;
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 19 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ScreenParams]
Vector 13 [unity_LightmapST]
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
def c19, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r1.zw, v0, c3
dp4 r0.yz, v0, c1
dp4 r0.x, v0, c0
mov r1.y, -r0
mov r0.y, r0.z
dp4 r0.z, v0, c2
mov r1.x, r0
mad r1.xy, r1.z, c12.zwzw, r1
mov r0.w, r1
mov o0, r0
mul o4.xy, r1, c19.x
mad o1.zw, v3.xyxy, c15.xyxy, c15
mad o1.xy, v3, c14, c14.zwzw
mad o2.zw, v3.xyxy, c17.xyxy, c17
mad o2.xy, v3, c16, c16.zwzw
mad o3.xy, v3, c18, c18.zwzw
mov o4.w, r1.z
mad o5.xy, v4, c13, c13.zwzw
mov o4.z, r0
"
}
SubProgram "d3d11 " {
// Stats: 12 math
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
eefiecedcjidjckgpabnecieembbpplhcjgehiicabaaaaaahiaeaaaaadaaaaaa
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
feeffiedepepfceeaaklklklfdeieefcmeacaaaaeaaaabaalbaaaaaafjaaaaae
egiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaaeaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaadmccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaa
ogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaagaaaaaakgiocaaaaaaaaaaaagaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
aiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaal
mccabaaaadaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaa
aaaaaaaaaeaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaadgaaaaafmccabaaa
aeaaaaaakgaobaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
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
  c_1.xyz = (col_4 * (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz));
  c_1.w = tmpvar_2;
  lowp vec4 res_31;
  highp vec2 pblend_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_34;
  tmpvar_34 = c_1.w;
  pblend_32.x = tmpvar_34;
  lowp float tmpvar_35;
  tmpvar_35 = tmpvar_33.w;
  pblend_32.y = tmpvar_35;
  highp vec4 tmpvar_36;
  tmpvar_36.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_36.w = max (pblend_32.x, pblend_32.y);
  res_31 = tmpvar_36;
  highp vec2 tmpvar_37;
  tmpvar_37 = max (((pblend_32 - res_31.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_38;
  tmpvar_38 = (tmpvar_37 / (tmpvar_37.x + tmpvar_37.y));
  pblend_32 = tmpvar_38;
  highp vec3 tmpvar_39;
  tmpvar_39 = ((c_1.xyz * tmpvar_38.x) + (tmpvar_33.xyz * tmpvar_38.y));
  res_31.xyz = tmpvar_39;
  gl_FragData[0] = res_31;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
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
  tmpvar_33 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  c_1.xyz = (col_4 * ((8.0 * tmpvar_33.w) * tmpvar_33.xyz));
  c_1.w = tmpvar_2;
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_37;
  tmpvar_37 = c_1.w;
  pblend_35.x = tmpvar_37;
  lowp float tmpvar_38;
  tmpvar_38 = tmpvar_36.w;
  pblend_35.y = tmpvar_38;
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_39.w = max (pblend_35.x, pblend_35.y);
  res_34 = tmpvar_39;
  highp vec2 tmpvar_40;
  tmpvar_40 = max (((pblend_35 - res_34.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_41;
  tmpvar_41 = (tmpvar_40 / (tmpvar_40.x + tmpvar_40.y));
  pblend_35 = tmpvar_41;
  highp vec3 tmpvar_42;
  tmpvar_42 = ((c_1.xyz * tmpvar_41.x) + (tmpvar_36.xyz * tmpvar_41.y));
  res_34.xyz = tmpvar_42;
  gl_FragData[0] = res_34;
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
out highp vec4 xlv_TEXCOORD3;
out highp vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in highp vec2 xlv_TEXCOORD4;
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
  c_1.xyz = (col_4 * (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz));
  c_1.w = tmpvar_2;
  lowp vec4 res_31;
  highp vec2 pblend_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_34;
  tmpvar_34 = c_1.w;
  pblend_32.x = tmpvar_34;
  lowp float tmpvar_35;
  tmpvar_35 = tmpvar_33.w;
  pblend_32.y = tmpvar_35;
  highp vec4 tmpvar_36;
  tmpvar_36.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_36.w = max (pblend_32.x, pblend_32.y);
  res_31 = tmpvar_36;
  highp vec2 tmpvar_37;
  tmpvar_37 = max (((pblend_32 - res_31.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_38;
  tmpvar_38 = (tmpvar_37 / (tmpvar_37.x + tmpvar_37.y));
  pblend_32 = tmpvar_38;
  highp vec3 tmpvar_39;
  tmpvar_39 = ((c_1.xyz * tmpvar_38.x) + (tmpvar_33.xyz * tmpvar_38.y));
  res_31.xyz = tmpvar_39;
  _glesFragData[0] = res_31;
}



#endif"
}
SubProgram "opengl " {
// Stats: 18 math
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
PARAM c[20] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
DP4 R1.zw, vertex.position, c[4];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MOV R0.z, R0.x;
MOV R0.w, R0.y;
ADD R1.xy, R0.zwzw, R1.z;
DP4 R0.z, vertex.position, c[3];
MOV R0.w, R1;
MOV result.position, R0;
MUL result.texcoord[3].xy, R1, c[0].x;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MOV result.texcoord[3].w, R1.z;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[14], c[14].zwzw;
MOV result.texcoord[3].z, R0;
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 19 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ScreenParams]
Vector 13 [unity_LightmapST]
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
def c19, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r1.zw, v0, c3
dp4 r0.yz, v0, c1
dp4 r0.x, v0, c0
mov r1.y, -r0
mov r0.y, r0.z
dp4 r0.z, v0, c2
mov r1.x, r0
mad r1.xy, r1.z, c12.zwzw, r1
mov r0.w, r1
mov o0, r0
mul o4.xy, r1, c19.x
mad o1.zw, v3.xyxy, c15.xyxy, c15
mad o1.xy, v3, c14, c14.zwzw
mad o2.zw, v3.xyxy, c17.xyxy, c17
mad o2.xy, v3, c16, c16.zwzw
mad o3.xy, v3, c18, c18.zwzw
mov o4.w, r1.z
mad o5.xy, v4, c13, c13.zwzw
mov o4.z, r0
"
}
SubProgram "d3d11 " {
// Stats: 12 math
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
eefiecedcjidjckgpabnecieembbpplhcjgehiicabaaaaaahiaeaaaaadaaaaaa
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
feeffiedepepfceeaaklklklfdeieefcmeacaaaaeaaaabaalbaaaaaafjaaaaae
egiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaaeaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaadmccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaa
ogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaagaaaaaakgiocaaaaaaaaaaaagaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
aiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaal
mccabaaaadaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaa
aaaaaaaaaeaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaadgaaaaafmccabaaa
aeaaaaaakgaobaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
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
  tmpvar_37 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_36 = tmpvar_37;
  lowp vec3 tmpvar_38;
  tmpvar_38 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  scalePerBasisVector_35 = tmpvar_38;
  lm_36 = (lm_36 * dot (clamp ((tmpvar_33 * normal_34), 0.0, 1.0), scalePerBasisVector_35));
  mediump vec3 tmpvar_39;
  tmpvar_39 = (col_4 * lm_36);
  c_1.xyz = tmpvar_39;
  c_1.w = tmpvar_2;
  lowp vec4 res_40;
  highp vec2 pblend_41;
  lowp vec4 tmpvar_42;
  tmpvar_42 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_43;
  tmpvar_43 = c_1.w;
  pblend_41.x = tmpvar_43;
  lowp float tmpvar_44;
  tmpvar_44 = tmpvar_42.w;
  pblend_41.y = tmpvar_44;
  highp vec4 tmpvar_45;
  tmpvar_45.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_45.w = max (pblend_41.x, pblend_41.y);
  res_40 = tmpvar_45;
  highp vec2 tmpvar_46;
  tmpvar_46 = max (((pblend_41 - res_40.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_47;
  tmpvar_47 = (tmpvar_46 / (tmpvar_46.x + tmpvar_46.y));
  pblend_41 = tmpvar_47;
  highp vec3 tmpvar_48;
  tmpvar_48 = ((c_1.xyz * tmpvar_47.x) + (tmpvar_42.xyz * tmpvar_47.y));
  res_40.xyz = tmpvar_48;
  gl_FragData[0] = res_40;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
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
  tmpvar_33 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (unity_LightmapInd, xlv_TEXCOORD4);
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
  lowp vec4 res_42;
  highp vec2 pblend_43;
  lowp vec4 tmpvar_44;
  tmpvar_44 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_45;
  tmpvar_45 = c_1.w;
  pblend_43.x = tmpvar_45;
  lowp float tmpvar_46;
  tmpvar_46 = tmpvar_44.w;
  pblend_43.y = tmpvar_46;
  highp vec4 tmpvar_47;
  tmpvar_47.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_47.w = max (pblend_43.x, pblend_43.y);
  res_42 = tmpvar_47;
  highp vec2 tmpvar_48;
  tmpvar_48 = max (((pblend_43 - res_42.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_49;
  tmpvar_49 = (tmpvar_48 / (tmpvar_48.x + tmpvar_48.y));
  pblend_43 = tmpvar_49;
  highp vec3 tmpvar_50;
  tmpvar_50 = ((c_1.xyz * tmpvar_49.x) + (tmpvar_44.xyz * tmpvar_49.y));
  res_42.xyz = tmpvar_50;
  gl_FragData[0] = res_42;
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
out highp vec4 xlv_TEXCOORD3;
out highp vec2 xlv_TEXCOORD4;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in highp vec2 xlv_TEXCOORD4;
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
  tmpvar_37 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_36 = tmpvar_37;
  lowp vec3 tmpvar_38;
  tmpvar_38 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  scalePerBasisVector_35 = tmpvar_38;
  lm_36 = (lm_36 * dot (clamp ((tmpvar_33 * normal_34), 0.0, 1.0), scalePerBasisVector_35));
  mediump vec3 tmpvar_39;
  tmpvar_39 = (col_4 * lm_36);
  c_1.xyz = tmpvar_39;
  c_1.w = tmpvar_2;
  lowp vec4 res_40;
  highp vec2 pblend_41;
  lowp vec4 tmpvar_42;
  tmpvar_42 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_43;
  tmpvar_43 = c_1.w;
  pblend_41.x = tmpvar_43;
  lowp float tmpvar_44;
  tmpvar_44 = tmpvar_42.w;
  pblend_41.y = tmpvar_44;
  highp vec4 tmpvar_45;
  tmpvar_45.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_45.w = max (pblend_41.x, pblend_41.y);
  res_40 = tmpvar_45;
  highp vec2 tmpvar_46;
  tmpvar_46 = max (((pblend_41 - res_40.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_47;
  tmpvar_47 = (tmpvar_46 / (tmpvar_46.x + tmpvar_46.y));
  pblend_41 = tmpvar_47;
  highp vec3 tmpvar_48;
  tmpvar_48 = ((c_1.xyz * tmpvar_47.x) + (tmpvar_42.xyz * tmpvar_47.y));
  res_40.xyz = tmpvar_48;
  _glesFragData[0] = res_40;
}



#endif"
}
SubProgram "opengl " {
// Stats: 52 math
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
PARAM c[28] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		program.local[5..27] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R1.xyz, vertex.normal, c[22].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[17];
DP4 R2.y, R0, c[16];
DP4 R2.x, R0, c[15];
MUL R0.y, R2.w, R2.w;
MAD R0.x, R0, R0, -R0.y;
DP4 R3.z, R1, c[20];
DP4 R3.y, R1, c[19];
DP4 R3.x, R1, c[18];
DP4 R4.zw, vertex.position, c[4];
MUL R1.xyz, -vertex.normal.zxyw, c[0].zyzw;
MAD R1.xyz, vertex.normal.yzxw, c[0].yzzw, R1;
ADD R2.xyz, R2, R3;
MUL R0.xyz, R0.x, c[21];
ADD result.texcoord[5].xyz, R2, R0;
MOV R0, c[14];
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP3 result.texcoord[4].x, R3, R1;
DP4 R4.x, vertex.position, c[1];
DP4 R4.y, vertex.position, c[2];
DP4 R1.z, vertex.position, c[3];
MOV R0.w, R4;
MOV R0.z, R1;
MOV R0.x, R4;
MOV R0.y, R4;
DP3 result.texcoord[4].y, R3, -R2;
MUL R2.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
ADD result.texcoord[6].xy, R1, R2.z;
ADD R0.xy, R4.z, R4;
MOV R1.w, R4.z;
MUL R1.xy, R0, c[0].x;
DP3 result.texcoord[4].z, vertex.normal, R3;
MOV result.texcoord[3], R1;
MOV result.texcoord[6].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[26].xyxy, c[26];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[27], c[27].zwzw;
END
# 52 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 54 math
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
dcl_texcoord6 o7
def c28, 0.50000000, 0.00000000, 1.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c22.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
mov r0.y, r2.w
dp3 r0.z, r1, c6
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c28.z
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
add o6.xyz, r1, r0
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
mul r2.xyz, -v2.zxyw, c28.yzyw
mad r2.xyz, v2.yzxw, c28.zyyw, r2
mul r1.xyz, v2.zxyw, r2.yzxw
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
mov r1, c8
dp4 r4.x, c14, r1
dp4 r4.y, c14, r0
dp3 o5.y, r4, -r3
dp4 r3.zw, v0, c3
dp4 r1.w, v0, c0
dp4 r3.xy, v0, c1
dp3 o5.x, r4, r2
dp4 r2.z, v0, c2
mov r0.w, r3
mov r0.z, r2
mov r0.x, r1.w
mov r0.y, r3
mul r1.xyz, r0.xyww, c28.x
mul r1.y, r1, c12.x
mad o7.xy, r1.z, c13.zwzw, r1
mov r1.x, -r3
mov o0, r0
mad r0.xy, r3.z, c13.zwzw, r1.wxzw
mov r2.w, r3.z
mul r2.xy, r0, c28.x
dp3 o5.z, v2, r4
mov o4, r2
mov o7.zw, r0
mad o1.zw, v3.xyxy, c24.xyxy, c24
mad o1.xy, v3, c23, c23.zwzw
mad o2.zw, v3.xyxy, c26.xyxy, c26
mad o2.xy, v3, c25, c25.zwzw
mad o3.xy, v3, c27, c27.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 41 math
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
eefiecedefejeofaadakckpckghlkgfhgcgklehfabaaaaaapaaiaaaaadaaaaaa
cmaaaaaapeaaaaaanmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
amahaaaaeaaaabaamdabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
hccabaaaagaaaaaagfaaaaadpccabaaaahaaaaaagiaaaaacafaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaa
dcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaa
ogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadcaaaaaldccabaaa
adaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaa
amaaaaaadcaaaaamdcaabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaa
egaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaaf
mccabaaaaeaaaaaakgaobaaaaaaaaaaadgaaaaafmccabaaaahaaaaaakgaobaaa
aaaaaaaadiaaaaakhcaabaaaabaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadp
aaaaaaaaaaaaaaaaaaaaaaaadcaaaaanhcaabaaaabaaaaaacgbjbaaaacaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaiadpaaaaaaaaegacbaiaebaaaaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaajgbebaaaacaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaa
acaaaaaadiaaaaajhcaabaaaadaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaadaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaaegacbaaaadaaaaaadcaaaaalhcaabaaaadaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaadaaaaaa
dcaaaaalhcaabaaaadaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaaegacbaaaadaaaaaabaaaaaaicccabaaaafaaaaaaegacbaiaebaaaaaa
acaaaaaaegacbaaaadaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaa
egacbaaaadaaaaaaapaaaaahbccabaaaafaaaaaacgakbaaaabaaaaaaegaabaaa
adaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
abaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaaficaabaaaabaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaa
abaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
adaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
adaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
adaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaa
diaaaaahecaabaaaaaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaak
ecaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaackaabaiaebaaaaaa
aaaaaaaadcaaaaakhccabaaaagaaaaaaegiccaaaacaaaaaacmaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakfcaabaaaaaaaaaaaagadbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaahdccabaaaahaaaaaakgakbaaa
aaaaaaaamgaabaaaaaaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
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
  tmpvar_15.xyz = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
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
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
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
  tmpvar_35 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  dist_34 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = _LightShadowData.x;
  lightShadowDataX_33 = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = max (float((dist_34 > (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))), lightShadowDataX_33);
  tmpvar_32 = tmpvar_37;
  lowp vec4 c_38;
  c_38.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD4)) * tmpvar_32) * 2.0));
  c_38.w = tmpvar_2;
  c_1.w = c_38.w;
  c_1.xyz = (c_38.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_39;
  highp vec2 pblend_40;
  lowp vec4 tmpvar_41;
  tmpvar_41 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_42;
  tmpvar_42 = c_1.w;
  pblend_40.x = tmpvar_42;
  lowp float tmpvar_43;
  tmpvar_43 = tmpvar_41.w;
  pblend_40.y = tmpvar_43;
  highp vec4 tmpvar_44;
  tmpvar_44.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_44.w = max (pblend_40.x, pblend_40.y);
  res_39 = tmpvar_44;
  highp vec2 tmpvar_45;
  tmpvar_45 = max (((pblend_40 - res_39.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_46;
  tmpvar_46 = (tmpvar_45 / (tmpvar_45.x + tmpvar_45.y));
  pblend_40 = tmpvar_46;
  highp vec3 tmpvar_47;
  tmpvar_47 = ((c_1.xyz * tmpvar_46.x) + (tmpvar_41.xyz * tmpvar_46.y));
  res_39.xyz = tmpvar_47;
  gl_FragData[0] = res_39;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  highp vec4 tmpvar_10;
  tmpvar_10 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_11;
  tmpvar_11[0] = _Object2World[0].xyz;
  tmpvar_11[1] = _Object2World[1].xyz;
  tmpvar_11[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = tmpvar_7.xyz;
  tmpvar_13 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_14;
  tmpvar_14[0].x = tmpvar_12.x;
  tmpvar_14[0].y = tmpvar_13.x;
  tmpvar_14[0].z = tmpvar_1.x;
  tmpvar_14[1].x = tmpvar_12.y;
  tmpvar_14[1].y = tmpvar_13.y;
  tmpvar_14[1].z = tmpvar_1.y;
  tmpvar_14[2].x = tmpvar_12.z;
  tmpvar_14[2].y = tmpvar_13.z;
  tmpvar_14[2].z = tmpvar_1.z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = (tmpvar_11 * (tmpvar_1 * unity_Scale.w));
  mediump vec3 tmpvar_17;
  mediump vec4 normal_18;
  normal_18 = tmpvar_16;
  highp float vC_19;
  mediump vec3 x3_20;
  mediump vec3 x2_21;
  mediump vec3 x1_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAr, normal_18);
  x1_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAg, normal_18);
  x1_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAb, normal_18);
  x1_22.z = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal_18.xyzz * normal_18.yzzx);
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBr, tmpvar_26);
  x2_21.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBg, tmpvar_26);
  x2_21.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBb, tmpvar_26);
  x2_21.z = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = ((normal_18.x * normal_18.x) - (normal_18.y * normal_18.y));
  vC_19 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (unity_SHC.xyz * vC_19);
  x3_20 = tmpvar_31;
  tmpvar_17 = ((x1_22 + x2_21) + x3_20);
  shlight_2 = tmpvar_17;
  tmpvar_6 = shlight_2;
  highp vec4 o_32;
  highp vec4 tmpvar_33;
  tmpvar_33 = (tmpvar_10 * 0.5);
  highp vec2 tmpvar_34;
  tmpvar_34.x = tmpvar_33.x;
  tmpvar_34.y = (tmpvar_33.y * _ProjectionParams.x);
  o_32.xy = (tmpvar_34 + tmpvar_33.w);
  o_32.zw = tmpvar_10.zw;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = o_32;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
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
  c_33.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (normal_32, xlv_TEXCOORD4)) * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x) * 2.0));
  c_33.w = tmpvar_2;
  c_1.w = c_33.w;
  c_1.xyz = (c_33.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_37;
  tmpvar_37 = c_1.w;
  pblend_35.x = tmpvar_37;
  lowp float tmpvar_38;
  tmpvar_38 = tmpvar_36.w;
  pblend_35.y = tmpvar_38;
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_39.w = max (pblend_35.x, pblend_35.y);
  res_34 = tmpvar_39;
  highp vec2 tmpvar_40;
  tmpvar_40 = max (((pblend_35 - res_34.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_41;
  tmpvar_41 = (tmpvar_40 / (tmpvar_40.x + tmpvar_40.y));
  pblend_35 = tmpvar_41;
  highp vec3 tmpvar_42;
  tmpvar_42 = ((c_1.xyz * tmpvar_41.x) + (tmpvar_36.xyz * tmpvar_41.y));
  res_34.xyz = tmpvar_42;
  gl_FragData[0] = res_34;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out lowp vec3 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
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
  tmpvar_15.xyz = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
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
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in lowp vec3 xlv_TEXCOORD5;
in highp vec4 xlv_TEXCOORD6;
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
  tmpvar_35 = textureProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  dist_34 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = _LightShadowData.x;
  lightShadowDataX_33 = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = max (float((dist_34 > (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))), lightShadowDataX_33);
  tmpvar_32 = tmpvar_37;
  lowp vec4 c_38;
  c_38.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD4)) * tmpvar_32) * 2.0));
  c_38.w = tmpvar_2;
  c_1.w = c_38.w;
  c_1.xyz = (c_38.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_39;
  highp vec2 pblend_40;
  lowp vec4 tmpvar_41;
  tmpvar_41 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_42;
  tmpvar_42 = c_1.w;
  pblend_40.x = tmpvar_42;
  lowp float tmpvar_43;
  tmpvar_43 = tmpvar_41.w;
  pblend_40.y = tmpvar_43;
  highp vec4 tmpvar_44;
  tmpvar_44.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_44.w = max (pblend_40.x, pblend_40.y);
  res_39 = tmpvar_44;
  highp vec2 tmpvar_45;
  tmpvar_45 = max (((pblend_40 - res_39.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_46;
  tmpvar_46 = (tmpvar_45 / (tmpvar_45.x + tmpvar_45.y));
  pblend_40 = tmpvar_46;
  highp vec3 tmpvar_47;
  tmpvar_47 = ((c_1.xyz * tmpvar_46.x) + (tmpvar_41.xyz * tmpvar_46.y));
  res_39.xyz = tmpvar_47;
  _glesFragData[0] = res_39;
}



#endif"
}
SubProgram "opengl " {
// Stats: 20 math
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
DP4 R1.xw, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
MOV R0.w, R1.x;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[13].x;
MOV result.position, R0;
ADD R0.xy, R0, R1.w;
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.texcoord[5].zw, R0;
MUL result.texcoord[3].xy, R0, c[0].x;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[17].xyxy, c[17];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MOV result.texcoord[3].w, R1;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[15], c[15].zwzw;
MOV result.texcoord[3].z, R0;
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 22 math
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
dcl_texcoord5 o6
def c20, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r2.zw, v0, c3
dp4 r0.z, v0, c2
mov r0.w, r2
dp4 r2.xy, v0, c1
dp4 r0.x, v0, c0
mov r0.y, r2
mul r1.xyz, r0.xyww, c20.x
mov o0, r0
mul r1.y, r1, c12.x
mov r0.y, -r2.x
mad r0.xy, r2.z, c13.zwzw, r0
mad o6.xy, r1.z, c13.zwzw, r1
mov o6.zw, r0
mul o4.xy, r0, c20.x
mad o1.zw, v3.xyxy, c16.xyxy, c16
mad o1.xy, v3, c15, c15.zwzw
mad o2.zw, v3.xyxy, c18.xyxy, c18
mad o2.xy, v3, c17, c17.zwzw
mad o3.xy, v3, c19, c19.zwzw
mov o4.w, r2.z
mad o5.xy, v4, c14, c14.zwzw
mov o4.z, r0
"
}
SubProgram "d3d11 " {
// Stats: 16 math
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
eefiecednnklennncdldnomdbgghgdahflfdlhpcabaaaaaaeaafaaaaadaaaaaa
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
aaklklklfdeieefcheadaaaaeaaaabaannaaaaaafjaaaaaeegiocaaaaaaaaaaa
aoaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
mccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaakaaaaaa
kgiocaaaaaaaaaaaakaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadcaaaaalmccabaaa
acaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaamaaaaaakgiocaaaaaaaaaaa
amaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
anaaaaaaogikcaaaaaaaaaaaanaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaam
dcaabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaa
aaaaaaaapgapbaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaaegaabaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaafmccabaaaaeaaaaaa
kgaobaaaaaaaaaaadgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
fcaabaaaaaaaaaaaagadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaahdccabaaaafaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab
"
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
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
  nrm_3 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_30;
  tmpvar_30 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_30;
  lowp float tmpvar_31;
  mediump float lightShadowDataX_32;
  highp float dist_33;
  lowp float tmpvar_34;
  tmpvar_34 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_33 = tmpvar_34;
  highp float tmpvar_35;
  tmpvar_35 = _LightShadowData.x;
  lightShadowDataX_32 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = max (float((dist_33 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_32);
  tmpvar_31 = tmpvar_36;
  c_1.xyz = (col_4 * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz), vec3((tmpvar_31 * 2.0))));
  c_1.w = tmpvar_2;
  lowp vec4 res_37;
  highp vec2 pblend_38;
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_40;
  tmpvar_40 = c_1.w;
  pblend_38.x = tmpvar_40;
  lowp float tmpvar_41;
  tmpvar_41 = tmpvar_39.w;
  pblend_38.y = tmpvar_41;
  highp vec4 tmpvar_42;
  tmpvar_42.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_42.w = max (pblend_38.x, pblend_38.y);
  res_37 = tmpvar_42;
  highp vec2 tmpvar_43;
  tmpvar_43 = max (((pblend_38 - res_37.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_44;
  tmpvar_44 = (tmpvar_43 / (tmpvar_43.x + tmpvar_43.y));
  pblend_38 = tmpvar_44;
  highp vec3 tmpvar_45;
  tmpvar_45 = ((c_1.xyz * tmpvar_44.x) + (tmpvar_39.xyz * tmpvar_44.y));
  res_37.xyz = tmpvar_45;
  gl_FragData[0] = res_37;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = o_6;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
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
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5);
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec3 tmpvar_35;
  tmpvar_35 = ((8.0 * tmpvar_34.w) * tmpvar_34.xyz);
  c_1.xyz = (col_4 * max (min (tmpvar_35, ((tmpvar_33.x * 2.0) * tmpvar_34.xyz)), (tmpvar_35 * tmpvar_33.x)));
  c_1.w = tmpvar_2;
  lowp vec4 res_36;
  highp vec2 pblend_37;
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_39;
  tmpvar_39 = c_1.w;
  pblend_37.x = tmpvar_39;
  lowp float tmpvar_40;
  tmpvar_40 = tmpvar_38.w;
  pblend_37.y = tmpvar_40;
  highp vec4 tmpvar_41;
  tmpvar_41.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_41.w = max (pblend_37.x, pblend_37.y);
  res_36 = tmpvar_41;
  highp vec2 tmpvar_42;
  tmpvar_42 = max (((pblend_37 - res_36.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_43;
  tmpvar_43 = (tmpvar_42 / (tmpvar_42.x + tmpvar_42.y));
  pblend_37 = tmpvar_43;
  highp vec3 tmpvar_44;
  tmpvar_44 = ((c_1.xyz * tmpvar_43.x) + (tmpvar_38.xyz * tmpvar_43.y));
  res_36.xyz = tmpvar_44;
  gl_FragData[0] = res_36;
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
out highp vec4 xlv_TEXCOORD3;
out highp vec2 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in highp vec2 xlv_TEXCOORD4;
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
  nrm_3 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_30;
  tmpvar_30 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_30;
  lowp float tmpvar_31;
  mediump float lightShadowDataX_32;
  highp float dist_33;
  lowp float tmpvar_34;
  tmpvar_34 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_33 = tmpvar_34;
  highp float tmpvar_35;
  tmpvar_35 = _LightShadowData.x;
  lightShadowDataX_32 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = max (float((dist_33 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_32);
  tmpvar_31 = tmpvar_36;
  c_1.xyz = (col_4 * min ((2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz), vec3((tmpvar_31 * 2.0))));
  c_1.w = tmpvar_2;
  lowp vec4 res_37;
  highp vec2 pblend_38;
  lowp vec4 tmpvar_39;
  tmpvar_39 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_40;
  tmpvar_40 = c_1.w;
  pblend_38.x = tmpvar_40;
  lowp float tmpvar_41;
  tmpvar_41 = tmpvar_39.w;
  pblend_38.y = tmpvar_41;
  highp vec4 tmpvar_42;
  tmpvar_42.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_42.w = max (pblend_38.x, pblend_38.y);
  res_37 = tmpvar_42;
  highp vec2 tmpvar_43;
  tmpvar_43 = max (((pblend_38 - res_37.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_44;
  tmpvar_44 = (tmpvar_43 / (tmpvar_43.x + tmpvar_43.y));
  pblend_38 = tmpvar_44;
  highp vec3 tmpvar_45;
  tmpvar_45 = ((c_1.xyz * tmpvar_44.x) + (tmpvar_39.xyz * tmpvar_44.y));
  res_37.xyz = tmpvar_45;
  _glesFragData[0] = res_37;
}



#endif"
}
SubProgram "opengl " {
// Stats: 20 math
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
DP4 R1.xw, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
MOV R0.w, R1.x;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[13].x;
MOV result.position, R0;
ADD R0.xy, R0, R1.w;
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.texcoord[5].zw, R0;
MUL result.texcoord[3].xy, R0, c[0].x;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[17].xyxy, c[17];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MOV result.texcoord[3].w, R1;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[15], c[15].zwzw;
MOV result.texcoord[3].z, R0;
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 22 math
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
dcl_texcoord5 o6
def c20, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r2.zw, v0, c3
dp4 r0.z, v0, c2
mov r0.w, r2
dp4 r2.xy, v0, c1
dp4 r0.x, v0, c0
mov r0.y, r2
mul r1.xyz, r0.xyww, c20.x
mov o0, r0
mul r1.y, r1, c12.x
mov r0.y, -r2.x
mad r0.xy, r2.z, c13.zwzw, r0
mad o6.xy, r1.z, c13.zwzw, r1
mov o6.zw, r0
mul o4.xy, r0, c20.x
mad o1.zw, v3.xyxy, c16.xyxy, c16
mad o1.xy, v3, c15, c15.zwzw
mad o2.zw, v3.xyxy, c18.xyxy, c18
mad o2.xy, v3, c17, c17.zwzw
mad o3.xy, v3, c19, c19.zwzw
mov o4.w, r2.z
mad o5.xy, v4, c14, c14.zwzw
mov o4.z, r0
"
}
SubProgram "d3d11 " {
// Stats: 16 math
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
eefiecednnklennncdldnomdbgghgdahflfdlhpcabaaaaaaeaafaaaaadaaaaaa
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
aaklklklfdeieefcheadaaaaeaaaabaannaaaaaafjaaaaaeegiocaaaaaaaaaaa
aoaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
mccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaakaaaaaa
kgiocaaaaaaaaaaaakaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadcaaaaalmccabaaa
acaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaamaaaaaakgiocaaaaaaaaaaa
amaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
anaaaaaaogikcaaaaaaaaaaaanaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaam
dcaabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaa
aaaaaaaapgapbaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaaegaabaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaafmccabaaaaeaaaaaa
kgaobaaaaaaaaaaadgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
fcaabaaaaaaaaaaaagadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaahdccabaaaafaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab
"
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
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
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((tmpvar_30.xyz * 2.0) - 1.0);
  lowp float tmpvar_33;
  mediump float lightShadowDataX_34;
  highp float dist_35;
  lowp float tmpvar_36;
  tmpvar_36 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_35 = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = _LightShadowData.x;
  lightShadowDataX_34 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = max (float((dist_35 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_34);
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
  tmpvar_43 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_42 = tmpvar_43;
  lowp vec3 tmpvar_44;
  tmpvar_44 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  scalePerBasisVector_41 = tmpvar_44;
  lm_42 = (lm_42 * dot (clamp ((tmpvar_39 * normal_40), 0.0, 1.0), scalePerBasisVector_41));
  lowp vec3 tmpvar_45;
  tmpvar_45 = vec3((tmpvar_33 * 2.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (col_4 * min (lm_42, tmpvar_45));
  c_1.xyz = tmpvar_46;
  c_1.w = tmpvar_2;
  lowp vec4 res_47;
  highp vec2 pblend_48;
  lowp vec4 tmpvar_49;
  tmpvar_49 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_50;
  tmpvar_50 = c_1.w;
  pblend_48.x = tmpvar_50;
  lowp float tmpvar_51;
  tmpvar_51 = tmpvar_49.w;
  pblend_48.y = tmpvar_51;
  highp vec4 tmpvar_52;
  tmpvar_52.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_52.w = max (pblend_48.x, pblend_48.y);
  res_47 = tmpvar_52;
  highp vec2 tmpvar_53;
  tmpvar_53 = max (((pblend_48 - res_47.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_54;
  tmpvar_54 = (tmpvar_53 / (tmpvar_53.x + tmpvar_53.y));
  pblend_48 = tmpvar_54;
  highp vec3 tmpvar_55;
  tmpvar_55 = ((c_1.xyz * tmpvar_54.x) + (tmpvar_49.xyz * tmpvar_54.y));
  res_47.xyz = tmpvar_55;
  gl_FragData[0] = res_47;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = o_6;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
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
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5);
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (unity_LightmapInd, xlv_TEXCOORD4);
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
  lowp vec4 res_44;
  highp vec2 pblend_45;
  lowp vec4 tmpvar_46;
  tmpvar_46 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_47;
  tmpvar_47 = c_1.w;
  pblend_45.x = tmpvar_47;
  lowp float tmpvar_48;
  tmpvar_48 = tmpvar_46.w;
  pblend_45.y = tmpvar_48;
  highp vec4 tmpvar_49;
  tmpvar_49.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_49.w = max (pblend_45.x, pblend_45.y);
  res_44 = tmpvar_49;
  highp vec2 tmpvar_50;
  tmpvar_50 = max (((pblend_45 - res_44.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_51;
  tmpvar_51 = (tmpvar_50 / (tmpvar_50.x + tmpvar_50.y));
  pblend_45 = tmpvar_51;
  highp vec3 tmpvar_52;
  tmpvar_52 = ((c_1.xyz * tmpvar_51.x) + (tmpvar_46.xyz * tmpvar_51.y));
  res_44.xyz = tmpvar_52;
  gl_FragData[0] = res_44;
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
out highp vec4 xlv_TEXCOORD3;
out highp vec2 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in highp vec2 xlv_TEXCOORD4;
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
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((tmpvar_30.xyz * 2.0) - 1.0);
  lowp float tmpvar_33;
  mediump float lightShadowDataX_34;
  highp float dist_35;
  lowp float tmpvar_36;
  tmpvar_36 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_35 = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = _LightShadowData.x;
  lightShadowDataX_34 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = max (float((dist_35 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_34);
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
  tmpvar_43 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_42 = tmpvar_43;
  lowp vec3 tmpvar_44;
  tmpvar_44 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  scalePerBasisVector_41 = tmpvar_44;
  lm_42 = (lm_42 * dot (clamp ((tmpvar_39 * normal_40), 0.0, 1.0), scalePerBasisVector_41));
  lowp vec3 tmpvar_45;
  tmpvar_45 = vec3((tmpvar_33 * 2.0));
  mediump vec3 tmpvar_46;
  tmpvar_46 = (col_4 * min (lm_42, tmpvar_45));
  c_1.xyz = tmpvar_46;
  c_1.w = tmpvar_2;
  lowp vec4 res_47;
  highp vec2 pblend_48;
  lowp vec4 tmpvar_49;
  tmpvar_49 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_50;
  tmpvar_50 = c_1.w;
  pblend_48.x = tmpvar_50;
  lowp float tmpvar_51;
  tmpvar_51 = tmpvar_49.w;
  pblend_48.y = tmpvar_51;
  highp vec4 tmpvar_52;
  tmpvar_52.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_52.w = max (pblend_48.x, pblend_48.y);
  res_47 = tmpvar_52;
  highp vec2 tmpvar_53;
  tmpvar_53 = max (((pblend_48 - res_47.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_54;
  tmpvar_54 = (tmpvar_53 / (tmpvar_53.x + tmpvar_53.y));
  pblend_48 = tmpvar_54;
  highp vec3 tmpvar_55;
  tmpvar_55 = ((c_1.xyz * tmpvar_54.x) + (tmpvar_49.xyz * tmpvar_54.y));
  res_47.xyz = tmpvar_55;
  _glesFragData[0] = res_47;
}



#endif"
}
SubProgram "opengl " {
// Stats: 77 math
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
PARAM c[35] = { { 0.5, 1, 0 },
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
MOV R4.w, c[0].y;
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
ADD R1, R2, c[0].y;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
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
ADD result.texcoord[5].xyz, R2, R1;
MOV R1, c[13];
MUL R0.xyz, -vertex.normal.zxyw, c[0].zyzw;
MAD R0.xyz, vertex.normal.yzxw, c[0].yzzw, R0;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
DP4 R3.z, R1, c[11];
DP4 R3.y, R1, c[10];
DP4 R3.x, R1, c[9];
DP4 R1.zw, vertex.position, c[4];
MAD R2.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
DP4 R1.y, vertex.position, c[2];
DP4 R1.x, vertex.position, c[1];
DP3 result.texcoord[4].x, R3, R0;
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[4].y, R3, -R2;
ADD R2.xy, R1.z, R1;
MUL R0.xy, R2, c[0].x;
MOV R0.w, R1.z;
DP3 result.texcoord[4].z, vertex.normal, R3;
MOV result.texcoord[3], R0;
MOV result.position.w, R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[31].xyxy, c[31];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[30], c[30].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[33].xyxy, c[33];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[32], c[32].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[34], c[34].zwzw;
MOV result.position.z, R0;
MOV result.position.y, R1;
MOV result.position.x, R1;
END
# 77 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 80 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ScreenParams]
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
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c35, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c29.w
dp4 r0.x, v0, c5
add r1, -r0.x, c15
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c14
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c35.y
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c16
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c17
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c35.y
dp4 r2.z, r4, c24
dp4 r2.y, r4, c23
dp4 r2.x, r4, c22
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c35.z
mul r0, r0, r1
mul r1.xyz, r0.y, c19
mad r1.xyz, r0.x, c18, r1
mad r0.xyz, r0.z, c20, r1
mad r1.xyz, r0.w, c21, r0
mul r0, r4.xyzz, r4.yzzx
dp4 r3.z, r0, c27
dp4 r3.y, r0, c26
dp4 r3.x, r0, c25
mul r1.w, r3, r3
mad r0.x, r4, r4, -r1.w
add r2.xyz, r2, r3
mul r3.xyz, r0.x, c28
add r2.xyz, r2, r3
add o6.xyz, r2, r1
mov r1, c10
dp4 r4.z, c13, r1
mov r1, c9
dp4 r4.y, c13, r1
dp4 r1.xy, v0, c3
dp4 r1.zw, v0, c1
mul r0.xyz, -v2.zxyw, c35.zyzw
mad r0.xyz, v2.yzxw, c35.yzzw, r0
mul r2.xyz, v2.zxyw, r0.yzxw
mad r3.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r4.x, c13, r2
dp4 r2.x, v0, c0
dp3 o5.x, r4, r0
dp4 r0.z, v0, c2
mov r2.y, -r1.z
mad r2.zw, r1.x, c12, r2.xyxy
mul r0.xy, r2.zwzw, c35.x
mov r0.w, r1.x
dp3 o5.y, r4, -r3
dp3 o5.z, v2, r4
mov o4, r0
mov o0.w, r1.y
mov o0.y, r1.w
mad o1.zw, v3.xyxy, c31.xyxy, c31
mad o1.xy, v3, c30, c30.zwzw
mad o2.zw, v3.xyxy, c33.xyxy, c33
mad o2.xy, v3, c32, c32.zwzw
mad o3.xy, v3, c34, c34.zwzw
mov o0.z, r0
mov o0.x, r2
"
}
SubProgram "d3d11 " {
// Stats: 61 math
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
eefiecedadilnibcklpfcpaicghcalaclimcbicdabaaaaaahialaaaaadaaaaaa
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
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefckmajaaaaeaaaabaaglacaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaafaaaaaa
kgiocaaaaaaaaaaaafaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaa
acaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaa
ahaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaa
dgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaak
hcaabaaaaaaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaadcaaaaanhcaabaaaaaaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaiadpaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaaaaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
jgbebaaaacaaaaaajgaebaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaaj
hcaabaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaa
acaaaaaabaaaaaaicccabaaaafaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaa
acaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
apaaaaahbccabaaaafaaaaaacgakbaaaaaaaaaaaegaabaaaacaaaaaadgaaaaaf
icaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaabaaaaaaegbcbaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaa
bbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaj
pcaabaaaadaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaadaaaaaa
diaaaaahpcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaa
afaaaaaaagaabaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaaj
pcaabaaaacaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaaeaaaaaa
dcaaaaajpcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaa
afaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaa
acaaaaaadcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaabaaaaaa
afaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaak
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaaahaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaiaaaaaa
kgakbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
abaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaa
agaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = tmpvar_7.xyz;
  tmpvar_13 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_14;
  tmpvar_14[0].x = tmpvar_12.x;
  tmpvar_14[0].y = tmpvar_13.x;
  tmpvar_14[0].z = tmpvar_1.x;
  tmpvar_14[1].x = tmpvar_12.y;
  tmpvar_14[1].y = tmpvar_13.y;
  tmpvar_14[1].z = tmpvar_1.y;
  tmpvar_14[2].x = tmpvar_12.z;
  tmpvar_14[2].y = tmpvar_13.z;
  tmpvar_14[2].z = tmpvar_1.z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = tmpvar_11;
  mediump vec3 tmpvar_17;
  mediump vec4 normal_18;
  normal_18 = tmpvar_16;
  highp float vC_19;
  mediump vec3 x3_20;
  mediump vec3 x2_21;
  mediump vec3 x1_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAr, normal_18);
  x1_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAg, normal_18);
  x1_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAb, normal_18);
  x1_22.z = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal_18.xyzz * normal_18.yzzx);
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBr, tmpvar_26);
  x2_21.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBg, tmpvar_26);
  x2_21.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBb, tmpvar_26);
  x2_21.z = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = ((normal_18.x * normal_18.x) - (normal_18.y * normal_18.y));
  vC_19 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (unity_SHC.xyz * vC_19);
  x3_20 = tmpvar_31;
  tmpvar_17 = ((x1_22 + x2_21) + x3_20);
  shlight_2 = tmpvar_17;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_32;
  tmpvar_32 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosX0 - tmpvar_32.x);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosY0 - tmpvar_32.y);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosZ0 - tmpvar_32.z);
  highp vec4 tmpvar_36;
  tmpvar_36 = (((tmpvar_33 * tmpvar_33) + (tmpvar_34 * tmpvar_34)) + (tmpvar_35 * tmpvar_35));
  highp vec4 tmpvar_37;
  tmpvar_37 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_33 * tmpvar_11.x) + (tmpvar_34 * tmpvar_11.y)) + (tmpvar_35 * tmpvar_11.z)) * inversesqrt(tmpvar_36))) * (1.0/((1.0 + (tmpvar_36 * unity_4LightAtten0)))));
  highp vec3 tmpvar_38;
  tmpvar_38 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_37.x) + (unity_LightColor[1].xyz * tmpvar_37.y)) + (unity_LightColor[2].xyz * tmpvar_37.z)) + (unity_LightColor[3].xyz * tmpvar_37.w)));
  tmpvar_6 = tmpvar_38;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
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
  c_32.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD4)) * 2.0));
  c_32.w = tmpvar_2;
  c_1.w = c_32.w;
  c_1.xyz = (c_32.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_33;
  highp vec2 pblend_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_36;
  tmpvar_36 = c_1.w;
  pblend_34.x = tmpvar_36;
  lowp float tmpvar_37;
  tmpvar_37 = tmpvar_35.w;
  pblend_34.y = tmpvar_37;
  highp vec4 tmpvar_38;
  tmpvar_38.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_38.w = max (pblend_34.x, pblend_34.y);
  res_33 = tmpvar_38;
  highp vec2 tmpvar_39;
  tmpvar_39 = max (((pblend_34 - res_33.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_40;
  tmpvar_40 = (tmpvar_39 / (tmpvar_39.x + tmpvar_39.y));
  pblend_34 = tmpvar_40;
  highp vec3 tmpvar_41;
  tmpvar_41 = ((c_1.xyz * tmpvar_40.x) + (tmpvar_35.xyz * tmpvar_40.y));
  res_33.xyz = tmpvar_41;
  gl_FragData[0] = res_33;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = tmpvar_7.xyz;
  tmpvar_13 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_14;
  tmpvar_14[0].x = tmpvar_12.x;
  tmpvar_14[0].y = tmpvar_13.x;
  tmpvar_14[0].z = tmpvar_1.x;
  tmpvar_14[1].x = tmpvar_12.y;
  tmpvar_14[1].y = tmpvar_13.y;
  tmpvar_14[1].z = tmpvar_1.y;
  tmpvar_14[2].x = tmpvar_12.z;
  tmpvar_14[2].y = tmpvar_13.z;
  tmpvar_14[2].z = tmpvar_1.z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = tmpvar_11;
  mediump vec3 tmpvar_17;
  mediump vec4 normal_18;
  normal_18 = tmpvar_16;
  highp float vC_19;
  mediump vec3 x3_20;
  mediump vec3 x2_21;
  mediump vec3 x1_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAr, normal_18);
  x1_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAg, normal_18);
  x1_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAb, normal_18);
  x1_22.z = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal_18.xyzz * normal_18.yzzx);
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBr, tmpvar_26);
  x2_21.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBg, tmpvar_26);
  x2_21.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBb, tmpvar_26);
  x2_21.z = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = ((normal_18.x * normal_18.x) - (normal_18.y * normal_18.y));
  vC_19 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (unity_SHC.xyz * vC_19);
  x3_20 = tmpvar_31;
  tmpvar_17 = ((x1_22 + x2_21) + x3_20);
  shlight_2 = tmpvar_17;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_32;
  tmpvar_32 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosX0 - tmpvar_32.x);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosY0 - tmpvar_32.y);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosZ0 - tmpvar_32.z);
  highp vec4 tmpvar_36;
  tmpvar_36 = (((tmpvar_33 * tmpvar_33) + (tmpvar_34 * tmpvar_34)) + (tmpvar_35 * tmpvar_35));
  highp vec4 tmpvar_37;
  tmpvar_37 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_33 * tmpvar_11.x) + (tmpvar_34 * tmpvar_11.y)) + (tmpvar_35 * tmpvar_11.z)) * inversesqrt(tmpvar_36))) * (1.0/((1.0 + (tmpvar_36 * unity_4LightAtten0)))));
  highp vec3 tmpvar_38;
  tmpvar_38 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_37.x) + (unity_LightColor[1].xyz * tmpvar_37.y)) + (unity_LightColor[2].xyz * tmpvar_37.z)) + (unity_LightColor[3].xyz * tmpvar_37.w)));
  tmpvar_6 = tmpvar_38;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
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
  c_33.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (normal_32, xlv_TEXCOORD4)) * 2.0));
  c_33.w = tmpvar_2;
  c_1.w = c_33.w;
  c_1.xyz = (c_33.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_37;
  tmpvar_37 = c_1.w;
  pblend_35.x = tmpvar_37;
  lowp float tmpvar_38;
  tmpvar_38 = tmpvar_36.w;
  pblend_35.y = tmpvar_38;
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_39.w = max (pblend_35.x, pblend_35.y);
  res_34 = tmpvar_39;
  highp vec2 tmpvar_40;
  tmpvar_40 = max (((pblend_35 - res_34.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_41;
  tmpvar_41 = (tmpvar_40 / (tmpvar_40.x + tmpvar_40.y));
  pblend_35 = tmpvar_41;
  highp vec3 tmpvar_42;
  tmpvar_42 = ((c_1.xyz * tmpvar_41.x) + (tmpvar_36.xyz * tmpvar_41.y));
  res_34.xyz = tmpvar_42;
  gl_FragData[0] = res_34;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out lowp vec3 xlv_TEXCOORD5;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = tmpvar_7.xyz;
  tmpvar_13 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_14;
  tmpvar_14[0].x = tmpvar_12.x;
  tmpvar_14[0].y = tmpvar_13.x;
  tmpvar_14[0].z = tmpvar_1.x;
  tmpvar_14[1].x = tmpvar_12.y;
  tmpvar_14[1].y = tmpvar_13.y;
  tmpvar_14[1].z = tmpvar_1.y;
  tmpvar_14[2].x = tmpvar_12.z;
  tmpvar_14[2].y = tmpvar_13.z;
  tmpvar_14[2].z = tmpvar_1.z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = tmpvar_11;
  mediump vec3 tmpvar_17;
  mediump vec4 normal_18;
  normal_18 = tmpvar_16;
  highp float vC_19;
  mediump vec3 x3_20;
  mediump vec3 x2_21;
  mediump vec3 x1_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAr, normal_18);
  x1_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAg, normal_18);
  x1_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAb, normal_18);
  x1_22.z = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal_18.xyzz * normal_18.yzzx);
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBr, tmpvar_26);
  x2_21.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBg, tmpvar_26);
  x2_21.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBb, tmpvar_26);
  x2_21.z = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = ((normal_18.x * normal_18.x) - (normal_18.y * normal_18.y));
  vC_19 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (unity_SHC.xyz * vC_19);
  x3_20 = tmpvar_31;
  tmpvar_17 = ((x1_22 + x2_21) + x3_20);
  shlight_2 = tmpvar_17;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_32;
  tmpvar_32 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosX0 - tmpvar_32.x);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosY0 - tmpvar_32.y);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosZ0 - tmpvar_32.z);
  highp vec4 tmpvar_36;
  tmpvar_36 = (((tmpvar_33 * tmpvar_33) + (tmpvar_34 * tmpvar_34)) + (tmpvar_35 * tmpvar_35));
  highp vec4 tmpvar_37;
  tmpvar_37 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_33 * tmpvar_11.x) + (tmpvar_34 * tmpvar_11.y)) + (tmpvar_35 * tmpvar_11.z)) * inversesqrt(tmpvar_36))) * (1.0/((1.0 + (tmpvar_36 * unity_4LightAtten0)))));
  highp vec3 tmpvar_38;
  tmpvar_38 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_37.x) + (unity_LightColor[1].xyz * tmpvar_37.y)) + (unity_LightColor[2].xyz * tmpvar_37.z)) + (unity_LightColor[3].xyz * tmpvar_37.w)));
  tmpvar_6 = tmpvar_38;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in lowp vec3 xlv_TEXCOORD5;
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
  c_32.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD4)) * 2.0));
  c_32.w = tmpvar_2;
  c_1.w = c_32.w;
  c_1.xyz = (c_32.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_33;
  highp vec2 pblend_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_36;
  tmpvar_36 = c_1.w;
  pblend_34.x = tmpvar_36;
  lowp float tmpvar_37;
  tmpvar_37 = tmpvar_35.w;
  pblend_34.y = tmpvar_37;
  highp vec4 tmpvar_38;
  tmpvar_38.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_38.w = max (pblend_34.x, pblend_34.y);
  res_33 = tmpvar_38;
  highp vec2 tmpvar_39;
  tmpvar_39 = max (((pblend_34 - res_33.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_40;
  tmpvar_40 = (tmpvar_39 / (tmpvar_39.x + tmpvar_39.y));
  pblend_34 = tmpvar_40;
  highp vec3 tmpvar_41;
  tmpvar_41 = ((c_1.xyz * tmpvar_40.x) + (tmpvar_35.xyz * tmpvar_40.y));
  res_33.xyz = tmpvar_41;
  _glesFragData[0] = res_33;
}



#endif"
}
SubProgram "opengl " {
// Stats: 83 math
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
PARAM c[36] = { { 0.5, 1, 0 },
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
MOV R4.w, c[0].y;
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
ADD R1, R2, c[0].y;
DP4 R2.z, R4, c[25];
DP4 R2.y, R4, c[24];
DP4 R2.x, R4, c[23];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MAD R1.xyz, R0.w, c[22], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[28];
DP4 R3.y, R0, c[27];
DP4 R3.x, R0, c[26];
DP4 R4.zw, vertex.position, c[4];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[29];
ADD R2.xyz, R2, R3;
ADD result.texcoord[5].xyz, R2, R1;
MOV R1, c[14];
MUL R0.xyz, -vertex.normal.zxyw, c[0].zyzw;
MAD R0.xyz, vertex.normal.yzxw, c[0].yzzw, R0;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
DP4 R3.z, R1, c[11];
DP4 R3.y, R1, c[10];
DP4 R3.x, R1, c[9];
MAD R2.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
DP3 result.texcoord[4].x, R3, R0;
DP4 R4.x, vertex.position, c[1];
DP4 R4.y, vertex.position, c[2];
DP4 R0.z, vertex.position, c[3];
MOV R1.w, R4;
MOV R1.z, R0;
MOV R1.x, R4;
MOV R1.y, R4;
DP3 result.texcoord[4].y, R3, -R2;
MUL R2.xyz, R1.xyww, c[0].x;
MOV R0.x, R2;
MUL R0.y, R2, c[13].x;
ADD result.texcoord[6].xy, R0, R2.z;
ADD R0.xy, R4.z, R4;
MOV R0.w, R4.z;
MUL R0.xy, R0, c[0].x;
DP3 result.texcoord[4].z, vertex.normal, R3;
MOV result.position, R1;
MOV result.texcoord[3], R0;
MOV result.texcoord[6].zw, R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[32].xyxy, c[32];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[34].xyxy, c[34];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[33], c[33].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[35], c[35].zwzw;
END
# 83 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 86 math
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
dcl_texcoord6 o7
def c36, 0.50000000, 1.00000000, 0.00000000, 0
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
mov r4.w, c36.y
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
add r1, r2, c36.y
dp4 r2.z, r4, c25
dp4 r2.y, r4, c24
dp4 r2.x, r4, c23
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c36.z
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
add o6.xyz, r2, r1
mov r1, c10
dp4 r4.z, c14, r1
mov r1, c9
mul r0.xyz, -v2.zxyw, c36.zyzw
mad r0.xyz, v2.yzxw, c36.yzzw, r0
mul r2.xyz, v2.zxyw, r0.yzxw
mad r3.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r4.y, c14, r1
dp4 r4.x, c14, r2
dp3 o5.y, r4, -r3
dp4 r3.zw, v0, c3
dp4 r0.w, v0, c0
dp3 o5.x, r4, r0
dp4 r3.xy, v0, c1
dp4 r0.z, v0, c2
mov r1.w, r3
mov r1.z, r0
mov r1.x, r0.w
mov r1.y, r3
mul r2.xyz, r1.xyww, c36.x
mov r0.x, r2
mul r0.y, r2, c12.x
mad o7.xy, r2.z, c13.zwzw, r0
mov r0.x, -r3
mad r0.xy, r3.z, c13.zwzw, r0.wxzw
mov r0.w, r3.z
mul r0.xy, r0, c36.x
dp3 o5.z, v2, r4
mov o0, r1
mov o4, r0
mov o7.zw, r1
mad o1.zw, v3.xyxy, c32.xyxy, c32
mad o1.xy, v3, c31, c31.zwzw
mad o2.zw, v3.xyxy, c34.xyxy, c34
mad o2.xy, v3, c33, c33.zwzw
mad o3.xy, v3, c35, c35.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 65 math
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
eefiecedjnjbmjikjgdfkkjnjghoicbnibikognaabaaaaaaeaamaaaaadaaaaaa
cmaaaaaapeaaaaaanmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
fmakaaaaeaaaabaajhacaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
hccabaaaagaaaaaagfaaaaadpccabaaaahaaaaaagiaaaaacahaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaa
dcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaa
ogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadcaaaaaldccabaaa
adaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaa
amaaaaaadcaaaaamdcaabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaa
egaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaaf
mccabaaaaeaaaaaakgaobaaaaaaaaaaadgaaaaafmccabaaaahaaaaaakgaobaaa
aaaaaaaadiaaaaakhcaabaaaabaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadp
aaaaaaaaaaaaaaaaaaaaaaaadcaaaaanhcaabaaaabaaaaaacgbjbaaaacaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaiadpaaaaaaaaegacbaiaebaaaaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaajgbebaaaacaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaa
acaaaaaadiaaaaajhcaabaaaadaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaadaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaaegacbaaaadaaaaaadcaaaaalhcaabaaaadaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaadaaaaaa
dcaaaaalhcaabaaaadaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaaegacbaaaadaaaaaabaaaaaaicccabaaaafaaaaaaegacbaiaebaaaaaa
acaaaaaaegacbaaaadaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaa
egacbaaaadaaaaaaapaaaaahbccabaaaafaaaaaacgakbaaaabaaaaaaegaabaaa
adaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaa
acaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
adaaaaaafgafbaaaacaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
acaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaacaaaaaa
egadbaaaacaaaaaabbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaa
abaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
adaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
adaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
adaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaa
diaaaaahecaabaaaaaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaak
ecaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaackaabaiaebaaaaaa
aaaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaacmaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaadaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
adaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaaadaaaaaaegiocaaa
acaaaaaaadaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaa
aeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaa
aaaaaaajpcaabaaaagaaaaaaagaabaiaebaaaaaaadaaaaaaegiocaaaacaaaaaa
acaaaaaaaaaaaaajpcaabaaaadaaaaaakgakbaiaebaaaaaaadaaaaaaegiocaaa
acaaaaaaaeaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaagaaaaaaagaabaaa
abaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaadaaaaaa
kgakbaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaa
agaaaaaaegaobaaaagaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaa
egaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaa
aeaaaaaaegaobaaaadaaaaaadcaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaa
egiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
aoaaaaakpcaabaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
egaobaaaadaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
aeaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaadaaaaaa
egaobaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaaahaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaagaaaaaa
agaabaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
aaaaaaahhccabaaaagaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
fcaabaaaaaaaaaaaagadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaahdccabaaaahaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab
"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = tmpvar_7.xyz;
  tmpvar_13 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_14;
  tmpvar_14[0].x = tmpvar_12.x;
  tmpvar_14[0].y = tmpvar_13.x;
  tmpvar_14[0].z = tmpvar_1.x;
  tmpvar_14[1].x = tmpvar_12.y;
  tmpvar_14[1].y = tmpvar_13.y;
  tmpvar_14[1].z = tmpvar_1.y;
  tmpvar_14[2].x = tmpvar_12.z;
  tmpvar_14[2].y = tmpvar_13.z;
  tmpvar_14[2].z = tmpvar_1.z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = tmpvar_11;
  mediump vec3 tmpvar_17;
  mediump vec4 normal_18;
  normal_18 = tmpvar_16;
  highp float vC_19;
  mediump vec3 x3_20;
  mediump vec3 x2_21;
  mediump vec3 x1_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAr, normal_18);
  x1_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAg, normal_18);
  x1_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAb, normal_18);
  x1_22.z = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal_18.xyzz * normal_18.yzzx);
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBr, tmpvar_26);
  x2_21.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBg, tmpvar_26);
  x2_21.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBb, tmpvar_26);
  x2_21.z = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = ((normal_18.x * normal_18.x) - (normal_18.y * normal_18.y));
  vC_19 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (unity_SHC.xyz * vC_19);
  x3_20 = tmpvar_31;
  tmpvar_17 = ((x1_22 + x2_21) + x3_20);
  shlight_2 = tmpvar_17;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_32;
  tmpvar_32 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosX0 - tmpvar_32.x);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosY0 - tmpvar_32.y);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosZ0 - tmpvar_32.z);
  highp vec4 tmpvar_36;
  tmpvar_36 = (((tmpvar_33 * tmpvar_33) + (tmpvar_34 * tmpvar_34)) + (tmpvar_35 * tmpvar_35));
  highp vec4 tmpvar_37;
  tmpvar_37 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_33 * tmpvar_11.x) + (tmpvar_34 * tmpvar_11.y)) + (tmpvar_35 * tmpvar_11.z)) * inversesqrt(tmpvar_36))) * (1.0/((1.0 + (tmpvar_36 * unity_4LightAtten0)))));
  highp vec3 tmpvar_38;
  tmpvar_38 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_37.x) + (unity_LightColor[1].xyz * tmpvar_37.y)) + (unity_LightColor[2].xyz * tmpvar_37.z)) + (unity_LightColor[3].xyz * tmpvar_37.w)));
  tmpvar_6 = tmpvar_38;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
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
  tmpvar_35 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  dist_34 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = _LightShadowData.x;
  lightShadowDataX_33 = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = max (float((dist_34 > (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))), lightShadowDataX_33);
  tmpvar_32 = tmpvar_37;
  lowp vec4 c_38;
  c_38.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD4)) * tmpvar_32) * 2.0));
  c_38.w = tmpvar_2;
  c_1.w = c_38.w;
  c_1.xyz = (c_38.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_39;
  highp vec2 pblend_40;
  lowp vec4 tmpvar_41;
  tmpvar_41 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_42;
  tmpvar_42 = c_1.w;
  pblend_40.x = tmpvar_42;
  lowp float tmpvar_43;
  tmpvar_43 = tmpvar_41.w;
  pblend_40.y = tmpvar_43;
  highp vec4 tmpvar_44;
  tmpvar_44.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_44.w = max (pblend_40.x, pblend_40.y);
  res_39 = tmpvar_44;
  highp vec2 tmpvar_45;
  tmpvar_45 = max (((pblend_40 - res_39.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_46;
  tmpvar_46 = (tmpvar_45 / (tmpvar_45.x + tmpvar_45.y));
  pblend_40 = tmpvar_46;
  highp vec3 tmpvar_47;
  tmpvar_47 = ((c_1.xyz * tmpvar_46.x) + (tmpvar_41.xyz * tmpvar_46.y));
  res_39.xyz = tmpvar_47;
  gl_FragData[0] = res_39;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  highp vec4 tmpvar_10;
  tmpvar_10 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_11;
  tmpvar_11[0] = _Object2World[0].xyz;
  tmpvar_11[1] = _Object2World[1].xyz;
  tmpvar_11[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_13 = tmpvar_7.xyz;
  tmpvar_14 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_15;
  tmpvar_15[0].x = tmpvar_13.x;
  tmpvar_15[0].y = tmpvar_14.x;
  tmpvar_15[0].z = tmpvar_1.x;
  tmpvar_15[1].x = tmpvar_13.y;
  tmpvar_15[1].y = tmpvar_14.y;
  tmpvar_15[1].z = tmpvar_1.y;
  tmpvar_15[2].x = tmpvar_13.z;
  tmpvar_15[2].y = tmpvar_14.z;
  tmpvar_15[2].z = tmpvar_1.z;
  highp vec3 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_16;
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = tmpvar_12;
  mediump vec3 tmpvar_18;
  mediump vec4 normal_19;
  normal_19 = tmpvar_17;
  highp float vC_20;
  mediump vec3 x3_21;
  mediump vec3 x2_22;
  mediump vec3 x1_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAr, normal_19);
  x1_23.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAg, normal_19);
  x1_23.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAb, normal_19);
  x1_23.z = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = (normal_19.xyzz * normal_19.yzzx);
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBr, tmpvar_27);
  x2_22.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBg, tmpvar_27);
  x2_22.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBb, tmpvar_27);
  x2_22.z = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = ((normal_19.x * normal_19.x) - (normal_19.y * normal_19.y));
  vC_20 = tmpvar_31;
  highp vec3 tmpvar_32;
  tmpvar_32 = (unity_SHC.xyz * vC_20);
  x3_21 = tmpvar_32;
  tmpvar_18 = ((x1_23 + x2_22) + x3_21);
  shlight_2 = tmpvar_18;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_33;
  tmpvar_33 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosX0 - tmpvar_33.x);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosY0 - tmpvar_33.y);
  highp vec4 tmpvar_36;
  tmpvar_36 = (unity_4LightPosZ0 - tmpvar_33.z);
  highp vec4 tmpvar_37;
  tmpvar_37 = (((tmpvar_34 * tmpvar_34) + (tmpvar_35 * tmpvar_35)) + (tmpvar_36 * tmpvar_36));
  highp vec4 tmpvar_38;
  tmpvar_38 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_34 * tmpvar_12.x) + (tmpvar_35 * tmpvar_12.y)) + (tmpvar_36 * tmpvar_12.z)) * inversesqrt(tmpvar_37))) * (1.0/((1.0 + (tmpvar_37 * unity_4LightAtten0)))));
  highp vec3 tmpvar_39;
  tmpvar_39 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_38.x) + (unity_LightColor[1].xyz * tmpvar_38.y)) + (unity_LightColor[2].xyz * tmpvar_38.z)) + (unity_LightColor[3].xyz * tmpvar_38.w)));
  tmpvar_6 = tmpvar_39;
  highp vec4 o_40;
  highp vec4 tmpvar_41;
  tmpvar_41 = (tmpvar_10 * 0.5);
  highp vec2 tmpvar_42;
  tmpvar_42.x = tmpvar_41.x;
  tmpvar_42.y = (tmpvar_41.y * _ProjectionParams.x);
  o_40.xy = (tmpvar_42 + tmpvar_41.w);
  o_40.zw = tmpvar_10.zw;
  gl_Position = tmpvar_10;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = o_40;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
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
  c_33.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (normal_32, xlv_TEXCOORD4)) * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x) * 2.0));
  c_33.w = tmpvar_2;
  c_1.w = c_33.w;
  c_1.xyz = (c_33.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_37;
  tmpvar_37 = c_1.w;
  pblend_35.x = tmpvar_37;
  lowp float tmpvar_38;
  tmpvar_38 = tmpvar_36.w;
  pblend_35.y = tmpvar_38;
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_39.w = max (pblend_35.x, pblend_35.y);
  res_34 = tmpvar_39;
  highp vec2 tmpvar_40;
  tmpvar_40 = max (((pblend_35 - res_34.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_41;
  tmpvar_41 = (tmpvar_40 / (tmpvar_40.x + tmpvar_40.y));
  pblend_35 = tmpvar_41;
  highp vec3 tmpvar_42;
  tmpvar_42 = ((c_1.xyz * tmpvar_41.x) + (tmpvar_36.xyz * tmpvar_41.y));
  res_34.xyz = tmpvar_42;
  gl_FragData[0] = res_34;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out lowp vec3 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = tmpvar_7.xyz;
  tmpvar_13 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_14;
  tmpvar_14[0].x = tmpvar_12.x;
  tmpvar_14[0].y = tmpvar_13.x;
  tmpvar_14[0].z = tmpvar_1.x;
  tmpvar_14[1].x = tmpvar_12.y;
  tmpvar_14[1].y = tmpvar_13.y;
  tmpvar_14[1].z = tmpvar_1.y;
  tmpvar_14[2].x = tmpvar_12.z;
  tmpvar_14[2].y = tmpvar_13.z;
  tmpvar_14[2].z = tmpvar_1.z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = tmpvar_11;
  mediump vec3 tmpvar_17;
  mediump vec4 normal_18;
  normal_18 = tmpvar_16;
  highp float vC_19;
  mediump vec3 x3_20;
  mediump vec3 x2_21;
  mediump vec3 x1_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAr, normal_18);
  x1_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAg, normal_18);
  x1_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAb, normal_18);
  x1_22.z = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal_18.xyzz * normal_18.yzzx);
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBr, tmpvar_26);
  x2_21.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBg, tmpvar_26);
  x2_21.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBb, tmpvar_26);
  x2_21.z = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = ((normal_18.x * normal_18.x) - (normal_18.y * normal_18.y));
  vC_19 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (unity_SHC.xyz * vC_19);
  x3_20 = tmpvar_31;
  tmpvar_17 = ((x1_22 + x2_21) + x3_20);
  shlight_2 = tmpvar_17;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_32;
  tmpvar_32 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosX0 - tmpvar_32.x);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosY0 - tmpvar_32.y);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosZ0 - tmpvar_32.z);
  highp vec4 tmpvar_36;
  tmpvar_36 = (((tmpvar_33 * tmpvar_33) + (tmpvar_34 * tmpvar_34)) + (tmpvar_35 * tmpvar_35));
  highp vec4 tmpvar_37;
  tmpvar_37 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_33 * tmpvar_11.x) + (tmpvar_34 * tmpvar_11.y)) + (tmpvar_35 * tmpvar_11.z)) * inversesqrt(tmpvar_36))) * (1.0/((1.0 + (tmpvar_36 * unity_4LightAtten0)))));
  highp vec3 tmpvar_38;
  tmpvar_38 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_37.x) + (unity_LightColor[1].xyz * tmpvar_37.y)) + (unity_LightColor[2].xyz * tmpvar_37.z)) + (unity_LightColor[3].xyz * tmpvar_37.w)));
  tmpvar_6 = tmpvar_38;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in lowp vec3 xlv_TEXCOORD5;
in highp vec4 xlv_TEXCOORD6;
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
  tmpvar_35 = textureProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  dist_34 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = _LightShadowData.x;
  lightShadowDataX_33 = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = max (float((dist_34 > (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))), lightShadowDataX_33);
  tmpvar_32 = tmpvar_37;
  lowp vec4 c_38;
  c_38.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD4)) * tmpvar_32) * 2.0));
  c_38.w = tmpvar_2;
  c_1.w = c_38.w;
  c_1.xyz = (c_38.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_39;
  highp vec2 pblend_40;
  lowp vec4 tmpvar_41;
  tmpvar_41 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_42;
  tmpvar_42 = c_1.w;
  pblend_40.x = tmpvar_42;
  lowp float tmpvar_43;
  tmpvar_43 = tmpvar_41.w;
  pblend_40.y = tmpvar_43;
  highp vec4 tmpvar_44;
  tmpvar_44.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_44.w = max (pblend_40.x, pblend_40.y);
  res_39 = tmpvar_44;
  highp vec2 tmpvar_45;
  tmpvar_45 = max (((pblend_40 - res_39.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_46;
  tmpvar_46 = (tmpvar_45 / (tmpvar_45.x + tmpvar_45.y));
  pblend_40 = tmpvar_46;
  highp vec3 tmpvar_47;
  tmpvar_47 = ((c_1.xyz * tmpvar_46.x) + (tmpvar_41.xyz * tmpvar_46.y));
  res_39.xyz = tmpvar_47;
  _glesFragData[0] = res_39;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
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
  tmpvar_15.xyz = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
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
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
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
  tmpvar_33 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD6.xyz);
  highp float tmpvar_34;
  tmpvar_34 = (_LightShadowData.x + (tmpvar_33 * (1.0 - _LightShadowData.x)));
  shadow_32 = tmpvar_34;
  lowp vec4 c_35;
  c_35.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD4)) * shadow_32) * 2.0));
  c_35.w = tmpvar_2;
  c_1.w = c_35.w;
  c_1.xyz = (c_35.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_36;
  highp vec2 pblend_37;
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_39;
  tmpvar_39 = c_1.w;
  pblend_37.x = tmpvar_39;
  lowp float tmpvar_40;
  tmpvar_40 = tmpvar_38.w;
  pblend_37.y = tmpvar_40;
  highp vec4 tmpvar_41;
  tmpvar_41.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_41.w = max (pblend_37.x, pblend_37.y);
  res_36 = tmpvar_41;
  highp vec2 tmpvar_42;
  tmpvar_42 = max (((pblend_37 - res_36.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_43;
  tmpvar_43 = (tmpvar_42 / (tmpvar_42.x + tmpvar_42.y));
  pblend_37 = tmpvar_43;
  highp vec3 tmpvar_44;
  tmpvar_44 = ((c_1.xyz * tmpvar_43.x) + (tmpvar_38.xyz * tmpvar_43.y));
  res_36.xyz = tmpvar_44;
  gl_FragData[0] = res_36;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out lowp vec3 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
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
  tmpvar_15.xyz = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
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
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in lowp vec3 xlv_TEXCOORD5;
in highp vec4 xlv_TEXCOORD6;
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
  tmpvar_33 = texture (_ShadowMapTexture, xlv_TEXCOORD6.xyz);
  shadow_32 = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (_LightShadowData.x + (shadow_32 * (1.0 - _LightShadowData.x)));
  shadow_32 = tmpvar_34;
  lowp vec4 c_35;
  c_35.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD4)) * shadow_32) * 2.0));
  c_35.w = tmpvar_2;
  c_1.w = c_35.w;
  c_1.xyz = (c_35.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_36;
  highp vec2 pblend_37;
  lowp vec4 tmpvar_38;
  tmpvar_38 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_39;
  tmpvar_39 = c_1.w;
  pblend_37.x = tmpvar_39;
  lowp float tmpvar_40;
  tmpvar_40 = tmpvar_38.w;
  pblend_37.y = tmpvar_40;
  highp vec4 tmpvar_41;
  tmpvar_41.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_41.w = max (pblend_37.x, pblend_37.y);
  res_36 = tmpvar_41;
  highp vec2 tmpvar_42;
  tmpvar_42 = max (((pblend_37 - res_36.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_43;
  tmpvar_43 = (tmpvar_42 / (tmpvar_42.x + tmpvar_42.y));
  pblend_37 = tmpvar_43;
  highp vec3 tmpvar_44;
  tmpvar_44 = ((c_1.xyz * tmpvar_43.x) + (tmpvar_38.xyz * tmpvar_43.y));
  res_36.xyz = tmpvar_44;
  _glesFragData[0] = res_36;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
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
  nrm_3 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_30;
  tmpvar_30 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_30;
  lowp float shadow_31;
  lowp float tmpvar_32;
  tmpvar_32 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_33;
  tmpvar_33 = (_LightShadowData.x + (tmpvar_32 * (1.0 - _LightShadowData.x)));
  shadow_31 = tmpvar_33;
  c_1.xyz = (col_4 * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz), vec3((shadow_31 * 2.0))));
  c_1.w = tmpvar_2;
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_37;
  tmpvar_37 = c_1.w;
  pblend_35.x = tmpvar_37;
  lowp float tmpvar_38;
  tmpvar_38 = tmpvar_36.w;
  pblend_35.y = tmpvar_38;
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_39.w = max (pblend_35.x, pblend_35.y);
  res_34 = tmpvar_39;
  highp vec2 tmpvar_40;
  tmpvar_40 = max (((pblend_35 - res_34.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_41;
  tmpvar_41 = (tmpvar_40 / (tmpvar_40.x + tmpvar_40.y));
  pblend_35 = tmpvar_41;
  highp vec3 tmpvar_42;
  tmpvar_42 = ((c_1.xyz * tmpvar_41.x) + (tmpvar_36.xyz * tmpvar_41.y));
  res_34.xyz = tmpvar_42;
  gl_FragData[0] = res_34;
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
out highp vec4 xlv_TEXCOORD3;
out highp vec2 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in highp vec2 xlv_TEXCOORD4;
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
  nrm_3 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_3, vec4(dot (tmpvar_6, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_30;
  tmpvar_30 = (tmpvar_15 * 0.5);
  tmpvar_2 = tmpvar_30;
  lowp float shadow_31;
  mediump float tmpvar_32;
  tmpvar_32 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_31 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (_LightShadowData.x + (shadow_31 * (1.0 - _LightShadowData.x)));
  shadow_31 = tmpvar_33;
  c_1.xyz = (col_4 * min ((2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz), vec3((shadow_31 * 2.0))));
  c_1.w = tmpvar_2;
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_37;
  tmpvar_37 = c_1.w;
  pblend_35.x = tmpvar_37;
  lowp float tmpvar_38;
  tmpvar_38 = tmpvar_36.w;
  pblend_35.y = tmpvar_38;
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_39.w = max (pblend_35.x, pblend_35.y);
  res_34 = tmpvar_39;
  highp vec2 tmpvar_40;
  tmpvar_40 = max (((pblend_35 - res_34.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_41;
  tmpvar_41 = (tmpvar_40 / (tmpvar_40.x + tmpvar_40.y));
  pblend_35 = tmpvar_41;
  highp vec3 tmpvar_42;
  tmpvar_42 = ((c_1.xyz * tmpvar_41.x) + (tmpvar_36.xyz * tmpvar_41.y));
  res_34.xyz = tmpvar_42;
  _glesFragData[0] = res_34;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD4;
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
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((tmpvar_30.xyz * 2.0) - 1.0);
  lowp float shadow_33;
  lowp float tmpvar_34;
  tmpvar_34 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
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
  tmpvar_40 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_39 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  scalePerBasisVector_38 = tmpvar_41;
  lm_39 = (lm_39 * dot (clamp ((tmpvar_36 * normal_37), 0.0, 1.0), scalePerBasisVector_38));
  lowp vec3 tmpvar_42;
  tmpvar_42 = vec3((shadow_33 * 2.0));
  mediump vec3 tmpvar_43;
  tmpvar_43 = (col_4 * min (lm_39, tmpvar_42));
  c_1.xyz = tmpvar_43;
  c_1.w = tmpvar_2;
  lowp vec4 res_44;
  highp vec2 pblend_45;
  lowp vec4 tmpvar_46;
  tmpvar_46 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_47;
  tmpvar_47 = c_1.w;
  pblend_45.x = tmpvar_47;
  lowp float tmpvar_48;
  tmpvar_48 = tmpvar_46.w;
  pblend_45.y = tmpvar_48;
  highp vec4 tmpvar_49;
  tmpvar_49.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_49.w = max (pblend_45.x, pblend_45.y);
  res_44 = tmpvar_49;
  highp vec2 tmpvar_50;
  tmpvar_50 = max (((pblend_45 - res_44.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_51;
  tmpvar_51 = (tmpvar_50 / (tmpvar_50.x + tmpvar_50.y));
  pblend_45 = tmpvar_51;
  highp vec3 tmpvar_52;
  tmpvar_52 = ((c_1.xyz * tmpvar_51.x) + (tmpvar_46.xyz * tmpvar_51.y));
  res_44.xyz = tmpvar_52;
  gl_FragData[0] = res_44;
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
out highp vec4 xlv_TEXCOORD3;
out highp vec2 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in highp vec2 xlv_TEXCOORD4;
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
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((tmpvar_30.xyz * 2.0) - 1.0);
  lowp float shadow_33;
  mediump float tmpvar_34;
  tmpvar_34 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
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
  tmpvar_40 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_39 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD4).xyz);
  scalePerBasisVector_38 = tmpvar_41;
  lm_39 = (lm_39 * dot (clamp ((tmpvar_36 * normal_37), 0.0, 1.0), scalePerBasisVector_38));
  lowp vec3 tmpvar_42;
  tmpvar_42 = vec3((shadow_33 * 2.0));
  mediump vec3 tmpvar_43;
  tmpvar_43 = (col_4 * min (lm_39, tmpvar_42));
  c_1.xyz = tmpvar_43;
  c_1.w = tmpvar_2;
  lowp vec4 res_44;
  highp vec2 pblend_45;
  lowp vec4 tmpvar_46;
  tmpvar_46 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_47;
  tmpvar_47 = c_1.w;
  pblend_45.x = tmpvar_47;
  lowp float tmpvar_48;
  tmpvar_48 = tmpvar_46.w;
  pblend_45.y = tmpvar_48;
  highp vec4 tmpvar_49;
  tmpvar_49.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_49.w = max (pblend_45.x, pblend_45.y);
  res_44 = tmpvar_49;
  highp vec2 tmpvar_50;
  tmpvar_50 = max (((pblend_45 - res_44.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_51;
  tmpvar_51 = (tmpvar_50 / (tmpvar_50.x + tmpvar_50.y));
  pblend_45 = tmpvar_51;
  highp vec3 tmpvar_52;
  tmpvar_52 = ((c_1.xyz * tmpvar_51.x) + (tmpvar_46.xyz * tmpvar_51.y));
  res_44.xyz = tmpvar_52;
  _glesFragData[0] = res_44;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = tmpvar_7.xyz;
  tmpvar_13 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_14;
  tmpvar_14[0].x = tmpvar_12.x;
  tmpvar_14[0].y = tmpvar_13.x;
  tmpvar_14[0].z = tmpvar_1.x;
  tmpvar_14[1].x = tmpvar_12.y;
  tmpvar_14[1].y = tmpvar_13.y;
  tmpvar_14[1].z = tmpvar_1.y;
  tmpvar_14[2].x = tmpvar_12.z;
  tmpvar_14[2].y = tmpvar_13.z;
  tmpvar_14[2].z = tmpvar_1.z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = tmpvar_11;
  mediump vec3 tmpvar_17;
  mediump vec4 normal_18;
  normal_18 = tmpvar_16;
  highp float vC_19;
  mediump vec3 x3_20;
  mediump vec3 x2_21;
  mediump vec3 x1_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAr, normal_18);
  x1_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAg, normal_18);
  x1_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAb, normal_18);
  x1_22.z = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal_18.xyzz * normal_18.yzzx);
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBr, tmpvar_26);
  x2_21.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBg, tmpvar_26);
  x2_21.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBb, tmpvar_26);
  x2_21.z = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = ((normal_18.x * normal_18.x) - (normal_18.y * normal_18.y));
  vC_19 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (unity_SHC.xyz * vC_19);
  x3_20 = tmpvar_31;
  tmpvar_17 = ((x1_22 + x2_21) + x3_20);
  shlight_2 = tmpvar_17;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_32;
  tmpvar_32 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosX0 - tmpvar_32.x);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosY0 - tmpvar_32.y);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosZ0 - tmpvar_32.z);
  highp vec4 tmpvar_36;
  tmpvar_36 = (((tmpvar_33 * tmpvar_33) + (tmpvar_34 * tmpvar_34)) + (tmpvar_35 * tmpvar_35));
  highp vec4 tmpvar_37;
  tmpvar_37 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_33 * tmpvar_11.x) + (tmpvar_34 * tmpvar_11.y)) + (tmpvar_35 * tmpvar_11.z)) * inversesqrt(tmpvar_36))) * (1.0/((1.0 + (tmpvar_36 * unity_4LightAtten0)))));
  highp vec3 tmpvar_38;
  tmpvar_38 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_37.x) + (unity_LightColor[1].xyz * tmpvar_37.y)) + (unity_LightColor[2].xyz * tmpvar_37.z)) + (unity_LightColor[3].xyz * tmpvar_37.w)));
  tmpvar_6 = tmpvar_38;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
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
  tmpvar_33 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD6.xyz);
  highp float tmpvar_34;
  tmpvar_34 = (_LightShadowData.x + (tmpvar_33 * (1.0 - _LightShadowData.x)));
  shadow_32 = tmpvar_34;
  lowp vec4 c_35;
  c_35.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD4)) * shadow_32) * 2.0));
  c_35.w = tmpvar_2;
  c_1.w = c_35.w;
  c_1.xyz = (c_35.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_36;
  highp vec2 pblend_37;
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_39;
  tmpvar_39 = c_1.w;
  pblend_37.x = tmpvar_39;
  lowp float tmpvar_40;
  tmpvar_40 = tmpvar_38.w;
  pblend_37.y = tmpvar_40;
  highp vec4 tmpvar_41;
  tmpvar_41.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_41.w = max (pblend_37.x, pblend_37.y);
  res_36 = tmpvar_41;
  highp vec2 tmpvar_42;
  tmpvar_42 = max (((pblend_37 - res_36.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_43;
  tmpvar_43 = (tmpvar_42 / (tmpvar_42.x + tmpvar_42.y));
  pblend_37 = tmpvar_43;
  highp vec3 tmpvar_44;
  tmpvar_44 = ((c_1.xyz * tmpvar_43.x) + (tmpvar_38.xyz * tmpvar_43.y));
  res_36.xyz = tmpvar_44;
  gl_FragData[0] = res_36;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out lowp vec3 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
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
  highp vec4 pos_8;
  pos_8 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_9;
  tmpvar_9.xy = ((pos_8.xy + pos_8.w) * 0.5);
  tmpvar_9.zw = pos_8.zw;
  tmpvar_7.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_7.w = -1.0;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (tmpvar_1 * unity_Scale.w));
  highp vec3 tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = tmpvar_7.xyz;
  tmpvar_13 = (((tmpvar_1.yzx * tmpvar_7.zxy) - (tmpvar_1.zxy * tmpvar_7.yzx)) * -1.0);
  highp mat3 tmpvar_14;
  tmpvar_14[0].x = tmpvar_12.x;
  tmpvar_14[0].y = tmpvar_13.x;
  tmpvar_14[0].z = tmpvar_1.x;
  tmpvar_14[1].x = tmpvar_12.y;
  tmpvar_14[1].y = tmpvar_13.y;
  tmpvar_14[1].z = tmpvar_1.y;
  tmpvar_14[2].x = tmpvar_12.z;
  tmpvar_14[2].y = tmpvar_13.z;
  tmpvar_14[2].z = tmpvar_1.z;
  highp vec3 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_15;
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = tmpvar_11;
  mediump vec3 tmpvar_17;
  mediump vec4 normal_18;
  normal_18 = tmpvar_16;
  highp float vC_19;
  mediump vec3 x3_20;
  mediump vec3 x2_21;
  mediump vec3 x1_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAr, normal_18);
  x1_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAg, normal_18);
  x1_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAb, normal_18);
  x1_22.z = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal_18.xyzz * normal_18.yzzx);
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBr, tmpvar_26);
  x2_21.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBg, tmpvar_26);
  x2_21.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBb, tmpvar_26);
  x2_21.z = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = ((normal_18.x * normal_18.x) - (normal_18.y * normal_18.y));
  vC_19 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (unity_SHC.xyz * vC_19);
  x3_20 = tmpvar_31;
  tmpvar_17 = ((x1_22 + x2_21) + x3_20);
  shlight_2 = tmpvar_17;
  tmpvar_6 = shlight_2;
  highp vec3 tmpvar_32;
  tmpvar_32 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosX0 - tmpvar_32.x);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosY0 - tmpvar_32.y);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosZ0 - tmpvar_32.z);
  highp vec4 tmpvar_36;
  tmpvar_36 = (((tmpvar_33 * tmpvar_33) + (tmpvar_34 * tmpvar_34)) + (tmpvar_35 * tmpvar_35));
  highp vec4 tmpvar_37;
  tmpvar_37 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_33 * tmpvar_11.x) + (tmpvar_34 * tmpvar_11.y)) + (tmpvar_35 * tmpvar_11.z)) * inversesqrt(tmpvar_36))) * (1.0/((1.0 + (tmpvar_36 * unity_4LightAtten0)))));
  highp vec3 tmpvar_38;
  tmpvar_38 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_37.x) + (unity_LightColor[1].xyz * tmpvar_37.y)) + (unity_LightColor[2].xyz * tmpvar_37.z)) + (unity_LightColor[3].xyz * tmpvar_37.w)));
  tmpvar_6 = tmpvar_38;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_9;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in lowp vec3 xlv_TEXCOORD5;
in highp vec4 xlv_TEXCOORD6;
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
  tmpvar_33 = texture (_ShadowMapTexture, xlv_TEXCOORD6.xyz);
  shadow_32 = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (_LightShadowData.x + (shadow_32 * (1.0 - _LightShadowData.x)));
  shadow_32 = tmpvar_34;
  lowp vec4 c_35;
  c_35.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), xlv_TEXCOORD4)) * shadow_32) * 2.0));
  c_35.w = tmpvar_2;
  c_1.w = c_35.w;
  c_1.xyz = (c_35.xyz + (col_4 * xlv_TEXCOORD5));
  lowp vec4 res_36;
  highp vec2 pblend_37;
  lowp vec4 tmpvar_38;
  tmpvar_38 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_39;
  tmpvar_39 = c_1.w;
  pblend_37.x = tmpvar_39;
  lowp float tmpvar_40;
  tmpvar_40 = tmpvar_38.w;
  pblend_37.y = tmpvar_40;
  highp vec4 tmpvar_41;
  tmpvar_41.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_41.w = max (pblend_37.x, pblend_37.y);
  res_36 = tmpvar_41;
  highp vec2 tmpvar_42;
  tmpvar_42 = max (((pblend_37 - res_36.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_43;
  tmpvar_43 = (tmpvar_42 / (tmpvar_42.x + tmpvar_42.y));
  pblend_37 = tmpvar_43;
  highp vec3 tmpvar_44;
  tmpvar_44 = ((c_1.xyz * tmpvar_43.x) + (tmpvar_38.xyz * tmpvar_43.y));
  res_36.xyz = tmpvar_44;
  _glesFragData[0] = res_36;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 70 math, 10 textures
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
SetTexture 9 [_GrabTexture] 2D 9
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
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R0.z, R2;
TEX R1, fragment.texcoord[2], texture[4], 2D;
ADD R5.y, R0.w, R1.w;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R0, R4.w;
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
DP4 R0.x, R0, c[2].x;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6.xzzw, R6.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[2].z;
MAD R0.xy, R0.x, R6, c[2].z;
MAD R0.xy, R0.yxzw, c[2].w, -c[2].x;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[2].x;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R0.x, R0, fragment.texcoord[4];
MAX R0.w, R0.x, c[2].y;
MUL R0.xyz, R5.z, R2;
MUL R2.xyz, R5.y, R3;
MUL R3.xyz, R5.x, R4;
ADD R2.xyz, R3, R2;
ADD R0.xyz, R2, R0;
TXP R2, fragment.texcoord[3], texture[9], 2D;
MUL R3.x, R1.w, c[2].z;
MAX R1.w, R2, R3.x;
MOV R3.y, R2.w;
MUL R1.xyz, R5.w, R1;
ADD R1.xyz, R0, R1;
MUL R0.xyz, R1, c[0];
MOV R2.w, c[2].z;
ADD R3.xy, R3, -R1.w;
MAD R3.xy, R2.w, c[1].x, R3;
MAX R3.xy, R3, c[2].y;
ADD R2.w, R3.x, R3.y;
RCP R2.w, R2.w;
MUL R3.xy, R3, R2.w;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, R1, fragment.texcoord[5];
MUL R2.xyz, R3.y, R2;
MAD R0.xyz, R0, c[2].w, R1;
MAD result.color.xyz, R0, R3.x, R2;
MOV result.color.w, R1;
END
# 70 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 60 math, 10 textures
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
SetTexture 9 [_GrabTexture] 2D 9
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
def c2, 1.00000000, 0.00000000, -0.50000000, 2.00000000
def c3, 2.00000000, -1.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
texld r0, v0, s0
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r1, v2, s4
add_pp r5.y, r0.w, r1.w
texld r3, v1, s2
texld r4, v0.zwzw, s1
add_pp r5.x, r0, r4.w
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
dp4_pp r0.x, r0, c2.x
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6.xzzw, r6.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c2.z
mad_pp r0.xy, r0.x, r6, c3.z
mad_pp r0.xy, r0.yxzw, c3.x, c3.y
mul_pp r0.zw, r0.xyxy, r0.xyxy
add_pp_sat r0.z, r0, r0.w
add_pp r0.z, -r0, c2.x
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.x, r0, v4
max_pp r0.w, r0.x, c2.y
mul r0.xyz, r5.z, r2
mul r2.xyz, r5.y, r3
mul r3.xyz, r5.x, r4
add_pp r2.xyz, r3, r2
add_pp r0.xyz, r2, r0
texldp r2, v3, s9
mul r3.x, r1.w, c3.z
max r1.w, r2, r3.x
mov r3.y, r2.w
mul r1.xyz, r5.w, r1
add_pp r1.xyz, r0, r1
mul_pp r0.xyz, r1, c0
mov r2.w, c1.x
add r3.xy, r3, -r1.w
mad r3.xy, c3.z, r2.w, r3
max r3.xy, r3, c2.y
add r2.w, r3.x, r3.y
rcp r2.w, r2.w
mul r3.xy, r3, r2.w
mul_pp r0.xyz, r0.w, r0
mul_pp r1.xyz, r1, v5
mul r2.xyz, r3.y, r2
mad_pp r0.xyz, r0, c2.w, r1
mad oC0.xyz, r0, r3.x, r2
mov_pp oC0.w, r1
"
}
SubProgram "d3d11 " {
// Stats: 46 math, 10 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_Normal0] 2D 6
SetTexture 6 [_Normal1] 2D 7
SetTexture 7 [_Normal2] 2D 8
SetTexture 8 [_Normal3] 2D 9
SetTexture 9 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedbholejhlhfbjdcapofonknbnndclalcmabaaaaaaciakaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpaaiaaaaeaaaaaaadmacaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafkaaaaad
aagabaaaajaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaa
ahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaaeaahabaaa
ajaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
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
ebaaaaaaaaaaaaaaegaobaaaafaaaaaadiaaaaahbcaabaaaafaaaaaaakaabaaa
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
aaaaaaaaegbcbaaaafaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaahaaaaaafgafbaaaaeaaaaaa
dcaaaaajocaabaaaaaaaaaaaagaabaaaaeaaaaaaagajbaaaaiaaaaaafgaobaaa
aaaaaaaadcaaaaajocaabaaaaaaaaaaakgakbaaaaeaaaaaaagajbaaaadaaaaaa
fgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaaaeaaaaaaagajbaaa
agaaaaaafgaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaajgahbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agbjbaaaagaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaa
pgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaa
ajaaaaaaaagabaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaa
akaabaaaafaaaaaadgaaaaafccaabaaaafaaaaaadkaabaaaabaaaaaaaaaaaaai
dcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegaabaaaafaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaandcaabaaaacaaaaaaagiacaaa
aaaaaaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaegaabaaa
acaaaaaadeaaaaakdcaabaaaacaaaaaaegaabaaaacaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaa
akaabaaaacaaaaaaaoaaaaahdcaabaaaacaaaaaaegaabaaaacaaaaaapgapbaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaafgafbaaaacaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaagaabaaaacaaaaaaegacbaaa
abaaaaaadoaaaaab"
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
// Stats: 47 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 9 [unity_Lightmap] 2D 9
SetTexture 10 [_GrabTexture] 2D 10
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 8, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R1.w, R4.z, R1;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R4.w, R0, R4;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
MAX R0.w, R4, R1;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
MAX R0.w, R2, R0;
ADD R4.x, R4, R3.w;
MAX R0.w, R4.x, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R0.w;
ADD R4, R4, c[0].x;
MAX R4, R4, c[1].x;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R3.xyz, R4.x, R3;
MUL R4.x, R0.w, c[1].z;
MUL R2.xyz, R4.y, R2;
ADD R2.xyz, R3, R2;
MUL R3.xyz, R4.z, R1;
TXP R1, fragment.texcoord[3], texture[10], 2D;
MAX R2.w, R1, R4.x;
MOV R4.y, R1.w;
ADD R2.xyz, R2, R3;
MUL R0.xyz, R4.w, R0;
MOV R0.w, c[1].z;
ADD R4.xy, R4, -R2.w;
MAD R4.xy, R0.w, c[0].x, R4;
MAX R3.xy, R4, c[1].x;
ADD R0.w, R3.x, R3.y;
RCP R1.w, R0.w;
ADD R2.xyz, R2, R0;
MUL R3.xy, R3, R1.w;
TEX R0, fragment.texcoord[4], texture[9], 2D;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R2;
MUL R1.xyz, R3.y, R1;
MUL R0.xyz, R0, c[1].y;
MAD result.color.xyz, R0, R3.x, R1;
MOV result.color.w, R2;
END
# 47 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 40 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 9 [unity_Lightmap] 2D 9
SetTexture 10 [_GrabTexture] 2D 10
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s9
dcl_2d s10
def c1, 0.00000000, 8.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xy
texld r4, v0, s0
texld r0, v1.zwzw, s3
texld r2, v0.zwzw, s1
texld r1, v2, s4
add_pp r1.w, r1, r4
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r1, r4.z
add_pp r4.x, r4, r2.w
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, r4, -r0.w
add r4, r4, c0.x
max r4, r4, c1.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r2.xyz, r4.x, r2
mul r3.xyz, r4.y, r3
add_pp r2.xyz, r2, r3
mul r3.xyz, r4.z, r0
mul r4.x, r0.w, c1.z
texldp r0, v3, s10
max r2.w, r0, r4.x
mov r4.y, r0.w
add_pp r2.xyz, r2, r3
mul r1.xyz, r4.w, r1
add_pp r2.xyz, r2, r1
texld r1, v4, s9
mul_pp r1.xyz, r1.w, r1
mul_pp r1.xyz, r1, r2
mov r0.w, c0.x
add r4.xy, r4, -r2.w
mad r4.xy, c1.z, r0.w, r4
max r3.xy, r4, c1.x
add r0.w, r3.x, r3.y
rcp r0.w, r0.w
mul r3.xy, r3, r0.w
mul r0.xyz, r3.y, r0
mul_pp r1.xyz, r1, c1.y
mad oC0.xyz, r1, r3.x, r0
mov_pp oC0.w, r2
"
}
SubProgram "d3d11 " {
// Stats: 31 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [unity_Lightmap] 2D 6
SetTexture 6 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 160
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefieceddhacloebhfphikcodikemnkmncomoncjabaaaaaadeahaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbeagaaaa
eaaaaaaaifabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
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
acaaaaaadiaaaaahbcaabaaaacaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaadaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaaaoaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaa
aeaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaaaeaaaaaa
agaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaaeaaaaaadcaaaaajhcaabaaa
aaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaaj
hcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaaafaaaaaaaagabaaa
agaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaeb
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaa
abaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaagaaaaaaaagabaaaaaaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaadgaaaaafccaabaaaacaaaaaa
dkaabaaaabaaaaaaaaaaaaaidcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaa
egaabaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaan
dcaabaaaacaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaaegaabaaaacaaaaaadeaaaaakdcaabaaaacaaaaaaegaabaaa
acaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaa
aaaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaaaoaaaaahdcaabaaaacaaaaaa
egaabaaaacaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaafgafbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaa
agaabaaaacaaaaaaegacbaaaabaaaaaadoaaaaab"
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
// Stats: 76 math, 12 textures
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
SetTexture 11 [_GrabTexture] 2D 11
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0],
		{ 1, 0, 0.5, 2 },
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
TEX R1, fragment.texcoord[2], texture[4], 2D;
ADD R5.y, R0.w, R1.w;
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R0.z, R2;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R0, R4.w;
ADD R3.w, R0.y, R3;
MAX R1.w, R5.y, R2;
MAX R1.w, R3, R1;
MOV R5.w, R5.y;
MAX R1.w, R5.x, R1;
DP4 R0.x, R0, c[1].x;
MOV R5.z, R2.w;
MOV R5.y, R3.w;
ADD R5, R5, -R1.w;
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
MUL R4.xyz, R5.x, R4;
MUL R3.xyz, R5.y, R3;
MUL R5.x, R1.w, c[1].z;
ADD R4.xyz, R4, R3;
TXP R3, fragment.texcoord[3], texture[11], 2D;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
MUL R2.xyz, R5.z, R2;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[1].z;
MAD R0.xy, R0.x, R6, c[1].z;
MAD R7.xy, R0.yxzw, c[1].w, -c[1].x;
MUL R0.xy, R7, R7;
ADD_SAT R0.x, R0, R0.y;
ADD R0.x, -R0, c[1];
RSQ R0.x, R0.x;
RCP R7.z, R0.x;
TEX R0, fragment.texcoord[4], texture[10], 2D;
MUL R0.xyz, R0.w, R0;
MOV R1.w, c[1].z;
ADD R2.xyz, R4, R2;
MUL R1.xyz, R5.w, R1;
ADD R1.xyz, R2, R1;
DP3_SAT R6.z, R7, c[2];
DP3_SAT R6.y, R7, c[3];
DP3_SAT R6.x, R7, c[4];
MUL R6.xyz, R0, R6;
TEX R0, fragment.texcoord[4], texture[9], 2D;
MUL R0.xyz, R0.w, R0;
MAX R0.w, R3, R5.x;
DP3 R2.w, R6, c[2].w;
MUL R0.xyz, R0, R2.w;
MUL R0.xyz, R0, R1;
MOV R5.y, R3.w;
ADD R5.xy, R5, -R0.w;
MAD R5.xy, R1.w, c[0].x, R5;
MAX R5.xy, R5, c[1].y;
ADD R1.w, R5.x, R5.y;
RCP R1.w, R1.w;
MUL R2.xy, R5, R1.w;
MUL R1.xyz, R2.y, R3;
MUL R0.xyz, R0, c[2].w;
MAD result.color.xyz, R0, R2.x, R1;
MOV result.color.w, R0;
END
# 76 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 64 math, 12 textures
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
SetTexture 11 [_GrabTexture] 2D 11
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
def c1, 1.00000000, 0.00000000, -0.50000000, 8.00000000
def c2, 2.00000000, -1.00000000, 0.50000000, 0
def c3, -0.40824828, -0.70710677, 0.57735026, 0
def c4, -0.40824831, 0.70710677, 0.57735026, 0
def c5, 0.81649655, 0.00000000, 0.57735026, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xy
texld r0, v0, s0
texld r1, v2, s4
add_pp r5.y, r0.w, r1.w
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r3, v1, s2
texld r4, v0.zwzw, s1
add_pp r5.x, r0, r4.w
add_pp r3.w, r0.y, r3
max r1.w, r5.y, r2
max r1.w, r3, r1
mov r5.w, r5.y
max r1.w, r5.x, r1
dp4_pp r0.x, r0, c1.x
mov r5.z, r2.w
mov r5.y, r3.w
add r5, r5, -r1.w
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
mul r4.xyz, r5.x, r4
mul r3.xyz, r5.y, r3
mul r5.x, r1.w, c2.z
add_pp r4.xyz, r4, r3
texldp r3, v3, s11
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
mul r2.xyz, r5.z, r2
add_pp r6.xy, r6.xzzw, r6.ywzw
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c1.z
mad_pp r0.xy, r0.x, r6, c2.z
mad_pp r7.xy, r0.yxzw, c2.x, c2.y
mul_pp r0.xy, r7, r7
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c1
rsq_pp r0.x, r0.x
rcp_pp r7.z, r0.x
texld r0, v4, s10
mul_pp r0.xyz, r0.w, r0
mov r1.w, c0.x
add_pp r2.xyz, r4, r2
mul r1.xyz, r5.w, r1
add_pp r1.xyz, r2, r1
dp3_pp_sat r6.z, r7, c3
dp3_pp_sat r6.y, r7, c4
dp3_pp_sat r6.x, r7, c5
mul_pp r6.xyz, r0, r6
texld r0, v4, s9
mul_pp r0.xyz, r0.w, r0
max r0.w, r3, r5.x
dp3_pp r2.w, r6, c1.w
mul_pp r0.xyz, r0, r2.w
mul_pp r0.xyz, r0, r1
mov r5.y, r3.w
add r5.xy, r5, -r0.w
mad r5.xy, c2.z, r1.w, r5
max r5.xy, r5, c1.y
add r1.w, r5.x, r5.y
rcp r1.w, r1.w
mul r2.xy, r5, r1.w
mul r1.xyz, r2.y, r3
mul_pp r0.xyz, r0, c1.w
mad oC0.xyz, r0, r2.x, r1
mov_pp oC0.w, r0
"
}
SubProgram "d3d11 " {
// Stats: 50 math, 12 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_Normal0] 2D 6
SetTexture 6 [_Normal1] 2D 7
SetTexture 7 [_Normal2] 2D 8
SetTexture 8 [_Normal3] 2D 9
SetTexture 9 [unity_Lightmap] 2D 10
SetTexture 10 [unity_LightmapInd] 2D 11
SetTexture 11 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 160
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedkcekcnfdijhmafkpnlmplapefafpindmabaaaaaaamalaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcomajaaaa
eaaaaaaahlacaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
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
aaaaaaaaogbkbaaaadaaaaaaeghobaaaakaaaaaaaagabaaaalaaaaaadiaaaaah
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
diaaaaahbcaabaaaagaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaai
pcaabaaaafaaaaaaegaobaaaafaaaaaaagiacaaaaaaaaaaaadaaaaaadeaaaaak
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
ogbkbaaaadaaaaaaeghobaaaajaaaaaaaagabaaaakaaaaaadiaaaaahccaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaa
agajbaaaabaaaaaafgafbaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaaiaaaaaa
fgafbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaaagaabaaaafaaaaaaegacbaaa
ajaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaabaaaaaakgakbaaaafaaaaaa
egacbaaaaeaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaabaaaaaapgapbaaa
afaaaaaaegacbaaaahaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
aeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaalaaaaaaaagabaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
abaaaaaaakaabaaaagaaaaaadgaaaaafccaabaaaagaaaaaadkaabaaaabaaaaaa
aaaaaaaidcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegaabaaaagaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaandcaabaaaacaaaaaa
agiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
egaabaaaacaaaaaadeaaaaakdcaabaaaacaaaaaaegaabaaaacaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
acaaaaaaakaabaaaacaaaaaaaoaaaaahdcaabaaaacaaaaaaegaabaaaacaaaaaa
pgapbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaafgafbaaa
acaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaagaabaaaacaaaaaa
egacbaaaabaaaaaadoaaaaab"
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
// Stats: 72 math, 11 textures
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
SetTexture 10 [_GrabTexture] 2D 10
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
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R0.z, R2;
TEX R1, fragment.texcoord[2], texture[4], 2D;
ADD R5.y, R0.w, R1.w;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R0, R4.w;
MAX R1.w, R5.y, R2;
ADD R3.w, R0.y, R3;
MOV R5.w, R5.y;
MAX R1.w, R3, R1;
MAX R1.w, R5.x, R1;
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
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6.xzzw, R6.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[2].z;
MAD R0.xy, R0.x, R6, c[2].z;
MAD R0.xy, R0.yxzw, c[2].w, -c[2].x;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[2].x;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R0.y, R0, fragment.texcoord[4];
TXP R0.x, fragment.texcoord[6], texture[9], 2D;
MAX R0.y, R0, c[2];
MUL R0.w, R0.y, R0.x;
MUL R0.xyz, R5.z, R2;
MUL R2.xyz, R5.y, R3;
MUL R3.xyz, R5.x, R4;
ADD R2.xyz, R3, R2;
ADD R0.xyz, R2, R0;
TXP R2, fragment.texcoord[3], texture[10], 2D;
MUL R3.x, R1.w, c[2].z;
MAX R1.w, R2, R3.x;
MOV R3.y, R2.w;
MUL R1.xyz, R5.w, R1;
ADD R1.xyz, R0, R1;
MUL R0.xyz, R1, c[0];
MOV R2.w, c[2].z;
ADD R3.xy, R3, -R1.w;
MAD R3.xy, R2.w, c[1].x, R3;
MAX R3.xy, R3, c[2].y;
ADD R2.w, R3.x, R3.y;
RCP R2.w, R2.w;
MUL R3.xy, R3, R2.w;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, R1, fragment.texcoord[5];
MUL R2.xyz, R3.y, R2;
MAD R0.xyz, R0, c[2].w, R1;
MAD result.color.xyz, R0, R3.x, R2;
MOV result.color.w, R1;
END
# 72 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 61 math, 11 textures
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
SetTexture 10 [_GrabTexture] 2D 10
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
def c2, 1.00000000, 0.00000000, -0.50000000, 2.00000000
def c3, 2.00000000, -1.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6
texld r0, v0, s0
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r1, v2, s4
add_pp r5.y, r0.w, r1.w
texld r3, v1, s2
texld r4, v0.zwzw, s1
add_pp r5.x, r0, r4.w
max r1.w, r5.y, r2
add_pp r3.w, r0.y, r3
mov r5.w, r5.y
max r1.w, r3, r1
max r1.w, r5.x, r1
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
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6.xzzw, r6.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c2.z
mad_pp r0.xy, r0.x, r6, c3.z
mad_pp r0.xy, r0.yxzw, c3.x, c3.y
mul_pp r0.zw, r0.xyxy, r0.xyxy
add_pp_sat r0.z, r0, r0.w
add_pp r0.z, -r0, c2.x
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.y, r0, v4
texldp r0.x, v6, s9
max_pp r0.y, r0, c2
mul_pp r0.w, r0.y, r0.x
mul r0.xyz, r5.z, r2
mul r2.xyz, r5.y, r3
mul r3.xyz, r5.x, r4
add_pp r2.xyz, r3, r2
add_pp r0.xyz, r2, r0
texldp r2, v3, s10
mul r3.x, r1.w, c3.z
max r1.w, r2, r3.x
mov r3.y, r2.w
mul r1.xyz, r5.w, r1
add_pp r1.xyz, r0, r1
mul_pp r0.xyz, r1, c0
mov r2.w, c1.x
add r3.xy, r3, -r1.w
mad r3.xy, c3.z, r2.w, r3
max r3.xy, r3, c2.y
add r2.w, r3.x, r3.y
rcp r2.w, r2.w
mul r3.xy, r3, r2.w
mul_pp r0.xyz, r0.w, r0
mul_pp r1.xyz, r1, v5
mul r2.xyz, r3.y, r2
mad_pp r0.xyz, r0, c2.w, r1
mad oC0.xyz, r0, r3.x, r2
mov_pp oC0.w, r1
"
}
SubProgram "d3d11 " {
// Stats: 47 math, 11 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Splat0] 2D 3
SetTexture 2 [_Splat1] 2D 4
SetTexture 3 [_Splat2] 2D 5
SetTexture 4 [_Splat3] 2D 6
SetTexture 5 [_Normal0] 2D 7
SetTexture 6 [_Normal1] 2D 8
SetTexture 7 [_Normal2] 2D 9
SetTexture 8 [_Normal3] 2D 10
SetTexture 9 [_ShadowMapTexture] 2D 0
SetTexture 10 [_GrabTexture] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmdbhglpchpnicbmaifpabbjdomaiihbmabaaaaaakiakaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcfiajaaaaeaaaaaaafgacaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafkaaaaad
aagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafkaaaaadaagabaaaajaaaaaa
fkaaaaadaagabaaaakaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaae
aahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaae
aahabaaaajaaaaaaffffaaaafibiaaaeaahabaaaakaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadlcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaa
agaaaaaagcbaaaadlcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ajaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaaeghobaaaahaaaaaa
aagabaaaajaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
afaaaaaaaagabaaaahaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaa
eghobaaaagaaaaaaaagabaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaogbkbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaahecaabaaa
afaaaaaadkaabaaaadaaaaaackaabaaaaeaaaaaaefaaaaajpcaabaaaagaaaaaa
egbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaahicaabaaa
afaaaaaadkaabaaaaeaaaaaadkaabaaaagaaaaaadeaaaaahbcaabaaaaaaaaaaa
dkaabaaaafaaaaaackaabaaaafaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaahccaabaaaafaaaaaa
bkaabaaaaeaaaaaadkaabaaaahaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaaaafaaaaaaefaaaaajpcaabaaaaiaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaaaaaaaaahbcaabaaaafaaaaaaakaabaaa
aeaaaaaadkaabaaaaiaaaaaabbaaaaakecaabaaaaaaaaaaaegaobaaaaeaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaafaaaaaaaaaaaaaipcaabaaaaeaaaaaaagaabaia
ebaaaaaaaaaaaaaaegaobaaaafaaaaaadiaaaaahbcaabaaaafaaaaaaakaabaaa
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
aiaaaaaaaagabaaaakaaaaaadcaaaaajdcaabaaaaaaaaaaapgapbaaaaeaaaaaa
hgapbaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadcaaaaamdcaabaaa
aaaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadcaaaaapdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaa
ddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaafaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaaoaaaaahgcaabaaaaaaaaaaaagbbbaaaahaaaaaapgbpbaaa
ahaaaaaaefaaaaajpcaabaaaabaaaaaajgafbaaaaaaaaaaaeghobaaaajaaaaaa
aagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaaagaabaaa
abaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaahaaaaaafgafbaaaaeaaaaaa
dcaaaaajocaabaaaaaaaaaaaagaabaaaaeaaaaaaagajbaaaaiaaaaaafgaobaaa
aaaaaaaadcaaaaajocaabaaaaaaaaaaakgakbaaaaeaaaaaaagajbaaaadaaaaaa
fgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaaaeaaaaaaagajbaaa
agaaaaaafgaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaajgahbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agbjbaaaagaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaa
pgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaa
akaaaaaaaagabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaa
akaabaaaafaaaaaadgaaaaafccaabaaaafaaaaaadkaabaaaabaaaaaaaaaaaaai
dcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegaabaaaafaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaandcaabaaaacaaaaaaagiacaaa
aaaaaaaaahaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaegaabaaa
acaaaaaadeaaaaakdcaabaaaacaaaaaaegaabaaaacaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaa
akaabaaaacaaaaaaaoaaaaahdcaabaaaacaaaaaaegaabaaaacaaaaaapgapbaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaafgafbaaaacaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaagaabaaaacaaaaaaegacbaaa
abaaaaaadoaaaaab"
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
// Stats: 53 math, 8 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 9 [_ShadowMapTexture] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [_GrabTexture] 2D 11
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 8, 2, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R1.w, R4.z, R1;
ADD R4.w, R0, R4;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
MAX R0.w, R4, R1;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
MAX R0.w, R2, R0;
ADD R4.x, R4, R3.w;
MAX R0.w, R4.x, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R0.w;
ADD R4, R4, c[0].x;
MAX R4, R4, c[1].x;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R3.xyz, R4.x, R3;
MUL R2.xyz, R4.y, R2;
ADD R3.xyz, R3, R2;
MUL R4.x, R0.w, c[1].w;
TXP R2, fragment.texcoord[3], texture[11], 2D;
MAX R1.w, R2, R4.x;
MOV R4.y, R2.w;
MUL R1.xyz, R4.z, R1;
MOV R0.w, c[1];
ADD R4.xy, R4, -R1.w;
MAD R4.xy, R0.w, c[0].x, R4;
MAX R4.xy, R4, c[1].x;
ADD R0.w, R4.x, R4.y;
RCP R0.w, R0.w;
MUL R4.xy, R4, R0.w;
ADD R1.xyz, R3, R1;
MUL R0.xyz, R4.w, R0;
ADD R1.xyz, R1, R0;
TEX R0, fragment.texcoord[4], texture[10], 2D;
MUL R3.xyz, R0.w, R0;
TXP R5.x, fragment.texcoord[5], texture[9], 2D;
MUL R0.xyz, R0, R5.x;
MUL R3.xyz, R3, c[1].y;
MUL R0.xyz, R0, c[1].z;
MUL R5.xyz, R3, R5.x;
MIN R0.xyz, R3, R0;
MAX R0.xyz, R0, R5;
MUL R2.xyz, R4.y, R2;
MUL R0.xyz, R1, R0;
MAD result.color.xyz, R0, R4.x, R2;
MOV result.color.w, R1;
END
# 53 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 45 math, 8 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 9 [_ShadowMapTexture] 2D 9
SetTexture 10 [unity_Lightmap] 2D 10
SetTexture 11 [_GrabTexture] 2D 11
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s9
dcl_2d s10
dcl_2d s11
def c1, 0.00000000, 8.00000000, 2.00000000, 0.50000000
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
add_pp r1.w, r1, r4
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r1, r4.z
add_pp r4.x, r4, r2.w
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, r4, -r0.w
add r4, r4, c0.x
max r4, r4, c1.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r2.xyz, r4.x, r2
mul r4.x, r0.w, c1.w
mul r3.xyz, r4.y, r3
add_pp r3.xyz, r2, r3
texldp r2, v3, s11
max r1.w, r2, r4.x
mov r4.y, r2.w
mul r0.xyz, r4.z, r0
add_pp r0.xyz, r3, r0
mul r1.xyz, r4.w, r1
mov r0.w, c0.x
add r4.xy, r4, -r1.w
mad r4.xy, c1.w, r0.w, r4
max r4.xy, r4, c1.x
add r0.w, r4.x, r4.y
rcp r0.w, r0.w
mul r4.xy, r4, r0.w
add_pp r1.xyz, r0, r1
texld r0, v4, s10
mul_pp r3.xyz, r0.w, r0
texldp r5.x, v5, s9
mul_pp r0.xyz, r0, r5.x
mul_pp r3.xyz, r3, c1.y
mul_pp r0.xyz, r0, c1.z
mul_pp r5.xyz, r3, r5.x
min_pp r0.xyz, r3, r0
max_pp r0.xyz, r0, r5
mul r2.xyz, r4.y, r2
mul_pp r0.xyz, r1, r0
mad oC0.xyz, r0, r4.x, r2
mov_pp oC0.w, r1
"
}
SubProgram "d3d11 " {
// Stats: 37 math, 8 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Splat0] 2D 3
SetTexture 2 [_Splat1] 2D 4
SetTexture 3 [_Splat2] 2D 5
SetTexture 4 [_Splat3] 2D 6
SetTexture 5 [_ShadowMapTexture] 2D 0
SetTexture 6 [unity_Lightmap] 2D 7
SetTexture 7 [_GrabTexture] 2D 1
ConstBuffer "$Globals" 224
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlfljjnbnpnecbjafabcjgadpagdommbkabaaaaaaeaaiaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcaiahaaaaeaaaaaaamcabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
fibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaa
fibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaa
gcbaaaadlcbabaaaaeaaaaaagcbaaaadlcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaahecaabaaaacaaaaaa
dkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaahicaabaaaacaaaaaa
dkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
acaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaahccaabaaaacaaaaaabkaabaaa
abaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaadaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaaabaaaaaa
dkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
acaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaa
acaaaaaadiaaaaahbcaabaaaacaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaahaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaaaoaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaa
aeaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaaaeaaaaaa
agaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaaeaaaaaadcaaaaajhcaabaaa
aaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaaj
hcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaaefaaaaaj
pcaabaaaadaaaaaaogbkbaaaadaaaaaaeghobaaaagaaaaaaaagabaaaahaaaaaa
diaaaaahocaabaaaabaaaaaapgapbaaaaaaaaaaaagajbaaaadaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaadaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
adaaaaaaegacbaaaadaaaaaapgapbaaaaaaaaaaaddaaaaahocaabaaaabaaaaaa
fgaobaaaabaaaaaaagajbaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaa
abaaaaaaegacbaaaadaaaaaadeaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaahaaaaaaaagabaaa
abaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaa
dgaaaaafccaabaaaacaaaaaadkaabaaaabaaaaaaaaaaaaaidcaabaaaacaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegaabaaaacaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaandcaabaaaacaaaaaaagiacaaaaaaaaaaaahaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaegaabaaaacaaaaaadeaaaaak
dcaabaaaacaaaaaaegaabaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaa
aoaaaaahdcaabaaaacaaaaaaegaabaaaacaaaaaapgapbaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaafgafbaaaacaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaaaaaaaaaagaabaaaacaaaaaaegacbaaaabaaaaaadoaaaaab
"
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
// Stats: 82 math, 13 textures
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
SetTexture 12 [_GrabTexture] 2D 12
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0],
		{ 0, 1, 0.5, 2 },
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
TEX R1, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R5.y, R0.w, R1.w;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R1.z, R2;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R1, R4.w;
ADD R3.w, R1.y, R3;
MAX R0.w, R5.y, R2;
MAX R0.w, R3, R0;
MOV R5.w, R5.y;
MAX R0.w, R5.x, R0;
DP4 R1.x, R1, c[1].y;
MOV R5.z, R2.w;
MOV R5.y, R3.w;
ADD R5, R5, -R0.w;
ADD R5, R5, c[0].x;
MAX R5, R5, c[1].x;
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
MUL R4.xyz, R5.x, R4;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[1].z;
MAD R1.xy, R1.x, R6, c[1].z;
MAD R7.xy, R1.yxzw, c[1].w, -c[1].y;
MUL R1.xy, R7, R7;
ADD_SAT R1.x, R1, R1.y;
ADD R1.x, -R1, c[1].y;
RSQ R1.x, R1.x;
RCP R7.z, R1.x;
TEX R1, fragment.texcoord[4], texture[11], 2D;
DP3_SAT R6.z, R7, c[2];
DP3_SAT R6.y, R7, c[3];
DP3_SAT R6.x, R7, c[4];
MUL R1.xyz, R1.w, R1;
MUL R6.xyz, R1, R6;
TEX R1, fragment.texcoord[4], texture[10], 2D;
DP3 R2.w, R6, c[2].w;
MUL R6.xyz, R1.w, R1;
TXP R7.x, fragment.texcoord[5], texture[9], 2D;
MUL R1.xyz, R1, R7.x;
MUL R6.xyz, R6, R2.w;
MUL R6.xyz, R6, c[2].w;
MUL R1.xyz, R1, c[1].w;
MUL R5.x, R0.w, c[1].z;
MUL R7.xyz, R6, R7.x;
MIN R1.xyz, R6, R1;
MUL R6.xyz, R5.y, R3;
TXP R3, fragment.texcoord[3], texture[12], 2D;
MAX R0.w, R3, R5.x;
MOV R5.y, R3.w;
MOV R1.w, c[1].z;
ADD R5.xy, R5, -R0.w;
MAD R5.xy, R1.w, c[0].x, R5;
MAX R5.xy, R5, c[1].x;
ADD R1.w, R5.x, R5.y;
ADD R4.xyz, R4, R6;
MUL R2.xyz, R5.z, R2;
ADD R2.xyz, R4, R2;
RCP R1.w, R1.w;
MUL R0.xyz, R5.w, R0;
MUL R4.xy, R5, R1.w;
ADD R0.xyz, R2, R0;
MAX R1.xyz, R1, R7;
MUL R2.xyz, R4.y, R3;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, R4.x, R2;
MOV result.color.w, R0;
END
# 82 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 69 math, 13 textures
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
SetTexture 12 [_GrabTexture] 2D 12
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
dcl_2d s12
def c1, 0.00000000, 1.00000000, -0.50000000, 8.00000000
def c2, 2.00000000, -1.00000000, 0.50000000, 0
def c3, -0.40824828, -0.70710677, 0.57735026, 0
def c4, -0.40824831, 0.70710677, 0.57735026, 0
def c5, 0.81649655, 0.00000000, 0.57735026, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xy
dcl_texcoord5 v5
texld r1, v0, s0
texld r0, v2, s4
add_pp r5.y, r0.w, r1.w
texld r3, v1, s2
texld r2, v1.zwzw, s3
add_pp r2.w, r1.z, r2
texld r4, v0.zwzw, s1
add_pp r5.x, r1, r4.w
add_pp r3.w, r1.y, r3
max r0.w, r5.y, r2
max r0.w, r3, r0
mov r5.w, r5.y
max r0.w, r5.x, r0
dp4_pp r1.x, r1, c1.y
mov r5.z, r2.w
mov r5.y, r3.w
add r5, r5, -r0.w
add r5, r5, c0.x
max r5, r5, c1.x
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
mul r4.xyz, r5.x, r4
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
add_pp r6.xy, r6.xzzw, r6.ywzw
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c1.z
mad_pp r1.xy, r1.x, r6, c2.z
mad_pp r7.xy, r1.yxzw, c2.x, c2.y
mul_pp r1.xy, r7, r7
add_pp_sat r1.x, r1, r1.y
add_pp r1.x, -r1, c1.y
rsq_pp r1.x, r1.x
rcp_pp r7.z, r1.x
texld r1, v4, s11
dp3_pp_sat r6.z, r7, c3
dp3_pp_sat r6.y, r7, c4
dp3_pp_sat r6.x, r7, c5
mul_pp r1.xyz, r1.w, r1
mul_pp r6.xyz, r1, r6
texld r1, v4, s10
dp3_pp r2.w, r6, c1.w
mul_pp r6.xyz, r1.w, r1
texldp r7.x, v5, s9
mul_pp r1.xyz, r1, r7.x
mul_pp r6.xyz, r6, r2.w
mul_pp r6.xyz, r6, c1.w
mul_pp r1.xyz, r1, c2.x
mul r5.x, r0.w, c2.z
mul_pp r7.xyz, r6, r7.x
min_pp r1.xyz, r6, r1
mul r6.xyz, r5.y, r3
texldp r3, v3, s12
max r0.w, r3, r5.x
mov r5.y, r3.w
mov r1.w, c0.x
add r5.xy, r5, -r0.w
mad r5.xy, c2.z, r1.w, r5
max r5.xy, r5, c1.x
add r1.w, r5.x, r5.y
add_pp r4.xyz, r4, r6
mul r2.xyz, r5.z, r2
add_pp r2.xyz, r4, r2
rcp r1.w, r1.w
mul r0.xyz, r5.w, r0
mul r4.xy, r5, r1.w
add_pp r0.xyz, r2, r0
max_pp r1.xyz, r1, r7
mul r2.xyz, r4.y, r3
mul_pp r0.xyz, r0, r1
mad oC0.xyz, r0, r4.x, r2
mov_pp oC0.w, r0
"
}
SubProgram "d3d11 " {
// Stats: 56 math, 13 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Splat0] 2D 3
SetTexture 2 [_Splat1] 2D 4
SetTexture 3 [_Splat2] 2D 5
SetTexture 4 [_Splat3] 2D 6
SetTexture 5 [_Normal0] 2D 7
SetTexture 6 [_Normal1] 2D 8
SetTexture 7 [_Normal2] 2D 9
SetTexture 8 [_Normal3] 2D 10
SetTexture 9 [_ShadowMapTexture] 2D 0
SetTexture 10 [unity_Lightmap] 2D 11
SetTexture 11 [unity_LightmapInd] 2D 12
SetTexture 12 [_GrabTexture] 2D 1
ConstBuffer "$Globals" 224
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedegcckdgenafeklkhdehlegooaedoadmpabaaaaaabiamaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcoaakaaaaeaaaaaaaliacaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafkaaaaad
aagabaaaajaaaaaafkaaaaadaagabaaaakaaaaaafkaaaaadaagabaaaalaaaaaa
fkaaaaadaagabaaaamaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaae
aahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaae
aahabaaaajaaaaaaffffaaaafibiaaaeaahabaaaakaaaaaaffffaaaafibiaaae
aahabaaaalaaaaaaffffaaaafibiaaaeaahabaaaamaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaadlcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacakaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaadaaaaaaeghobaaaalaaaaaaaagabaaaamaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaacaaaaaaeghobaaaahaaaaaaaagabaaaajaaaaaaefaaaaajpcaabaaa
acaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaaaagabaaaahaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaacaaaaaaeghobaaaagaaaaaaaagabaaaaiaaaaaa
efaaaaajpcaabaaaaeaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
afaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaacaaaaaaaaaaaaahecaabaaaagaaaaaadkaabaaaaeaaaaaackaabaaa
afaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaa
aagabaaaagaaaaaaaaaaaaahicaabaaaagaaaaaadkaabaaaafaaaaaadkaabaaa
ahaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaagaaaaaackaabaaaagaaaaaa
efaaaaajpcaabaaaaiaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaa
aeaaaaaaaaaaaaahccaabaaaagaaaaaabkaabaaaafaaaaaadkaabaaaaiaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaagaaaaaaefaaaaaj
pcaabaaaajaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaa
aaaaaaahbcaabaaaagaaaaaaakaabaaaafaaaaaadkaabaaaajaaaaaabbaaaaak
bcaabaaaabaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaagaaaaaa
aaaaaaaipcaabaaaafaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaaagaaaaaa
diaaaaahbcaabaaaagaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaai
pcaabaaaafaaaaaaegaobaaaafaaaaaaagiacaaaaaaaaaaaahaaaaaadeaaaaak
pcaabaaaafaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaafaaaaaaakaabaaaafaaaaaa
aaaaaaahicaabaaaaaaaaaaackaabaaaafaaaaaadkaabaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaadkaabaaaafaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaa
afaaaaaaegaobaaaafaaaaaapgapbaaaaaaaaaaadiaaaaahfcaabaaaacaaaaaa
pganbaaaadaaaaaafgafbaaaafaaaaaadcaaaaajdcaabaaaacaaaaaaagaabaaa
afaaaaaahgapbaaaacaaaaaaigaabaaaacaaaaaadcaaaaajgcaabaaaabaaaaaa
kgakbaaaafaaaaaapganbaaaabaaaaaaagabbaaaacaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaadaaaaaaeghobaaaaiaaaaaaaagabaaaakaaaaaadcaaaaaj
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
ogbkbaaaadaaaaaaeghobaaaakaaaaaaaagabaaaalaaaaaadiaaaaahccaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaa
agajbaaaabaaaaaafgafbaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaacaaaaaaegbabaaaafaaaaaa
pgbpbaaaafaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
ajaaaaaaaagabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaaakaabaaaacaaaaaa
akaabaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaaaaaaaaaagaabaaa
acaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
ddaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadeaaaaah
hcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaaiaaaaaafgafbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaa
agaabaaaafaaaaaaegacbaaaajaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaa
abaaaaaakgakbaaaafaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaadcaaaaaj
hcaabaaaabaaaaaapgapbaaaafaaaaaaegacbaaaahaaaaaaegacbaaaabaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaah
dcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaamaaaaaaaagabaaaabaaaaaadeaaaaah
icaabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaagaaaaaadgaaaaafccaabaaa
agaaaaaadkaabaaaabaaaaaaaaaaaaaidcaabaaaacaaaaaapgapbaiaebaaaaaa
aaaaaaaaegaabaaaagaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaandcaabaaaacaaaaaaagiacaaaaaaaaaaaahaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaegaabaaaacaaaaaadeaaaaakdcaabaaaacaaaaaa
egaabaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaaaoaaaaahdcaabaaa
acaaaaaaegaabaaaacaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaafgafbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
aaaaaaaaagaabaaaacaaaaaaegacbaaaabaaaaaadoaaaaab"
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
 //       d3d11 : 29 avg math (22..31)
 //        d3d9 : 37 avg math (31..40)
 //      opengl : 34 avg math (28..37)
 // Stats for Fragment shader:
 //       d3d11 : 47 avg math (44..54), 11 avg texture (10..12)
 //        d3d9 : 62 avg math (58..68), 11 avg texture (10..12)
 //      opengl : 73 avg math (68..79), 11 avg texture (10..12)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Geometry-99" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" "SplatCount"="4" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
// Stats: 36 math
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
PARAM c[24] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, -vertex.normal.zxyw, c[0].zyzw;
MAD R1.xyz, vertex.normal.yzxw, c[0].yzzw, R0;
MOV R0, c[17];
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
DP4 R3.z, R0, c[11];
MAD R0.xyz, R3, c[18].w, -vertex.position;
DP3 result.texcoord[4].y, R0, -R2;
DP3 result.texcoord[4].x, R0, R1;
DP4 R2.zw, vertex.position, c[4];
DP3 result.texcoord[4].z, vertex.normal, R0;
DP4 R2.y, vertex.position, c[2];
DP4 R2.x, vertex.position, c[1];
DP4 R0.z, vertex.position, c[3];
ADD R3.xy, R2.z, R2;
DP4 R1.w, vertex.position, c[8];
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
MUL R0.xy, R3, c[0].x;
MOV R0.w, R2.z;
MOV result.texcoord[3], R0;
DP4 result.texcoord[5].z, R1, c[15];
DP4 result.texcoord[5].y, R1, c[14];
DP4 result.texcoord[5].x, R1, c[13];
MOV result.position.w, R2;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[20].xyxy, c[20];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[22].xyxy, c[22];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[21], c[21].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[23], c[23].zwzw;
MOV result.position.z, R0;
MOV result.position.y, R2;
MOV result.position.x, R2;
END
# 36 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 39 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_ScreenParams]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_Control_ST]
Vector 20 [_Splat0_ST]
Vector 21 [_Splat1_ST]
Vector 22 [_Splat2_ST]
Vector 23 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c24, 0.50000000, 0.00000000, 1.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r0.xyz, -v2.zxyw, c24.yzyw
mad r2.xyz, v2.yzxw, c24.zyyw, r0
mul r1.xyz, v2.zxyw, r2.yzxw
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
mov r1, c8
dp4 r4.x, c17, r1
dp4 r1.zw, v0, c3
mov r0, c10
dp4 r4.z, c17, r0
mov r0, c9
dp4 r4.y, c17, r0
mad r0.xyz, r4, c18.w, -v0
dp3 o5.x, r0, r2
dp3 o5.y, r0, -r3
dp4 r3.xy, v0, c1
dp3 o5.z, v2, r0
dp4 r1.x, v0, c0
dp4 r0.z, v0, c2
mov r1.y, -r3.x
mad r3.zw, r1.z, c16, r1.xyxy
dp4 r2.w, v0, c7
dp4 r2.z, v0, c6
dp4 r2.x, v0, c4
dp4 r2.y, v0, c5
mul r0.xy, r3.zwzw, c24.x
mov r0.w, r1.z
mov o4, r0
dp4 o6.z, r2, c14
dp4 o6.y, r2, c13
dp4 o6.x, r2, c12
mov o0.w, r1
mov o0.y, r3
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
mad o2.zw, v3.xyxy, c22.xyxy, c22
mad o2.xy, v3, c21, c21.zwzw
mad o3.xy, v3, c23, c23.zwzw
mov o0.z, r0
mov o0.x, r1
"
}
SubProgram "d3d11 " {
// Stats: 31 math
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
eefiecedelahlifbknhmnfllgmigfoddanbopgjaabaaaaaahmahaaaaadaaaaaa
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
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefclaafaaaaeaaaabaagmabaaaafjaaaaaeegiocaaaaaaaaaaa
anaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaajaaaaaa
kgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaa
acaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaa
alaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
amaaaaaaogikcaaaaaaaaaaaamaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaa
dgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaak
hcaabaaaaaaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaadcaaaaanhcaabaaaaaaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaiadpaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaaaaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
jgbebaaaacaaaaaajgaebaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaaj
hcaabaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaicccabaaaafaaaaaaegacbaia
ebaaaaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaa
acaaaaaaegacbaaaacaaaaaaapaaaaahbccabaaaafaaaaaacgakbaaaaaaaaaaa
egaabaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize(xlv_TEXCOORD4);
  lightDir_1 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 c_34;
  c_34.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), lightDir_1)) * texture2D (_LightTexture0, vec2(tmpvar_33)).w) * 2.0));
  c_34.w = tmpvar_2;
  lowp vec4 tmpvar_35;
  lowp vec4 res_36;
  highp vec2 pblend_37;
  lowp float tmpvar_38;
  tmpvar_38 = c_34.w;
  pblend_37.x = tmpvar_38;
  lowp float tmpvar_39;
  tmpvar_39 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_37.y = tmpvar_39;
  highp vec4 tmpvar_40;
  tmpvar_40.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_40.w = max (pblend_37.x, pblend_37.y);
  res_36 = tmpvar_40;
  highp vec2 tmpvar_41;
  tmpvar_41 = max (((pblend_37 - res_36.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_42;
  tmpvar_42 = (tmpvar_41 / (tmpvar_41.x + tmpvar_41.y));
  pblend_37 = tmpvar_42;
  highp vec4 tmpvar_43;
  tmpvar_43.w = 0.0;
  tmpvar_43.xyz = (c_34.xyz * tmpvar_42.x);
  tmpvar_35 = tmpvar_43;
  gl_FragData[0] = tmpvar_35;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize(xlv_TEXCOORD4);
  lightDir_1 = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 c_35;
  c_35.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (normal_32, lightDir_1)) * texture2D (_LightTexture0, vec2(tmpvar_34)).w) * 2.0));
  c_35.w = tmpvar_2;
  lowp vec4 tmpvar_36;
  lowp vec4 res_37;
  highp vec2 pblend_38;
  lowp float tmpvar_39;
  tmpvar_39 = c_35.w;
  pblend_38.x = tmpvar_39;
  lowp float tmpvar_40;
  tmpvar_40 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_38.y = tmpvar_40;
  highp vec4 tmpvar_41;
  tmpvar_41.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_41.w = max (pblend_38.x, pblend_38.y);
  res_37 = tmpvar_41;
  highp vec2 tmpvar_42;
  tmpvar_42 = max (((pblend_38 - res_37.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_43;
  tmpvar_43 = (tmpvar_42 / (tmpvar_42.x + tmpvar_42.y));
  pblend_38 = tmpvar_43;
  highp vec4 tmpvar_44;
  tmpvar_44.w = 0.0;
  tmpvar_44.xyz = (c_35.xyz * tmpvar_43.x);
  tmpvar_36 = tmpvar_44;
  gl_FragData[0] = tmpvar_36;
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
out highp vec4 xlv_TEXCOORD3;
out mediump vec3 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in mediump vec3 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize(xlv_TEXCOORD4);
  lightDir_1 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 c_34;
  c_34.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), lightDir_1)) * texture (_LightTexture0, vec2(tmpvar_33)).w) * 2.0));
  c_34.w = tmpvar_2;
  lowp vec4 tmpvar_35;
  lowp vec4 res_36;
  highp vec2 pblend_37;
  lowp float tmpvar_38;
  tmpvar_38 = c_34.w;
  pblend_37.x = tmpvar_38;
  lowp float tmpvar_39;
  tmpvar_39 = textureProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_37.y = tmpvar_39;
  highp vec4 tmpvar_40;
  tmpvar_40.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_40.w = max (pblend_37.x, pblend_37.y);
  res_36 = tmpvar_40;
  highp vec2 tmpvar_41;
  tmpvar_41 = max (((pblend_37 - res_36.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_42;
  tmpvar_42 = (tmpvar_41 / (tmpvar_41.x + tmpvar_41.y));
  pblend_37 = tmpvar_42;
  highp vec4 tmpvar_43;
  tmpvar_43.w = 0.0;
  tmpvar_43.xyz = (c_34.xyz * tmpvar_42.x);
  tmpvar_35 = tmpvar_43;
  _glesFragData[0] = tmpvar_35;
}



#endif"
}
SubProgram "opengl " {
// Stats: 28 math
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
PARAM c[15] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, -vertex.normal.zxyw, c[0].zyzw;
MAD R1.xyz, vertex.normal.yzxw, c[0].yzzw, R0;
MOV R0, c[9];
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
DP4 R3.z, R0, c[7];
DP4 R3.y, R0, c[6];
DP4 R3.x, R0, c[5];
DP4 R0.zw, vertex.position, c[4];
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP4 R0.y, vertex.position, c[2];
DP4 R0.x, vertex.position, c[1];
DP3 result.texcoord[4].x, R3, R1;
DP4 R1.z, vertex.position, c[3];
DP3 result.texcoord[4].y, R3, -R2;
ADD R2.xy, R0.z, R0;
MUL R1.xy, R2, c[0].x;
MOV R1.w, R0.z;
DP3 result.texcoord[4].z, vertex.normal, R3;
MOV result.texcoord[3], R1;
MOV result.position.w, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MOV result.position.z, R1;
MOV result.position.y, R0;
MOV result.position.x, R0;
END
# 28 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 31 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_World2Object]
Vector 8 [_ScreenParams]
Vector 9 [_WorldSpaceLightPos0]
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
def c15, 0.50000000, 0.00000000, 1.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r0.xyz, -v2.zxyw, c15.yzyw
mad r2.xyz, v2.yzxw, c15.zyyw, r0
mul r1.xyz, v2.zxyw, r2.yzxw
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
mov r1, c4
dp4 r4.x, c9, r1
mov r0, c6
dp4 r4.z, c9, r0
mov r0, c5
dp4 r4.y, c9, r0
dp4 r0.zw, v0, c3
dp4 r1.xy, v0, c1
dp4 r0.x, v0, c0
dp3 o5.x, r4, r2
dp4 r2.z, v0, c2
mov r0.y, -r1.x
mad r1.zw, r0.z, c8, r0.xyxy
mul r2.xy, r1.zwzw, c15.x
mov r2.w, r0.z
dp3 o5.y, r4, -r3
dp3 o5.z, v2, r4
mov o4, r2
mov o0.w, r0
mov o0.y, r1
mad o1.zw, v3.xyxy, c11.xyxy, c11
mad o1.xy, v3, c10, c10.zwzw
mad o2.zw, v3.xyxy, c13.xyxy, c13
mad o2.xy, v3, c12, c12.zwzw
mad o3.xy, v3, c14, c14.zwzw
mov o0.z, r2
mov o0.x, r0
"
}
SubProgram "d3d11 " {
// Stats: 22 math
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
eefiecedimjdcinbolcedmpccgapcflibggfmhngabaaaaaapmafaaaaadaaaaaa
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
feeffiedepepfceeaaklklklfdeieefceiaeaaaaeaaaabaabcabaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
adaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaa
aaaaaaaaafaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaacaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaadgaaaaaf
mccabaaaaeaaaaaakgaobaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaakhcaabaaa
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
baaaaaaicccabaaaafaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaaacaaaaaa
baaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaaapaaaaah
bccabaaaafaaaaaacgakbaaaaaaaaaaaegaabaaaacaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lightDir_1;
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
  lightDir_1 = xlv_TEXCOORD4;
  lowp vec4 c_32;
  c_32.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), lightDir_1)) * 2.0));
  c_32.w = tmpvar_2;
  lowp vec4 tmpvar_33;
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp float tmpvar_36;
  tmpvar_36 = c_32.w;
  pblend_35.x = tmpvar_36;
  lowp float tmpvar_37;
  tmpvar_37 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_35.y = tmpvar_37;
  highp vec4 tmpvar_38;
  tmpvar_38.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_38.w = max (pblend_35.x, pblend_35.y);
  res_34 = tmpvar_38;
  highp vec2 tmpvar_39;
  tmpvar_39 = max (((pblend_35 - res_34.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_40;
  tmpvar_40 = (tmpvar_39 / (tmpvar_39.x + tmpvar_39.y));
  pblend_35 = tmpvar_40;
  highp vec4 tmpvar_41;
  tmpvar_41.w = 0.0;
  tmpvar_41.xyz = (c_32.xyz * tmpvar_40.x);
  tmpvar_33 = tmpvar_41;
  gl_FragData[0] = tmpvar_33;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lightDir_1;
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
  lightDir_1 = xlv_TEXCOORD4;
  lowp vec4 c_33;
  c_33.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (normal_32, lightDir_1)) * 2.0));
  c_33.w = tmpvar_2;
  lowp vec4 tmpvar_34;
  lowp vec4 res_35;
  highp vec2 pblend_36;
  lowp float tmpvar_37;
  tmpvar_37 = c_33.w;
  pblend_36.x = tmpvar_37;
  lowp float tmpvar_38;
  tmpvar_38 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_36.y = tmpvar_38;
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_39.w = max (pblend_36.x, pblend_36.y);
  res_35 = tmpvar_39;
  highp vec2 tmpvar_40;
  tmpvar_40 = max (((pblend_36 - res_35.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_41;
  tmpvar_41 = (tmpvar_40 / (tmpvar_40.x + tmpvar_40.y));
  pblend_36 = tmpvar_41;
  highp vec4 tmpvar_42;
  tmpvar_42.w = 0.0;
  tmpvar_42.xyz = (c_33.xyz * tmpvar_41.x);
  tmpvar_34 = tmpvar_42;
  gl_FragData[0] = tmpvar_34;
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
out highp vec4 xlv_TEXCOORD3;
out mediump vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 lightDir_1;
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
  lightDir_1 = xlv_TEXCOORD4;
  lowp vec4 c_32;
  c_32.xyz = ((col_4 * _LightColor0.xyz) * (max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), lightDir_1)) * 2.0));
  c_32.w = tmpvar_2;
  lowp vec4 tmpvar_33;
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp float tmpvar_36;
  tmpvar_36 = c_32.w;
  pblend_35.x = tmpvar_36;
  lowp float tmpvar_37;
  tmpvar_37 = textureProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_35.y = tmpvar_37;
  highp vec4 tmpvar_38;
  tmpvar_38.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_38.w = max (pblend_35.x, pblend_35.y);
  res_34 = tmpvar_38;
  highp vec2 tmpvar_39;
  tmpvar_39 = max (((pblend_35 - res_34.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_40;
  tmpvar_40 = (tmpvar_39 / (tmpvar_39.x + tmpvar_39.y));
  pblend_35 = tmpvar_40;
  highp vec4 tmpvar_41;
  tmpvar_41.w = 0.0;
  tmpvar_41.xyz = (c_32.xyz * tmpvar_40.x);
  tmpvar_33 = tmpvar_41;
  _glesFragData[0] = tmpvar_33;
}



#endif"
}
SubProgram "opengl " {
// Stats: 37 math
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
PARAM c[24] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, -vertex.normal.zxyw, c[0].zyzw;
MAD R1.xyz, vertex.normal.yzxw, c[0].yzzw, R0;
MOV R0, c[17];
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
DP4 R3.z, R0, c[11];
MAD R0.xyz, R3, c[18].w, -vertex.position;
DP3 result.texcoord[4].y, R0, -R2;
DP3 result.texcoord[4].x, R0, R1;
DP4 R2.zw, vertex.position, c[4];
DP3 result.texcoord[4].z, vertex.normal, R0;
DP4 R2.y, vertex.position, c[2];
DP4 R2.x, vertex.position, c[1];
DP4 R0.z, vertex.position, c[3];
ADD R3.xy, R2.z, R2;
DP4 R1.w, vertex.position, c[8];
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
MUL R0.xy, R3, c[0].x;
MOV R0.w, R2.z;
MOV result.texcoord[3], R0;
DP4 result.texcoord[5].w, R1, c[16];
DP4 result.texcoord[5].z, R1, c[15];
DP4 result.texcoord[5].y, R1, c[14];
DP4 result.texcoord[5].x, R1, c[13];
MOV result.position.w, R2;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[20].xyxy, c[20];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[22].xyxy, c[22];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[21], c[21].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[23], c[23].zwzw;
MOV result.position.z, R0;
MOV result.position.y, R2;
MOV result.position.x, R2;
END
# 37 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 40 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_ScreenParams]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_Control_ST]
Vector 20 [_Splat0_ST]
Vector 21 [_Splat1_ST]
Vector 22 [_Splat2_ST]
Vector 23 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c24, 0.50000000, 0.00000000, 1.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r0.xyz, -v2.zxyw, c24.yzyw
mad r2.xyz, v2.yzxw, c24.zyyw, r0
mul r1.xyz, v2.zxyw, r2.yzxw
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
mov r1, c8
dp4 r4.x, c17, r1
dp4 r1.zw, v0, c3
mov r0, c10
dp4 r4.z, c17, r0
mov r0, c9
dp4 r4.y, c17, r0
mad r0.xyz, r4, c18.w, -v0
dp3 o5.x, r0, r2
dp3 o5.y, r0, -r3
dp4 r3.xy, v0, c1
dp3 o5.z, v2, r0
dp4 r1.x, v0, c0
dp4 r0.z, v0, c2
mov r1.y, -r3.x
mad r3.zw, r1.z, c16, r1.xyxy
dp4 r2.w, v0, c7
dp4 r2.z, v0, c6
dp4 r2.x, v0, c4
dp4 r2.y, v0, c5
mul r0.xy, r3.zwzw, c24.x
mov r0.w, r1.z
mov o4, r0
dp4 o6.w, r2, c15
dp4 o6.z, r2, c14
dp4 o6.y, r2, c13
dp4 o6.x, r2, c12
mov o0.w, r1
mov o0.y, r3
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
mad o2.zw, v3.xyxy, c22.xyxy, c22
mad o2.xy, v3, c21, c21.zwzw
mad o3.xy, v3, c23, c23.zwzw
mov o0.z, r0
mov o0.x, r1
"
}
SubProgram "d3d11 " {
// Stats: 31 math
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
eefieceddpadelaijlkndoneeajljicmoogimmbaabaaaaaahmahaaaaadaaaaaa
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
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefclaafaaaaeaaaabaagmabaaaafjaaaaaeegiocaaaaaaaaaaa
anaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaa
giaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaajaaaaaa
kgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaa
acaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaa
alaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
amaaaaaaogikcaaaaaaaaaaaamaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaa
dgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaak
hcaabaaaaaaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaadcaaaaanhcaabaaaaaaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaiadpaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaaaaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
jgbebaaaacaaaaaajgaebaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaaj
hcaabaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaicccabaaaafaaaaaaegacbaia
ebaaaaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaa
acaaaaaaegacbaaaacaaaaaaapaaaaahbccabaaaafaaaaaacgakbaaaaaaaaaaa
egaabaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize(xlv_TEXCOORD4);
  lightDir_1 = tmpvar_32;
  highp vec2 P_33;
  P_33 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp float atten_35;
  atten_35 = ((float((xlv_TEXCOORD5.z > 0.0)) * texture2D (_LightTexture0, P_33).w) * texture2D (_LightTextureB0, vec2(tmpvar_34)).w);
  lowp vec4 c_36;
  c_36.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), lightDir_1)) * atten_35) * 2.0));
  c_36.w = tmpvar_2;
  lowp vec4 tmpvar_37;
  lowp vec4 res_38;
  highp vec2 pblend_39;
  lowp float tmpvar_40;
  tmpvar_40 = c_36.w;
  pblend_39.x = tmpvar_40;
  lowp float tmpvar_41;
  tmpvar_41 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_39.y = tmpvar_41;
  highp vec4 tmpvar_42;
  tmpvar_42.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_42.w = max (pblend_39.x, pblend_39.y);
  res_38 = tmpvar_42;
  highp vec2 tmpvar_43;
  tmpvar_43 = max (((pblend_39 - res_38.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_44;
  tmpvar_44 = (tmpvar_43 / (tmpvar_43.x + tmpvar_43.y));
  pblend_39 = tmpvar_44;
  highp vec4 tmpvar_45;
  tmpvar_45.w = 0.0;
  tmpvar_45.xyz = (c_36.xyz * tmpvar_44.x);
  tmpvar_37 = tmpvar_45;
  gl_FragData[0] = tmpvar_37;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize(xlv_TEXCOORD4);
  lightDir_1 = tmpvar_33;
  highp vec2 P_34;
  P_34 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  highp float tmpvar_35;
  tmpvar_35 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp float atten_36;
  atten_36 = ((float((xlv_TEXCOORD5.z > 0.0)) * texture2D (_LightTexture0, P_34).w) * texture2D (_LightTextureB0, vec2(tmpvar_35)).w);
  lowp vec4 c_37;
  c_37.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (normal_32, lightDir_1)) * atten_36) * 2.0));
  c_37.w = tmpvar_2;
  lowp vec4 tmpvar_38;
  lowp vec4 res_39;
  highp vec2 pblend_40;
  lowp float tmpvar_41;
  tmpvar_41 = c_37.w;
  pblend_40.x = tmpvar_41;
  lowp float tmpvar_42;
  tmpvar_42 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_40.y = tmpvar_42;
  highp vec4 tmpvar_43;
  tmpvar_43.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_43.w = max (pblend_40.x, pblend_40.y);
  res_39 = tmpvar_43;
  highp vec2 tmpvar_44;
  tmpvar_44 = max (((pblend_40 - res_39.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_45;
  tmpvar_45 = (tmpvar_44 / (tmpvar_44.x + tmpvar_44.y));
  pblend_40 = tmpvar_45;
  highp vec4 tmpvar_46;
  tmpvar_46.w = 0.0;
  tmpvar_46.xyz = (c_37.xyz * tmpvar_45.x);
  tmpvar_38 = tmpvar_46;
  gl_FragData[0] = tmpvar_38;
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
out highp vec4 xlv_TEXCOORD3;
out mediump vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
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
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in mediump vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize(xlv_TEXCOORD4);
  lightDir_1 = tmpvar_32;
  highp vec2 P_33;
  P_33 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp float atten_35;
  atten_35 = ((float((xlv_TEXCOORD5.z > 0.0)) * texture (_LightTexture0, P_33).w) * texture (_LightTextureB0, vec2(tmpvar_34)).w);
  lowp vec4 c_36;
  c_36.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), lightDir_1)) * atten_35) * 2.0));
  c_36.w = tmpvar_2;
  lowp vec4 tmpvar_37;
  lowp vec4 res_38;
  highp vec2 pblend_39;
  lowp float tmpvar_40;
  tmpvar_40 = c_36.w;
  pblend_39.x = tmpvar_40;
  lowp float tmpvar_41;
  tmpvar_41 = textureProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_39.y = tmpvar_41;
  highp vec4 tmpvar_42;
  tmpvar_42.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_42.w = max (pblend_39.x, pblend_39.y);
  res_38 = tmpvar_42;
  highp vec2 tmpvar_43;
  tmpvar_43 = max (((pblend_39 - res_38.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_44;
  tmpvar_44 = (tmpvar_43 / (tmpvar_43.x + tmpvar_43.y));
  pblend_39 = tmpvar_44;
  highp vec4 tmpvar_45;
  tmpvar_45.w = 0.0;
  tmpvar_45.xyz = (c_36.xyz * tmpvar_44.x);
  tmpvar_37 = tmpvar_45;
  _glesFragData[0] = tmpvar_37;
}



#endif"
}
SubProgram "opengl " {
// Stats: 36 math
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
PARAM c[24] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, -vertex.normal.zxyw, c[0].zyzw;
MAD R1.xyz, vertex.normal.yzxw, c[0].yzzw, R0;
MOV R0, c[17];
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
DP4 R3.z, R0, c[11];
MAD R0.xyz, R3, c[18].w, -vertex.position;
DP3 result.texcoord[4].y, R0, -R2;
DP3 result.texcoord[4].x, R0, R1;
DP4 R2.zw, vertex.position, c[4];
DP3 result.texcoord[4].z, vertex.normal, R0;
DP4 R2.y, vertex.position, c[2];
DP4 R2.x, vertex.position, c[1];
DP4 R0.z, vertex.position, c[3];
ADD R3.xy, R2.z, R2;
DP4 R1.w, vertex.position, c[8];
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
MUL R0.xy, R3, c[0].x;
MOV R0.w, R2.z;
MOV result.texcoord[3], R0;
DP4 result.texcoord[5].z, R1, c[15];
DP4 result.texcoord[5].y, R1, c[14];
DP4 result.texcoord[5].x, R1, c[13];
MOV result.position.w, R2;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[20].xyxy, c[20];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[22].xyxy, c[22];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[21], c[21].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[23], c[23].zwzw;
MOV result.position.z, R0;
MOV result.position.y, R2;
MOV result.position.x, R2;
END
# 36 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 39 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_ScreenParams]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_Control_ST]
Vector 20 [_Splat0_ST]
Vector 21 [_Splat1_ST]
Vector 22 [_Splat2_ST]
Vector 23 [_Splat3_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c24, 0.50000000, 0.00000000, 1.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r0.xyz, -v2.zxyw, c24.yzyw
mad r2.xyz, v2.yzxw, c24.zyyw, r0
mul r1.xyz, v2.zxyw, r2.yzxw
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
mov r1, c8
dp4 r4.x, c17, r1
dp4 r1.zw, v0, c3
mov r0, c10
dp4 r4.z, c17, r0
mov r0, c9
dp4 r4.y, c17, r0
mad r0.xyz, r4, c18.w, -v0
dp3 o5.x, r0, r2
dp3 o5.y, r0, -r3
dp4 r3.xy, v0, c1
dp3 o5.z, v2, r0
dp4 r1.x, v0, c0
dp4 r0.z, v0, c2
mov r1.y, -r3.x
mad r3.zw, r1.z, c16, r1.xyxy
dp4 r2.w, v0, c7
dp4 r2.z, v0, c6
dp4 r2.x, v0, c4
dp4 r2.y, v0, c5
mul r0.xy, r3.zwzw, c24.x
mov r0.w, r1.z
mov o4, r0
dp4 o6.z, r2, c14
dp4 o6.y, r2, c13
dp4 o6.x, r2, c12
mov o0.w, r1
mov o0.y, r3
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
mad o2.zw, v3.xyxy, c22.xyxy, c22
mad o2.xy, v3, c21, c21.zwzw
mad o3.xy, v3, c23, c23.zwzw
mov o0.z, r0
mov o0.x, r1
"
}
SubProgram "d3d11 " {
// Stats: 31 math
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
eefiecedelahlifbknhmnfllgmigfoddanbopgjaabaaaaaahmahaaaaadaaaaaa
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
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefclaafaaaaeaaaabaagmabaaaafjaaaaaeegiocaaaaaaaaaaa
anaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaajaaaaaa
kgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaa
acaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaa
alaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
amaaaaaaogikcaaaaaaaaaaaamaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaa
dgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaak
hcaabaaaaaaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaadcaaaaanhcaabaaaaaaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaiadpaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaaaaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
jgbebaaaacaaaaaajgaebaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaaj
hcaabaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaicccabaaaafaaaaaaegacbaia
ebaaaaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaa
acaaaaaaegacbaaaacaaaaaaapaaaaahbccabaaaafaaaaaacgakbaaaaaaaaaaa
egaabaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize(xlv_TEXCOORD4);
  lightDir_1 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 c_34;
  c_34.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), lightDir_1)) * (texture2D (_LightTextureB0, vec2(tmpvar_33)).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w)) * 2.0));
  c_34.w = tmpvar_2;
  lowp vec4 tmpvar_35;
  lowp vec4 res_36;
  highp vec2 pblend_37;
  lowp float tmpvar_38;
  tmpvar_38 = c_34.w;
  pblend_37.x = tmpvar_38;
  lowp float tmpvar_39;
  tmpvar_39 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_37.y = tmpvar_39;
  highp vec4 tmpvar_40;
  tmpvar_40.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_40.w = max (pblend_37.x, pblend_37.y);
  res_36 = tmpvar_40;
  highp vec2 tmpvar_41;
  tmpvar_41 = max (((pblend_37 - res_36.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_42;
  tmpvar_42 = (tmpvar_41 / (tmpvar_41.x + tmpvar_41.y));
  pblend_37 = tmpvar_42;
  highp vec4 tmpvar_43;
  tmpvar_43.w = 0.0;
  tmpvar_43.xyz = (c_34.xyz * tmpvar_42.x);
  tmpvar_35 = tmpvar_43;
  gl_FragData[0] = tmpvar_35;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize(xlv_TEXCOORD4);
  lightDir_1 = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 c_35;
  c_35.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (normal_32, lightDir_1)) * (texture2D (_LightTextureB0, vec2(tmpvar_34)).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w)) * 2.0));
  c_35.w = tmpvar_2;
  lowp vec4 tmpvar_36;
  lowp vec4 res_37;
  highp vec2 pblend_38;
  lowp float tmpvar_39;
  tmpvar_39 = c_35.w;
  pblend_38.x = tmpvar_39;
  lowp float tmpvar_40;
  tmpvar_40 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_38.y = tmpvar_40;
  highp vec4 tmpvar_41;
  tmpvar_41.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_41.w = max (pblend_38.x, pblend_38.y);
  res_37 = tmpvar_41;
  highp vec2 tmpvar_42;
  tmpvar_42 = max (((pblend_38 - res_37.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_43;
  tmpvar_43 = (tmpvar_42 / (tmpvar_42.x + tmpvar_42.y));
  pblend_38 = tmpvar_43;
  highp vec4 tmpvar_44;
  tmpvar_44.w = 0.0;
  tmpvar_44.xyz = (c_35.xyz * tmpvar_43.x);
  tmpvar_36 = tmpvar_44;
  gl_FragData[0] = tmpvar_36;
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
out highp vec4 xlv_TEXCOORD3;
out mediump vec3 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
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
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in mediump vec3 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize(xlv_TEXCOORD4);
  lightDir_1 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 c_34;
  c_34.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), lightDir_1)) * (texture (_LightTextureB0, vec2(tmpvar_33)).w * texture (_LightTexture0, xlv_TEXCOORD5).w)) * 2.0));
  c_34.w = tmpvar_2;
  lowp vec4 tmpvar_35;
  lowp vec4 res_36;
  highp vec2 pblend_37;
  lowp float tmpvar_38;
  tmpvar_38 = c_34.w;
  pblend_37.x = tmpvar_38;
  lowp float tmpvar_39;
  tmpvar_39 = textureProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_37.y = tmpvar_39;
  highp vec4 tmpvar_40;
  tmpvar_40.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_40.w = max (pblend_37.x, pblend_37.y);
  res_36 = tmpvar_40;
  highp vec2 tmpvar_41;
  tmpvar_41 = max (((pblend_37 - res_36.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_42;
  tmpvar_42 = (tmpvar_41 / (tmpvar_41.x + tmpvar_41.y));
  pblend_37 = tmpvar_42;
  highp vec4 tmpvar_43;
  tmpvar_43.w = 0.0;
  tmpvar_43.xyz = (c_34.xyz * tmpvar_42.x);
  tmpvar_35 = tmpvar_43;
  _glesFragData[0] = tmpvar_35;
}



#endif"
}
SubProgram "opengl " {
// Stats: 34 math
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
PARAM c[23] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, -vertex.normal.zxyw, c[0].zyzw;
MAD R1.xyz, vertex.normal.yzxw, c[0].yzzw, R0;
MOV R0, c[17];
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
DP4 R0.zw, vertex.position, c[4];
DP3 result.texcoord[4].y, R3, -R2;
DP4 R0.y, vertex.position, c[2];
DP4 R0.x, vertex.position, c[1];
DP3 result.texcoord[4].x, R3, R1;
ADD R2.xy, R0.z, R0;
MUL R1.xy, R2, c[0].x;
DP4 R1.z, vertex.position, c[3];
MOV R1.w, R0.z;
DP4 R2.w, vertex.position, c[8];
DP4 R2.z, vertex.position, c[7];
DP4 R2.x, vertex.position, c[5];
DP4 R2.y, vertex.position, c[6];
DP3 result.texcoord[4].z, vertex.normal, R3;
MOV result.texcoord[3], R1;
DP4 result.texcoord[5].y, R2, c[14];
DP4 result.texcoord[5].x, R2, c[13];
MOV result.position.w, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MOV result.position.z, R1;
MOV result.position.y, R0;
MOV result.position.x, R0;
END
# 34 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 37 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_ScreenParams]
Vector 17 [_WorldSpaceLightPos0]
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
def c23, 0.50000000, 0.00000000, 1.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r0.xyz, -v2.zxyw, c23.yzyw
mad r2.xyz, v2.yzxw, c23.zyyw, r0
mul r1.xyz, v2.zxyw, r2.yzxw
mad r3.xyz, v2.yzxw, r2.zxyw, -r1
mov r1, c8
dp4 r4.x, c17, r1
mov r0, c10
dp4 r4.z, c17, r0
mov r0, c9
dp4 r4.y, c17, r0
dp3 o5.y, r4, -r3
dp4 r0.zw, v0, c3
dp4 r1.xy, v0, c1
dp4 r0.x, v0, c0
dp3 o5.x, r4, r2
dp4 r2.z, v0, c2
mov r0.y, -r1.x
mad r1.zw, r0.z, c16, r0.xyxy
dp4 r3.w, v0, c7
dp4 r3.z, v0, c6
dp4 r3.x, v0, c4
dp4 r3.y, v0, c5
mul r2.xy, r1.zwzw, c23.x
mov r2.w, r0.z
dp3 o5.z, v2, r4
mov o4, r2
dp4 o6.y, r3, c13
dp4 o6.x, r3, c12
mov o0.w, r0
mov o0.y, r1
mad o1.zw, v3.xyxy, c19.xyxy, c19
mad o1.xy, v3, c18, c18.zwzw
mad o2.zw, v3.xyxy, c21.xyxy, c21
mad o2.xy, v3, c20, c20.zwzw
mad o3.xy, v3, c22, c22.zwzw
mov o0.z, r2
mov o0.x, r0
"
}
SubProgram "d3d11 " {
// Stats: 30 math
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
eefiecedlblolcaobdkbnbpjilannpieonafkmieabaaaaaafaahaaaaadaaaaaa
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
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcieafaaaaeaaaabaagbabaaaafjaaaaaeegiocaaaaaaaaaaa
anaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
beaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
mccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
giaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaajaaaaaa
kgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaa
acaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaa
alaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
anaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadiaaaaai
dcaabaaaacaaaaaafgafbaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaak
dcaabaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaabaaaaaaegaabaaa
acaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaa
abaaaaaaegaabaaaabaaaaaadcaaaaakmccabaaaadaaaaaaagiecaaaaaaaaaaa
agaaaaaapgapbaaaabaaaaaaagaebaaaabaaaaaadcaaaaaldccabaaaadaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaa
dcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaialp
aaaaaaaaaaaaaaaapgapbaaaaaaaaaaadgaaaaafmccabaaaaeaaaaaakgaobaaa
aaaaaaaadiaaaaakdccabaaaaeaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadiaaaaakhcaabaaaaaaaaaaaegbcbaaaacaaaaaa
aceaaaaaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaadcaaaaanhcaabaaaaaaaaaaa
cgbjbaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadpaaaaaaaaegacbaia
ebaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaaaaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaajgaebaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaa
aaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
acaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabdaaaaaa
pgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaaicccabaaaafaaaaaa
egacbaiaebaaaaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaafaaaaaa
egbcbaaaacaaaaaaegacbaaaacaaaaaaapaaaaahbccabaaaafaaaaaacgakbaaa
aaaaaaaaegaabaaaacaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  lightDir_1 = xlv_TEXCOORD4;
  lowp vec4 c_32;
  c_32.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), lightDir_1)) * texture2D (_LightTexture0, xlv_TEXCOORD5).w) * 2.0));
  c_32.w = tmpvar_2;
  lowp vec4 tmpvar_33;
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp float tmpvar_36;
  tmpvar_36 = c_32.w;
  pblend_35.x = tmpvar_36;
  lowp float tmpvar_37;
  tmpvar_37 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_35.y = tmpvar_37;
  highp vec4 tmpvar_38;
  tmpvar_38.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_38.w = max (pblend_35.x, pblend_35.y);
  res_34 = tmpvar_38;
  highp vec2 tmpvar_39;
  tmpvar_39 = max (((pblend_35 - res_34.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_40;
  tmpvar_40 = (tmpvar_39 / (tmpvar_39.x + tmpvar_39.y));
  pblend_35 = tmpvar_40;
  highp vec4 tmpvar_41;
  tmpvar_41.w = 0.0;
  tmpvar_41.xyz = (c_32.xyz * tmpvar_40.x);
  tmpvar_33 = tmpvar_41;
  gl_FragData[0] = tmpvar_33;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  lightDir_1 = xlv_TEXCOORD4;
  lowp vec4 c_33;
  c_33.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (normal_32, lightDir_1)) * texture2D (_LightTexture0, xlv_TEXCOORD5).w) * 2.0));
  c_33.w = tmpvar_2;
  lowp vec4 tmpvar_34;
  lowp vec4 res_35;
  highp vec2 pblend_36;
  lowp float tmpvar_37;
  tmpvar_37 = c_33.w;
  pblend_36.x = tmpvar_37;
  lowp float tmpvar_38;
  tmpvar_38 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_36.y = tmpvar_38;
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_39.w = max (pblend_36.x, pblend_36.y);
  res_35 = tmpvar_39;
  highp vec2 tmpvar_40;
  tmpvar_40 = max (((pblend_36 - res_35.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_41;
  tmpvar_41 = (tmpvar_40 / (tmpvar_40.x + tmpvar_40.y));
  pblend_36 = tmpvar_41;
  highp vec4 tmpvar_42;
  tmpvar_42.w = 0.0;
  tmpvar_42.xyz = (c_33.xyz * tmpvar_41.x);
  tmpvar_34 = tmpvar_42;
  gl_FragData[0] = tmpvar_34;
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
out highp vec4 xlv_TEXCOORD3;
out mediump vec3 xlv_TEXCOORD4;
out highp vec2 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_5.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_5.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_5.xyz;
  tmpvar_9 = (((tmpvar_1.yzx * tmpvar_5.zxy) - (tmpvar_1.zxy * tmpvar_5.yzx)) * -1.0);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_1.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_1.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_1.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in mediump vec3 xlv_TEXCOORD4;
in highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  lightDir_1 = xlv_TEXCOORD4;
  lowp vec4 c_32;
  c_32.xyz = ((col_4 * _LightColor0.xyz) * ((max (0.0, dot (((tmpvar_30.xyz * 2.0) - 1.0), lightDir_1)) * texture (_LightTexture0, xlv_TEXCOORD5).w) * 2.0));
  c_32.w = tmpvar_2;
  lowp vec4 tmpvar_33;
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp float tmpvar_36;
  tmpvar_36 = c_32.w;
  pblend_35.x = tmpvar_36;
  lowp float tmpvar_37;
  tmpvar_37 = textureProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_35.y = tmpvar_37;
  highp vec4 tmpvar_38;
  tmpvar_38.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_38.w = max (pblend_35.x, pblend_35.y);
  res_34 = tmpvar_38;
  highp vec2 tmpvar_39;
  tmpvar_39 = max (((pblend_35 - res_34.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_40;
  tmpvar_40 = (tmpvar_39 / (tmpvar_39.x + tmpvar_39.y));
  pblend_35 = tmpvar_40;
  highp vec4 tmpvar_41;
  tmpvar_41.w = 0.0;
  tmpvar_41.xyz = (c_32.xyz * tmpvar_40.x);
  tmpvar_33 = tmpvar_41;
  _glesFragData[0] = tmpvar_33;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 74 math, 11 textures
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
SetTexture 10 [_GrabTexture] 2D 10
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
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R0.w, R2, R0;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R5.y, R2.z, R1.w;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
MAX R1.w, R0, R5.y;
ADD R3.w, R2.y, R3;
MOV R5.z, R5.y;
ADD R5.x, R2, R4.w;
MAX R1.w, R3, R1;
MAX R1.w, R5.x, R1;
MOV R5.w, R0;
MOV R5.y, R3.w;
ADD R5, R5, -R1.w;
ADD R5, R5, c[1].x;
MAX R5, R5, c[2].y;
ADD R0.w, R5.x, R5.y;
ADD R0.w, R5.z, R0;
ADD R0.w, R5, R0;
RCP R0.w, R0.w;
MUL R5, R5, R0.w;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
DP4 R0.w, R2, c[2].x;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[2].z;
MAD R2.xy, R0.w, R6, c[2].z;
MAD R2.xy, R2.yxzw, c[2].w, -c[2].x;
MUL R2.zw, R2.xyxy, R2.xyxy;
ADD_SAT R0.w, R2.z, R2;
DP3 R2.z, fragment.texcoord[4], fragment.texcoord[4];
RSQ R2.w, R2.z;
ADD R0.w, -R0, c[2].x;
RSQ R0.w, R0.w;
RCP R2.z, R0.w;
MUL R6.xyz, R2.w, fragment.texcoord[4];
DP3 R2.x, R2, R6;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
TEX R0.w, R0.w, texture[9], 2D;
MAX R2.x, R2, c[2].y;
MUL R2.w, R2.x, R0;
MUL R2.xyz, R5.y, R3;
MUL R3.xyz, R5.x, R4;
ADD R2.xyz, R3, R2;
MUL R1.xyz, R5.z, R1;
ADD R1.xyz, R2, R1;
TXP R0.w, fragment.texcoord[3], texture[10], 2D;
MUL R2.x, R1.w, c[2].z;
MAX R1.w, R0, R2.x;
MOV R2.y, R0.w;
ADD R2.xy, R2, -R1.w;
MOV R0.w, c[2].z;
MAD R3.xy, R0.w, c[1].x, R2;
MUL R2.xyz, R5.w, R0;
MAX R0.xy, R3, c[2].y;
ADD R0.y, R0.x, R0;
RCP R0.y, R0.y;
ADD R1.xyz, R1, R2;
MUL R1.xyz, R1, c[0];
MUL R0.w, R0.x, R0.y;
MUL R1.xyz, R2.w, R1;
MUL R0.xyz, R1, c[2].w;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].y;
END
# 74 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 63 math, 11 textures
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
SetTexture 10 [_GrabTexture] 2D 10
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
def c2, 1.00000000, 0.00000000, -0.50000000, 2.00000000
def c3, 2.00000000, -1.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
texld r0, v0, s0
texld r1, v2, s4
add_pp r5.y, r0.w, r1.w
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r3, v1, s2
texld r4, v0.zwzw, s1
add_pp r5.x, r0, r4.w
max r1.w, r5.y, r2
add_pp r3.w, r0.y, r3
mov r5.w, r5.y
max r1.w, r3, r1
max r1.w, r5.x, r1
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
add_pp r6.xy, r6.xzzw, r6.ywzw
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c2.z
mad_pp r0.xy, r0.x, r6, c3.z
mad_pp r6.xy, r0.yxzw, c3.x, c3.y
mul_pp r0.xy, r6, r6
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c2
rsq_pp r0.x, r0.x
rcp_pp r6.z, r0.x
dp3_pp r0.y, v4, v4
rsq_pp r0.y, r0.y
mul_pp r0.yzw, r0.y, v4.xxyz
dp3_pp r0.y, r6, r0.yzww
dp3 r0.x, v5, v5
texldp r0.w, v3, s10
texld r0.x, r0.x, s9
max_pp r0.y, r0, c2
mul_pp r2.w, r0.y, r0.x
mul r0.xyz, r5.z, r2
mul r2.xyz, r5.y, r3
mul r3.xyz, r5.x, r4
add_pp r2.xyz, r3, r2
add_pp r0.xyz, r2, r0
mul r2.x, r1.w, c3.z
max r1.w, r0, r2.x
mov r2.y, r0.w
add r2.xy, r2, -r1.w
mov r0.w, c1.x
mad r3.xy, c3.z, r0.w, r2
mul r2.xyz, r5.w, r1
max r1.xy, r3, c2.y
add_pp r0.xyz, r0, r2
add r0.w, r1.x, r1.y
mul_pp r0.xyz, r0, c0
rcp r0.w, r0.w
mul_pp r0.xyz, r2.w, r0
mul r0.w, r1.x, r0
mul_pp r0.xyz, r0, c2.w
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c2.y
"
}
SubProgram "d3d11 " {
// Stats: 48 math, 11 textures
Keywords { "POINT" }
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
SetTexture 10 [_GrabTexture] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedeladljdkilemfaigkhhoffgggecldhonabaaaaaaiiakaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfaajaaaaeaaaaaaafeacaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafkaaaaad
aagabaaaajaaaaaafkaaaaadaagabaaaakaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaa
ffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaa
ffffaaaafibiaaaeaahabaaaajaaaaaaffffaaaafibiaaaeaahabaaaakaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
dcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacakaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaa
eghobaaaahaaaaaaaagabaaaajaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaa
abaaaaaaeghobaaaafaaaaaaaagabaaaahaaaaaaefaaaaajpcaabaaaadaaaaaa
egbabaaaacaaaaaaeghobaaaagaaaaaaaagabaaaaiaaaaaaefaaaaajpcaabaaa
aeaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaaefaaaaaj
pcaabaaaafaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
aaaaaaahecaabaaaagaaaaaadkaabaaaaeaaaaaackaabaaaafaaaaaaefaaaaaj
pcaabaaaahaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaa
aaaaaaahicaabaaaagaaaaaadkaabaaaafaaaaaadkaabaaaahaaaaaadeaaaaah
icaabaaaaaaaaaaadkaabaaaagaaaaaackaabaaaagaaaaaaefaaaaajpcaabaaa
aiaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaah
ccaabaaaagaaaaaabkaabaaaafaaaaaadkaabaaaaiaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaabkaabaaaagaaaaaaefaaaaajpcaabaaaajaaaaaa
ogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaaaaaaaaahbcaabaaa
agaaaaaaakaabaaaafaaaaaadkaabaaaajaaaaaabbaaaaakbcaabaaaabaaaaaa
egaobaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdeaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaagaaaaaaaaaaaaaipcaabaaa
afaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaaagaaaaaadiaaaaahbcaabaaa
agaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaaipcaabaaaafaaaaaa
egaobaaaafaaaaaaagiacaaaaaaaaaaaahaaaaaadeaaaaakpcaabaaaafaaaaaa
egaobaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaabkaabaaaafaaaaaaakaabaaaafaaaaaaaaaaaaahicaabaaa
aaaaaaaackaabaaaafaaaaaadkaabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaafaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaaafaaaaaaegaobaaa
afaaaaaapgapbaaaaaaaaaaadiaaaaahfcaabaaaacaaaaaapganbaaaadaaaaaa
fgafbaaaafaaaaaadcaaaaajdcaabaaaacaaaaaaagaabaaaafaaaaaahgapbaaa
acaaaaaaigaabaaaacaaaaaadcaaaaajgcaabaaaabaaaaaakgakbaaaafaaaaaa
pganbaaaabaaaaaaagabbaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
adaaaaaaeghobaaaaiaaaaaaaagabaaaakaaaaaadcaaaaajgcaabaaaabaaaaaa
pgapbaaaafaaaaaapganbaaaacaaaaaafgagbaaaabaaaaaaaaaaaaakgcaabaaa
abaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaaaa
dcaaaaamdcaabaaaabaaaaaaagaabaaaabaaaaaajgafbaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaadcaaaaapdcaabaaaabaaaaaaegaabaaa
abaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaabaaaaaa
egaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
agaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaa
eghobaaaajaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaa
aaaaaaaaagaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaaiaaaaaa
fgafbaaaafaaaaaadcaaaaajocaabaaaaaaaaaaaagaabaaaafaaaaaaagajbaaa
ajaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaakgakbaaaafaaaaaa
agajbaaaaeaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaa
afaaaaaaagajbaaaahaaaaaafgaobaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
aeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaakaaaaaaaagabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
abaaaaaaakaabaaaagaaaaaadgaaaaafccaabaaaagaaaaaadkaabaaaabaaaaaa
aaaaaaaidcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegaabaaaagaaaaaa
dcaaaaandcaabaaaabaaaaaaagiacaaaaaaaaaaaahaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaegaabaaaabaaaaaadeaaaaakdcaabaaaabaaaaaa
egaabaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaaaoaaaaahicaabaaa
aaaaaaaaakaabaaaabaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
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
// Stats: 68 math, 10 textures
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
SetTexture 9 [_GrabTexture] 2D 9
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
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R0.z, R2;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R0, R4.w;
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
DP4 R0.x, R0, c[2].x;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6.xzzw, R6.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[2].z;
MAD R0.xy, R0.x, R6, c[2].z;
MAD R0.xy, R0.yxzw, c[2].w, -c[2].x;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[2].x;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R0.x, R0, fragment.texcoord[4];
MAX R0.w, R0.x, c[2].y;
MUL R0.xyz, R5.z, R2;
MUL R2.xyz, R5.y, R3;
MUL R3.xyz, R5.x, R4;
ADD R2.xyz, R3, R2;
ADD R0.xyz, R2, R0;
MUL R2.x, R1.w, c[2].z;
TXP R1.w, fragment.texcoord[3], texture[9], 2D;
MAX R2.z, R1.w, R2.x;
MOV R2.y, R1.w;
ADD R2.xy, R2, -R2.z;
MOV R1.w, c[2].z;
MAD R3.xy, R1.w, c[1].x, R2;
MUL R2.xyz, R5.w, R1;
MAX R1.xy, R3, c[2].y;
ADD R0.xyz, R0, R2;
ADD R1.y, R1.x, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0.w, R0;
RCP R1.y, R1.y;
MUL R0.w, R1.x, R1.y;
MUL R0.xyz, R0, c[2].w;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].y;
END
# 68 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 58 math, 10 textures
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
SetTexture 9 [_GrabTexture] 2D 9
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
def c2, 1.00000000, 0.00000000, -0.50000000, 2.00000000
def c3, 2.00000000, -1.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
texld r0, v0, s0
texld r1, v2, s4
add_pp r5.y, r0.w, r1.w
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r3, v1, s2
texld r4, v0.zwzw, s1
add_pp r5.x, r0, r4.w
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
dp4_pp r0.x, r0, c2.x
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6.xzzw, r6.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c2.z
mad_pp r0.xy, r0.x, r6, c3.z
mad_pp r0.xy, r0.yxzw, c3.x, c3.y
mul_pp r0.zw, r0.xyxy, r0.xyxy
add_pp_sat r0.z, r0, r0.w
add_pp r0.z, -r0, c2.x
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.x, r0, v4
max_pp r0.w, r0.x, c2.y
mul r0.xyz, r5.z, r2
mul r2.xyz, r5.y, r3
mul r3.xyz, r5.x, r4
add_pp r2.xyz, r3, r2
add_pp r0.xyz, r2, r0
mul r2.x, r1.w, c3.z
texldp r1.w, v3, s9
max r2.z, r1.w, r2.x
mov r2.y, r1.w
add r2.xy, r2, -r2.z
mov r1.w, c1.x
mad r3.xy, c3.z, r1.w, r2
mul r2.xyz, r5.w, r1
max r1.xy, r3, c2.y
add_pp r0.xyz, r0, r2
add r1.y, r1.x, r1
mul_pp r0.xyz, r0, c0
mul_pp r0.xyz, r0.w, r0
rcp r1.y, r1.y
mul r0.w, r1.x, r1.y
mul_pp r0.xyz, r0, c2.w
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c2.y
"
}
SubProgram "d3d11 " {
// Stats: 44 math, 10 textures
Keywords { "DIRECTIONAL" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_Normal0] 2D 6
SetTexture 6 [_Normal1] 2D 7
SetTexture 7 [_Normal2] 2D 8
SetTexture 8 [_Normal3] 2D 9
SetTexture 9 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedgcmcliiepfigdddaofoonkmhhciipibiabaaaaaalmajaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjmaiaaaa
eaaaaaaachacaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaa
aiaaaaaafkaaaaadaagabaaaajaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
fibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaa
fibiaaaeaahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaa
fibiaaaeaahabaaaajaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacajaaaaaa
efaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaaeghobaaaahaaaaaaaagabaaa
aiaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaa
aagabaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaa
agaaaaaaaagabaaaahaaaaaaefaaaaajpcaabaaaadaaaaaaogbkbaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaahecaabaaaafaaaaaa
dkaabaaaadaaaaaackaabaaaaeaaaaaaefaaaaajpcaabaaaagaaaaaaegbabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaahicaabaaaafaaaaaa
dkaabaaaaeaaaaaadkaabaaaagaaaaaadeaaaaahbcaabaaaaaaaaaaadkaabaaa
afaaaaaackaabaaaafaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaahccaabaaaafaaaaaabkaabaaa
aeaaaaaadkaabaaaahaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaaaafaaaaaaefaaaaajpcaabaaaaiaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaacaaaaaaaaaaaaahbcaabaaaafaaaaaaakaabaaaaeaaaaaa
dkaabaaaaiaaaaaabbaaaaakecaabaaaaaaaaaaaegaobaaaaeaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpdeaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaafaaaaaaaaaaaaaipcaabaaaaeaaaaaaagaabaiaebaaaaaa
aaaaaaaaegaobaaaafaaaaaadiaaaaahbcaabaaaafaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaadpaaaaaaaipcaabaaaaeaaaaaaegaobaaaaeaaaaaaagiacaaa
aaaaaaaaadaaaaaadeaaaaakpcaabaaaaeaaaaaaegaobaaaaeaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaa
aeaaaaaaakaabaaaaeaaaaaaaaaaaaahbcaabaaaaaaaaaaackaabaaaaeaaaaaa
akaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaadkaabaaaaeaaaaaaakaabaaa
aaaaaaaaaoaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaagaabaaaaaaaaaaa
diaaaaahfcaabaaaabaaaaaapganbaaaacaaaaaafgafbaaaaeaaaaaadcaaaaaj
dcaabaaaabaaaaaaagaabaaaaeaaaaaahgapbaaaabaaaaaaigaabaaaabaaaaaa
dcaaaaajdcaabaaaaaaaaaaakgakbaaaaeaaaaaahgapbaaaaaaaaaaaegaabaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaaiaaaaaa
aagabaaaajaaaaaadcaaaaajdcaabaaaaaaaaaaapgapbaaaaeaaaaaahgapbaaa
abaaaaaaegaabaaaaaaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadcaaaaamdcaabaaaaaaaaaaa
kgakbaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadcaaaaapdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaafaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahocaabaaaaaaaaaaaagajbaaaahaaaaaafgafbaaaaeaaaaaadcaaaaaj
ocaabaaaaaaaaaaaagaabaaaaeaaaaaaagajbaaaaiaaaaaafgaobaaaaaaaaaaa
dcaaaaajocaabaaaaaaaaaaakgakbaaaaeaaaaaaagajbaaaadaaaaaafgaobaaa
aaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaaaeaaaaaaagajbaaaagaaaaaa
fgaobaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaa
aaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaajaaaaaaaagabaaa
aaaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaafaaaaaa
dgaaaaafccaabaaaafaaaaaadkaabaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegaabaaaafaaaaaadcaaaaandcaabaaaabaaaaaa
agiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
egaabaaaabaaaaaadeaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaaaoaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaa
dkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 79 math, 12 textures
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
SetTexture 11 [_GrabTexture] 2D 11
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
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R0.w, R2, R0;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R1.w, R2.z, R1;
MAX R5.x, R0.w, R1.w;
ADD R5.y, R2, R3.w;
MOV R5.z, R1.w;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
MAX R3.w, R5.y, R5.x;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R2, R4.w;
MAX R3.w, R5.x, R3;
MOV R5.w, R0;
ADD R5, R5, -R3.w;
ADD R5, R5, c[1].x;
MAX R5, R5, c[2].y;
ADD R0.w, R5.x, R5.y;
ADD R0.w, R5.z, R0;
ADD R0.w, R5, R0;
RCP R0.w, R0.w;
MUL R5, R5, R0.w;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
DP4 R0.w, R2, c[2].x;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[2].z;
MAD R2.xy, R0.w, R6, c[2].z;
MAD R2.xy, R2.yxzw, c[2].w, -c[2].x;
MUL R2.zw, R2.xyxy, R2.xyxy;
ADD_SAT R0.w, R2.z, R2;
RSQ R1.w, R1.w;
MUL R6.xyz, R1.w, fragment.texcoord[4];
ADD R0.w, -R0, c[2].x;
RSQ R0.w, R0.w;
RCP R2.z, R0.w;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
DP3 R2.z, R2, R6;
RCP R0.w, fragment.texcoord[5].w;
MAD R2.xy, fragment.texcoord[5], R0.w, c[2].z;
TEX R0.w, R2, texture[9], 2D;
SLT R2.x, c[2].y, fragment.texcoord[5].z;
MUL R0.w, R2.x, R0;
TEX R1.w, R1.w, texture[10], 2D;
MUL R1.w, R0, R1;
MAX R0.w, R2.z, c[2].y;
MUL R1.w, R0, R1;
MUL R2.xyz, R5.y, R3;
MUL R3.xyz, R5.x, R4;
ADD R2.xyz, R3, R2;
MUL R1.xyz, R5.z, R1;
ADD R1.xyz, R2, R1;
TXP R0.w, fragment.texcoord[3], texture[11], 2D;
MUL R2.x, R3.w, c[2].z;
MAX R2.z, R0.w, R2.x;
MOV R2.y, R0.w;
ADD R2.xy, R2, -R2.z;
MOV R0.w, c[2].z;
MAD R3.xy, R0.w, c[1].x, R2;
MUL R2.xyz, R5.w, R0;
MAX R0.xy, R3, c[2].y;
ADD R0.y, R0.x, R0;
RCP R0.y, R0.y;
ADD R1.xyz, R1, R2;
MUL R1.xyz, R1, c[0];
MUL R0.w, R0.x, R0.y;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R1, c[2].w;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].y;
END
# 79 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 68 math, 12 textures
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
SetTexture 11 [_GrabTexture] 2D 11
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
def c2, 1.00000000, 0.00000000, -0.50000000, 2.00000000
def c3, 2.00000000, -1.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
texld r0, v0, s0
texld r1, v2, s4
add_pp r5.y, r0.w, r1.w
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r3, v1, s2
texld r4, v0.zwzw, s1
add_pp r5.x, r0, r4.w
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
dp4_pp r0.x, r0, c2.x
mad_pp r0.xy, r0.x, r6, c3.z
mad_pp r0.xy, r0.yxzw, c3.x, c3.y
mul_pp r0.zw, r0.xyxy, r0.xyxy
add_pp_sat r0.z, r0, r0.w
add_pp r0.z, -r0, c2.x
dp3_pp r0.w, v4, v4
rsq_pp r0.w, r0.w
mul_pp r6.xyz, r0.w, v4
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.y, r0, r6
rcp r0.w, v5.w
mad r6.xy, v5, r0.w, c3.z
dp3 r0.x, v5, v5
texld r0.w, r6, s9
cmp r0.z, -v5, c2.y, c2.x
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s10
mul_pp r0.z, r0, r0.x
max_pp r0.x, r0.y, c2.y
mul_pp r2.w, r0.x, r0.z
mul r0.xyz, r5.z, r2
mul r2.xyz, r5.y, r3
mul r3.xyz, r5.x, r4
add_pp r2.xyz, r3, r2
add_pp r0.xyz, r2, r0
texldp r0.w, v3, s11
mul r2.x, r1.w, c3.z
max r1.w, r0, r2.x
mov r2.y, r0.w
add r2.xy, r2, -r1.w
mov r0.w, c1.x
mad r3.xy, c3.z, r0.w, r2
mul r2.xyz, r5.w, r1
max r1.xy, r3, c2.y
add_pp r0.xyz, r0, r2
add r0.w, r1.x, r1.y
mul_pp r0.xyz, r0, c0
rcp r0.w, r0.w
mul_pp r0.xyz, r2.w, r0
mul r0.w, r1.x, r0
mul_pp r0.xyz, r0, c2.w
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c2.y
"
}
SubProgram "d3d11 " {
// Stats: 54 math, 12 textures
Keywords { "SPOT" }
SetTexture 0 [_Control] 2D 3
SetTexture 1 [_Splat0] 2D 4
SetTexture 2 [_Splat1] 2D 5
SetTexture 3 [_Splat2] 2D 6
SetTexture 4 [_Splat3] 2D 7
SetTexture 5 [_Normal0] 2D 8
SetTexture 6 [_Normal1] 2D 9
SetTexture 7 [_Normal2] 2D 10
SetTexture 8 [_Normal3] 2D 11
SetTexture 9 [_LightTexture0] 2D 0
SetTexture 10 [_LightTextureB0] 2D 1
SetTexture 11 [_GrabTexture] 2D 2
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedcleemgjpfcgcnocjkahmgdjecbjlpnnnabaaaaaahmalaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceeakaaaaeaaaaaaajbacaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafkaaaaad
aagabaaaajaaaaaafkaaaaadaagabaaaakaaaaaafkaaaaadaagabaaaalaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaa
fibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaa
fibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaaeaahabaaaajaaaaaaffffaaaa
fibiaaaeaahabaaaakaaaaaaffffaaaafibiaaaeaahabaaaalaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaa
adaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaad
pcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacakaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaakdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaajaaaaaaaagabaaa
aaaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaaagaaaaaa
abaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaah
bcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaa
aaaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaeghobaaaakaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaaahaaaaaaaagabaaa
akaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaa
aagabaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaacaaaaaaeghobaaa
agaaaaaaaagabaaaajaaaaaaefaaaaajpcaabaaaaeaaaaaaogbkbaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaagaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaadaaaaaaaaaaaaahecaabaaaagaaaaaa
dkaabaaaaeaaaaaackaabaaaafaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaahaaaaaaaaaaaaahicaabaaaagaaaaaa
dkaabaaaafaaaaaadkaabaaaahaaaaaadeaaaaahbcaabaaaabaaaaaadkaabaaa
agaaaaaackaabaaaagaaaaaaefaaaaajpcaabaaaaiaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaafaaaaaaaaaaaaahccaabaaaagaaaaaabkaabaaa
afaaaaaadkaabaaaaiaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
bkaabaaaagaaaaaaefaaaaajpcaabaaaajaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaaeaaaaaaaaaaaaahbcaabaaaagaaaaaaakaabaaaafaaaaaa
dkaabaaaajaaaaaabbaaaaakecaabaaaabaaaaaaegaobaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpdeaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaaakaabaaaagaaaaaaaaaaaaaipcaabaaaafaaaaaaagaabaiaebaaaaaa
abaaaaaaegaobaaaagaaaaaadiaaaaahbcaabaaaagaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaadpaaaaaaaipcaabaaaafaaaaaaegaobaaaafaaaaaaagiacaaa
aaaaaaaaahaaaaaadeaaaaakpcaabaaaafaaaaaaegaobaaaafaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahbcaabaaaabaaaaaabkaabaaa
afaaaaaaakaabaaaafaaaaaaaaaaaaahbcaabaaaabaaaaaackaabaaaafaaaaaa
akaabaaaabaaaaaaaaaaaaahbcaabaaaabaaaaaadkaabaaaafaaaaaaakaabaaa
abaaaaaaaoaaaaahpcaabaaaafaaaaaaegaobaaaafaaaaaaagaabaaaabaaaaaa
diaaaaahfcaabaaaacaaaaaapganbaaaadaaaaaafgafbaaaafaaaaaadcaaaaaj
dcaabaaaacaaaaaaagaabaaaafaaaaaahgapbaaaacaaaaaaigaabaaaacaaaaaa
dcaaaaajdcaabaaaabaaaaaakgakbaaaafaaaaaahgapbaaaabaaaaaaegaabaaa
acaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaadaaaaaaeghobaaaaiaaaaaa
aagabaaaalaaaaaadcaaaaajdcaabaaaabaaaaaapgapbaaaafaaaaaahgapbaaa
acaaaaaaegaabaaaabaaaaaaaaaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadcaaaaamdcaabaaaabaaaaaa
kgakbaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadcaaaaapdcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaabaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
abaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
abaaaaaadkaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaa
jgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaa
diaaaaahocaabaaaaaaaaaaaagajbaaaaiaaaaaafgafbaaaafaaaaaadcaaaaaj
ocaabaaaaaaaaaaaagaabaaaafaaaaaaagajbaaaajaaaaaafgaobaaaaaaaaaaa
dcaaaaajocaabaaaaaaaaaaakgakbaaaafaaaaaaagajbaaaaeaaaaaafgaobaaa
aaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaaafaaaaaaagajbaaaahaaaaaa
fgaobaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaa
aaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaalaaaaaaaagabaaa
acaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaagaaaaaa
dgaaaaafccaabaaaagaaaaaadkaabaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegaabaaaagaaaaaadcaaaaandcaabaaaabaaaaaa
agiacaaaaaaaaaaaahaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
egaabaaaabaaaaaadeaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaaaoaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaa
dkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 75 math, 12 textures
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
SetTexture 11 [_GrabTexture] 2D 11
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
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R0.w, R2, R0;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R1.w, R2.z, R1;
MAX R5.x, R0.w, R1.w;
ADD R5.y, R2, R3.w;
MOV R5.z, R1.w;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
MAX R3.w, R5.y, R5.x;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R2, R4.w;
MAX R3.w, R5.x, R3;
MOV R5.w, R0;
ADD R5, R5, -R3.w;
ADD R5, R5, c[1].x;
MAX R5, R5, c[2].y;
ADD R0.w, R5.x, R5.y;
ADD R0.w, R5.z, R0;
ADD R0.w, R5, R0;
RCP R0.w, R0.w;
MUL R5, R5, R0.w;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
DP4 R0.w, R2, c[2].x;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[2].z;
MAD R2.xy, R0.w, R6, c[2].z;
MAD R2.xy, R2.yxzw, c[2].w, -c[2].x;
MUL R2.zw, R2.xyxy, R2.xyxy;
ADD_SAT R0.w, R2.z, R2;
RSQ R1.w, R1.w;
MUL R6.xyz, R1.w, fragment.texcoord[4];
ADD R0.w, -R0, c[2].x;
RSQ R0.w, R0.w;
RCP R2.z, R0.w;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
DP3 R2.x, R2, R6;
TEX R0.w, fragment.texcoord[5], texture[10], CUBE;
TEX R1.w, R1.w, texture[9], 2D;
MUL R1.w, R1, R0;
MAX R0.w, R2.x, c[2].y;
MUL R1.w, R0, R1;
MUL R2.xyz, R5.y, R3;
MUL R3.xyz, R5.x, R4;
ADD R2.xyz, R3, R2;
MUL R1.xyz, R5.z, R1;
ADD R1.xyz, R2, R1;
TXP R0.w, fragment.texcoord[3], texture[11], 2D;
MUL R2.x, R3.w, c[2].z;
MAX R2.z, R0.w, R2.x;
MOV R2.y, R0.w;
ADD R2.xy, R2, -R2.z;
MOV R0.w, c[2].z;
MAD R3.xy, R0.w, c[1].x, R2;
MUL R2.xyz, R5.w, R0;
MAX R0.xy, R3, c[2].y;
ADD R0.y, R0.x, R0;
RCP R0.y, R0.y;
ADD R1.xyz, R1, R2;
MUL R1.xyz, R1, c[0];
MUL R0.w, R0.x, R0.y;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R1, c[2].w;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].y;
END
# 75 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 64 math, 12 textures
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
SetTexture 11 [_GrabTexture] 2D 11
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
dcl_2d s11
def c2, 1.00000000, 0.00000000, -0.50000000, 2.00000000
def c3, 2.00000000, -1.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
texld r0, v0, s0
texld r1, v2, s4
add_pp r5.y, r0.w, r1.w
texld r2, v1.zwzw, s3
add_pp r2.w, r0.z, r2
texld r3, v1, s2
texld r4, v0.zwzw, s1
add_pp r5.x, r0, r4.w
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
dp4_pp r0.x, r0, c2.x
mad_pp r0.xy, r0.x, r6, c3.z
mad_pp r0.xy, r0.yxzw, c3.x, c3.y
mul_pp r0.zw, r0.xyxy, r0.xyxy
add_pp_sat r0.z, r0, r0.w
dp3_pp r0.w, v4, v4
rsq_pp r0.w, r0.w
mul_pp r6.xyz, r0.w, v4
add_pp r0.z, -r0, c2.x
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.y, r0, r6
dp3 r0.x, v5, v5
texld r0.w, v5, s10
texld r0.x, r0.x, s9
mul r0.z, r0.x, r0.w
max_pp r0.x, r0.y, c2.y
mul_pp r2.w, r0.x, r0.z
mul r0.xyz, r5.z, r2
mul r2.xyz, r5.y, r3
mul r3.xyz, r5.x, r4
add_pp r2.xyz, r3, r2
add_pp r0.xyz, r2, r0
texldp r0.w, v3, s11
mul r2.x, r1.w, c3.z
max r1.w, r0, r2.x
mov r2.y, r0.w
add r2.xy, r2, -r1.w
mov r0.w, c1.x
mad r3.xy, c3.z, r0.w, r2
mul r2.xyz, r5.w, r1
max r1.xy, r3, c2.y
add_pp r0.xyz, r0, r2
add r0.w, r1.x, r1.y
mul_pp r0.xyz, r0, c0
rcp r0.w, r0.w
mul_pp r0.xyz, r2.w, r0
mul r0.w, r1.x, r0
mul_pp r0.xyz, r0, c2.w
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c2.y
"
}
SubProgram "d3d11 " {
// Stats: 49 math, 12 textures
Keywords { "POINT_COOKIE" }
SetTexture 0 [_Control] 2D 3
SetTexture 1 [_Splat0] 2D 4
SetTexture 2 [_Splat1] 2D 5
SetTexture 3 [_Splat2] 2D 6
SetTexture 4 [_Splat3] 2D 7
SetTexture 5 [_Normal0] 2D 8
SetTexture 6 [_Normal1] 2D 9
SetTexture 7 [_Normal2] 2D 10
SetTexture 8 [_Normal3] 2D 11
SetTexture 9 [_LightTextureB0] 2D 1
SetTexture 10 [_LightTexture0] CUBE 0
SetTexture 11 [_GrabTexture] 2D 2
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedllbajgggcohjcnmloanoijaliceiimoeabaaaaaaoeakaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefckmajaaaaeaaaaaaaglacaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafkaaaaad
aagabaaaajaaaaaafkaaaaadaagabaaaakaaaaaafkaaaaadaagabaaaalaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaa
fibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaa
fibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaaeaahabaaaajaaaaaaffffaaaa
fidaaaaeaahabaaaakaaaaaaffffaaaafibiaaaeaahabaaaalaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaa
adaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaad
hcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacakaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaa
aaaaaaaaagaabaaaaaaaaaaaeghobaaaajaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbcbaaaagaaaaaaeghobaaaakaaaaaaaagabaaaaaaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaabaaaaaah
ccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agbjbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaa
ahaaaaaaaagabaaaakaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaa
eghobaaaafaaaaaaaagabaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaa
acaaaaaaeghobaaaagaaaaaaaagabaaaajaaaaaaefaaaaajpcaabaaaaeaaaaaa
ogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaaagaaaaaaefaaaaajpcaabaaa
afaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaadaaaaaaaaaaaaah
ecaabaaaagaaaaaadkaabaaaaeaaaaaackaabaaaafaaaaaaefaaaaajpcaabaaa
ahaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaahaaaaaaaaaaaaah
icaabaaaagaaaaaadkaabaaaafaaaaaadkaabaaaahaaaaaadeaaaaahbcaabaaa
abaaaaaadkaabaaaagaaaaaackaabaaaagaaaaaaefaaaaajpcaabaaaaiaaaaaa
egbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaafaaaaaaaaaaaaahccaabaaa
agaaaaaabkaabaaaafaaaaaadkaabaaaaiaaaaaadeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaagaaaaaaefaaaaajpcaabaaaajaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaaeaaaaaaaaaaaaahbcaabaaaagaaaaaa
akaabaaaafaaaaaadkaabaaaajaaaaaabbaaaaakecaabaaaabaaaaaaegaobaaa
afaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdeaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaakaabaaaagaaaaaaaaaaaaaipcaabaaaafaaaaaa
agaabaiaebaaaaaaabaaaaaaegaobaaaagaaaaaadiaaaaahbcaabaaaagaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaadpaaaaaaaipcaabaaaafaaaaaaegaobaaa
afaaaaaaagiacaaaaaaaaaaaahaaaaaadeaaaaakpcaabaaaafaaaaaaegaobaaa
afaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahbcaabaaa
abaaaaaabkaabaaaafaaaaaaakaabaaaafaaaaaaaaaaaaahbcaabaaaabaaaaaa
ckaabaaaafaaaaaaakaabaaaabaaaaaaaaaaaaahbcaabaaaabaaaaaadkaabaaa
afaaaaaaakaabaaaabaaaaaaaoaaaaahpcaabaaaafaaaaaaegaobaaaafaaaaaa
agaabaaaabaaaaaadiaaaaahfcaabaaaacaaaaaapganbaaaadaaaaaafgafbaaa
afaaaaaadcaaaaajdcaabaaaacaaaaaaagaabaaaafaaaaaahgapbaaaacaaaaaa
igaabaaaacaaaaaadcaaaaajdcaabaaaabaaaaaakgakbaaaafaaaaaahgapbaaa
abaaaaaaegaabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaadaaaaaa
eghobaaaaiaaaaaaaagabaaaalaaaaaadcaaaaajdcaabaaaabaaaaaapgapbaaa
afaaaaaahgapbaaaacaaaaaaegaabaaaabaaaaaaaaaaaaakdcaabaaaabaaaaaa
egaabaaaabaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadcaaaaam
dcaabaaaabaaaaaakgakbaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadcaaaaapdcaabaaaabaaaaaaegaabaaaabaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialp
aaaaaaaaaaaaaaaaapaaaaahicaabaaaabaaaaaaegaabaaaabaaaaaaegaabaaa
abaaaaaaddaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadp
aaaaaaaiicaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadp
elaaaaafecaabaaaabaaaaaadkaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egacbaaaabaaaaaajgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaa
agaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaaiaaaaaafgafbaaa
afaaaaaadcaaaaajocaabaaaaaaaaaaaagaabaaaafaaaaaaagajbaaaajaaaaaa
fgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaakgakbaaaafaaaaaaagajbaaa
aeaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaaafaaaaaa
agajbaaaahaaaaaafgaobaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaa
pgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaa
alaaaaaaaagabaaaacaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaa
akaabaaaagaaaaaadgaaaaafccaabaaaagaaaaaadkaabaaaabaaaaaaaaaaaaai
dcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegaabaaaagaaaaaadcaaaaan
dcaabaaaabaaaaaaagiacaaaaaaaaaaaahaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaaegaabaaaabaaaaaadeaaaaakdcaabaaaabaaaaaaegaabaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaa
aaaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaaaoaaaaahicaabaaaaaaaaaaa
akaabaaaabaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
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
// Stats: 70 math, 11 textures
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
SetTexture 10 [_GrabTexture] 2D 10
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
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R0.w, R2, R0;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R5.y, R2.z, R1.w;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
MAX R1.w, R0, R5.y;
ADD R3.w, R2.y, R3;
MOV R5.z, R5.y;
ADD R5.x, R2, R4.w;
MAX R1.w, R3, R1;
MAX R1.w, R5.x, R1;
MOV R5.w, R0;
MOV R5.y, R3.w;
ADD R5, R5, -R1.w;
ADD R5, R5, c[1].x;
MAX R5, R5, c[2].y;
ADD R0.w, R5.x, R5.y;
ADD R0.w, R5.z, R0;
ADD R0.w, R5, R0;
RCP R0.w, R0.w;
MUL R5, R5, R0.w;
TEX R7.yw, fragment.texcoord[1], texture[6], 2D;
TEX R6.yw, fragment.texcoord[0].zwzw, texture[5], 2D;
MUL R7.xy, R5.y, R7.ywzw;
MUL R6.xy, R5.x, R6.ywzw;
ADD R6.xz, R6.xyyw, R7.xyyw;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
DP4 R0.w, R2, c[2].x;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6.xzzw, R6.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[2].z;
MAD R2.xy, R0.w, R6, c[2].z;
MAD R2.xy, R2.yxzw, c[2].w, -c[2].x;
MUL R2.zw, R2.xyxy, R2.xyxy;
ADD_SAT R0.w, R2.z, R2;
ADD R0.w, -R0, c[2].x;
RSQ R0.w, R0.w;
RCP R2.z, R0.w;
DP3 R2.x, R2, fragment.texcoord[4];
TEX R0.w, fragment.texcoord[5], texture[9], 2D;
MAX R2.x, R2, c[2].y;
MUL R2.w, R2.x, R0;
MUL R2.xyz, R5.y, R3;
MUL R3.xyz, R5.x, R4;
ADD R2.xyz, R3, R2;
MUL R1.xyz, R5.z, R1;
ADD R1.xyz, R2, R1;
TXP R0.w, fragment.texcoord[3], texture[10], 2D;
MUL R2.x, R1.w, c[2].z;
MAX R1.w, R0, R2.x;
MOV R2.y, R0.w;
ADD R2.xy, R2, -R1.w;
MOV R0.w, c[2].z;
MAD R3.xy, R0.w, c[1].x, R2;
MUL R2.xyz, R5.w, R0;
MAX R0.xy, R3, c[2].y;
ADD R0.y, R0.x, R0;
RCP R0.y, R0.y;
ADD R1.xyz, R1, R2;
MUL R1.xyz, R1, c[0];
MUL R0.w, R0.x, R0.y;
MUL R1.xyz, R2.w, R1;
MUL R0.xyz, R1, c[2].w;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].y;
END
# 70 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 59 math, 11 textures
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
SetTexture 10 [_GrabTexture] 2D 10
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
def c2, 1.00000000, 0.00000000, -0.50000000, 2.00000000
def c3, 2.00000000, -1.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xy
texld r2, v0, s0
texld r0, v2, s4
add_pp r0.w, r2, r0
texld r1, v1.zwzw, s3
add_pp r5.y, r2.z, r1.w
texld r3, v1, s2
texld r4, v0.zwzw, s1
max r1.w, r0, r5.y
add_pp r3.w, r2.y, r3
mov r5.z, r5.y
add_pp r5.x, r2, r4.w
max r1.w, r3, r1
max r1.w, r5.x, r1
mov r5.w, r0
mov r5.y, r3.w
add r5, r5, -r1.w
add r5, r5, c1.x
max r5, r5, c2.y
add r0.w, r5.x, r5.y
add r0.w, r5.z, r0
add r0.w, r5, r0
rcp r0.w, r0.w
mul r5, r5, r0.w
texld r7.yw, v1, s6
texld r6.yw, v0.zwzw, s5
mul r7.xy, r5.y, r7.ywzw
mul r6.xy, r5.x, r6.ywzw
add_pp r6.xz, r6.xyyw, r7.xyyw
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
dp4_pp r0.w, r2, c2.x
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6.xzzw, r6.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c2.z
mad_pp r2.xy, r0.w, r6, c3.z
mad_pp r2.xy, r2.yxzw, c3.x, c3.y
mul_pp r2.zw, r2.xyxy, r2.xyxy
add_pp_sat r0.w, r2.z, r2
add_pp r0.w, -r0, c2.x
rsq_pp r0.w, r0.w
rcp_pp r2.z, r0.w
dp3_pp r2.x, r2, v4
texld r0.w, v5, s9
max_pp r2.x, r2, c2.y
mul_pp r2.w, r2.x, r0
mul r2.xyz, r5.y, r3
mul r3.xyz, r5.x, r4
add_pp r2.xyz, r3, r2
mul r1.xyz, r5.z, r1
add_pp r1.xyz, r2, r1
texldp r0.w, v3, s10
mul r2.x, r1.w, c3.z
max r1.w, r0, r2.x
mov r2.y, r0.w
add r2.xy, r2, -r1.w
mov r0.w, c1.x
mad r3.xy, c3.z, r0.w, r2
mul r2.xyz, r5.w, r0
max r0.xy, r3, c2.y
add r0.y, r0.x, r0
rcp r0.y, r0.y
add_pp r1.xyz, r1, r2
mul_pp r1.xyz, r1, c0
mul r0.w, r0.x, r0.y
mul_pp r1.xyz, r2.w, r1
mul_pp r0.xyz, r1, c2.w
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c2.y
"
}
SubProgram "d3d11 " {
// Stats: 44 math, 11 textures
Keywords { "DIRECTIONAL_COOKIE" }
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
SetTexture 10 [_GrabTexture] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhhbhidocjmbofmpdlnokjhcjelkcbhdnabaaaaaacaakaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcoiaiaaaaeaaaaaaadkacaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafkaaaaad
aagabaaaajaaaaaafkaaaaadaagabaaaakaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaa
ffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaa
ffffaaaafibiaaaeaahabaaaajaaaaaaffffaaaafibiaaaeaahabaaaakaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
dcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacajaaaaaa
efaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaaeghobaaaahaaaaaaaagabaaa
ajaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaa
aagabaaaahaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaa
agaaaaaaaagabaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaogbkbaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaahecaabaaaafaaaaaa
dkaabaaaadaaaaaackaabaaaaeaaaaaaefaaaaajpcaabaaaagaaaaaaegbabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaahicaabaaaafaaaaaa
dkaabaaaaeaaaaaadkaabaaaagaaaaaadeaaaaahbcaabaaaaaaaaaaadkaabaaa
afaaaaaackaabaaaafaaaaaaefaaaaajpcaabaaaahaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaahccaabaaaafaaaaaabkaabaaa
aeaaaaaadkaabaaaahaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaaaafaaaaaaefaaaaajpcaabaaaaiaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaadaaaaaaaaaaaaahbcaabaaaafaaaaaaakaabaaaaeaaaaaa
dkaabaaaaiaaaaaabbaaaaakecaabaaaaaaaaaaaegaobaaaaeaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpdeaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaafaaaaaaaaaaaaaipcaabaaaaeaaaaaaagaabaiaebaaaaaa
aaaaaaaaegaobaaaafaaaaaadiaaaaahbcaabaaaafaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaadpaaaaaaaipcaabaaaaeaaaaaaegaobaaaaeaaaaaaagiacaaa
aaaaaaaaahaaaaaadeaaaaakpcaabaaaaeaaaaaaegaobaaaaeaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaa
aeaaaaaaakaabaaaaeaaaaaaaaaaaaahbcaabaaaaaaaaaaackaabaaaaeaaaaaa
akaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaadkaabaaaaeaaaaaaakaabaaa
aaaaaaaaaoaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaagaabaaaaaaaaaaa
diaaaaahfcaabaaaabaaaaaapganbaaaacaaaaaafgafbaaaaeaaaaaadcaaaaaj
dcaabaaaabaaaaaaagaabaaaaeaaaaaahgapbaaaabaaaaaaigaabaaaabaaaaaa
dcaaaaajdcaabaaaaaaaaaaakgakbaaaaeaaaaaahgapbaaaaaaaaaaaegaabaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaaiaaaaaa
aagabaaaakaaaaaadcaaaaajdcaabaaaaaaaaaaapgapbaaaaeaaaaaahgapbaaa
abaaaaaaegaabaaaaaaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadcaaaaamdcaabaaaaaaaaaaa
kgakbaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadcaaaaapdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaafaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaaajaaaaaa
aagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaapgapbaaa
abaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaahaaaaaafgafbaaaaeaaaaaa
dcaaaaajocaabaaaaaaaaaaaagaabaaaaeaaaaaaagajbaaaaiaaaaaafgaobaaa
aaaaaaaadcaaaaajocaabaaaaaaaaaaakgakbaaaaeaaaaaaagajbaaaadaaaaaa
fgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaaaeaaaaaaagajbaaa
agaaaaaafgaobaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaa
aeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaakaaaaaa
aagabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaa
afaaaaaadgaaaaafccaabaaaafaaaaaadkaabaaaabaaaaaaaaaaaaaidcaabaaa
abaaaaaapgapbaiaebaaaaaaaaaaaaaaegaabaaaafaaaaaadcaaaaandcaabaaa
abaaaaaaagiacaaaaaaaaaaaahaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaegaabaaaabaaaaaadeaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
bkaabaaaabaaaaaaakaabaaaabaaaaaaaoaaaaahicaabaaaaaaaaaaaakaabaaa
abaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
"
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
 //       d3d11 : 27 math
 //        d3d9 : 34 math
 //      opengl : 33 math
 // Stats for Fragment shader:
 //       d3d11 : 30 math, 9 texture
 //        d3d9 : 38 math, 9 texture
 //      opengl : 47 math, 9 texture
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="Geometry-99" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" "SplatCount"="4" }
  ZWrite Off
  Fog { Mode Off }
  Blend DstColor SrcColor, One One
Program "vp" {
SubProgram "opengl " {
// Stats: 33 math
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
PARAM c[15] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
TEMP R2;
MUL R0.xyz, -vertex.normal.zxyw, c[0].zyzw;
MAD R0.xyz, vertex.normal.yzxw, c[0].yzzw, R0;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
DP3 R2.y, -R1, c[5];
DP3 R2.x, R0, c[5];
DP3 R2.z, vertex.normal, c[5];
MUL result.texcoord[4].xyz, R2, c[9].w;
DP3 R2.x, R0, c[6];
DP3 R0.x, R0, c[7];
DP4 R0.z, vertex.position, c[3];
DP3 R2.y, -R1, c[6];
DP3 R0.w, -R1, c[7];
DP4 R1.zw, vertex.position, c[4];
DP4 R1.y, vertex.position, c[2];
DP4 R1.x, vertex.position, c[1];
DP3 R0.y, vertex.normal, c[7];
MUL result.texcoord[6].xyz, R0.xwyw, c[9].w;
DP3 R2.z, vertex.normal, c[6];
MUL result.texcoord[5].xyz, R2, c[9].w;
ADD R2.xy, R1.z, R1;
MUL R0.xy, R2, c[0].x;
MOV R0.w, R1.z;
MOV result.texcoord[3], R0;
MOV result.position.w, R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MOV result.position.z, R0;
MOV result.position.y, R1;
MOV result.position.x, R1;
END
# 33 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ScreenParams]
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
dcl_texcoord5 o6
dcl_texcoord6 o7
def c15, 0.50000000, 0.00000000, 1.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r0.xyz, -v2.zxyw, c15.yzyw
mad r0.xyz, v2.yzxw, c15.zyyw, r0
mul r1.xyz, v2.zxyw, r0.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
dp3 r2.x, r0, c4
dp3 r2.y, -r1, c4
dp3 r2.z, v2, c4
mul o5.xyz, r2, c9.w
dp3 r2.x, r0, c5
dp3 r0.x, r0, c6
dp4 r0.z, v0, c2
dp3 r2.y, -r1, c5
dp3 r0.w, -r1, c6
dp4 r1.xy, v0, c3
dp3 r2.z, v2, c5
mul o6.xyz, r2, c9.w
dp4 r1.zw, v0, c1
dp4 r2.x, v0, c0
dp3 r0.y, v2, c6
mul o7.xyz, r0.xwyw, c9.w
mov r2.y, -r1.z
mad r2.zw, r1.x, c8, r2.xyxy
mul r0.xy, r2.zwzw, c15.x
mov r0.w, r1.x
mov o4, r0
mov o0.w, r1.y
mov o0.y, r1.w
mad o1.zw, v3.xyxy, c11.xyxy, c11
mad o1.xy, v3, c10, c10.zwzw
mad o2.zw, v3.xyxy, c13.xyxy, c13
mad o2.xy, v3, c12, c12.zwzw
mad o3.xy, v3, c14, c14.zwzw
mov o0.z, r0
mov o0.x, r2
"
}
SubProgram "d3d11 " {
// Stats: 27 math
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
eefiecedbbhngniekhdmjmnpgchfkgnldpfcpeeoabaaaaaaheahaaaaadaaaaaa
cmaaaaaapeaaaaaanmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
jaafaaaaeaaaabaageabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
hccabaaaagaaaaaagfaaaaadhccabaaaahaaaaaagiaaaaacaeaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaa
dcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaadcaaaaaldccabaaa
adaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaa
aiaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaadgaaaaafmccabaaaaeaaaaaa
kgaobaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaa
abaaaaaaaoaaaaaadgaaaaagbcaabaaaaaaaaaaaakiacaaaabaaaaaaamaaaaaa
dgaaaaagccaabaaaaaaaaaaaakiacaaaabaaaaaaanaaaaaabaaaaaahecaabaaa
abaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaakhcaabaaaacaaaaaa
egbcbaaaacaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaadcaaaaan
hcaabaaaacaaaaaacgbjbaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadp
aaaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaa
acaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgbebaaaacaaaaaa
jgaebaaaacaaaaaaegacbaiaebaaaaaaadaaaaaabaaaaaaiccaabaaaabaaaaaa
egacbaiaebaaaaaaadaaaaaaegacbaaaaaaaaaaaapaaaaahbcaabaaaabaaaaaa
cgakbaaaacaaaaaaegaabaaaaaaaaaaadiaaaaaihccabaaaafaaaaaaegacbaaa
abaaaaaapgipcaaaabaaaaaabeaaaaaadgaaaaagbcaabaaaaaaaaaaabkiacaaa
abaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaabkiacaaaabaaaaaaanaaaaaa
apaaaaahbcaabaaaabaaaaaacgakbaaaacaaaaaaegaabaaaaaaaaaaadgaaaaag
ecaabaaaaaaaaaaabkiacaaaabaaaaaaaoaaaaaabaaaaaaiccaabaaaabaaaaaa
egacbaiaebaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihccabaaaagaaaaaaegacbaaa
abaaaaaapgipcaaaabaaaaaabeaaaaaadgaaaaagbcaabaaaaaaaaaaackiacaaa
abaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaaabaaaaaaanaaaaaa
apaaaaahbcaabaaaabaaaaaacgakbaaaacaaaaaaegaabaaaaaaaaaaadgaaaaag
ecaabaaaaaaaaaaackiacaaaabaaaaaaaoaaaaaabaaaaaaiccaabaaaabaaaaaa
egacbaiaebaaaaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihccabaaaahaaaaaaegacbaaa
abaaaaaapgipcaaaabaaaaaabeaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_4.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_4.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_7 = tmpvar_4.xyz;
  tmpvar_8 = (((tmpvar_1.yzx * tmpvar_4.zxy) - (tmpvar_1.zxy * tmpvar_4.yzx)) * -1.0);
  highp mat3 tmpvar_9;
  tmpvar_9[0].x = tmpvar_7.x;
  tmpvar_9[0].y = tmpvar_8.x;
  tmpvar_9[0].z = tmpvar_1.x;
  tmpvar_9[1].x = tmpvar_7.y;
  tmpvar_9[1].y = tmpvar_8.y;
  tmpvar_9[1].z = tmpvar_1.y;
  tmpvar_9[2].x = tmpvar_7.z;
  tmpvar_9[2].y = tmpvar_8.z;
  tmpvar_9[2].z = tmpvar_1.z;
  vec3 v_10;
  v_10.x = _Object2World[0].x;
  v_10.y = _Object2World[1].x;
  v_10.z = _Object2World[2].x;
  vec3 v_11;
  v_11.x = _Object2World[0].y;
  v_11.y = _Object2World[1].y;
  v_11.z = _Object2World[2].y;
  vec3 v_12;
  v_12.x = _Object2World[0].z;
  v_12.y = _Object2World[1].z;
  v_12.z = _Object2World[2].z;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = ((tmpvar_9 * v_10) * unity_Scale.w);
  xlv_TEXCOORD5 = ((tmpvar_9 * v_11) * unity_Scale.w);
  xlv_TEXCOORD6 = ((tmpvar_9 * v_12) * unity_Scale.w);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 res_1;
  lowp vec3 worldN_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
  lowp vec3 col_5;
  highp vec2 pblend_6;
  mediump vec4 blend_7;
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
  highp vec4 val_17;
  val_17 = blend_7;
  highp float tmpvar_18;
  tmpvar_18 = max (val_17.x, max (val_17.y, max (val_17.z, val_17.w)));
  pblend_6.x = (tmpvar_18 * 0.5);
  lowp float tmpvar_19;
  tmpvar_19 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_6.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (pblend_6.x, pblend_6.y);
  tmpvar_3 = tmpvar_20;
  highp vec2 tmpvar_21;
  tmpvar_21 = max (((pblend_6 - tmpvar_3) + (_Depth * 0.5)), vec2(0.0, 0.0));
  pblend_6 = (tmpvar_21 / (tmpvar_21.x + tmpvar_21.y));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (((blend_7 - tmpvar_18) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 / (((tmpvar_22.x + tmpvar_22.y) + tmpvar_22.z) + tmpvar_22.w));
  blend_7 = tmpvar_23;
  mediump vec3 tmpvar_24;
  tmpvar_24 = (blend_7.x * tmpvar_9).xyz;
  col_5 = tmpvar_24;
  mediump vec3 tmpvar_25;
  tmpvar_25 = (col_5 + (blend_7.y * tmpvar_10).xyz);
  col_5 = tmpvar_25;
  mediump vec3 tmpvar_26;
  tmpvar_26 = (col_5 + (blend_7.z * tmpvar_11).xyz);
  col_5 = tmpvar_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (col_5 + (blend_7.w * tmpvar_12).xyz);
  col_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  mediump vec4 tmpvar_29;
  tmpvar_29 = (blend_7.x * tmpvar_28);
  nrm_4 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  mediump vec4 tmpvar_31;
  tmpvar_31 = (nrm_4 + (blend_7.y * tmpvar_30));
  nrm_4 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  mediump vec4 tmpvar_33;
  tmpvar_33 = (nrm_4 + (blend_7.z * tmpvar_32));
  nrm_4 = tmpvar_33;
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_Normal3, xlv_TEXCOORD2);
  mediump vec4 tmpvar_35;
  tmpvar_35 = (nrm_4 + (blend_7.w * tmpvar_34));
  nrm_4 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_36;
  lowp vec3 tmpvar_37;
  tmpvar_37 = ((tmpvar_36.xyz * 2.0) - 1.0);
  highp float tmpvar_38;
  tmpvar_38 = dot (xlv_TEXCOORD4, tmpvar_37);
  worldN_2.x = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = dot (xlv_TEXCOORD5, tmpvar_37);
  worldN_2.y = tmpvar_39;
  highp float tmpvar_40;
  tmpvar_40 = dot (xlv_TEXCOORD6, tmpvar_37);
  worldN_2.z = tmpvar_40;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_4.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_4.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_7 = tmpvar_4.xyz;
  tmpvar_8 = (((tmpvar_1.yzx * tmpvar_4.zxy) - (tmpvar_1.zxy * tmpvar_4.yzx)) * -1.0);
  highp mat3 tmpvar_9;
  tmpvar_9[0].x = tmpvar_7.x;
  tmpvar_9[0].y = tmpvar_8.x;
  tmpvar_9[0].z = tmpvar_1.x;
  tmpvar_9[1].x = tmpvar_7.y;
  tmpvar_9[1].y = tmpvar_8.y;
  tmpvar_9[1].z = tmpvar_1.y;
  tmpvar_9[2].x = tmpvar_7.z;
  tmpvar_9[2].y = tmpvar_8.z;
  tmpvar_9[2].z = tmpvar_1.z;
  vec3 v_10;
  v_10.x = _Object2World[0].x;
  v_10.y = _Object2World[1].x;
  v_10.z = _Object2World[2].x;
  vec3 v_11;
  v_11.x = _Object2World[0].y;
  v_11.y = _Object2World[1].y;
  v_11.z = _Object2World[2].y;
  vec3 v_12;
  v_12.x = _Object2World[0].z;
  v_12.y = _Object2World[1].z;
  v_12.z = _Object2World[2].z;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = ((tmpvar_9 * v_10) * unity_Scale.w);
  xlv_TEXCOORD5 = ((tmpvar_9 * v_11) * unity_Scale.w);
  xlv_TEXCOORD6 = ((tmpvar_9 * v_12) * unity_Scale.w);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 res_1;
  lowp vec3 worldN_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
  lowp vec3 col_5;
  highp vec2 pblend_6;
  mediump vec4 blend_7;
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
  highp vec4 val_17;
  val_17 = blend_7;
  highp float tmpvar_18;
  tmpvar_18 = max (val_17.x, max (val_17.y, max (val_17.z, val_17.w)));
  pblend_6.x = (tmpvar_18 * 0.5);
  lowp float tmpvar_19;
  tmpvar_19 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_6.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (pblend_6.x, pblend_6.y);
  tmpvar_3 = tmpvar_20;
  highp vec2 tmpvar_21;
  tmpvar_21 = max (((pblend_6 - tmpvar_3) + (_Depth * 0.5)), vec2(0.0, 0.0));
  pblend_6 = (tmpvar_21 / (tmpvar_21.x + tmpvar_21.y));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (((blend_7 - tmpvar_18) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 / (((tmpvar_22.x + tmpvar_22.y) + tmpvar_22.z) + tmpvar_22.w));
  blend_7 = tmpvar_23;
  mediump vec3 tmpvar_24;
  tmpvar_24 = (blend_7.x * tmpvar_9).xyz;
  col_5 = tmpvar_24;
  mediump vec3 tmpvar_25;
  tmpvar_25 = (col_5 + (blend_7.y * tmpvar_10).xyz);
  col_5 = tmpvar_25;
  mediump vec3 tmpvar_26;
  tmpvar_26 = (col_5 + (blend_7.z * tmpvar_11).xyz);
  col_5 = tmpvar_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (col_5 + (blend_7.w * tmpvar_12).xyz);
  col_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  mediump vec4 tmpvar_29;
  tmpvar_29 = (blend_7.x * tmpvar_28);
  nrm_4 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  mediump vec4 tmpvar_31;
  tmpvar_31 = (nrm_4 + (blend_7.y * tmpvar_30));
  nrm_4 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  mediump vec4 tmpvar_33;
  tmpvar_33 = (nrm_4 + (blend_7.z * tmpvar_32));
  nrm_4 = tmpvar_33;
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_Normal3, xlv_TEXCOORD2);
  mediump vec4 tmpvar_35;
  tmpvar_35 = (nrm_4 + (blend_7.w * tmpvar_34));
  nrm_4 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_36;
  lowp vec3 normal_37;
  normal_37.xy = ((tmpvar_36.wy * 2.0) - 1.0);
  normal_37.z = sqrt((1.0 - clamp (dot (normal_37.xy, normal_37.xy), 0.0, 1.0)));
  highp float tmpvar_38;
  tmpvar_38 = dot (xlv_TEXCOORD4, normal_37);
  worldN_2.x = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = dot (xlv_TEXCOORD5, normal_37);
  worldN_2.y = tmpvar_39;
  highp float tmpvar_40;
  tmpvar_40 = dot (xlv_TEXCOORD6, normal_37);
  worldN_2.z = tmpvar_40;
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
out highp vec4 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
out highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(_glesNormal);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_4.xyz = ((tmpvar_1.yzx * vec3(1.0, 0.0, 0.0)) - (tmpvar_1.zxy * vec3(0.0, 1.0, 0.0)));
  tmpvar_4.w = -1.0;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec3 tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_7 = tmpvar_4.xyz;
  tmpvar_8 = (((tmpvar_1.yzx * tmpvar_4.zxy) - (tmpvar_1.zxy * tmpvar_4.yzx)) * -1.0);
  highp mat3 tmpvar_9;
  tmpvar_9[0].x = tmpvar_7.x;
  tmpvar_9[0].y = tmpvar_8.x;
  tmpvar_9[0].z = tmpvar_1.x;
  tmpvar_9[1].x = tmpvar_7.y;
  tmpvar_9[1].y = tmpvar_8.y;
  tmpvar_9[1].z = tmpvar_1.y;
  tmpvar_9[2].x = tmpvar_7.z;
  tmpvar_9[2].y = tmpvar_8.z;
  tmpvar_9[2].z = tmpvar_1.z;
  vec3 v_10;
  v_10.x = _Object2World[0].x;
  v_10.y = _Object2World[1].x;
  v_10.z = _Object2World[2].x;
  vec3 v_11;
  v_11.x = _Object2World[0].y;
  v_11.y = _Object2World[1].y;
  v_11.z = _Object2World[2].y;
  vec3 v_12;
  v_12.x = _Object2World[0].z;
  v_12.y = _Object2World[1].z;
  v_12.z = _Object2World[2].z;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = ((tmpvar_9 * v_10) * unity_Scale.w);
  xlv_TEXCOORD5 = ((tmpvar_9 * v_11) * unity_Scale.w);
  xlv_TEXCOORD6 = ((tmpvar_9 * v_12) * unity_Scale.w);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
in highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 res_1;
  lowp vec3 worldN_2;
  lowp float tmpvar_3;
  lowp vec4 nrm_4;
  lowp vec3 col_5;
  highp vec2 pblend_6;
  mediump vec4 blend_7;
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
  highp vec4 val_17;
  val_17 = blend_7;
  highp float tmpvar_18;
  tmpvar_18 = max (val_17.x, max (val_17.y, max (val_17.z, val_17.w)));
  pblend_6.x = (tmpvar_18 * 0.5);
  lowp float tmpvar_19;
  tmpvar_19 = textureProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_6.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = max (pblend_6.x, pblend_6.y);
  tmpvar_3 = tmpvar_20;
  highp vec2 tmpvar_21;
  tmpvar_21 = max (((pblend_6 - tmpvar_3) + (_Depth * 0.5)), vec2(0.0, 0.0));
  pblend_6 = (tmpvar_21 / (tmpvar_21.x + tmpvar_21.y));
  highp vec4 tmpvar_22;
  tmpvar_22 = max (((blend_7 - tmpvar_18) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 / (((tmpvar_22.x + tmpvar_22.y) + tmpvar_22.z) + tmpvar_22.w));
  blend_7 = tmpvar_23;
  mediump vec3 tmpvar_24;
  tmpvar_24 = (blend_7.x * tmpvar_9).xyz;
  col_5 = tmpvar_24;
  mediump vec3 tmpvar_25;
  tmpvar_25 = (col_5 + (blend_7.y * tmpvar_10).xyz);
  col_5 = tmpvar_25;
  mediump vec3 tmpvar_26;
  tmpvar_26 = (col_5 + (blend_7.z * tmpvar_11).xyz);
  col_5 = tmpvar_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (col_5 + (blend_7.w * tmpvar_12).xyz);
  col_5 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal0, xlv_TEXCOORD0.zw);
  mediump vec4 tmpvar_29;
  tmpvar_29 = (blend_7.x * tmpvar_28);
  nrm_4 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture (_Normal1, xlv_TEXCOORD1.xy);
  mediump vec4 tmpvar_31;
  tmpvar_31 = (nrm_4 + (blend_7.y * tmpvar_30));
  nrm_4 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture (_Normal2, xlv_TEXCOORD1.zw);
  mediump vec4 tmpvar_33;
  tmpvar_33 = (nrm_4 + (blend_7.z * tmpvar_32));
  nrm_4 = tmpvar_33;
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture (_Normal3, xlv_TEXCOORD2);
  mediump vec4 tmpvar_35;
  tmpvar_35 = (nrm_4 + (blend_7.w * tmpvar_34));
  nrm_4 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_8, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_4 = tmpvar_36;
  lowp vec3 tmpvar_37;
  tmpvar_37 = ((tmpvar_36.xyz * 2.0) - 1.0);
  highp float tmpvar_38;
  tmpvar_38 = dot (xlv_TEXCOORD4, tmpvar_37);
  worldN_2.x = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = dot (xlv_TEXCOORD5, tmpvar_37);
  worldN_2.y = tmpvar_39;
  highp float tmpvar_40;
  tmpvar_40 = dot (xlv_TEXCOORD6, tmpvar_37);
  worldN_2.z = tmpvar_40;
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
SetTexture 6 [_Normal0] 2D 6
SetTexture 7 [_Normal1] 2D 7
SetTexture 8 [_Normal2] 2D 8
SetTexture 9 [_Normal3] 2D 9
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
TEX R3.yw, fragment.texcoord[1], texture[7], 2D;
MUL R3.xy, R0.y, R3.ywzw;
TEX R2.yw, fragment.texcoord[0].zwzw, texture[6], 2D;
MUL R0.xy, R0.x, R2.ywzw;
ADD R0.xy, R0, R3;
TEX R2.yw, fragment.texcoord[1].zwzw, texture[8], 2D;
MUL R2.xy, R0.z, R2.ywzw;
TEX R3.yw, fragment.texcoord[2], texture[9], 2D;
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
DP3 R1.z, fragment.texcoord[6], R0;
DP3 R1.x, R0, fragment.texcoord[4];
DP3 R1.y, R0, fragment.texcoord[5];
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
SetTexture 6 [_Normal0] 2D 6
SetTexture 7 [_Normal1] 2D 7
SetTexture 8 [_Normal2] 2D 8
SetTexture 9 [_Normal3] 2D 9
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s6
dcl_2d s7
dcl_2d s8
dcl_2d s9
def c1, 1.00000000, 0.00000000, -0.50000000, 0.50000000
def c2, 2.00000000, -1.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
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
mov_pp r0.w, r0.y
max r2.y, r0.x, r2
mov_pp r0.y, r2.x
add r0, r0, -r2.y
add r0, r0, c0.x
max r0, r0, c1.y
add r2.x, r0, r0.y
add r2.x, r0.z, r2
add r2.x, r0.w, r2
rcp r2.x, r2.x
mul r0, r0, r2.x
texld r3.yw, v1, s7
mul r3.xy, r0.y, r3.ywzw
texld r2.yw, v0.zwzw, s6
mul r0.xy, r0.x, r2.ywzw
add_pp r0.xy, r0, r3
texld r2.yw, v1.zwzw, s8
mul r2.xy, r0.z, r2.ywzw
texld r3.yw, v2, s9
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
dp3 r1.z, v6, r0
dp3 r1.x, r0, v4
dp3 r1.y, r0, v5
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
eefiecedhfobfnmdlcbfcackkldfgggghfanpblmabaaaaaapiahaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefckiagaaaaeaaaaaaakkabaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafkaaaaad
aagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaa
ffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
dcbabaaaadaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaa
gcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaa
efaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
adaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaaaaaaaahecaabaaaaaaaaaaadkaabaaaaaaaaaaackaabaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaa
aagabaaaaeaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaa
acaaaaaadeaaaaahbcaabaaaacaaaaaadkaabaaaaaaaaaaackaabaaaaaaaaaaa
efaaaaajpcaabaaaadaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaabaaaaaadkaabaaaadaaaaaa
deaaaaahbcaabaaaacaaaaaaakaabaaaacaaaaaabkaabaaaaaaaaaaaefaaaaaj
pcaabaaaadaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
aaaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaaadaaaaaabbaaaaak
bcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdeaaaaahccaabaaaabaaaaaaakaabaaaacaaaaaaakaabaaaaaaaaaaa
aaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaafgafbaiaebaaaaaaabaaaaaa
aaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaagiacaaaaaaaaaaaadaaaaaa
deaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaahccaabaaaabaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaa
aaaaaaahccaabaaaabaaaaaadkaabaaaaaaaaaaabkaabaaaabaaaaaaaoaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaafgafbaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaacaaaaaaeghobaaaagaaaaaaaagabaaaagaaaaaadiaaaaah
gcaabaaaabaaaaaafgafbaaaaaaaaaaapganbaaaacaaaaaaefaaaaajpcaabaaa
acaaaaaaogbkbaaaabaaaaaaeghobaaaafaaaaaaaagabaaaafaaaaaadcaaaaaj
dcaabaaaaaaaaaaaagaabaaaaaaaaaaahgapbaaaacaaaaaajgafbaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaogbkbaaaacaaaaaaeghobaaaahaaaaaaaagabaaa
ahaaaaaadcaaaaajdcaabaaaaaaaaaaakgakbaaaaaaaaaaahgapbaaaacaaaaaa
egaabaaaaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaadaaaaaaeghobaaa
aiaaaaaaaagabaaaaiaaaaaadcaaaaajdcaabaaaaaaaaaaapgapbaaaaaaaaaaa
hgapbaaaacaaaaaaegaabaaaaaaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadcaaaaamdcaabaaa
aaaaaaaaagaabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadcaaaaapdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaa
ddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
afaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaagaaaaaa
egacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaahaaaaaaegacbaaa
aaaaaaaadcaaaaaphccabaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
 //       d3d11 : 24 avg math (16..30)
 //        d3d9 : 31 avg math (22..40)
 //      opengl : 29 avg math (20..39)
 // Stats for Fragment shader:
 //       d3d11 : 40 avg math (31..52), 9 avg texture (7..13)
 //        d3d9 : 51 avg math (39..67), 9 avg texture (7..13)
 //      opengl : 61 avg math (46..80), 9 avg texture (7..13)
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "QUEUE"="Geometry-99" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" "SplatCount"="4" }
  ZWrite Off
Program "vp" {
SubProgram "opengl " {
// Stats: 39 math
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
MAD R0.y, R0.x, R0.x, -R0;
DP4 R0.xw, vertex.position, c[4];
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
DP4 R1.z, vertex.position, c[3];
MOV R1.w, R0.x;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.y, c[16];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
MUL R0.y, R0, c[9].x;
ADD result.texcoord[4].xy, R0, R0.z;
MOV R0.y, R1;
MOV R0.x, R1;
ADD R0.xy, R0, R0.w;
ADD result.texcoord[5].xyz, R3, R2;
MOV result.position, R1;
MOV result.texcoord[4].zw, R1;
MUL result.texcoord[3].xy, R0, c[0].x;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MOV result.texcoord[3].w, R0;
MOV result.texcoord[3].z, R1;
END
# 39 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 40 math
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
dcl_texcoord5 o6
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c17.w
dp3 r2.w, r1, c5
dp4 r4.xy, v0, c3
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
dp4 r1.z, v0, c2
mov r1.w, r4.y
mad r0.x, r0, r0, -r0.y
add r3.xyz, r2, r3
mul r2.xyz, r0.x, c16
dp4 r0.xw, v0, c1
dp4 r1.x, v0, c0
mov r1.y, r0.x
mul r0.xyz, r1.xyww, c23.x
mul r0.y, r0, c8.x
mad o5.xy, r0.z, c9.zwzw, r0
mov r0.y, -r0.w
mov r0.x, r1
mad r0.xy, r4.x, c9.zwzw, r0
add o6.xyz, r3, r2
mov o0, r1
mov o5.zw, r1
mul o4.xy, r0, c23.x
mad o1.zw, v3.xyxy, c19.xyxy, c19
mad o1.xy, v3, c18, c18.zwzw
mad o2.zw, v3.xyxy, c21.xyxy, c21
mad o2.xy, v3, c20, c20.zwzw
mad o3.xy, v3, c22, c22.zwzw
mov o4.w, r4.x
mov o4.z, r1
"
}
SubProgram "d3d11 " {
// Stats: 30 math
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
eefiecedbhjkgmdmgalgcjpekpdcmnoiglobaeljabaaaaaacmahaaaaadaaaaaa
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
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcgaafaaaaeaaaabaafiabaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaadcaaaaal
dccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaadcaaaaaldccabaaaadaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
dcaaaaamdcaabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaialp
aaaaaaaaaaaaaaaapgapbaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaaegaabaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaafmccabaaa
aeaaaaaakgaobaaaaaaaaaaadgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakfcaabaaaaaaaaaaaagadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaadpaaaaaaahdccabaaaafaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
aaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
aaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaa
bbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaa
bbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaa
bbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dcaaaaakhccabaaaagaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((pos_4.xy + pos_4.w) * 0.5);
  tmpvar_5.zw = pos_4.zw;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = (tmpvar_10 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_12;
  mediump vec4 normal_13;
  normal_13 = tmpvar_11;
  highp float vC_14;
  mediump vec3 x3_15;
  mediump vec3 x2_16;
  mediump vec3 x1_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAr, normal_13);
  x1_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAg, normal_13);
  x1_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAb, normal_13);
  x1_17.z = tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normal_13.xyzz * normal_13.yzzx);
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBr, tmpvar_21);
  x2_16.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBg, tmpvar_21);
  x2_16.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBb, tmpvar_21);
  x2_16.z = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y));
  vC_14 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (unity_SHC.xyz * vC_14);
  x3_15 = tmpvar_26;
  tmpvar_12 = ((x1_17 + x2_16) + x3_15);
  tmpvar_3 = tmpvar_12;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = o_7;
  xlv_TEXCOORD5 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  mediump vec4 light_2;
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
  nrm_4 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_32;
  mediump vec4 tmpvar_33;
  tmpvar_33 = -(log2(max (light_2, vec4(0.001, 0.001, 0.001, 0.001))));
  light_2.w = tmpvar_33.w;
  highp vec3 tmpvar_34;
  tmpvar_34 = (tmpvar_33.xyz + xlv_TEXCOORD5);
  light_2.xyz = tmpvar_34;
  lowp vec4 c_35;
  mediump vec3 tmpvar_36;
  tmpvar_36 = (col_5 * light_2.xyz);
  c_35.xyz = tmpvar_36;
  c_35.w = tmpvar_3;
  c_1 = c_35;
  lowp vec4 col_37;
  col_37 = c_1;
  lowp vec4 res_38;
  highp vec2 pblend_39;
  lowp vec4 tmpvar_40;
  tmpvar_40 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_41;
  tmpvar_41 = col_37.w;
  pblend_39.x = tmpvar_41;
  lowp float tmpvar_42;
  tmpvar_42 = tmpvar_40.w;
  pblend_39.y = tmpvar_42;
  highp vec4 tmpvar_43;
  tmpvar_43.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_43.w = max (pblend_39.x, pblend_39.y);
  res_38 = tmpvar_43;
  highp vec2 tmpvar_44;
  tmpvar_44 = max (((pblend_39 - res_38.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_45;
  tmpvar_45 = (tmpvar_44 / (tmpvar_44.x + tmpvar_44.y));
  pblend_39 = tmpvar_45;
  highp vec3 tmpvar_46;
  tmpvar_46 = ((col_37.xyz * tmpvar_45.x) + (tmpvar_40.xyz * tmpvar_45.y));
  res_38.xyz = tmpvar_46;
  gl_FragData[0] = res_38;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((pos_4.xy + pos_4.w) * 0.5);
  tmpvar_5.zw = pos_4.zw;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = (tmpvar_10 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_12;
  mediump vec4 normal_13;
  normal_13 = tmpvar_11;
  highp float vC_14;
  mediump vec3 x3_15;
  mediump vec3 x2_16;
  mediump vec3 x1_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAr, normal_13);
  x1_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAg, normal_13);
  x1_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAb, normal_13);
  x1_17.z = tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normal_13.xyzz * normal_13.yzzx);
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBr, tmpvar_21);
  x2_16.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBg, tmpvar_21);
  x2_16.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBb, tmpvar_21);
  x2_16.z = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y));
  vC_14 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (unity_SHC.xyz * vC_14);
  x3_15 = tmpvar_26;
  tmpvar_12 = ((x1_17 + x2_16) + x3_15);
  tmpvar_3 = tmpvar_12;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = o_7;
  xlv_TEXCOORD5 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  mediump vec4 light_2;
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
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_34;
  mediump vec4 tmpvar_35;
  tmpvar_35 = -(log2(max (light_2, vec4(0.001, 0.001, 0.001, 0.001))));
  light_2.w = tmpvar_35.w;
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_35.xyz + xlv_TEXCOORD5);
  light_2.xyz = tmpvar_36;
  lowp vec4 c_37;
  mediump vec3 tmpvar_38;
  tmpvar_38 = (col_5 * light_2.xyz);
  c_37.xyz = tmpvar_38;
  c_37.w = tmpvar_3;
  c_1 = c_37;
  lowp vec4 col_39;
  col_39 = c_1;
  lowp vec4 res_40;
  highp vec2 pblend_41;
  lowp vec4 tmpvar_42;
  tmpvar_42 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_43;
  tmpvar_43 = col_39.w;
  pblend_41.x = tmpvar_43;
  lowp float tmpvar_44;
  tmpvar_44 = tmpvar_42.w;
  pblend_41.y = tmpvar_44;
  highp vec4 tmpvar_45;
  tmpvar_45.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_45.w = max (pblend_41.x, pblend_41.y);
  res_40 = tmpvar_45;
  highp vec2 tmpvar_46;
  tmpvar_46 = max (((pblend_41 - res_40.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_47;
  tmpvar_47 = (tmpvar_46 / (tmpvar_46.x + tmpvar_46.y));
  pblend_41 = tmpvar_47;
  highp vec3 tmpvar_48;
  tmpvar_48 = ((col_39.xyz * tmpvar_47.x) + (tmpvar_42.xyz * tmpvar_47.y));
  res_40.xyz = tmpvar_48;
  gl_FragData[0] = res_40;
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
out highp vec4 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((pos_4.xy + pos_4.w) * 0.5);
  tmpvar_5.zw = pos_4.zw;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = (tmpvar_10 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_12;
  mediump vec4 normal_13;
  normal_13 = tmpvar_11;
  highp float vC_14;
  mediump vec3 x3_15;
  mediump vec3 x2_16;
  mediump vec3 x1_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAr, normal_13);
  x1_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAg, normal_13);
  x1_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAb, normal_13);
  x1_17.z = tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normal_13.xyzz * normal_13.yzzx);
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBr, tmpvar_21);
  x2_16.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBg, tmpvar_21);
  x2_16.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBb, tmpvar_21);
  x2_16.z = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y));
  vC_14 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (unity_SHC.xyz * vC_14);
  x3_15 = tmpvar_26;
  tmpvar_12 = ((x1_17 + x2_16) + x3_15);
  tmpvar_3 = tmpvar_12;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = o_7;
  xlv_TEXCOORD5 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  mediump vec4 light_2;
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
  nrm_4 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = textureProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_32;
  mediump vec4 tmpvar_33;
  tmpvar_33 = -(log2(max (light_2, vec4(0.001, 0.001, 0.001, 0.001))));
  light_2.w = tmpvar_33.w;
  highp vec3 tmpvar_34;
  tmpvar_34 = (tmpvar_33.xyz + xlv_TEXCOORD5);
  light_2.xyz = tmpvar_34;
  lowp vec4 c_35;
  mediump vec3 tmpvar_36;
  tmpvar_36 = (col_5 * light_2.xyz);
  c_35.xyz = tmpvar_36;
  c_35.w = tmpvar_3;
  c_1 = c_35;
  lowp vec4 col_37;
  col_37 = c_1;
  lowp vec4 res_38;
  highp vec2 pblend_39;
  lowp vec4 tmpvar_40;
  tmpvar_40 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_41;
  tmpvar_41 = col_37.w;
  pblend_39.x = tmpvar_41;
  lowp float tmpvar_42;
  tmpvar_42 = tmpvar_40.w;
  pblend_39.y = tmpvar_42;
  highp vec4 tmpvar_43;
  tmpvar_43.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_43.w = max (pblend_39.x, pblend_39.y);
  res_38 = tmpvar_43;
  highp vec2 tmpvar_44;
  tmpvar_44 = max (((pblend_39 - res_38.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_45;
  tmpvar_45 = (tmpvar_44 / (tmpvar_44.x + tmpvar_44.y));
  pblend_39 = tmpvar_45;
  highp vec3 tmpvar_46;
  tmpvar_46 = ((col_37.xyz * tmpvar_45.x) + (tmpvar_40.xyz * tmpvar_45.y));
  res_38.xyz = tmpvar_46;
  _glesFragData[0] = res_38;
}



#endif"
}
SubProgram "opengl " {
// Stats: 29 math
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
DP4 R1.xw, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
MOV R0.w, R1.x;
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
ADD R0.xy, R0, R1.w;
MUL result.texcoord[3].xy, R0, c[0].x;
MOV R0.x, c[0].y;
ADD R0.y, R0.x, -c[14].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[14];
MOV result.texcoord[4].zw, R0;
MUL result.texcoord[6].xyz, R1, c[14].w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[17].xyxy, c[17];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MOV result.texcoord[3].w, R1;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[15], c[15].zwzw;
MUL result.texcoord[6].w, -R0.x, R0.y;
MOV result.texcoord[3].z, R0;
END
# 29 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 31 math
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
dcl_texcoord6 o7
def c21, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r2.zw, v0, c7
dp4 r0.z, v0, c6
mov r0.w, r2
dp4 r2.xy, v0, c5
dp4 r0.x, v0, c4
mov r0.y, r2
mul r1.xyz, r0.xyww, c21.x
mul r1.y, r1, c12.x
mad o5.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov r0.y, -r2.x
mad r0.xy, r2.z, c13.zwzw, r0
mul o4.xy, r0, c21.x
mov r0.x, c14.w
add r0.y, c21, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c14
mov o5.zw, r0
mul o7.xyz, r1, c14.w
mad o1.zw, v3.xyxy, c17.xyxy, c17
mad o1.xy, v3, c16, c16.zwzw
mad o2.zw, v3.xyxy, c19.xyxy, c19
mad o2.xy, v3, c18, c18.zwzw
mad o3.xy, v3, c20, c20.zwzw
mov o4.w, r2.z
mad o6.xy, v4, c15, c15.zwzw
mul o7.w, -r0.x, r0.y
mov o4.z, r0
"
}
SubProgram "d3d11 " {
// Stats: 28 math
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
eefiecedjheimaeofbmogdhiookmfgokffaabapaabaaaaaacmahaaaaadaaaaaa
cmaaaaaapeaaaaaanmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
eiafaaaaeaaaabaafcabaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabkaaaaaafjaaaaae
egiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadmccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaaaaaaaaaaagaaaaaa
dcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaa
ogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaa
adaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
aeaaaaaakgiocaaaaaaaaaaaaeaaaaaadcaaaaamdcaabaaaabaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaa
diaaaaakdccabaaaaeaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaadgaaaaaf
mccabaaaafaaaaaakgaobaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakfcaabaaaaaaaaaaaagadbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaahdccabaaaafaaaaaa
kgakbaaaaaaaaaaamgaabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaacaaaaaabjaaaaaadiaaaaaihccabaaaagaaaaaaegacbaaaaaaaaaaa
pgipcaaaacaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaa
ckiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaa
aeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaa
abeaaaaaaaaaiadpdiaaaaaiiccabaaaagaaaaaabkaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((pos_4.xy + pos_4.w) * 0.5);
  tmpvar_5.zw = pos_4.zw;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  tmpvar_3.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_3.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = o_7;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec4 c_1;
  mediump vec3 lmIndirect_2;
  mediump vec3 lmFull_3;
  mediump float lmFade_4;
  mediump vec4 light_5;
  lowp float tmpvar_6;
  lowp vec4 nrm_7;
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
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_21.x * tmpvar_26);
  nrm_7 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_7 + (tmpvar_21.y * tmpvar_28));
  nrm_7 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_7 + (tmpvar_21.z * tmpvar_30));
  nrm_7 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_33;
  tmpvar_33 = (nrm_7 + (tmpvar_21.w * tmpvar_32));
  nrm_7 = tmpvar_33;
  nrm_7 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_7, vec4(dot (tmpvar_10, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_19 * 0.5);
  tmpvar_6 = tmpvar_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_5 = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  light_5.w = tmpvar_36.w;
  highp float tmpvar_37;
  tmpvar_37 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_4 = tmpvar_37;
  lowp vec3 tmpvar_38;
  tmpvar_38 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lmFull_3 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  lmIndirect_2 = tmpvar_39;
  light_5.xyz = (tmpvar_36.xyz + mix (lmIndirect_2, lmFull_3, vec3(clamp (lmFade_4, 0.0, 1.0))));
  lowp vec4 c_40;
  mediump vec3 tmpvar_41;
  tmpvar_41 = (col_8 * light_5.xyz);
  c_40.xyz = tmpvar_41;
  c_40.w = tmpvar_6;
  c_1 = c_40;
  lowp vec4 col_42;
  col_42 = c_1;
  lowp vec4 res_43;
  highp vec2 pblend_44;
  lowp vec4 tmpvar_45;
  tmpvar_45 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_46;
  tmpvar_46 = col_42.w;
  pblend_44.x = tmpvar_46;
  lowp float tmpvar_47;
  tmpvar_47 = tmpvar_45.w;
  pblend_44.y = tmpvar_47;
  highp vec4 tmpvar_48;
  tmpvar_48.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_48.w = max (pblend_44.x, pblend_44.y);
  res_43 = tmpvar_48;
  highp vec2 tmpvar_49;
  tmpvar_49 = max (((pblend_44 - res_43.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_50;
  tmpvar_50 = (tmpvar_49 / (tmpvar_49.x + tmpvar_49.y));
  pblend_44 = tmpvar_50;
  highp vec3 tmpvar_51;
  tmpvar_51 = ((col_42.xyz * tmpvar_50.x) + (tmpvar_45.xyz * tmpvar_50.y));
  res_43.xyz = tmpvar_51;
  gl_FragData[0] = res_43;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((pos_4.xy + pos_4.w) * 0.5);
  tmpvar_5.zw = pos_4.zw;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  tmpvar_3.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_3.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = o_7;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec4 c_1;
  mediump vec3 lmIndirect_2;
  mediump vec3 lmFull_3;
  mediump float lmFade_4;
  mediump vec4 light_5;
  lowp float tmpvar_6;
  lowp vec4 nrm_7;
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
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_21.x * tmpvar_26);
  nrm_7 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_7 + (tmpvar_21.y * tmpvar_28));
  nrm_7 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_7 + (tmpvar_21.z * tmpvar_30));
  nrm_7 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_33;
  tmpvar_33 = (nrm_7 + (tmpvar_21.w * tmpvar_32));
  nrm_7 = tmpvar_33;
  lowp vec4 tmpvar_34;
  tmpvar_34 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_7, vec4(dot (tmpvar_10, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_7 = tmpvar_34;
  highp float tmpvar_35;
  tmpvar_35 = (tmpvar_19 * 0.5);
  tmpvar_6 = tmpvar_35;
  lowp vec3 normal_36;
  normal_36.xy = ((tmpvar_34.wy * 2.0) - 1.0);
  normal_36.z = sqrt((1.0 - clamp (dot (normal_36.xy, normal_36.xy), 0.0, 1.0)));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_5 = tmpvar_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  light_5.w = tmpvar_38.w;
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (unity_Lightmap, xlv_TEXCOORD5);
  lowp vec4 tmpvar_40;
  tmpvar_40 = texture2D (unity_LightmapInd, xlv_TEXCOORD5);
  highp float tmpvar_41;
  tmpvar_41 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_4 = tmpvar_41;
  lowp vec3 tmpvar_42;
  tmpvar_42 = ((8.0 * tmpvar_39.w) * tmpvar_39.xyz);
  lmFull_3 = tmpvar_42;
  lowp vec3 tmpvar_43;
  tmpvar_43 = ((8.0 * tmpvar_40.w) * tmpvar_40.xyz);
  lmIndirect_2 = tmpvar_43;
  light_5.xyz = (tmpvar_38.xyz + mix (lmIndirect_2, lmFull_3, vec3(clamp (lmFade_4, 0.0, 1.0))));
  lowp vec4 c_44;
  mediump vec3 tmpvar_45;
  tmpvar_45 = (col_8 * light_5.xyz);
  c_44.xyz = tmpvar_45;
  c_44.w = tmpvar_6;
  c_1 = c_44;
  lowp vec4 col_46;
  col_46 = c_1;
  lowp vec4 res_47;
  highp vec2 pblend_48;
  lowp vec4 tmpvar_49;
  tmpvar_49 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_50;
  tmpvar_50 = col_46.w;
  pblend_48.x = tmpvar_50;
  lowp float tmpvar_51;
  tmpvar_51 = tmpvar_49.w;
  pblend_48.y = tmpvar_51;
  highp vec4 tmpvar_52;
  tmpvar_52.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_52.w = max (pblend_48.x, pblend_48.y);
  res_47 = tmpvar_52;
  highp vec2 tmpvar_53;
  tmpvar_53 = max (((pblend_48 - res_47.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_54;
  tmpvar_54 = (tmpvar_53 / (tmpvar_53.x + tmpvar_53.y));
  pblend_48 = tmpvar_54;
  highp vec3 tmpvar_55;
  tmpvar_55 = ((col_46.xyz * tmpvar_54.x) + (tmpvar_49.xyz * tmpvar_54.y));
  res_47.xyz = tmpvar_55;
  gl_FragData[0] = res_47;
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
out highp vec4 xlv_TEXCOORD4;
out highp vec2 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((pos_4.xy + pos_4.w) * 0.5);
  tmpvar_5.zw = pos_4.zw;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  tmpvar_3.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_3.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = o_7;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD4;
in highp vec2 xlv_TEXCOORD5;
in highp vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec4 c_1;
  mediump vec3 lmIndirect_2;
  mediump vec3 lmFull_3;
  mediump float lmFade_4;
  mediump vec4 light_5;
  lowp float tmpvar_6;
  lowp vec4 nrm_7;
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
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_21.x * tmpvar_26);
  nrm_7 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_7 + (tmpvar_21.y * tmpvar_28));
  nrm_7 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_7 + (tmpvar_21.z * tmpvar_30));
  nrm_7 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_33;
  tmpvar_33 = (nrm_7 + (tmpvar_21.w * tmpvar_32));
  nrm_7 = tmpvar_33;
  nrm_7 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_7, vec4(dot (tmpvar_10, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_19 * 0.5);
  tmpvar_6 = tmpvar_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = textureProj (_LightBuffer, xlv_TEXCOORD4);
  light_5 = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  light_5.w = tmpvar_36.w;
  highp float tmpvar_37;
  tmpvar_37 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_4 = tmpvar_37;
  lowp vec3 tmpvar_38;
  tmpvar_38 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lmFull_3 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  lmIndirect_2 = tmpvar_39;
  light_5.xyz = (tmpvar_36.xyz + mix (lmIndirect_2, lmFull_3, vec3(clamp (lmFade_4, 0.0, 1.0))));
  lowp vec4 c_40;
  mediump vec3 tmpvar_41;
  tmpvar_41 = (col_8 * light_5.xyz);
  c_40.xyz = tmpvar_41;
  c_40.w = tmpvar_6;
  c_1 = c_40;
  lowp vec4 col_42;
  col_42 = c_1;
  lowp vec4 res_43;
  highp vec2 pblend_44;
  lowp vec4 tmpvar_45;
  tmpvar_45 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_46;
  tmpvar_46 = col_42.w;
  pblend_44.x = tmpvar_46;
  lowp float tmpvar_47;
  tmpvar_47 = tmpvar_45.w;
  pblend_44.y = tmpvar_47;
  highp vec4 tmpvar_48;
  tmpvar_48.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_48.w = max (pblend_44.x, pblend_44.y);
  res_43 = tmpvar_48;
  highp vec2 tmpvar_49;
  tmpvar_49 = max (((pblend_44 - res_43.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_50;
  tmpvar_50 = (tmpvar_49 / (tmpvar_49.x + tmpvar_49.y));
  pblend_44 = tmpvar_50;
  highp vec3 tmpvar_51;
  tmpvar_51 = ((col_42.xyz * tmpvar_50.x) + (tmpvar_45.xyz * tmpvar_50.y));
  res_43.xyz = tmpvar_51;
  _glesFragData[0] = res_43;
}



#endif"
}
SubProgram "opengl " {
// Stats: 20 math
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
DP4 R1.xw, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
MOV R0.w, R1.x;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[5].x;
MOV result.position, R0;
ADD R0.xy, R0, R1.w;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.texcoord[4].zw, R0;
MUL result.texcoord[3].xy, R0, c[0].x;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[8].xyxy, c[8];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[7], c[7].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[10].xyxy, c[10];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[9], c[9].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MOV result.texcoord[3].w, R1;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[6], c[6].zwzw;
MOV result.texcoord[3].z, R0;
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 22 math
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
dcl_texcoord5 o6
def c12, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r2.zw, v0, c3
dp4 r0.z, v0, c2
mov r0.w, r2
dp4 r2.xy, v0, c1
dp4 r0.x, v0, c0
mov r0.y, r2
mul r1.xyz, r0.xyww, c12.x
mov o0, r0
mul r1.y, r1, c4.x
mov r0.y, -r2.x
mad r0.xy, r2.z, c5.zwzw, r0
mad o5.xy, r1.z, c5.zwzw, r1
mov o5.zw, r0
mul o4.xy, r0, c12.x
mad o1.zw, v3.xyxy, c8.xyxy, c8
mad o1.xy, v3, c7, c7.zwzw
mad o2.zw, v3.xyxy, c10.xyxy, c10
mad o2.xy, v3, c9, c9.zwzw
mad o3.xy, v3, c11, c11.zwzw
mov o4.w, r2.z
mad o6.xy, v4, c6, c6.zwzw
mov o4.z, r0
"
}
SubProgram "d3d11 " {
// Stats: 16 math
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
eefiecedhaofpgmdcijmjjoljhclpefgfcieohppabaaaaaaeaafaaaaadaaaaaa
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
adamaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcheadaaaaeaaaabaannaaaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
mccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaa
kgiocaaaaaaaaaaaagaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaa
acaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaa
aiaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
ajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaadcaaaaam
dcaabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaa
aaaaaaaapgapbaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaaegaabaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaafmccabaaaaeaaaaaa
kgaobaaaaaaaaaaadgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
fcaabaaaaaaaaaaaagadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaahdccabaaaafaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab
"
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = o_6;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  mediump vec4 light_2;
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
  lowp vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_31.xyz * 2.0) - 1.0);
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_34;
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
  normal_36 = tmpvar_33;
  mediump vec3 scalePerBasisVector_37;
  mediump vec3 lm_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lm_38 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  scalePerBasisVector_37 = tmpvar_40;
  lm_38 = (lm_38 * dot (clamp ((tmpvar_35 * normal_36), 0.0, 1.0), scalePerBasisVector_37));
  mediump vec4 tmpvar_41;
  tmpvar_41.w = 0.0;
  tmpvar_41.xyz = lm_38;
  mediump vec4 tmpvar_42;
  tmpvar_42 = (-(log2(max (light_2, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_41);
  light_2 = tmpvar_42;
  lowp vec4 c_43;
  mediump vec3 tmpvar_44;
  tmpvar_44 = (col_5 * tmpvar_42.xyz);
  c_43.xyz = tmpvar_44;
  c_43.w = tmpvar_3;
  c_1 = c_43;
  lowp vec4 col_45;
  col_45 = c_1;
  lowp vec4 res_46;
  highp vec2 pblend_47;
  lowp vec4 tmpvar_48;
  tmpvar_48 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_49;
  tmpvar_49 = col_45.w;
  pblend_47.x = tmpvar_49;
  lowp float tmpvar_50;
  tmpvar_50 = tmpvar_48.w;
  pblend_47.y = tmpvar_50;
  highp vec4 tmpvar_51;
  tmpvar_51.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_51.w = max (pblend_47.x, pblend_47.y);
  res_46 = tmpvar_51;
  highp vec2 tmpvar_52;
  tmpvar_52 = max (((pblend_47 - res_46.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_53;
  tmpvar_53 = (tmpvar_52 / (tmpvar_52.x + tmpvar_52.y));
  pblend_47 = tmpvar_53;
  highp vec3 tmpvar_54;
  tmpvar_54 = ((col_45.xyz * tmpvar_53.x) + (tmpvar_48.xyz * tmpvar_53.y));
  res_46.xyz = tmpvar_54;
  gl_FragData[0] = res_46;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = o_6;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  mediump vec4 light_2;
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
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (unity_Lightmap, xlv_TEXCOORD5);
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (unity_LightmapInd, xlv_TEXCOORD5);
  mat3 tmpvar_37;
  tmpvar_37[0].x = 0.816497;
  tmpvar_37[0].y = -0.408248;
  tmpvar_37[0].z = -0.408248;
  tmpvar_37[1].x = 0.0;
  tmpvar_37[1].y = 0.707107;
  tmpvar_37[1].z = -0.707107;
  tmpvar_37[2].x = 0.57735;
  tmpvar_37[2].y = 0.57735;
  tmpvar_37[2].z = 0.57735;
  mediump vec3 normal_38;
  normal_38 = normal_33;
  mediump vec3 scalePerBasisVector_39;
  mediump vec3 lm_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = ((8.0 * tmpvar_35.w) * tmpvar_35.xyz);
  lm_40 = tmpvar_41;
  lowp vec3 tmpvar_42;
  tmpvar_42 = ((8.0 * tmpvar_36.w) * tmpvar_36.xyz);
  scalePerBasisVector_39 = tmpvar_42;
  lm_40 = (lm_40 * dot (clamp ((tmpvar_37 * normal_38), 0.0, 1.0), scalePerBasisVector_39));
  mediump vec4 tmpvar_43;
  tmpvar_43.w = 0.0;
  tmpvar_43.xyz = lm_40;
  mediump vec4 tmpvar_44;
  tmpvar_44 = (-(log2(max (light_2, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_43);
  light_2 = tmpvar_44;
  lowp vec4 c_45;
  mediump vec3 tmpvar_46;
  tmpvar_46 = (col_5 * tmpvar_44.xyz);
  c_45.xyz = tmpvar_46;
  c_45.w = tmpvar_3;
  c_1 = c_45;
  lowp vec4 col_47;
  col_47 = c_1;
  lowp vec4 res_48;
  highp vec2 pblend_49;
  lowp vec4 tmpvar_50;
  tmpvar_50 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_51;
  tmpvar_51 = col_47.w;
  pblend_49.x = tmpvar_51;
  lowp float tmpvar_52;
  tmpvar_52 = tmpvar_50.w;
  pblend_49.y = tmpvar_52;
  highp vec4 tmpvar_53;
  tmpvar_53.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_53.w = max (pblend_49.x, pblend_49.y);
  res_48 = tmpvar_53;
  highp vec2 tmpvar_54;
  tmpvar_54 = max (((pblend_49 - res_48.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_55;
  tmpvar_55 = (tmpvar_54 / (tmpvar_54.x + tmpvar_54.y));
  pblend_49 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = ((col_47.xyz * tmpvar_55.x) + (tmpvar_50.xyz * tmpvar_55.y));
  res_48.xyz = tmpvar_56;
  gl_FragData[0] = res_48;
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
out highp vec4 xlv_TEXCOORD4;
out highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = o_6;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD4;
in highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  mediump vec4 light_2;
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
  lowp vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_31.xyz * 2.0) - 1.0);
  lowp vec4 tmpvar_34;
  tmpvar_34 = textureProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_34;
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
  normal_36 = tmpvar_33;
  mediump vec3 scalePerBasisVector_37;
  mediump vec3 lm_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lm_38 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  scalePerBasisVector_37 = tmpvar_40;
  lm_38 = (lm_38 * dot (clamp ((tmpvar_35 * normal_36), 0.0, 1.0), scalePerBasisVector_37));
  mediump vec4 tmpvar_41;
  tmpvar_41.w = 0.0;
  tmpvar_41.xyz = lm_38;
  mediump vec4 tmpvar_42;
  tmpvar_42 = (-(log2(max (light_2, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_41);
  light_2 = tmpvar_42;
  lowp vec4 c_43;
  mediump vec3 tmpvar_44;
  tmpvar_44 = (col_5 * tmpvar_42.xyz);
  c_43.xyz = tmpvar_44;
  c_43.w = tmpvar_3;
  c_1 = c_43;
  lowp vec4 col_45;
  col_45 = c_1;
  lowp vec4 res_46;
  highp vec2 pblend_47;
  lowp vec4 tmpvar_48;
  tmpvar_48 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_49;
  tmpvar_49 = col_45.w;
  pblend_47.x = tmpvar_49;
  lowp float tmpvar_50;
  tmpvar_50 = tmpvar_48.w;
  pblend_47.y = tmpvar_50;
  highp vec4 tmpvar_51;
  tmpvar_51.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_51.w = max (pblend_47.x, pblend_47.y);
  res_46 = tmpvar_51;
  highp vec2 tmpvar_52;
  tmpvar_52 = max (((pblend_47 - res_46.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_53;
  tmpvar_53 = (tmpvar_52 / (tmpvar_52.x + tmpvar_52.y));
  pblend_47 = tmpvar_53;
  highp vec3 tmpvar_54;
  tmpvar_54 = ((col_45.xyz * tmpvar_53.x) + (tmpvar_48.xyz * tmpvar_53.y));
  res_46.xyz = tmpvar_54;
  _glesFragData[0] = res_46;
}



#endif"
}
SubProgram "opengl " {
// Stats: 39 math
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
MAD R0.y, R0.x, R0.x, -R0;
DP4 R0.xw, vertex.position, c[4];
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
DP4 R1.z, vertex.position, c[3];
MOV R1.w, R0.x;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.y, c[16];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
MUL R0.y, R0, c[9].x;
ADD result.texcoord[4].xy, R0, R0.z;
MOV R0.y, R1;
MOV R0.x, R1;
ADD R0.xy, R0, R0.w;
ADD result.texcoord[5].xyz, R3, R2;
MOV result.position, R1;
MOV result.texcoord[4].zw, R1;
MUL result.texcoord[3].xy, R0, c[0].x;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MOV result.texcoord[3].w, R0;
MOV result.texcoord[3].z, R1;
END
# 39 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 40 math
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
dcl_texcoord5 o6
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c17.w
dp3 r2.w, r1, c5
dp4 r4.xy, v0, c3
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
dp4 r1.z, v0, c2
mov r1.w, r4.y
mad r0.x, r0, r0, -r0.y
add r3.xyz, r2, r3
mul r2.xyz, r0.x, c16
dp4 r0.xw, v0, c1
dp4 r1.x, v0, c0
mov r1.y, r0.x
mul r0.xyz, r1.xyww, c23.x
mul r0.y, r0, c8.x
mad o5.xy, r0.z, c9.zwzw, r0
mov r0.y, -r0.w
mov r0.x, r1
mad r0.xy, r4.x, c9.zwzw, r0
add o6.xyz, r3, r2
mov o0, r1
mov o5.zw, r1
mul o4.xy, r0, c23.x
mad o1.zw, v3.xyxy, c19.xyxy, c19
mad o1.xy, v3, c18, c18.zwzw
mad o2.zw, v3.xyxy, c21.xyxy, c21
mad o2.xy, v3, c20, c20.zwzw
mad o3.xy, v3, c22, c22.zwzw
mov o4.w, r4.x
mov o4.z, r1
"
}
SubProgram "d3d11 " {
// Stats: 30 math
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
eefiecedbhjkgmdmgalgcjpekpdcmnoiglobaeljabaaaaaacmahaaaaadaaaaaa
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
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcgaafaaaaeaaaabaafiabaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaadcaaaaal
dccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaadcaaaaaldccabaaaadaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
dcaaaaamdcaabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaialp
aaaaaaaaaaaaaaaapgapbaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaaegaabaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaafmccabaaa
aeaaaaaakgaobaaaaaaaaaaadgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakfcaabaaaaaaaaaaaagadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaadpaaaaaaahdccabaaaafaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
aaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
aaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaa
bbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaa
bbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaa
bbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dcaaaaakhccabaaaagaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((pos_4.xy + pos_4.w) * 0.5);
  tmpvar_5.zw = pos_4.zw;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = (tmpvar_10 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_12;
  mediump vec4 normal_13;
  normal_13 = tmpvar_11;
  highp float vC_14;
  mediump vec3 x3_15;
  mediump vec3 x2_16;
  mediump vec3 x1_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAr, normal_13);
  x1_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAg, normal_13);
  x1_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAb, normal_13);
  x1_17.z = tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normal_13.xyzz * normal_13.yzzx);
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBr, tmpvar_21);
  x2_16.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBg, tmpvar_21);
  x2_16.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBb, tmpvar_21);
  x2_16.z = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y));
  vC_14 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (unity_SHC.xyz * vC_14);
  x3_15 = tmpvar_26;
  tmpvar_12 = ((x1_17 + x2_16) + x3_15);
  tmpvar_3 = tmpvar_12;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = o_7;
  xlv_TEXCOORD5 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  mediump vec4 light_2;
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
  nrm_4 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_32;
  mediump vec4 tmpvar_33;
  tmpvar_33 = max (light_2, vec4(0.001, 0.001, 0.001, 0.001));
  light_2.w = tmpvar_33.w;
  highp vec3 tmpvar_34;
  tmpvar_34 = (tmpvar_33.xyz + xlv_TEXCOORD5);
  light_2.xyz = tmpvar_34;
  lowp vec4 c_35;
  mediump vec3 tmpvar_36;
  tmpvar_36 = (col_5 * light_2.xyz);
  c_35.xyz = tmpvar_36;
  c_35.w = tmpvar_3;
  c_1 = c_35;
  lowp vec4 col_37;
  col_37 = c_1;
  lowp vec4 res_38;
  highp vec2 pblend_39;
  lowp vec4 tmpvar_40;
  tmpvar_40 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_41;
  tmpvar_41 = col_37.w;
  pblend_39.x = tmpvar_41;
  lowp float tmpvar_42;
  tmpvar_42 = tmpvar_40.w;
  pblend_39.y = tmpvar_42;
  highp vec4 tmpvar_43;
  tmpvar_43.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_43.w = max (pblend_39.x, pblend_39.y);
  res_38 = tmpvar_43;
  highp vec2 tmpvar_44;
  tmpvar_44 = max (((pblend_39 - res_38.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_45;
  tmpvar_45 = (tmpvar_44 / (tmpvar_44.x + tmpvar_44.y));
  pblend_39 = tmpvar_45;
  highp vec3 tmpvar_46;
  tmpvar_46 = ((col_37.xyz * tmpvar_45.x) + (tmpvar_40.xyz * tmpvar_45.y));
  res_38.xyz = tmpvar_46;
  gl_FragData[0] = res_38;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((pos_4.xy + pos_4.w) * 0.5);
  tmpvar_5.zw = pos_4.zw;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = (tmpvar_10 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_12;
  mediump vec4 normal_13;
  normal_13 = tmpvar_11;
  highp float vC_14;
  mediump vec3 x3_15;
  mediump vec3 x2_16;
  mediump vec3 x1_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAr, normal_13);
  x1_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAg, normal_13);
  x1_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAb, normal_13);
  x1_17.z = tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normal_13.xyzz * normal_13.yzzx);
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBr, tmpvar_21);
  x2_16.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBg, tmpvar_21);
  x2_16.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBb, tmpvar_21);
  x2_16.z = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y));
  vC_14 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (unity_SHC.xyz * vC_14);
  x3_15 = tmpvar_26;
  tmpvar_12 = ((x1_17 + x2_16) + x3_15);
  tmpvar_3 = tmpvar_12;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = o_7;
  xlv_TEXCOORD5 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  mediump vec4 light_2;
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
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_34;
  mediump vec4 tmpvar_35;
  tmpvar_35 = max (light_2, vec4(0.001, 0.001, 0.001, 0.001));
  light_2.w = tmpvar_35.w;
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_35.xyz + xlv_TEXCOORD5);
  light_2.xyz = tmpvar_36;
  lowp vec4 c_37;
  mediump vec3 tmpvar_38;
  tmpvar_38 = (col_5 * light_2.xyz);
  c_37.xyz = tmpvar_38;
  c_37.w = tmpvar_3;
  c_1 = c_37;
  lowp vec4 col_39;
  col_39 = c_1;
  lowp vec4 res_40;
  highp vec2 pblend_41;
  lowp vec4 tmpvar_42;
  tmpvar_42 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_43;
  tmpvar_43 = col_39.w;
  pblend_41.x = tmpvar_43;
  lowp float tmpvar_44;
  tmpvar_44 = tmpvar_42.w;
  pblend_41.y = tmpvar_44;
  highp vec4 tmpvar_45;
  tmpvar_45.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_45.w = max (pblend_41.x, pblend_41.y);
  res_40 = tmpvar_45;
  highp vec2 tmpvar_46;
  tmpvar_46 = max (((pblend_41 - res_40.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_47;
  tmpvar_47 = (tmpvar_46 / (tmpvar_46.x + tmpvar_46.y));
  pblend_41 = tmpvar_47;
  highp vec3 tmpvar_48;
  tmpvar_48 = ((col_39.xyz * tmpvar_47.x) + (tmpvar_42.xyz * tmpvar_47.y));
  res_40.xyz = tmpvar_48;
  gl_FragData[0] = res_40;
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
out highp vec4 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec3 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((pos_4.xy + pos_4.w) * 0.5);
  tmpvar_5.zw = pos_4.zw;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = (tmpvar_10 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_12;
  mediump vec4 normal_13;
  normal_13 = tmpvar_11;
  highp float vC_14;
  mediump vec3 x3_15;
  mediump vec3 x2_16;
  mediump vec3 x1_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAr, normal_13);
  x1_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAg, normal_13);
  x1_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAb, normal_13);
  x1_17.z = tmpvar_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normal_13.xyzz * normal_13.yzzx);
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBr, tmpvar_21);
  x2_16.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBg, tmpvar_21);
  x2_16.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBb, tmpvar_21);
  x2_16.z = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y));
  vC_14 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (unity_SHC.xyz * vC_14);
  x3_15 = tmpvar_26;
  tmpvar_12 = ((x1_17 + x2_16) + x3_15);
  tmpvar_3 = tmpvar_12;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = o_7;
  xlv_TEXCOORD5 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  mediump vec4 light_2;
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
  nrm_4 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_4, vec4(dot (tmpvar_7, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_16 * 0.5);
  tmpvar_3 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = textureProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_32;
  mediump vec4 tmpvar_33;
  tmpvar_33 = max (light_2, vec4(0.001, 0.001, 0.001, 0.001));
  light_2.w = tmpvar_33.w;
  highp vec3 tmpvar_34;
  tmpvar_34 = (tmpvar_33.xyz + xlv_TEXCOORD5);
  light_2.xyz = tmpvar_34;
  lowp vec4 c_35;
  mediump vec3 tmpvar_36;
  tmpvar_36 = (col_5 * light_2.xyz);
  c_35.xyz = tmpvar_36;
  c_35.w = tmpvar_3;
  c_1 = c_35;
  lowp vec4 col_37;
  col_37 = c_1;
  lowp vec4 res_38;
  highp vec2 pblend_39;
  lowp vec4 tmpvar_40;
  tmpvar_40 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_41;
  tmpvar_41 = col_37.w;
  pblend_39.x = tmpvar_41;
  lowp float tmpvar_42;
  tmpvar_42 = tmpvar_40.w;
  pblend_39.y = tmpvar_42;
  highp vec4 tmpvar_43;
  tmpvar_43.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_43.w = max (pblend_39.x, pblend_39.y);
  res_38 = tmpvar_43;
  highp vec2 tmpvar_44;
  tmpvar_44 = max (((pblend_39 - res_38.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_45;
  tmpvar_45 = (tmpvar_44 / (tmpvar_44.x + tmpvar_44.y));
  pblend_39 = tmpvar_45;
  highp vec3 tmpvar_46;
  tmpvar_46 = ((col_37.xyz * tmpvar_45.x) + (tmpvar_40.xyz * tmpvar_45.y));
  res_38.xyz = tmpvar_46;
  _glesFragData[0] = res_38;
}



#endif"
}
SubProgram "opengl " {
// Stats: 29 math
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
DP4 R1.xw, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
MOV R0.w, R1.x;
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
ADD R0.xy, R0, R1.w;
MUL result.texcoord[3].xy, R0, c[0].x;
MOV R0.x, c[0].y;
ADD R0.y, R0.x, -c[14].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[14];
MOV result.texcoord[4].zw, R0;
MUL result.texcoord[6].xyz, R1, c[14].w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[17].xyxy, c[17];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MOV result.texcoord[3].w, R1;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[15], c[15].zwzw;
MUL result.texcoord[6].w, -R0.x, R0.y;
MOV result.texcoord[3].z, R0;
END
# 29 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 31 math
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
dcl_texcoord6 o7
def c21, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r2.zw, v0, c7
dp4 r0.z, v0, c6
mov r0.w, r2
dp4 r2.xy, v0, c5
dp4 r0.x, v0, c4
mov r0.y, r2
mul r1.xyz, r0.xyww, c21.x
mul r1.y, r1, c12.x
mad o5.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov r0.y, -r2.x
mad r0.xy, r2.z, c13.zwzw, r0
mul o4.xy, r0, c21.x
mov r0.x, c14.w
add r0.y, c21, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c14
mov o5.zw, r0
mul o7.xyz, r1, c14.w
mad o1.zw, v3.xyxy, c17.xyxy, c17
mad o1.xy, v3, c16, c16.zwzw
mad o2.zw, v3.xyxy, c19.xyxy, c19
mad o2.xy, v3, c18, c18.zwzw
mad o3.xy, v3, c20, c20.zwzw
mov o4.w, r2.z
mad o6.xy, v4, c15, c15.zwzw
mul o7.w, -r0.x, r0.y
mov o4.z, r0
"
}
SubProgram "d3d11 " {
// Stats: 28 math
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
eefiecedjheimaeofbmogdhiookmfgokffaabapaabaaaaaacmahaaaaadaaaaaa
cmaaaaaapeaaaaaanmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
eiafaaaaeaaaabaafcabaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabkaaaaaafjaaaaae
egiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadmccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaaaaaaaaaaagaaaaaa
dcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaa
ogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaa
adaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
aeaaaaaakgiocaaaaaaaaaaaaeaaaaaadcaaaaamdcaabaaaabaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaa
diaaaaakdccabaaaaeaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaadgaaaaaf
mccabaaaafaaaaaakgaobaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakfcaabaaaaaaaaaaaagadbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaahdccabaaaafaaaaaa
kgakbaaaaaaaaaaamgaabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaacaaaaaabjaaaaaadiaaaaaihccabaaaagaaaaaaegacbaaaaaaaaaaa
pgipcaaaacaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaa
ckiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaa
aeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaa
abeaaaaaaaaaiadpdiaaaaaiiccabaaaagaaaaaabkaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((pos_4.xy + pos_4.w) * 0.5);
  tmpvar_5.zw = pos_4.zw;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  tmpvar_3.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_3.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = o_7;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec4 c_1;
  mediump vec3 lmIndirect_2;
  mediump vec3 lmFull_3;
  mediump float lmFade_4;
  mediump vec4 light_5;
  lowp float tmpvar_6;
  lowp vec4 nrm_7;
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
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_21.x * tmpvar_26);
  nrm_7 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_7 + (tmpvar_21.y * tmpvar_28));
  nrm_7 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_7 + (tmpvar_21.z * tmpvar_30));
  nrm_7 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_33;
  tmpvar_33 = (nrm_7 + (tmpvar_21.w * tmpvar_32));
  nrm_7 = tmpvar_33;
  nrm_7 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_7, vec4(dot (tmpvar_10, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_19 * 0.5);
  tmpvar_6 = tmpvar_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_5 = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_36.w;
  highp float tmpvar_37;
  tmpvar_37 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_4 = tmpvar_37;
  lowp vec3 tmpvar_38;
  tmpvar_38 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lmFull_3 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  lmIndirect_2 = tmpvar_39;
  light_5.xyz = (tmpvar_36.xyz + mix (lmIndirect_2, lmFull_3, vec3(clamp (lmFade_4, 0.0, 1.0))));
  lowp vec4 c_40;
  mediump vec3 tmpvar_41;
  tmpvar_41 = (col_8 * light_5.xyz);
  c_40.xyz = tmpvar_41;
  c_40.w = tmpvar_6;
  c_1 = c_40;
  lowp vec4 col_42;
  col_42 = c_1;
  lowp vec4 res_43;
  highp vec2 pblend_44;
  lowp vec4 tmpvar_45;
  tmpvar_45 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_46;
  tmpvar_46 = col_42.w;
  pblend_44.x = tmpvar_46;
  lowp float tmpvar_47;
  tmpvar_47 = tmpvar_45.w;
  pblend_44.y = tmpvar_47;
  highp vec4 tmpvar_48;
  tmpvar_48.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_48.w = max (pblend_44.x, pblend_44.y);
  res_43 = tmpvar_48;
  highp vec2 tmpvar_49;
  tmpvar_49 = max (((pblend_44 - res_43.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_50;
  tmpvar_50 = (tmpvar_49 / (tmpvar_49.x + tmpvar_49.y));
  pblend_44 = tmpvar_50;
  highp vec3 tmpvar_51;
  tmpvar_51 = ((col_42.xyz * tmpvar_50.x) + (tmpvar_45.xyz * tmpvar_50.y));
  res_43.xyz = tmpvar_51;
  gl_FragData[0] = res_43;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((pos_4.xy + pos_4.w) * 0.5);
  tmpvar_5.zw = pos_4.zw;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  tmpvar_3.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_3.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = o_7;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec4 c_1;
  mediump vec3 lmIndirect_2;
  mediump vec3 lmFull_3;
  mediump float lmFade_4;
  mediump vec4 light_5;
  lowp float tmpvar_6;
  lowp vec4 nrm_7;
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
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_21.x * tmpvar_26);
  nrm_7 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_7 + (tmpvar_21.y * tmpvar_28));
  nrm_7 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_7 + (tmpvar_21.z * tmpvar_30));
  nrm_7 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2D (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_33;
  tmpvar_33 = (nrm_7 + (tmpvar_21.w * tmpvar_32));
  nrm_7 = tmpvar_33;
  lowp vec4 tmpvar_34;
  tmpvar_34 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_7, vec4(dot (tmpvar_10, vec4(1.0, 1.0, 1.0, 1.0))));
  nrm_7 = tmpvar_34;
  highp float tmpvar_35;
  tmpvar_35 = (tmpvar_19 * 0.5);
  tmpvar_6 = tmpvar_35;
  lowp vec3 normal_36;
  normal_36.xy = ((tmpvar_34.wy * 2.0) - 1.0);
  normal_36.z = sqrt((1.0 - clamp (dot (normal_36.xy, normal_36.xy), 0.0, 1.0)));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_5 = tmpvar_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_38.w;
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (unity_Lightmap, xlv_TEXCOORD5);
  lowp vec4 tmpvar_40;
  tmpvar_40 = texture2D (unity_LightmapInd, xlv_TEXCOORD5);
  highp float tmpvar_41;
  tmpvar_41 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_4 = tmpvar_41;
  lowp vec3 tmpvar_42;
  tmpvar_42 = ((8.0 * tmpvar_39.w) * tmpvar_39.xyz);
  lmFull_3 = tmpvar_42;
  lowp vec3 tmpvar_43;
  tmpvar_43 = ((8.0 * tmpvar_40.w) * tmpvar_40.xyz);
  lmIndirect_2 = tmpvar_43;
  light_5.xyz = (tmpvar_38.xyz + mix (lmIndirect_2, lmFull_3, vec3(clamp (lmFade_4, 0.0, 1.0))));
  lowp vec4 c_44;
  mediump vec3 tmpvar_45;
  tmpvar_45 = (col_8 * light_5.xyz);
  c_44.xyz = tmpvar_45;
  c_44.w = tmpvar_6;
  c_1 = c_44;
  lowp vec4 col_46;
  col_46 = c_1;
  lowp vec4 res_47;
  highp vec2 pblend_48;
  lowp vec4 tmpvar_49;
  tmpvar_49 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_50;
  tmpvar_50 = col_46.w;
  pblend_48.x = tmpvar_50;
  lowp float tmpvar_51;
  tmpvar_51 = tmpvar_49.w;
  pblend_48.y = tmpvar_51;
  highp vec4 tmpvar_52;
  tmpvar_52.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_52.w = max (pblend_48.x, pblend_48.y);
  res_47 = tmpvar_52;
  highp vec2 tmpvar_53;
  tmpvar_53 = max (((pblend_48 - res_47.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_54;
  tmpvar_54 = (tmpvar_53 / (tmpvar_53.x + tmpvar_53.y));
  pblend_48 = tmpvar_54;
  highp vec3 tmpvar_55;
  tmpvar_55 = ((col_46.xyz * tmpvar_54.x) + (tmpvar_49.xyz * tmpvar_54.y));
  res_47.xyz = tmpvar_55;
  gl_FragData[0] = res_47;
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
out highp vec4 xlv_TEXCOORD4;
out highp vec2 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 pos_4;
  pos_4 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((pos_4.xy + pos_4.w) * 0.5);
  tmpvar_5.zw = pos_4.zw;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  tmpvar_3.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_3.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = o_7;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD4;
in highp vec2 xlv_TEXCOORD5;
in highp vec4 xlv_TEXCOORD6;
void main ()
{
  mediump vec4 c_1;
  mediump vec3 lmIndirect_2;
  mediump vec3 lmFull_3;
  mediump float lmFade_4;
  mediump vec4 light_5;
  lowp float tmpvar_6;
  lowp vec4 nrm_7;
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
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_Normal0, xlv_TEXCOORD0.zw);
  highp vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_21.x * tmpvar_26);
  nrm_7 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_Normal1, xlv_TEXCOORD1.xy);
  highp vec4 tmpvar_29;
  tmpvar_29 = (nrm_7 + (tmpvar_21.y * tmpvar_28));
  nrm_7 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture (_Normal2, xlv_TEXCOORD1.zw);
  highp vec4 tmpvar_31;
  tmpvar_31 = (nrm_7 + (tmpvar_21.z * tmpvar_30));
  nrm_7 = tmpvar_31;
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture (_Normal3, xlv_TEXCOORD2);
  highp vec4 tmpvar_33;
  tmpvar_33 = (nrm_7 + (tmpvar_21.w * tmpvar_32));
  nrm_7 = tmpvar_33;
  nrm_7 = mix (vec4(0.5, 0.5, 1.0, 0.5), nrm_7, vec4(dot (tmpvar_10, vec4(1.0, 1.0, 1.0, 1.0))));
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_19 * 0.5);
  tmpvar_6 = tmpvar_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = textureProj (_LightBuffer, xlv_TEXCOORD4);
  light_5 = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_36.w;
  highp float tmpvar_37;
  tmpvar_37 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_4 = tmpvar_37;
  lowp vec3 tmpvar_38;
  tmpvar_38 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lmFull_3 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  lmIndirect_2 = tmpvar_39;
  light_5.xyz = (tmpvar_36.xyz + mix (lmIndirect_2, lmFull_3, vec3(clamp (lmFade_4, 0.0, 1.0))));
  lowp vec4 c_40;
  mediump vec3 tmpvar_41;
  tmpvar_41 = (col_8 * light_5.xyz);
  c_40.xyz = tmpvar_41;
  c_40.w = tmpvar_6;
  c_1 = c_40;
  lowp vec4 col_42;
  col_42 = c_1;
  lowp vec4 res_43;
  highp vec2 pblend_44;
  lowp vec4 tmpvar_45;
  tmpvar_45 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_46;
  tmpvar_46 = col_42.w;
  pblend_44.x = tmpvar_46;
  lowp float tmpvar_47;
  tmpvar_47 = tmpvar_45.w;
  pblend_44.y = tmpvar_47;
  highp vec4 tmpvar_48;
  tmpvar_48.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_48.w = max (pblend_44.x, pblend_44.y);
  res_43 = tmpvar_48;
  highp vec2 tmpvar_49;
  tmpvar_49 = max (((pblend_44 - res_43.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_50;
  tmpvar_50 = (tmpvar_49 / (tmpvar_49.x + tmpvar_49.y));
  pblend_44 = tmpvar_50;
  highp vec3 tmpvar_51;
  tmpvar_51 = ((col_42.xyz * tmpvar_50.x) + (tmpvar_45.xyz * tmpvar_50.y));
  res_43.xyz = tmpvar_51;
  _glesFragData[0] = res_43;
}



#endif"
}
SubProgram "opengl " {
// Stats: 20 math
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
DP4 R1.xw, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
MOV R0.w, R1.x;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[5].x;
MOV result.position, R0;
ADD R0.xy, R0, R1.w;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.texcoord[4].zw, R0;
MUL result.texcoord[3].xy, R0, c[0].x;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[8].xyxy, c[8];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[7], c[7].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[10].xyxy, c[10];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[9], c[9].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MOV result.texcoord[3].w, R1;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[6], c[6].zwzw;
MOV result.texcoord[3].z, R0;
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 22 math
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
dcl_texcoord5 o6
def c12, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r2.zw, v0, c3
dp4 r0.z, v0, c2
mov r0.w, r2
dp4 r2.xy, v0, c1
dp4 r0.x, v0, c0
mov r0.y, r2
mul r1.xyz, r0.xyww, c12.x
mov o0, r0
mul r1.y, r1, c4.x
mov r0.y, -r2.x
mad r0.xy, r2.z, c5.zwzw, r0
mad o5.xy, r1.z, c5.zwzw, r1
mov o5.zw, r0
mul o4.xy, r0, c12.x
mad o1.zw, v3.xyxy, c8.xyxy, c8
mad o1.xy, v3, c7, c7.zwzw
mad o2.zw, v3.xyxy, c10.xyxy, c10
mad o2.xy, v3, c9, c9.zwzw
mad o3.xy, v3, c11, c11.zwzw
mov o4.w, r2.z
mad o6.xy, v4, c6, c6.zwzw
mov o4.z, r0
"
}
SubProgram "d3d11 " {
// Stats: 16 math
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
eefiecedhaofpgmdcijmjjoljhclpefgfcieohppabaaaaaaeaafaaaaadaaaaaa
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
adamaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcheadaaaaeaaaabaannaaaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
mccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaa
kgiocaaaaaaaaaaaagaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaa
acaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaa
aiaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
ajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaadcaaaaam
dcaabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaa
aaaaaaaapgapbaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaaegaabaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaafmccabaaaaeaaaaaa
kgaobaaaaaaaaaaadgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
fcaabaaaaaaaaaaaagadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaahdccabaaaafaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab
"
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = o_6;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  mediump vec4 light_2;
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
  lowp vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_31.xyz * 2.0) - 1.0);
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_34;
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
  normal_36 = tmpvar_33;
  mediump vec3 scalePerBasisVector_37;
  mediump vec3 lm_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lm_38 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  scalePerBasisVector_37 = tmpvar_40;
  lm_38 = (lm_38 * dot (clamp ((tmpvar_35 * normal_36), 0.0, 1.0), scalePerBasisVector_37));
  mediump vec4 tmpvar_41;
  tmpvar_41.w = 0.0;
  tmpvar_41.xyz = lm_38;
  mediump vec4 tmpvar_42;
  tmpvar_42 = (max (light_2, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_41);
  light_2 = tmpvar_42;
  lowp vec4 c_43;
  mediump vec3 tmpvar_44;
  tmpvar_44 = (col_5 * tmpvar_42.xyz);
  c_43.xyz = tmpvar_44;
  c_43.w = tmpvar_3;
  c_1 = c_43;
  lowp vec4 col_45;
  col_45 = c_1;
  lowp vec4 res_46;
  highp vec2 pblend_47;
  lowp vec4 tmpvar_48;
  tmpvar_48 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_49;
  tmpvar_49 = col_45.w;
  pblend_47.x = tmpvar_49;
  lowp float tmpvar_50;
  tmpvar_50 = tmpvar_48.w;
  pblend_47.y = tmpvar_50;
  highp vec4 tmpvar_51;
  tmpvar_51.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_51.w = max (pblend_47.x, pblend_47.y);
  res_46 = tmpvar_51;
  highp vec2 tmpvar_52;
  tmpvar_52 = max (((pblend_47 - res_46.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_53;
  tmpvar_53 = (tmpvar_52 / (tmpvar_52.x + tmpvar_52.y));
  pblend_47 = tmpvar_53;
  highp vec3 tmpvar_54;
  tmpvar_54 = ((col_45.xyz * tmpvar_53.x) + (tmpvar_48.xyz * tmpvar_53.y));
  res_46.xyz = tmpvar_54;
  gl_FragData[0] = res_46;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = o_6;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
varying highp vec4 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  mediump vec4 light_2;
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
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (unity_Lightmap, xlv_TEXCOORD5);
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (unity_LightmapInd, xlv_TEXCOORD5);
  mat3 tmpvar_37;
  tmpvar_37[0].x = 0.816497;
  tmpvar_37[0].y = -0.408248;
  tmpvar_37[0].z = -0.408248;
  tmpvar_37[1].x = 0.0;
  tmpvar_37[1].y = 0.707107;
  tmpvar_37[1].z = -0.707107;
  tmpvar_37[2].x = 0.57735;
  tmpvar_37[2].y = 0.57735;
  tmpvar_37[2].z = 0.57735;
  mediump vec3 normal_38;
  normal_38 = normal_33;
  mediump vec3 scalePerBasisVector_39;
  mediump vec3 lm_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = ((8.0 * tmpvar_35.w) * tmpvar_35.xyz);
  lm_40 = tmpvar_41;
  lowp vec3 tmpvar_42;
  tmpvar_42 = ((8.0 * tmpvar_36.w) * tmpvar_36.xyz);
  scalePerBasisVector_39 = tmpvar_42;
  lm_40 = (lm_40 * dot (clamp ((tmpvar_37 * normal_38), 0.0, 1.0), scalePerBasisVector_39));
  mediump vec4 tmpvar_43;
  tmpvar_43.w = 0.0;
  tmpvar_43.xyz = lm_40;
  mediump vec4 tmpvar_44;
  tmpvar_44 = (max (light_2, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_43);
  light_2 = tmpvar_44;
  lowp vec4 c_45;
  mediump vec3 tmpvar_46;
  tmpvar_46 = (col_5 * tmpvar_44.xyz);
  c_45.xyz = tmpvar_46;
  c_45.w = tmpvar_3;
  c_1 = c_45;
  lowp vec4 col_47;
  col_47 = c_1;
  lowp vec4 res_48;
  highp vec2 pblend_49;
  lowp vec4 tmpvar_50;
  tmpvar_50 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_51;
  tmpvar_51 = col_47.w;
  pblend_49.x = tmpvar_51;
  lowp float tmpvar_52;
  tmpvar_52 = tmpvar_50.w;
  pblend_49.y = tmpvar_52;
  highp vec4 tmpvar_53;
  tmpvar_53.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_53.w = max (pblend_49.x, pblend_49.y);
  res_48 = tmpvar_53;
  highp vec2 tmpvar_54;
  tmpvar_54 = max (((pblend_49 - res_48.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_55;
  tmpvar_55 = (tmpvar_54 / (tmpvar_54.x + tmpvar_54.y));
  pblend_49 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = ((col_47.xyz * tmpvar_55.x) + (tmpvar_50.xyz * tmpvar_55.y));
  res_48.xyz = tmpvar_56;
  gl_FragData[0] = res_48;
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
out highp vec4 xlv_TEXCOORD4;
out highp vec2 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  highp vec4 pos_3;
  pos_3 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_4;
  tmpvar_4.xy = ((pos_3.xy + pos_3.w) * 0.5);
  tmpvar_4.zw = pos_3.zw;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_4;
  xlv_TEXCOORD4 = o_6;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
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
in highp vec4 xlv_TEXCOORD4;
in highp vec2 xlv_TEXCOORD5;
void main ()
{
  mediump vec4 c_1;
  mediump vec4 light_2;
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
  lowp vec3 tmpvar_33;
  tmpvar_33 = ((tmpvar_31.xyz * 2.0) - 1.0);
  lowp vec4 tmpvar_34;
  tmpvar_34 = textureProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_34;
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
  normal_36 = tmpvar_33;
  mediump vec3 scalePerBasisVector_37;
  mediump vec3 lm_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lm_38 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  scalePerBasisVector_37 = tmpvar_40;
  lm_38 = (lm_38 * dot (clamp ((tmpvar_35 * normal_36), 0.0, 1.0), scalePerBasisVector_37));
  mediump vec4 tmpvar_41;
  tmpvar_41.w = 0.0;
  tmpvar_41.xyz = lm_38;
  mediump vec4 tmpvar_42;
  tmpvar_42 = (max (light_2, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_41);
  light_2 = tmpvar_42;
  lowp vec4 c_43;
  mediump vec3 tmpvar_44;
  tmpvar_44 = (col_5 * tmpvar_42.xyz);
  c_43.xyz = tmpvar_44;
  c_43.w = tmpvar_3;
  c_1 = c_43;
  lowp vec4 col_45;
  col_45 = c_1;
  lowp vec4 res_46;
  highp vec2 pblend_47;
  lowp vec4 tmpvar_48;
  tmpvar_48 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_49;
  tmpvar_49 = col_45.w;
  pblend_47.x = tmpvar_49;
  lowp float tmpvar_50;
  tmpvar_50 = tmpvar_48.w;
  pblend_47.y = tmpvar_50;
  highp vec4 tmpvar_51;
  tmpvar_51.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_51.w = max (pblend_47.x, pblend_47.y);
  res_46 = tmpvar_51;
  highp vec2 tmpvar_52;
  tmpvar_52 = max (((pblend_47 - res_46.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_53;
  tmpvar_53 = (tmpvar_52 / (tmpvar_52.x + tmpvar_52.y));
  pblend_47 = tmpvar_53;
  highp vec3 tmpvar_54;
  tmpvar_54 = ((col_45.xyz * tmpvar_53.x) + (tmpvar_48.xyz * tmpvar_53.y));
  res_46.xyz = tmpvar_54;
  _glesFragData[0] = res_46;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 49 math, 7 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [_GrabTexture] 2D 10
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R1.w, R4.z, R1;
TEX R0, fragment.texcoord[2], texture[4], 2D;
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
ADD R4, R4, c[0].x;
MAX R4, R4, c[1].x;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R3.xyz, R4.x, R3;
MUL R2.xyz, R4.y, R2;
ADD R2.xyz, R3, R2;
MUL R3.xyz, R4.z, R1;
TXP R1, fragment.texcoord[3], texture[10], 2D;
MUL R4.x, R0.w, c[1].y;
MAX R0.w, R1, R4.x;
MOV R4.y, R1.w;
ADD R2.xyz, R2, R3;
MUL R0.xyz, R4.w, R0;
ADD R2.xyz, R2, R0;
TXP R0.xyz, fragment.texcoord[4], texture[9], 2D;
MOV R1.w, c[1].y;
ADD R4.xy, R4, -R0.w;
MAD R4.xy, R1.w, c[0].x, R4;
MAX R3.xy, R4, c[1].x;
ADD R1.w, R3.x, R3.y;
RCP R1.w, R1.w;
MUL R3.xy, R3, R1.w;
LG2 R0.x, R0.x;
LG2 R0.z, R0.z;
LG2 R0.y, R0.y;
ADD R0.xyz, -R0, fragment.texcoord[5];
MUL R1.xyz, R3.y, R1;
MUL R0.xyz, R2, R0;
MAD result.color.xyz, R0, R3.x, R1;
MOV result.color.w, R0;
END
# 49 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 42 math, 7 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [_GrabTexture] 2D 10
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s9
dcl_2d s10
def c1, 0.00000000, 0.50000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4
dcl_texcoord5 v5.xyz
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
add r4, r4, c0.x
max r4, r4, c1.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r2.xyz, r4.x, r2
mul r3.xyz, r4.y, r3
add_pp r2.xyz, r2, r3
mul r3.xyz, r4.z, r0
mul r4.x, r0.w, c1.y
texldp r0, v3, s10
max r1.w, r0, r4.x
mov r4.y, r0.w
add_pp r2.xyz, r2, r3
mul r1.xyz, r4.w, r1
add_pp r2.xyz, r2, r1
texldp r1.xyz, v4, s9
mov r0.w, c0.x
add r4.xy, r4, -r1.w
mad r4.xy, c1.y, r0.w, r4
max r3.xy, r4, c1.x
add r0.w, r3.x, r3.y
rcp r0.w, r0.w
mul r3.xy, r3, r0.w
log_pp r1.x, r1.x
log_pp r1.z, r1.z
log_pp r1.y, r1.y
add_pp r1.xyz, -r1, v5
mul r0.xyz, r3.y, r0
mul_pp r1.xyz, r2, r1
mad oC0.xyz, r1, r3.x, r0
mov_pp oC0.w, r1
"
}
SubProgram "d3d11 " {
// Stats: 32 math, 7 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_LightBuffer] 2D 6
SetTexture 6 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 160
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedajeiienlohagcebgggjemcaoeepefjlmabaaaaaahaahaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcdiagaaaaeaaaaaaaioabaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadlcbabaaa
aeaaaaaagcbaaaadlcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaahecaabaaa
acaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaa
egbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaahicaabaaa
acaaaaaadkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaacaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaahccaabaaaacaaaaaa
bkaabaaaabaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaabkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaa
abaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egaobaaaacaaaaaadiaaaaahbcaabaaaacaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaadpaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaa
adaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaa
akaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaa
aoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaah
hcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaa
aeaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaaeaaaaaadcaaaaaj
hcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaa
aaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaa
agaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaaagaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaa
egbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaa
abaaaaaaeghobaaaagaaaaaaaagabaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaabaaaaaaakaabaaaacaaaaaadgaaaaafccaabaaaacaaaaaadkaabaaa
abaaaaaaaaaaaaaidcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegaabaaa
acaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaandcaabaaa
acaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaegaabaaaacaaaaaadeaaaaakdcaabaaaacaaaaaaegaabaaaacaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
bkaabaaaacaaaaaaakaabaaaacaaaaaaaoaaaaahdcaabaaaacaaaaaaegaabaaa
acaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
fgafbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaagaabaaa
acaaaaaaegacbaaaabaaaaaadoaaaaab"
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
// Stats: 60 math, 9 textures
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
SetTexture 12 [_GrabTexture] 2D 12
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 8, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R1.w, R4.z, R1;
ADD R4.w, R0, R4;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
MAX R0.w, R4, R1;
ADD R4.x, R4, R3.w;
MAX R0.w, R2, R0;
MAX R0.w, R4.x, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R0.w;
ADD R4, R4, c[0].x;
MAX R4, R4, c[2].x;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R3.xyz, R4.x, R3;
MUL R2.xyz, R4.y, R2;
ADD R3.xyz, R3, R2;
MUL R4.x, R0.w, c[2].z;
TXP R2, fragment.texcoord[3], texture[12], 2D;
MAX R3.w, R2, R4.x;
MOV R4.y, R2.w;
MUL R1.xyz, R4.z, R1;
ADD R1.xyz, R3, R1;
MUL R0.xyz, R4.w, R0;
ADD R3.xyz, R1, R0;
TEX R1, fragment.texcoord[5], texture[10], 2D;
MOV R0.w, c[2].z;
ADD R4.xy, R4, -R3.w;
MAD R4.xy, R0.w, c[0].x, R4;
MAX R4.xy, R4, c[2].x;
ADD R0.w, R4.x, R4.y;
RCP R0.w, R0.w;
MUL R4.xy, R4, R0.w;
TEX R0, fragment.texcoord[5], texture[11], 2D;
MUL R0.xyz, R0.w, R0;
DP4 R0.w, fragment.texcoord[6], fragment.texcoord[6];
RSQ R0.w, R0.w;
RCP R0.w, R0.w;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R0, c[2].y;
MAD R5.xyz, R1, c[2].y, -R0;
TXP R1.xyz, fragment.texcoord[4], texture[9], 2D;
MAD_SAT R0.w, R0, c[1].z, c[1];
LG2 R1.x, R1.x;
LG2 R1.y, R1.y;
LG2 R1.z, R1.z;
MAD R0.xyz, R0.w, R5, R0;
ADD R0.xyz, -R1, R0;
MUL R1.xyz, R4.y, R2;
MUL R0.xyz, R3, R0;
MAD result.color.xyz, R0, R4.x, R1;
MOV result.color.w, R3;
END
# 60 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 51 math, 9 textures
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
SetTexture 12 [_GrabTexture] 2D 12
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s9
dcl_2d s10
dcl_2d s11
dcl_2d s12
def c2, 0.00000000, 8.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4
dcl_texcoord5 v5.xy
dcl_texcoord6 v6
texld r4, v0, s0
texld r0, v1.zwzw, s3
texld r2, v0.zwzw, s1
texld r1, v2, s4
add_pp r1.w, r1, r4
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r1, r4.z
add_pp r4.x, r4, r2.w
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, r4, -r0.w
add r4, r4, c0.x
max r4, r4, c2.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r2.xyz, r4.x, r2
mul r4.x, r0.w, c2.z
mul r3.xyz, r4.y, r3
add_pp r3.xyz, r2, r3
texldp r2, v3, s12
max r3.w, r2, r4.x
mov r4.y, r2.w
mul r0.xyz, r4.z, r0
add_pp r0.xyz, r3, r0
mul r1.xyz, r4.w, r1
add_pp r3.xyz, r0, r1
texld r1, v5, s10
mov r0.w, c0.x
add r4.xy, r4, -r3.w
mad r4.xy, c2.z, r0.w, r4
max r4.xy, r4, c2.x
add r0.w, r4.x, r4.y
rcp r0.w, r0.w
mul r4.xy, r4, r0.w
texld r0, v5, s11
mul_pp r0.xyz, r0.w, r0
dp4 r0.w, v6, v6
rsq r0.w, r0.w
rcp r0.w, r0.w
mul_pp r1.xyz, r1.w, r1
mul_pp r0.xyz, r0, c2.y
mad_pp r5.xyz, r1, c2.y, -r0
texldp r1.xyz, v4, s9
mad_sat r0.w, r0, c1.z, c1
log_pp r1.x, r1.x
log_pp r1.y, r1.y
log_pp r1.z, r1.z
mad_pp r0.xyz, r0.w, r5, r0
add_pp r0.xyz, -r1, r0
mul r1.xyz, r4.y, r2
mul_pp r0.xyz, r3, r0
mad oC0.xyz, r0, r4.x, r1
mov_pp oC0.w, r3
"
}
SubProgram "d3d11 " {
// Stats: 40 math, 9 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_LightBuffer] 2D 6
SetTexture 6 [unity_Lightmap] 2D 7
SetTexture 7 [unity_LightmapInd] 2D 8
SetTexture 8 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 192
Float 48 [_Depth]
Vector 160 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhbdopobaddmalkmhhahijfeflnhjephiabaaaaaabaajaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaneaaaaaa
afaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaaneaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apalaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcmaahaaaaeaaaaaaapaabaaaafjaaaaaeegiocaaa
aaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafkaaaaad
aagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaa
ffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
dcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaa
gcbaaaadlcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacahaaaaaabbaaaaahbcaabaaaaaaaaaaaegbobaaaagaaaaaa
egbobaaaagaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadccaaaal
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaakaaaaaadkiacaaa
aaaaaaaaakaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaa
ahaaaaaaaagabaaaaiaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaafgafbaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaaagaaaaaa
aagabaaaahaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaaaebdcaaaaakhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
jgahbaiaebaaaaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
afaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaafaaaaaaaagabaaaagaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaa
abaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaa
aagabaaaaeaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaaaaaaaaahecaabaaaadaaaaaadkaabaaaabaaaaaa
ckaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaafaaaaaaaaaaaaahicaabaaaadaaaaaadkaabaaaacaaaaaa
dkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaadaaaaaackaabaaa
adaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaa
aagabaaaadaaaaaaaaaaaaahccaabaaaadaaaaaabkaabaaaacaaaaaadkaabaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaadaaaaaa
efaaaaajpcaabaaaagaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
acaaaaaaaaaaaaahbcaabaaaadaaaaaaakaabaaaacaaaaaadkaabaaaagaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaadaaaaaaaaaaaaai
pcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaaadaaaaaadiaaaaah
bcaabaaaadaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaaipcaabaaa
acaaaaaaegaobaaaacaaaaaaagiacaaaaaaaaaaaadaaaaaadeaaaaakpcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaaaaaaaaah
icaabaaaaaaaaaaackaabaaaacaaaaaadkaabaaaaaaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaacaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaafaaaaaaegacbaaa
afaaaaaafgafbaaaacaaaaaadcaaaaajhcaabaaaafaaaaaaagaabaaaacaaaaaa
egacbaaaagaaaaaaegacbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaakgakbaaa
acaaaaaaegacbaaaabaaaaaaegacbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaa
pgapbaaaacaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaa
egbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaa
abaaaaaaeghobaaaaiaaaaaaaagabaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaabaaaaaaakaabaaaadaaaaaadgaaaaafccaabaaaadaaaaaadkaabaaa
abaaaaaaaaaaaaaidcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegaabaaa
adaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaandcaabaaa
acaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaegaabaaaacaaaaaadeaaaaakdcaabaaaacaaaaaaegaabaaaacaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
bkaabaaaacaaaaaaakaabaaaacaaaaaaaoaaaaahdcaabaaaacaaaaaaegaabaaa
acaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
fgafbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaagaabaaa
acaaaaaaegacbaaaabaaaaaadoaaaaab"
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
// Stats: 80 math, 13 textures
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
SetTexture 12 [_GrabTexture] 2D 12
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0],
		{ 0, 1, 0.5, 2 },
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
TEX R1, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R5.y, R0.w, R1.w;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R1.z, R2;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R1, R4.w;
ADD R3.w, R1.y, R3;
MAX R0.w, R5.y, R2;
MAX R0.w, R3, R0;
MOV R5.w, R5.y;
MAX R0.w, R5.x, R0;
DP4 R1.x, R1, c[1].y;
MOV R5.z, R2.w;
MOV R5.y, R3.w;
ADD R5, R5, -R0.w;
ADD R5, R5, c[0].x;
MAX R5, R5, c[1].x;
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
MUL R4.xyz, R5.x, R4;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[1].z;
MAD R1.xy, R1.x, R6, c[1].z;
MAD R7.xy, R1.yxzw, c[1].w, -c[1].y;
MUL R1.xy, R7, R7;
ADD_SAT R1.x, R1, R1.y;
ADD R1.x, -R1, c[1].y;
RSQ R1.x, R1.x;
RCP R7.z, R1.x;
TEX R1, fragment.texcoord[5], texture[11], 2D;
MUL R5.x, R0.w, c[1].z;
MUL R1.xyz, R1.w, R1;
DP3_SAT R6.z, R7, c[2];
DP3_SAT R6.y, R7, c[3];
DP3_SAT R6.x, R7, c[4];
MUL R6.xyz, R1, R6;
TEX R1, fragment.texcoord[5], texture[10], 2D;
DP3 R2.w, R6, c[2].w;
MUL R6.xyz, R1.w, R1;
TXP R1.xyz, fragment.texcoord[4], texture[9], 2D;
MUL R6.xyz, R6, R2.w;
MOV R1.w, c[1].z;
LG2 R1.x, R1.x;
LG2 R1.z, R1.z;
LG2 R1.y, R1.y;
MAD R1.xyz, R6, c[2].w, -R1;
MUL R6.xyz, R5.y, R3;
TXP R3, fragment.texcoord[3], texture[12], 2D;
MAX R0.w, R3, R5.x;
MOV R5.y, R3.w;
ADD R5.xy, R5, -R0.w;
MAD R5.xy, R1.w, c[0].x, R5;
MAX R5.xy, R5, c[1].x;
ADD R1.w, R5.x, R5.y;
ADD R4.xyz, R4, R6;
MUL R2.xyz, R5.z, R2;
ADD R2.xyz, R4, R2;
RCP R1.w, R1.w;
MUL R0.xyz, R5.w, R0;
ADD R0.xyz, R2, R0;
MUL R4.xy, R5, R1.w;
MUL R2.xyz, R4.y, R3;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, R4.x, R2;
MOV result.color.w, R0;
END
# 80 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 67 math, 13 textures
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
SetTexture 12 [_GrabTexture] 2D 12
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
dcl_2d s12
def c1, 0.00000000, 1.00000000, -0.50000000, 8.00000000
def c2, 2.00000000, -1.00000000, 0.50000000, 0
def c3, -0.40824828, -0.70710677, 0.57735026, 0
def c4, -0.40824831, 0.70710677, 0.57735026, 0
def c5, 0.81649655, 0.00000000, 0.57735026, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4
dcl_texcoord5 v5.xy
texld r1, v0, s0
texld r0, v2, s4
add_pp r5.y, r0.w, r1.w
texld r3, v1, s2
texld r2, v1.zwzw, s3
add_pp r2.w, r1.z, r2
texld r4, v0.zwzw, s1
add_pp r5.x, r1, r4.w
add_pp r3.w, r1.y, r3
max r0.w, r5.y, r2
max r0.w, r3, r0
mov r5.w, r5.y
max r0.w, r5.x, r0
dp4_pp r1.x, r1, c1.y
mov r5.z, r2.w
mov r5.y, r3.w
add r5, r5, -r0.w
add r5, r5, c0.x
max r5, r5, c1.x
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
mul r4.xyz, r5.x, r4
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
add_pp r6.xy, r6.xzzw, r6.ywzw
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c1.z
mad_pp r1.xy, r1.x, r6, c2.z
mad_pp r7.xy, r1.yxzw, c2.x, c2.y
mul_pp r1.xy, r7, r7
add_pp_sat r1.x, r1, r1.y
add_pp r1.x, -r1, c1.y
rsq_pp r1.x, r1.x
rcp_pp r7.z, r1.x
texld r1, v5, s11
mul r5.x, r0.w, c2.z
mul_pp r1.xyz, r1.w, r1
dp3_pp_sat r6.z, r7, c3
dp3_pp_sat r6.y, r7, c4
dp3_pp_sat r6.x, r7, c5
mul_pp r6.xyz, r1, r6
texld r1, v5, s10
dp3_pp r2.w, r6, c1.w
mul_pp r6.xyz, r1.w, r1
texldp r1.xyz, v4, s9
mul_pp r6.xyz, r6, r2.w
mov r1.w, c0.x
log_pp r1.x, r1.x
log_pp r1.z, r1.z
log_pp r1.y, r1.y
mad_pp r1.xyz, r6, c1.w, -r1
mul r6.xyz, r5.y, r3
texldp r3, v3, s12
max r0.w, r3, r5.x
mov r5.y, r3.w
add r5.xy, r5, -r0.w
mad r5.xy, c2.z, r1.w, r5
max r5.xy, r5, c1.x
add r1.w, r5.x, r5.y
add_pp r4.xyz, r4, r6
mul r2.xyz, r5.z, r2
add_pp r2.xyz, r4, r2
rcp r1.w, r1.w
mul r0.xyz, r5.w, r0
add_pp r0.xyz, r2, r0
mul r4.xy, r5, r1.w
mul r2.xyz, r4.y, r3
mul_pp r0.xyz, r0, r1
mad oC0.xyz, r0, r4.x, r2
mov_pp oC0.w, r0
"
}
SubProgram "d3d11 " {
// Stats: 52 math, 13 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_Normal0] 2D 6
SetTexture 6 [_Normal1] 2D 7
SetTexture 7 [_Normal2] 2D 8
SetTexture 8 [_Normal3] 2D 9
SetTexture 9 [_LightBuffer] 2D 10
SetTexture 10 [unity_Lightmap] 2D 11
SetTexture 11 [unity_LightmapInd] 2D 12
SetTexture 12 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 192
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefieceddggocgkpjbocmkaiaogpnjfckpgaipjmabaaaaaakmalaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcheakaaaaeaaaaaaajnacaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafkaaaaad
aagabaaaajaaaaaafkaaaaadaagabaaaakaaaaaafkaaaaadaagabaaaalaaaaaa
fkaaaaadaagabaaaamaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaae
aahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaae
aahabaaaajaaaaaaffffaaaafibiaaaeaahabaaaakaaaaaaffffaaaafibiaaae
aahabaaaalaaaaaaffffaaaafibiaaaeaahabaaaamaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaadlcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacakaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaadaaaaaaeghobaaaalaaaaaaaagabaaaamaaaaaadiaaaaah
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
diaaaaahbcaabaaaagaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaai
pcaabaaaafaaaaaaegaobaaaafaaaaaaagiacaaaaaaaaaaaadaaaaaadeaaaaak
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
aaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaaaoaaaaahgcaabaaaaaaaaaaa
agbbbaaaafaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaajgafbaaa
aaaaaaaaeghobaaaajaaaaaaaagabaaaakaaaaaacpaaaaafocaabaaaaaaaaaaa
agajbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaa
akaaaaaaaagabaaaalaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaa
jgahbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaaiaaaaaa
fgafbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaaagaabaaaafaaaaaaegacbaaa
ajaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaabaaaaaakgakbaaaafaaaaaa
egacbaaaaeaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaabaaaaaapgapbaaa
afaaaaaaegacbaaaahaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
aeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaamaaaaaaaagabaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
abaaaaaaakaabaaaagaaaaaadgaaaaafccaabaaaagaaaaaadkaabaaaabaaaaaa
aaaaaaaidcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegaabaaaagaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaandcaabaaaacaaaaaa
agiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
egaabaaaacaaaaaadeaaaaakdcaabaaaacaaaaaaegaabaaaacaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
acaaaaaaakaabaaaacaaaaaaaoaaaaahdcaabaaaacaaaaaaegaabaaaacaaaaaa
pgapbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaafgafbaaa
acaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaagaabaaaacaaaaaa
egacbaaaabaaaaaadoaaaaab"
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
// Stats: 46 math, 7 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [_GrabTexture] 2D 10
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R1.w, R4.z, R1;
TEX R0, fragment.texcoord[2], texture[4], 2D;
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
ADD R4, R4, c[0].x;
MAX R4, R4, c[1].x;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R3.xyz, R4.x, R3;
MUL R2.xyz, R4.y, R2;
ADD R2.xyz, R3, R2;
MUL R3.xyz, R4.z, R1;
TXP R1, fragment.texcoord[3], texture[10], 2D;
MUL R4.x, R0.w, c[1].y;
MAX R0.w, R1, R4.x;
MOV R4.y, R1.w;
ADD R2.xyz, R2, R3;
MUL R0.xyz, R4.w, R0;
ADD R2.xyz, R2, R0;
TXP R0.xyz, fragment.texcoord[4], texture[9], 2D;
ADD R0.xyz, R0, fragment.texcoord[5];
MOV R1.w, c[1].y;
ADD R4.xy, R4, -R0.w;
MAD R4.xy, R1.w, c[0].x, R4;
MAX R3.xy, R4, c[1].x;
ADD R1.w, R3.x, R3.y;
RCP R1.w, R1.w;
MUL R3.xy, R3, R1.w;
MUL R1.xyz, R3.y, R1;
MUL R0.xyz, R2, R0;
MAD result.color.xyz, R0, R3.x, R1;
MOV result.color.w, R0;
END
# 46 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 39 math, 7 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 9 [_LightBuffer] 2D 9
SetTexture 10 [_GrabTexture] 2D 10
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s9
dcl_2d s10
def c1, 0.00000000, 0.50000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4
dcl_texcoord5 v5.xyz
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
add r4, r4, c0.x
max r4, r4, c1.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r2.xyz, r4.x, r2
mul r3.xyz, r4.y, r3
add_pp r2.xyz, r2, r3
mul r3.xyz, r4.z, r0
mul r4.x, r0.w, c1.y
texldp r0, v3, s10
max r1.w, r0, r4.x
mov r4.y, r0.w
add_pp r2.xyz, r2, r3
mul r1.xyz, r4.w, r1
add_pp r2.xyz, r2, r1
texldp r1.xyz, v4, s9
add_pp r1.xyz, r1, v5
mov r0.w, c0.x
add r4.xy, r4, -r1.w
mad r4.xy, c1.y, r0.w, r4
max r3.xy, r4, c1.x
add r0.w, r3.x, r3.y
rcp r0.w, r0.w
mul r3.xy, r3, r0.w
mul r0.xyz, r3.y, r0
mul_pp r1.xyz, r2, r1
mad oC0.xyz, r1, r3.x, r0
mov_pp oC0.w, r1
"
}
SubProgram "d3d11 " {
// Stats: 31 math, 7 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_LightBuffer] 2D 6
SetTexture 6 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 160
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedfacbnpdmpoklgjeheecnidochmhhegakabaaaaaafiahaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefccaagaaaaeaaaaaaaiiabaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadlcbabaaa
aeaaaaaagcbaaaadlcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaahecaabaaa
acaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaa
egbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaahicaabaaa
acaaaaaadkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaacaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaahccaabaaaacaaaaaa
bkaabaaaabaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaabkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaa
abaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egaobaaaacaaaaaadiaaaaahbcaabaaaacaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaadpaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaa
adaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaa
akaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaa
aoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaah
hcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaa
aeaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaaeaaaaaadcaaaaaj
hcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaa
aaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaa
agaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegbcbaaaagaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaah
dcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaagaaaaaaaagabaaaaaaaaaaadeaaaaah
icaabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaadgaaaaafccaabaaa
acaaaaaadkaabaaaabaaaaaaaaaaaaaidcaabaaaacaaaaaapgapbaiaebaaaaaa
aaaaaaaaegaabaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaandcaabaaaacaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaegaabaaaacaaaaaadeaaaaakdcaabaaaacaaaaaa
egaabaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaaaoaaaaahdcaabaaa
acaaaaaaegaabaaaacaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaafgafbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
aaaaaaaaagaabaaaacaaaaaaegacbaaaabaaaaaadoaaaaab"
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
// Stats: 57 math, 9 textures
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
SetTexture 12 [_GrabTexture] 2D 12
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 8, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R4, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R1.w, R4.z, R1;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R4.w, R0, R4;
TEX R2, fragment.texcoord[1], texture[2], 2D;
ADD R2.w, R4.y, R2;
MAX R0.w, R4, R1;
TEX R3, fragment.texcoord[0].zwzw, texture[1], 2D;
MAX R0.w, R2, R0;
ADD R4.x, R4, R3.w;
MAX R0.w, R4.x, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R0.w;
ADD R4, R4, c[0].x;
MAX R4, R4, c[2].x;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R3.xyz, R4.x, R3;
MUL R4.x, R0.w, c[2].z;
MUL R2.xyz, R4.y, R2;
ADD R2.xyz, R3, R2;
MUL R3.xyz, R4.z, R1;
TXP R1, fragment.texcoord[3], texture[12], 2D;
MAX R2.w, R1, R4.x;
MOV R4.y, R1.w;
ADD R2.xyz, R2, R3;
MUL R0.xyz, R4.w, R0;
MOV R0.w, c[2].z;
ADD R4.xy, R4, -R2.w;
MAD R4.xy, R0.w, c[0].x, R4;
MAX R3.xy, R4, c[2].x;
ADD R0.w, R3.x, R3.y;
RCP R1.w, R0.w;
MUL R4.xy, R3, R1.w;
ADD R2.xyz, R2, R0;
TEX R0, fragment.texcoord[5], texture[10], 2D;
MUL R3.xyz, R0.w, R0;
TEX R0, fragment.texcoord[5], texture[11], 2D;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, c[2].y;
DP4 R1.w, fragment.texcoord[6], fragment.texcoord[6];
RSQ R0.w, R1.w;
RCP R0.w, R0.w;
MAD R3.xyz, R3, c[2].y, -R0;
MAD_SAT R0.w, R0, c[1].z, c[1];
MAD R3.xyz, R0.w, R3, R0;
TXP R0.xyz, fragment.texcoord[4], texture[9], 2D;
ADD R0.xyz, R0, R3;
MUL R1.xyz, R4.y, R1;
MUL R0.xyz, R2, R0;
MAD result.color.xyz, R0, R4.x, R1;
MOV result.color.w, R2;
END
# 57 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 48 math, 9 textures
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
SetTexture 12 [_GrabTexture] 2D 12
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s9
dcl_2d s10
dcl_2d s11
dcl_2d s12
def c2, 0.00000000, 8.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4
dcl_texcoord5 v5.xy
dcl_texcoord6 v6
texld r4, v0, s0
texld r0, v1.zwzw, s3
texld r2, v0.zwzw, s1
texld r1, v2, s4
add_pp r1.w, r1, r4
add_pp r4.z, r4, r0.w
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r1, r4.z
add_pp r4.x, r4, r2.w
max r0.w, r3, r0
max r0.w, r4.x, r0
mov r4.w, r1
mov r4.y, r3.w
add r4, r4, -r0.w
add r4, r4, c0.x
max r4, r4, c2.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r2.xyz, r4.x, r2
mul r3.xyz, r4.y, r3
add_pp r2.xyz, r2, r3
mul r3.xyz, r4.z, r0
mul r4.x, r0.w, c2.z
texldp r0, v3, s12
max r2.w, r0, r4.x
mov r4.y, r0.w
add_pp r2.xyz, r2, r3
mul r1.xyz, r4.w, r1
add_pp r2.xyz, r2, r1
mov r0.w, c0.x
add r4.xy, r4, -r2.w
mad r4.xy, c2.z, r0.w, r4
max r3.xy, r4, c2.x
add r0.w, r3.x, r3.y
rcp r0.w, r0.w
mul r4.xy, r3, r0.w
texld r1, v5, s10
mul_pp r3.xyz, r1.w, r1
texld r1, v5, s11
dp4 r0.w, v6, v6
mul_pp r1.xyz, r1.w, r1
mul_pp r1.xyz, r1, c2.y
rsq r0.w, r0.w
rcp r0.w, r0.w
mad_pp r3.xyz, r3, c2.y, -r1
mad_sat r0.w, r0, c1.z, c1
mad_pp r3.xyz, r0.w, r3, r1
texldp r1.xyz, v4, s9
add_pp r1.xyz, r1, r3
mul r0.xyz, r4.y, r0
mul_pp r1.xyz, r2, r1
mad oC0.xyz, r1, r4.x, r0
mov_pp oC0.w, r2
"
}
SubProgram "d3d11 " {
// Stats: 39 math, 9 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_LightBuffer] 2D 6
SetTexture 6 [unity_Lightmap] 2D 7
SetTexture 7 [unity_LightmapInd] 2D 8
SetTexture 8 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 192
Float 48 [_Depth]
Vector 160 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0
eefiecedbncoigmcdodccgnfeicajddbebkoicdaabaaaaaapiaiaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaneaaaaaa
afaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaaneaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apalaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefckiahaaaaeaaaaaaaokabaaaafjaaaaaeegiocaaa
aaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafkaaaaad
aagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaa
ffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
dcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaa
gcbaaaadlcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacahaaaaaabbaaaaahbcaabaaaaaaaaaaaegbobaaaagaaaaaa
egbobaaaagaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadccaaaal
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaakaaaaaadkiacaaa
aaaaaaaaakaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaa
ahaaaaaaaagabaaaaiaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaafgafbaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaaagaaaaaa
aagabaaaahaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaaaebdcaaaaakhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
jgahbaiaebaaaaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
afaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaafaaaaaaaagabaaaagaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaahecaabaaaadaaaaaa
dkaabaaaabaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaahicaabaaaadaaaaaa
dkaabaaaacaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
adaaaaaackaabaaaadaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaahccaabaaaadaaaaaabkaabaaa
acaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkaabaaaadaaaaaaefaaaaajpcaabaaaagaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaacaaaaaaaaaaaaahbcaabaaaadaaaaaaakaabaaaacaaaaaa
dkaabaaaagaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
adaaaaaaaaaaaaaipcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaa
adaaaaaadiaaaaahbcaabaaaadaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadp
aaaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaaagiacaaaaaaaaaaaadaaaaaa
deaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaaakaabaaa
acaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaacaaaaaadkaabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaacaaaaaadkaabaaaaaaaaaaaaoaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaa
afaaaaaaegacbaaaafaaaaaafgafbaaaacaaaaaadcaaaaajhcaabaaaafaaaaaa
agaabaaaacaaaaaaegacbaaaagaaaaaaegacbaaaafaaaaaadcaaaaajhcaabaaa
abaaaaaakgakbaaaacaaaaaaegacbaaaabaaaaaaegacbaaaafaaaaaadcaaaaaj
hcaabaaaabaaaaaapgapbaaaacaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaah
dcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaaiaaaaaaaagabaaaaaaaaaaadeaaaaah
icaabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaadaaaaaadgaaaaafccaabaaa
adaaaaaadkaabaaaabaaaaaaaaaaaaaidcaabaaaacaaaaaapgapbaiaebaaaaaa
aaaaaaaaegaabaaaadaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaandcaabaaaacaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaegaabaaaacaaaaaadeaaaaakdcaabaaaacaaaaaa
egaabaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaaaoaaaaahdcaabaaa
acaaaaaaegaabaaaacaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaafgafbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
aaaaaaaaagaabaaaacaaaaaaegacbaaaabaaaaaadoaaaaab"
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
// Stats: 77 math, 13 textures
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
SetTexture 12 [_GrabTexture] 2D 12
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0],
		{ 0, 1, 0.5, 2 },
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
TEX R1, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[4], 2D;
ADD R5.y, R0.w, R1.w;
TEX R3, fragment.texcoord[1], texture[2], 2D;
TEX R2, fragment.texcoord[1].zwzw, texture[3], 2D;
ADD R2.w, R1.z, R2;
TEX R4, fragment.texcoord[0].zwzw, texture[1], 2D;
ADD R5.x, R1, R4.w;
ADD R3.w, R1.y, R3;
MAX R0.w, R5.y, R2;
MAX R0.w, R3, R0;
MOV R5.w, R5.y;
MAX R0.w, R5.x, R0;
DP4 R1.x, R1, c[1].y;
MOV R5.z, R2.w;
MOV R5.y, R3.w;
ADD R5, R5, -R0.w;
ADD R5, R5, c[0].x;
MAX R5, R5, c[1].x;
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
MUL R4.xyz, R5.x, R4;
TEX R6.yw, fragment.texcoord[1].zwzw, texture[7], 2D;
TEX R7.yw, fragment.texcoord[2], texture[8], 2D;
MUL R6.yw, R5.z, R6;
ADD R6.xy, R6.xzzw, R6.ywzw;
MUL R7.xy, R5.w, R7.ywzw;
ADD R6.xy, R6, R7;
ADD R6.xy, R6, -c[1].z;
MAD R1.xy, R1.x, R6, c[1].z;
MAD R7.xy, R1.yxzw, c[1].w, -c[1].y;
MUL R1.xy, R7, R7;
ADD_SAT R1.x, R1, R1.y;
ADD R1.x, -R1, c[1].y;
RSQ R1.x, R1.x;
RCP R7.z, R1.x;
TEX R1, fragment.texcoord[5], texture[11], 2D;
MUL R5.x, R0.w, c[1].z;
MUL R1.xyz, R1.w, R1;
DP3_SAT R6.z, R7, c[2];
DP3_SAT R6.y, R7, c[3];
DP3_SAT R6.x, R7, c[4];
MUL R6.xyz, R1, R6;
TEX R1, fragment.texcoord[5], texture[10], 2D;
DP3 R2.w, R6, c[2].w;
MUL R6.xyz, R1.w, R1;
MUL R6.xyz, R6, R2.w;
TXP R1.xyz, fragment.texcoord[4], texture[9], 2D;
MAD R1.xyz, R6, c[2].w, R1;
MUL R6.xyz, R5.y, R3;
TXP R3, fragment.texcoord[3], texture[12], 2D;
MAX R0.w, R3, R5.x;
MOV R5.y, R3.w;
MOV R1.w, c[1].z;
ADD R5.xy, R5, -R0.w;
MAD R5.xy, R1.w, c[0].x, R5;
MAX R5.xy, R5, c[1].x;
ADD R1.w, R5.x, R5.y;
ADD R4.xyz, R4, R6;
MUL R2.xyz, R5.z, R2;
ADD R2.xyz, R4, R2;
RCP R1.w, R1.w;
MUL R0.xyz, R5.w, R0;
ADD R0.xyz, R2, R0;
MUL R4.xy, R5, R1.w;
MUL R2.xyz, R4.y, R3;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, R4.x, R2;
MOV result.color.w, R0;
END
# 77 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 64 math, 13 textures
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
SetTexture 12 [_GrabTexture] 2D 12
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
dcl_2d s12
def c1, 0.00000000, 1.00000000, -0.50000000, 8.00000000
def c2, 2.00000000, -1.00000000, 0.50000000, 0
def c3, -0.40824828, -0.70710677, 0.57735026, 0
def c4, -0.40824831, 0.70710677, 0.57735026, 0
def c5, 0.81649655, 0.00000000, 0.57735026, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4
dcl_texcoord5 v5.xy
texld r1, v0, s0
texld r0, v2, s4
add_pp r5.y, r0.w, r1.w
texld r3, v1, s2
texld r2, v1.zwzw, s3
add_pp r2.w, r1.z, r2
texld r4, v0.zwzw, s1
add_pp r5.x, r1, r4.w
add_pp r3.w, r1.y, r3
max r0.w, r5.y, r2
max r0.w, r3, r0
mov r5.w, r5.y
max r0.w, r5.x, r0
dp4_pp r1.x, r1, c1.y
mov r5.z, r2.w
mov r5.y, r3.w
add r5, r5, -r0.w
add r5, r5, c0.x
max r5, r5, c1.x
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
mul r4.xyz, r5.x, r4
texld r6.yw, v1.zwzw, s7
texld r7.yw, v2, s8
mul r6.yw, r5.z, r6
add_pp r6.xy, r6.xzzw, r6.ywzw
mul r7.xy, r5.w, r7.ywzw
add_pp r6.xy, r6, r7
add_pp r6.xy, r6, c1.z
mad_pp r1.xy, r1.x, r6, c2.z
mad_pp r7.xy, r1.yxzw, c2.x, c2.y
mul_pp r1.xy, r7, r7
add_pp_sat r1.x, r1, r1.y
add_pp r1.x, -r1, c1.y
rsq_pp r1.x, r1.x
rcp_pp r7.z, r1.x
texld r1, v5, s11
mul r5.x, r0.w, c2.z
mul_pp r1.xyz, r1.w, r1
dp3_pp_sat r6.z, r7, c3
dp3_pp_sat r6.y, r7, c4
dp3_pp_sat r6.x, r7, c5
mul_pp r6.xyz, r1, r6
texld r1, v5, s10
dp3_pp r2.w, r6, c1.w
mul_pp r6.xyz, r1.w, r1
mul_pp r6.xyz, r6, r2.w
texldp r1.xyz, v4, s9
mad_pp r1.xyz, r6, c1.w, r1
mul r6.xyz, r5.y, r3
texldp r3, v3, s12
max r0.w, r3, r5.x
mov r5.y, r3.w
mov r1.w, c0.x
add r5.xy, r5, -r0.w
mad r5.xy, c2.z, r1.w, r5
max r5.xy, r5, c1.x
add r1.w, r5.x, r5.y
add_pp r4.xyz, r4, r6
mul r2.xyz, r5.z, r2
add_pp r2.xyz, r4, r2
rcp r1.w, r1.w
mul r0.xyz, r5.w, r0
add_pp r0.xyz, r2, r0
mul r4.xy, r5, r1.w
mul r2.xyz, r4.y, r3
mul_pp r0.xyz, r0, r1
mad oC0.xyz, r0, r4.x, r2
mov_pp oC0.w, r0
"
}
SubProgram "d3d11 " {
// Stats: 51 math, 13 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_Normal0] 2D 6
SetTexture 6 [_Normal1] 2D 7
SetTexture 7 [_Normal2] 2D 8
SetTexture 8 [_Normal3] 2D 9
SetTexture 9 [_LightBuffer] 2D 10
SetTexture 10 [unity_Lightmap] 2D 11
SetTexture 11 [unity_LightmapInd] 2D 12
SetTexture 12 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 192
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedffdcnfhakomghonochcedmaaahlnbaheabaaaaaajealaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfmakaaaaeaaaaaaajhacaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafkaaaaadaagabaaaaiaaaaaafkaaaaad
aagabaaaajaaaaaafkaaaaadaagabaaaakaaaaaafkaaaaadaagabaaaalaaaaaa
fkaaaaadaagabaaaamaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaae
aahabaaaahaaaaaaffffaaaafibiaaaeaahabaaaaiaaaaaaffffaaaafibiaaae
aahabaaaajaaaaaaffffaaaafibiaaaeaahabaaaakaaaaaaffffaaaafibiaaae
aahabaaaalaaaaaaffffaaaafibiaaaeaahabaaaamaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaadlcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacakaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaadaaaaaaeghobaaaalaaaaaaaagabaaaamaaaaaadiaaaaah
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
diaaaaahbcaabaaaagaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaai
pcaabaaaafaaaaaaegaobaaaafaaaaaaagiacaaaaaaaaaaaadaaaaaadeaaaaak
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
ogbkbaaaadaaaaaaeghobaaaakaaaaaaaagabaaaalaaaaaadiaaaaahccaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaa
agajbaaaabaaaaaafgafbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
afaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaajaaaaaaaagabaaaakaaaaaadcaaaaajhcaabaaaaaaaaaaajgahbaaa
aaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaaiaaaaaafgafbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaaagaabaaa
afaaaaaaegacbaaaajaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaabaaaaaa
kgakbaaaafaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaa
abaaaaaapgapbaaaafaaaaaaegacbaaaahaaaaaaegacbaaaabaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaa
abaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaamaaaaaaaagabaaaaaaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaaakaabaaaagaaaaaadgaaaaafccaabaaaagaaaaaa
dkaabaaaabaaaaaaaaaaaaaidcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaa
egaabaaaagaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaan
dcaabaaaacaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaaegaabaaaacaaaaaadeaaaaakdcaabaaaacaaaaaaegaabaaa
acaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaa
aaaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaaaoaaaaahdcaabaaaacaaaaaa
egaabaaaacaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaafgafbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaa
agaabaaaacaaaaaaegacbaaaabaaaaaadoaaaaab"
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
Fallback Off
}