// Compiled shader for all platforms, uncompressed size: 663.5KB

Shader "Hidden/TerrainEngine/Splatmap/Lightmap-AddPass-Advanced-Pro" {
Properties {
 _Depth ("Blend Depth", Range(0.001,1)) = 0.1
 _Control ("Control (RGBA)", 2D) = "black" {}
 _Splat3 ("Layer 3 (A)", 2D) = "black" {}
 _Splat2 ("Layer 2 (B)", 2D) = "black" {}
 _Splat1 ("Layer 1 (G)", 2D) = "black" {}
 _Splat0 ("Layer 0 (R)", 2D) = "black" {}
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
 //       d3d11 : 27 avg math (12..54)
 //        d3d9 : 39 avg math (19..76)
 //      opengl : 37 avg math (18..75)
 // Stats for Fragment shader:
 //       d3d11 : 34 avg math (31..37), 7 avg texture (6..8)
 //        d3d9 : 42 avg math (40..45), 7 avg texture (6..8)
 //      opengl : 50 avg math (47..53), 7 avg texture (6..8)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry-99" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" "SplatCount"="4" }
Program "vp" {
SubProgram "opengl " {
// Stats: 39 math
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
PARAM c[22] = { { 0.5, 1 },
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
MOV R0.w, c[0].y;
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
ADD result.texcoord[5].xyz, R2, R1;
DP4 R2.xy, vertex.position, c[4];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
DP4 R1.z, vertex.position, c[3];
MOV R1.w, R2.y;
MOV R0.z, R1.x;
MOV R0.w, R1.y;
ADD R0.zw, R0, R2.x;
MOV result.position, R1;
MUL result.texcoord[3].xy, R0.zwzw, c[0].x;
MOV result.texcoord[4].z, R2.w;
MOV result.texcoord[4].y, R3.w;
MOV result.texcoord[4].x, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[20].xyxy, c[20];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[21], c[21].zwzw;
MOV result.texcoord[3].w, R2.x;
MOV result.texcoord[3].z, R1;
END
# 39 instructions, 4 R-regs
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
Vector 8 [_ScreenParams]
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
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c22, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c16.w
dp3 r3.w, r1, c5
dp3 r2.w, r1, c6
dp3 r0.x, r1, c4
mov r0.y, r3.w
mov r0.z, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c22.y
dp4 r2.z, r0, c11
dp4 r2.y, r0, c10
dp4 r2.x, r0, c9
mul r0.y, r3.w, r3.w
dp4 r3.y, r1, c13
dp4 r3.x, r1, c12
dp4 r3.z, r1, c14
add r2.xyz, r2, r3
dp4 r3.xy, v0, c1
mad r0.y, r0.x, r0.x, -r0
mul r1.xyz, r0.y, c15
add o6.xyz, r2, r1
dp4 r2.xy, v0, c3
dp4 r1.x, v0, c0
dp4 r1.z, v0, c2
mov r0.w, -r3.x
mov r0.z, r1.x
mad r0.zw, r2.x, c8, r0
mov r1.w, r2.y
mov r1.y, r3
mov o0, r1
mul o4.xy, r0.zwzw, c22.x
mov o5.z, r2.w
mov o5.y, r3.w
mov o5.x, r0
mad o1.zw, v2.xyxy, c18.xyxy, c18
mad o1.xy, v2, c17, c17.zwzw
mad o2.zw, v2.xyxy, c20.xyxy, c20
mad o2.xy, v2, c19, c19.zwzw
mad o3.xy, v2, c21, c21.zwzw
mov o4.w, r2.x
mov o4.z, r1
"
}
SubProgram "d3d11 " {
// Stats: 26 math
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
eefiecedafknkioemilecjipakppbiidkbagkpmpabaaaaaajmagaaaaadaaaaaa
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
aaklklklfdeieefcnaaeaaaaeaaaabaadeabaaaafjaaaaaeegiocaaaaaaaaaaa
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
egaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaafaaaaaaegacbaaaaaaaaaaa
dgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaa
egiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaa
egiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaa
egiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
jgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaa
abaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaa
abaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaa
abaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaagaaaaaaegiccaaa
abaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
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
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_23;
  highp vec2 pblend_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_26;
  tmpvar_26 = c_1.w;
  pblend_24.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = tmpvar_25.w;
  pblend_24.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_24.x, pblend_24.y);
  res_23 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_24 - res_23.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_24 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = ((c_1.xyz * tmpvar_30.x) + (tmpvar_25.xyz * tmpvar_30.y));
  res_23.xyz = tmpvar_31;
  gl_FragData[0] = res_23;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
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
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_23;
  highp vec2 pblend_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_26;
  tmpvar_26 = c_1.w;
  pblend_24.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = tmpvar_25.w;
  pblend_24.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_24.x, pblend_24.y);
  res_23 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_24 - res_23.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_24 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = ((c_1.xyz * tmpvar_30.x) + (tmpvar_25.xyz * tmpvar_30.y));
  res_23.xyz = tmpvar_31;
  gl_FragData[0] = res_23;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out lowp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
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
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_23;
  highp vec2 pblend_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_26;
  tmpvar_26 = c_1.w;
  pblend_24.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = tmpvar_25.w;
  pblend_24.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_24.x, pblend_24.y);
  res_23 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_24 - res_23.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_24 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = ((c_1.xyz * tmpvar_30.x) + (tmpvar_25.xyz * tmpvar_30.y));
  res_23.xyz = tmpvar_31;
  _glesFragData[0] = res_23;
}



#endif"
}
SubProgram "opengl " {
// Stats: 18 math
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
PARAM c[15] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..14] };
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
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MOV result.texcoord[3].w, R1.z;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[9], c[9].zwzw;
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
Vector 8 [_ScreenParams]
Vector 9 [unity_LightmapST]
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
def c15, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r1.zw, v0, c3
dp4 r0.yz, v0, c1
dp4 r0.x, v0, c0
mov r1.y, -r0
mov r0.y, r0.z
dp4 r0.z, v0, c2
mov r1.x, r0
mad r1.xy, r1.z, c8.zwzw, r1
mov r0.w, r1
mov o0, r0
mul o4.xy, r1, c15.x
mad o1.zw, v2.xyxy, c11.xyxy, c11
mad o1.xy, v2, c10, c10.zwzw
mad o2.zw, v2.xyxy, c13.xyxy, c13
mad o2.xy, v2, c12, c12.zwzw
mad o3.xy, v2, c14, c14.zwzw
mov o4.w, r1.z
mad o5.xy, v3, c9, c9.zwzw
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
  c_1.xyz = (col_3 * (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz));
  c_1.w = tmpvar_2;
  lowp vec4 res_22;
  highp vec2 pblend_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_25;
  tmpvar_25 = c_1.w;
  pblend_23.x = tmpvar_25;
  lowp float tmpvar_26;
  tmpvar_26 = tmpvar_24.w;
  pblend_23.y = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_27.w = max (pblend_23.x, pblend_23.y);
  res_22 = tmpvar_27;
  highp vec2 tmpvar_28;
  tmpvar_28 = max (((pblend_23 - res_22.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_29;
  tmpvar_29 = (tmpvar_28 / (tmpvar_28.x + tmpvar_28.y));
  pblend_23 = tmpvar_29;
  highp vec3 tmpvar_30;
  tmpvar_30 = ((c_1.xyz * tmpvar_29.x) + (tmpvar_24.xyz * tmpvar_29.y));
  res_22.xyz = tmpvar_30;
  gl_FragData[0] = res_22;
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
  tmpvar_22 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  c_1.xyz = (col_3 * ((8.0 * tmpvar_22.w) * tmpvar_22.xyz));
  c_1.w = tmpvar_2;
  lowp vec4 res_23;
  highp vec2 pblend_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_26;
  tmpvar_26 = c_1.w;
  pblend_24.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = tmpvar_25.w;
  pblend_24.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_24.x, pblend_24.y);
  res_23 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_24 - res_23.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_24 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = ((c_1.xyz * tmpvar_30.x) + (tmpvar_25.xyz * tmpvar_30.y));
  res_23.xyz = tmpvar_31;
  gl_FragData[0] = res_23;
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
  c_1.xyz = (col_3 * (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz));
  c_1.w = tmpvar_2;
  lowp vec4 res_22;
  highp vec2 pblend_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_25;
  tmpvar_25 = c_1.w;
  pblend_23.x = tmpvar_25;
  lowp float tmpvar_26;
  tmpvar_26 = tmpvar_24.w;
  pblend_23.y = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_27.w = max (pblend_23.x, pblend_23.y);
  res_22 = tmpvar_27;
  highp vec2 tmpvar_28;
  tmpvar_28 = max (((pblend_23 - res_22.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_29;
  tmpvar_29 = (tmpvar_28 / (tmpvar_28.x + tmpvar_28.y));
  pblend_23 = tmpvar_29;
  highp vec3 tmpvar_30;
  tmpvar_30 = ((c_1.xyz * tmpvar_29.x) + (tmpvar_24.xyz * tmpvar_29.y));
  res_22.xyz = tmpvar_30;
  _glesFragData[0] = res_22;
}



#endif"
}
SubProgram "opengl " {
// Stats: 18 math
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
PARAM c[15] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..14] };
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
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MOV result.texcoord[3].w, R1.z;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[9], c[9].zwzw;
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
Vector 8 [_ScreenParams]
Vector 9 [unity_LightmapST]
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
def c15, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r1.zw, v0, c3
dp4 r0.yz, v0, c1
dp4 r0.x, v0, c0
mov r1.y, -r0
mov r0.y, r0.z
dp4 r0.z, v0, c2
mov r1.x, r0
mad r1.xy, r1.z, c8.zwzw, r1
mov r0.w, r1
mov o0, r0
mul o4.xy, r1, c15.x
mad o1.zw, v2.xyxy, c11.xyxy, c11
mad o1.xy, v2, c10, c10.zwzw
mad o2.zw, v2.xyxy, c13.xyxy, c13
mad o2.xy, v2, c12, c12.zwzw
mad o3.xy, v2, c14, c14.zwzw
mov o4.w, r1.z
mad o5.xy, v3, c9, c9.zwzw
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
  tmpvar_23 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_22 = tmpvar_23;
  mediump vec3 tmpvar_24;
  tmpvar_24 = (col_3 * lm_22);
  c_1.xyz = tmpvar_24;
  c_1.w = tmpvar_2;
  lowp vec4 res_25;
  highp vec2 pblend_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_28;
  tmpvar_28 = c_1.w;
  pblend_26.x = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = tmpvar_27.w;
  pblend_26.y = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_30.w = max (pblend_26.x, pblend_26.y);
  res_25 = tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = max (((pblend_26 - res_25.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_32;
  tmpvar_32 = (tmpvar_31 / (tmpvar_31.x + tmpvar_31.y));
  pblend_26 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = ((c_1.xyz * tmpvar_32.x) + (tmpvar_27.xyz * tmpvar_32.y));
  res_25.xyz = tmpvar_33;
  gl_FragData[0] = res_25;
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
  tmpvar_22 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  mediump vec3 lm_23;
  lowp vec3 tmpvar_24;
  tmpvar_24 = ((8.0 * tmpvar_22.w) * tmpvar_22.xyz);
  lm_23 = tmpvar_24;
  mediump vec3 tmpvar_25;
  tmpvar_25 = (col_3 * lm_23);
  c_1.xyz = tmpvar_25;
  c_1.w = tmpvar_2;
  lowp vec4 res_26;
  highp vec2 pblend_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_29;
  tmpvar_29 = c_1.w;
  pblend_27.x = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = tmpvar_28.w;
  pblend_27.y = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_31.w = max (pblend_27.x, pblend_27.y);
  res_26 = tmpvar_31;
  highp vec2 tmpvar_32;
  tmpvar_32 = max (((pblend_27 - res_26.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_33;
  tmpvar_33 = (tmpvar_32 / (tmpvar_32.x + tmpvar_32.y));
  pblend_27 = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = ((c_1.xyz * tmpvar_33.x) + (tmpvar_28.xyz * tmpvar_33.y));
  res_26.xyz = tmpvar_34;
  gl_FragData[0] = res_26;
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
  tmpvar_23 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_22 = tmpvar_23;
  mediump vec3 tmpvar_24;
  tmpvar_24 = (col_3 * lm_22);
  c_1.xyz = tmpvar_24;
  c_1.w = tmpvar_2;
  lowp vec4 res_25;
  highp vec2 pblend_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_28;
  tmpvar_28 = c_1.w;
  pblend_26.x = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = tmpvar_27.w;
  pblend_26.y = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_30.w = max (pblend_26.x, pblend_26.y);
  res_25 = tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = max (((pblend_26 - res_25.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_32;
  tmpvar_32 = (tmpvar_31 / (tmpvar_31.x + tmpvar_31.y));
  pblend_26 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = ((c_1.xyz * tmpvar_32.x) + (tmpvar_27.xyz * tmpvar_32.y));
  res_25.xyz = tmpvar_33;
  _glesFragData[0] = res_25;
}



#endif"
}
SubProgram "opengl " {
// Stats: 41 math
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
PARAM c[23] = { { 0.5, 1 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R0.xyz, vertex.normal, c[17].w;
DP3 R3.w, R0, c[6];
DP3 R2.w, R0, c[7];
DP3 R1.w, R0, c[5];
DP4 R4.xy, vertex.position, c[4];
MOV R1.x, R3.w;
MOV R1.y, R2.w;
MOV R1.z, c[0].y;
MUL R0, R1.wxyy, R1.xyyw;
DP4 R2.z, R1.wxyz, c[12];
DP4 R2.y, R1.wxyz, c[11];
DP4 R2.x, R1.wxyz, c[10];
DP4 R1.z, R0, c[15];
DP4 R1.y, R0, c[14];
DP4 R1.x, R0, c[13];
DP4 R0.z, vertex.position, c[3];
MOV R0.w, R4.y;
MUL R0.x, R3.w, R3.w;
ADD R3.xyz, R2, R1;
MAD R0.x, R1.w, R1.w, -R0;
MUL R2.xyz, R0.x, c[16];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[9].x;
MOV result.position, R0;
ADD R0.xy, R0, R4.x;
ADD result.texcoord[5].xyz, R3, R2;
ADD result.texcoord[6].xy, R1, R1.z;
MOV result.texcoord[6].zw, R0;
MUL result.texcoord[3].xy, R0, c[0].x;
MOV result.texcoord[4].z, R2.w;
MOV result.texcoord[4].y, R3.w;
MOV result.texcoord[4].x, R1.w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MOV result.texcoord[3].w, R4.x;
MOV result.texcoord[3].z, R0;
END
# 41 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 44 math
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
dcl_texcoord6 o7
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1, c17.w
dp3 r3.w, r0, c5
dp3 r2.w, r0, c6
dp3 r1.w, r0, c4
dp4 r4.zw, v0, c3
mov r1.x, r3.w
mov r1.y, r2.w
mov r1.z, c23.y
mul r0, r1.wxyy, r1.xyyw
dp4 r2.z, r1.wxyz, c12
dp4 r2.y, r1.wxyz, c11
dp4 r2.x, r1.wxyz, c10
dp4 r1.z, r0, c15
dp4 r1.y, r0, c14
dp4 r1.x, r0, c13
dp4 r0.z, v0, c2
mov r0.w, r4
dp4 r4.xy, v0, c1
mul r0.x, r3.w, r3.w
add r3.xyz, r2, r1
mad r0.x, r1.w, r1.w, -r0
mul r1.xyz, r0.x, c16
dp4 r0.x, v0, c0
mov r0.y, r4
mul r2.xyz, r0.xyww, c23.x
add o6.xyz, r3, r1
mov o0, r0
mov r0.y, -r4.x
mad r0.xy, r4.z, c9.zwzw, r0
mov r1.x, r2
mul r1.y, r2, c8.x
mad o7.xy, r2.z, c9.zwzw, r1
mov o7.zw, r0
mul o4.xy, r0, c23.x
mov o5.z, r2.w
mov o5.y, r3.w
mov o5.x, r1.w
mad o1.zw, v2.xyxy, c19.xyxy, c19
mad o1.xy, v2, c18, c18.zwzw
mad o2.zw, v2.xyxy, c21.xyxy, c21
mad o2.xy, v2, c20, c20.zwzw
mad o3.xy, v2, c22, c22.zwzw
mov o4.w, r4.z
mov o4.z, r0
"
}
SubProgram "d3d11 " {
// Stats: 30 math
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
eefiecedildhfcbnlckmffcggdkldnjbfekgpihnabaaaaaageahaaaaadaaaaaa
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
iaafaaaaeaaaabaagaabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaae
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
aaaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
abaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaafaaaaaa
egacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaai
ccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaai
ecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaa
aeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaa
aeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaa
aeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahecaabaaaaaaaaaaa
bkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakecaabaaaaaaaaaaaakaabaaa
abaaaaaaakaabaaaabaaaaaackaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
agaaaaaaegiccaaaacaaaaaacmaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakfcaabaaaaaaaaaaaagadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaadpaaaaaaahdccabaaaahaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaa
doaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
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
  tmpvar_25 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  lowp vec4 c_28;
  c_28.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * tmpvar_22) * 2.0));
  c_28.w = tmpvar_2;
  c_1.w = c_28.w;
  c_1.xyz = (c_28.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_29;
  highp vec2 pblend_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_32;
  tmpvar_32 = c_1.w;
  pblend_30.x = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = tmpvar_31.w;
  pblend_30.y = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_34.w = max (pblend_30.x, pblend_30.y);
  res_29 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35 = max (((pblend_30 - res_29.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_36;
  tmpvar_36 = (tmpvar_35 / (tmpvar_35.x + tmpvar_35.y));
  pblend_30 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((c_1.xyz * tmpvar_36.x) + (tmpvar_31.xyz * tmpvar_36.y));
  res_29.xyz = tmpvar_37;
  gl_FragData[0] = res_29;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  highp vec4 tmpvar_8;
  tmpvar_8 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10;
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
  shlight_1 = tmpvar_12;
  tmpvar_5 = shlight_1;
  highp vec4 o_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_8 * 0.5);
  highp vec2 tmpvar_29;
  tmpvar_29.x = tmpvar_28.x;
  tmpvar_29.y = (tmpvar_28.y * _ProjectionParams.x);
  o_27.xy = (tmpvar_29 + tmpvar_28.w);
  o_27.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = o_27;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
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
  c_22.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_23;
  highp vec2 pblend_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_26;
  tmpvar_26 = c_1.w;
  pblend_24.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = tmpvar_25.w;
  pblend_24.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_24.x, pblend_24.y);
  res_23 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_24 - res_23.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_24 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = ((c_1.xyz * tmpvar_30.x) + (tmpvar_25.xyz * tmpvar_30.y));
  res_23.xyz = tmpvar_31;
  gl_FragData[0] = res_23;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out lowp vec3 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _WorldSpaceLightPos0;
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
  tmpvar_25 = textureProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  lowp vec4 c_28;
  c_28.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * tmpvar_22) * 2.0));
  c_28.w = tmpvar_2;
  c_1.w = c_28.w;
  c_1.xyz = (c_28.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_29;
  highp vec2 pblend_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_32;
  tmpvar_32 = c_1.w;
  pblend_30.x = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = tmpvar_31.w;
  pblend_30.y = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_34.w = max (pblend_30.x, pblend_30.y);
  res_29 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35 = max (((pblend_30 - res_29.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_36;
  tmpvar_36 = (tmpvar_35 / (tmpvar_35.x + tmpvar_35.y));
  pblend_30 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((c_1.xyz * tmpvar_36.x) + (tmpvar_31.xyz * tmpvar_36.y));
  res_29.xyz = tmpvar_37;
  _glesFragData[0] = res_29;
}



#endif"
}
SubProgram "opengl " {
// Stats: 20 math
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
DP4 R1.xw, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
MOV R0.w, R1.x;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[9].x;
MOV result.position, R0;
ADD R0.xy, R0, R1.w;
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.texcoord[5].zw, R0;
MUL result.texcoord[3].xy, R0, c[0].x;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[12].xyxy, c[12];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[14].xyxy, c[14];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MOV result.texcoord[3].w, R1;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[10], c[10].zwzw;
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
dcl_texcoord5 o6
def c16, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r2.zw, v0, c3
dp4 r0.z, v0, c2
mov r0.w, r2
dp4 r2.xy, v0, c1
dp4 r0.x, v0, c0
mov r0.y, r2
mul r1.xyz, r0.xyww, c16.x
mov o0, r0
mul r1.y, r1, c8.x
mov r0.y, -r2.x
mad r0.xy, r2.z, c9.zwzw, r0
mad o6.xy, r1.z, c9.zwzw, r1
mov o6.zw, r0
mul o4.xy, r0, c16.x
mad o1.zw, v2.xyxy, c12.xyxy, c12
mad o1.xy, v2, c11, c11.zwzw
mad o2.zw, v2.xyxy, c14.xyxy, c14
mad o2.xy, v2, c13, c13.zwzw
mad o3.xy, v2, c15, c15.zwzw
mov o4.w, r2.z
mad o5.xy, v3, c10, c10.zwzw
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
  c_1.xyz = (col_3 * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz), vec3((tmpvar_22 * 2.0))));
  c_1.w = tmpvar_2;
  lowp vec4 res_28;
  highp vec2 pblend_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_31;
  tmpvar_31 = c_1.w;
  pblend_29.x = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = tmpvar_30.w;
  pblend_29.y = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_33.w = max (pblend_29.x, pblend_29.y);
  res_28 = tmpvar_33;
  highp vec2 tmpvar_34;
  tmpvar_34 = max (((pblend_29 - res_28.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_35;
  tmpvar_35 = (tmpvar_34 / (tmpvar_34.x + tmpvar_34.y));
  pblend_29 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = ((c_1.xyz * tmpvar_35.x) + (tmpvar_30.xyz * tmpvar_35.y));
  res_28.xyz = tmpvar_36;
  gl_FragData[0] = res_28;
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
  tmpvar_22 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec3 tmpvar_24;
  tmpvar_24 = ((8.0 * tmpvar_23.w) * tmpvar_23.xyz);
  c_1.xyz = (col_3 * max (min (tmpvar_24, ((tmpvar_22.x * 2.0) * tmpvar_23.xyz)), (tmpvar_24 * tmpvar_22.x)));
  c_1.w = tmpvar_2;
  lowp vec4 res_25;
  highp vec2 pblend_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_28;
  tmpvar_28 = c_1.w;
  pblend_26.x = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = tmpvar_27.w;
  pblend_26.y = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_30.w = max (pblend_26.x, pblend_26.y);
  res_25 = tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = max (((pblend_26 - res_25.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_32;
  tmpvar_32 = (tmpvar_31 / (tmpvar_31.x + tmpvar_31.y));
  pblend_26 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = ((c_1.xyz * tmpvar_32.x) + (tmpvar_27.xyz * tmpvar_32.y));
  res_25.xyz = tmpvar_33;
  gl_FragData[0] = res_25;
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
  c_1.xyz = (col_3 * min ((2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz), vec3((tmpvar_22 * 2.0))));
  c_1.w = tmpvar_2;
  lowp vec4 res_28;
  highp vec2 pblend_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_31;
  tmpvar_31 = c_1.w;
  pblend_29.x = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = tmpvar_30.w;
  pblend_29.y = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_33.w = max (pblend_29.x, pblend_29.y);
  res_28 = tmpvar_33;
  highp vec2 tmpvar_34;
  tmpvar_34 = max (((pblend_29 - res_28.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_35;
  tmpvar_35 = (tmpvar_34 / (tmpvar_34.x + tmpvar_34.y));
  pblend_29 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = ((c_1.xyz * tmpvar_35.x) + (tmpvar_30.xyz * tmpvar_35.y));
  res_28.xyz = tmpvar_36;
  _glesFragData[0] = res_28;
}



#endif"
}
SubProgram "opengl " {
// Stats: 20 math
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
DP4 R1.xw, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
MOV R0.w, R1.x;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[9].x;
MOV result.position, R0;
ADD R0.xy, R0, R1.w;
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.texcoord[5].zw, R0;
MUL result.texcoord[3].xy, R0, c[0].x;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[12].xyxy, c[12];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[14].xyxy, c[14];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MOV result.texcoord[3].w, R1;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[10], c[10].zwzw;
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
dcl_texcoord5 o6
def c16, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r2.zw, v0, c3
dp4 r0.z, v0, c2
mov r0.w, r2
dp4 r2.xy, v0, c1
dp4 r0.x, v0, c0
mov r0.y, r2
mul r1.xyz, r0.xyww, c16.x
mov o0, r0
mul r1.y, r1, c8.x
mov r0.y, -r2.x
mad r0.xy, r2.z, c9.zwzw, r0
mad o6.xy, r1.z, c9.zwzw, r1
mov o6.zw, r0
mul o4.xy, r0, c16.x
mad o1.zw, v2.xyxy, c12.xyxy, c12
mad o1.xy, v2, c11, c11.zwzw
mad o2.zw, v2.xyxy, c14.xyxy, c14
mad o2.xy, v2, c13, c13.zwzw
mad o3.xy, v2, c15, c15.zwzw
mov o4.w, r2.z
mad o5.xy, v3, c10, c10.zwzw
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
  mediump vec3 lm_28;
  lowp vec3 tmpvar_29;
  tmpvar_29 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_28 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = vec3((tmpvar_22 * 2.0));
  mediump vec3 tmpvar_31;
  tmpvar_31 = (col_3 * min (lm_28, tmpvar_30));
  c_1.xyz = tmpvar_31;
  c_1.w = tmpvar_2;
  lowp vec4 res_32;
  highp vec2 pblend_33;
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_35;
  tmpvar_35 = c_1.w;
  pblend_33.x = tmpvar_35;
  lowp float tmpvar_36;
  tmpvar_36 = tmpvar_34.w;
  pblend_33.y = tmpvar_36;
  highp vec4 tmpvar_37;
  tmpvar_37.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_37.w = max (pblend_33.x, pblend_33.y);
  res_32 = tmpvar_37;
  highp vec2 tmpvar_38;
  tmpvar_38 = max (((pblend_33 - res_32.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_39;
  tmpvar_39 = (tmpvar_38 / (tmpvar_38.x + tmpvar_38.y));
  pblend_33 = tmpvar_39;
  highp vec3 tmpvar_40;
  tmpvar_40 = ((c_1.xyz * tmpvar_39.x) + (tmpvar_34.xyz * tmpvar_39.y));
  res_32.xyz = tmpvar_40;
  gl_FragData[0] = res_32;
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
  tmpvar_22 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
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
  lowp vec4 res_28;
  highp vec2 pblend_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_31;
  tmpvar_31 = c_1.w;
  pblend_29.x = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = tmpvar_30.w;
  pblend_29.y = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_33.w = max (pblend_29.x, pblend_29.y);
  res_28 = tmpvar_33;
  highp vec2 tmpvar_34;
  tmpvar_34 = max (((pblend_29 - res_28.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_35;
  tmpvar_35 = (tmpvar_34 / (tmpvar_34.x + tmpvar_34.y));
  pblend_29 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = ((c_1.xyz * tmpvar_35.x) + (tmpvar_30.xyz * tmpvar_35.y));
  res_28.xyz = tmpvar_36;
  gl_FragData[0] = res_28;
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
  mediump vec3 lm_28;
  lowp vec3 tmpvar_29;
  tmpvar_29 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_28 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = vec3((tmpvar_22 * 2.0));
  mediump vec3 tmpvar_31;
  tmpvar_31 = (col_3 * min (lm_28, tmpvar_30));
  c_1.xyz = tmpvar_31;
  c_1.w = tmpvar_2;
  lowp vec4 res_32;
  highp vec2 pblend_33;
  lowp vec4 tmpvar_34;
  tmpvar_34 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_35;
  tmpvar_35 = c_1.w;
  pblend_33.x = tmpvar_35;
  lowp float tmpvar_36;
  tmpvar_36 = tmpvar_34.w;
  pblend_33.y = tmpvar_36;
  highp vec4 tmpvar_37;
  tmpvar_37.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_37.w = max (pblend_33.x, pblend_33.y);
  res_32 = tmpvar_37;
  highp vec2 tmpvar_38;
  tmpvar_38 = max (((pblend_33 - res_32.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_39;
  tmpvar_39 = (tmpvar_38 / (tmpvar_38.x + tmpvar_38.y));
  pblend_33 = tmpvar_39;
  highp vec3 tmpvar_40;
  tmpvar_40 = ((c_1.xyz * tmpvar_39.x) + (tmpvar_34.xyz * tmpvar_39.y));
  res_32.xyz = tmpvar_40;
  _glesFragData[0] = res_32;
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
PARAM c[30] = { { 0.5, 1, 0 },
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
MOV R4.w, c[0].y;
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
ADD R1, R2, c[0].y;
DP4 R2.z, R4, c[19];
DP4 R2.y, R4, c[18];
DP4 R2.x, R4, c[17];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
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
ADD R2.xyz, R2, R4.yzww;
MUL R0.xyz, R1.w, c[23];
ADD R0.xyz, R2, R0;
DP4 R2.zw, vertex.position, c[4];
DP4 R2.y, vertex.position, c[2];
DP4 R2.x, vertex.position, c[1];
ADD result.texcoord[5].xyz, R0, R1;
DP4 R0.z, vertex.position, c[3];
ADD R4.zw, R2.z, R2.xyxy;
MUL R0.xy, R4.zwzw, c[0].x;
MOV R0.w, R2.z;
MOV result.texcoord[3], R0;
MOV result.texcoord[4].z, R3.x;
MOV result.texcoord[4].y, R3.w;
MOV result.texcoord[4].x, R4;
MOV result.position.w, R2;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[26].xyxy, c[26];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[28].xyxy, c[28];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[27], c[27].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[29], c[29].zwzw;
MOV result.position.z, R0;
MOV result.position.y, R2;
MOV result.position.x, R2;
END
# 69 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 70 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ScreenParams]
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
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c30, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r3.xyz, v1, c24.w
dp3 r4.x, r3, c4
dp3 r3.w, r3, c5
dp3 r3.x, r3, c6
dp4 r0.x, v0, c5
add r1, -r0.x, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c9
mul r1, r1, r1
mov r4.z, r3.x
mov r4.w, c30.y
mad r2, r4.x, r0, r2
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c11
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c12
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c30.y
dp4 r2.z, r4, c19
dp4 r2.y, r4, c18
dp4 r2.x, r4, c17
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c30.z
mul r0, r0, r1
mul r1.xyz, r0.y, c14
mad r1.xyz, r0.x, c13, r1
mad r0.xyz, r0.z, c15, r1
mad r1.xyz, r0.w, c16, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r4.w, r0, c22
dp4 r4.z, r0, c21
dp4 r4.y, r0, c20
add r2.xyz, r2, r4.yzww
dp4 r4.zw, v0, c1
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c23
add r0.xyz, r2, r0
dp4 r2.zw, v0, c3
dp4 r2.x, v0, c0
add o6.xyz, r0, r1
dp4 r0.z, v0, c2
mov r2.y, -r4.z
mad r3.yz, r2.z, c8.xzww, r2.xxyw
mul r0.xy, r3.yzzw, c30.x
mov r0.w, r2.z
mov o4, r0
mov o5.z, r3.x
mov o5.y, r3.w
mov o5.x, r4
mov o0.w, r2
mov o0.y, r4.w
mad o1.zw, v2.xyxy, c26.xyxy, c26
mad o1.xy, v2, c25, c25.zwzw
mad o2.zw, v2.xyxy, c28.xyxy, c28
mad o2.xy, v2, c27, c27.zwzw
mad o3.xy, v2, c29, c29.zwzw
mov o0.z, r0
mov o0.x, r2
"
}
SubProgram "d3d11 " {
// Stats: 50 math
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
eefiecedbjadlmijbblnbmickgljenfmkdmcndchabaaaaaaomajaaaaadaaaaaa
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
aaklklklfdeieefccaaiaaaaeaaaabaaaiacaaaafjaaaaaeegiocaaaaaaaaaaa
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
egaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaafaaaaaaegacbaaaaaaaaaaa
dgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaa
egiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaa
egiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaa
egiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
jgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaa
abaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaa
abaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaa
abaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
abaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaa
acaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaafgafbaia
ebaaaaaaacaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaa
fgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
adaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaa
acaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaakgakbaia
ebaaaaaaacaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaa
egaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
aaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaaadaaaaaa
dcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
adaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaanpcaabaaa
acaaaaaaegaobaaaacaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaabaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaagaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_26;
  tmpvar_26 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_26.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_26.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_26.z);
  highp vec4 tmpvar_30;
  tmpvar_30 = (((tmpvar_27 * tmpvar_27) + (tmpvar_28 * tmpvar_28)) + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_31;
  tmpvar_31 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_27 * tmpvar_9.x) + (tmpvar_28 * tmpvar_9.y)) + (tmpvar_29 * tmpvar_9.z)) * inversesqrt(tmpvar_30))) * (1.0/((1.0 + (tmpvar_30 * unity_4LightAtten0)))));
  highp vec3 tmpvar_32;
  tmpvar_32 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_31.x) + (unity_LightColor[1].xyz * tmpvar_31.y)) + (unity_LightColor[2].xyz * tmpvar_31.z)) + (unity_LightColor[3].xyz * tmpvar_31.w)));
  tmpvar_5 = tmpvar_32;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
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
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_23;
  highp vec2 pblend_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_26;
  tmpvar_26 = c_1.w;
  pblend_24.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = tmpvar_25.w;
  pblend_24.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_24.x, pblend_24.y);
  res_23 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_24 - res_23.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_24 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = ((c_1.xyz * tmpvar_30.x) + (tmpvar_25.xyz * tmpvar_30.y));
  res_23.xyz = tmpvar_31;
  gl_FragData[0] = res_23;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_26;
  tmpvar_26 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_26.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_26.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_26.z);
  highp vec4 tmpvar_30;
  tmpvar_30 = (((tmpvar_27 * tmpvar_27) + (tmpvar_28 * tmpvar_28)) + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_31;
  tmpvar_31 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_27 * tmpvar_9.x) + (tmpvar_28 * tmpvar_9.y)) + (tmpvar_29 * tmpvar_9.z)) * inversesqrt(tmpvar_30))) * (1.0/((1.0 + (tmpvar_30 * unity_4LightAtten0)))));
  highp vec3 tmpvar_32;
  tmpvar_32 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_31.x) + (unity_LightColor[1].xyz * tmpvar_31.y)) + (unity_LightColor[2].xyz * tmpvar_31.z)) + (unity_LightColor[3].xyz * tmpvar_31.w)));
  tmpvar_5 = tmpvar_32;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
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
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_23;
  highp vec2 pblend_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_26;
  tmpvar_26 = c_1.w;
  pblend_24.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = tmpvar_25.w;
  pblend_24.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_24.x, pblend_24.y);
  res_23 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_24 - res_23.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_24 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = ((c_1.xyz * tmpvar_30.x) + (tmpvar_25.xyz * tmpvar_30.y));
  res_23.xyz = tmpvar_31;
  gl_FragData[0] = res_23;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out lowp vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_26;
  tmpvar_26 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_26.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_26.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_26.z);
  highp vec4 tmpvar_30;
  tmpvar_30 = (((tmpvar_27 * tmpvar_27) + (tmpvar_28 * tmpvar_28)) + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_31;
  tmpvar_31 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_27 * tmpvar_9.x) + (tmpvar_28 * tmpvar_9.y)) + (tmpvar_29 * tmpvar_9.z)) * inversesqrt(tmpvar_30))) * (1.0/((1.0 + (tmpvar_30 * unity_4LightAtten0)))));
  highp vec3 tmpvar_32;
  tmpvar_32 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_31.x) + (unity_LightColor[1].xyz * tmpvar_31.y)) + (unity_LightColor[2].xyz * tmpvar_31.z)) + (unity_LightColor[3].xyz * tmpvar_31.w)));
  tmpvar_5 = tmpvar_32;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
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
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_23;
  highp vec2 pblend_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_26;
  tmpvar_26 = c_1.w;
  pblend_24.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = tmpvar_25.w;
  pblend_24.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_24.x, pblend_24.y);
  res_23 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_24 - res_23.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_24 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = ((c_1.xyz * tmpvar_30.x) + (tmpvar_25.xyz * tmpvar_30.y));
  res_23.xyz = tmpvar_31;
  _glesFragData[0] = res_23;
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
PARAM c[31] = { { 0.5, 1, 0 },
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
MOV R4.w, c[0].y;
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
ADD R1, R2, c[0].y;
DP4 R2.z, R4, c[20];
DP4 R2.y, R4, c[19];
DP4 R2.x, R4, c[18];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[15];
MAD R1.xyz, R0.x, c[14], R1;
MAD R0.xyz, R0.z, c[16], R1;
MAD R1.xyz, R0.w, c[17], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R4.w, R0, c[23];
DP4 R4.z, R0, c[22];
DP4 R4.y, R0, c[21];
ADD R0.xyz, R2, R4.yzww;
MUL R1.w, R3, R3;
MAD R0.w, R4.x, R4.x, -R1;
DP4 R2.xw, vertex.position, c[4];
MUL R4.yzw, R0.w, c[24].xxyz;
ADD R4.yzw, R0.xxyz, R4;
ADD result.texcoord[5].xyz, R4.yzww, R1;
DP4 R3.y, vertex.position, c[1];
DP4 R3.z, vertex.position, c[2];
DP4 R1.z, vertex.position, c[3];
MOV R0.w, R2.x;
MOV R0.z, R1;
MOV R0.x, R3.y;
MOV R0.y, R3.z;
MUL R2.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MOV R1.x, R2;
MUL R1.y, R2, c[9].x;
ADD result.texcoord[6].xy, R1, R2.z;
ADD R0.xy, R2.w, R3.yzzw;
MOV R1.w, R2;
MUL R1.xy, R0, c[0].x;
MOV result.texcoord[3], R1;
MOV result.texcoord[6].zw, R0;
MOV result.texcoord[4].z, R3.x;
MOV result.texcoord[4].y, R3.w;
MOV result.texcoord[4].x, R4;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[27].xyxy, c[27];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[26], c[26].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[29].xyxy, c[29];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[28], c[28].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[30], c[30].zwzw;
END
# 75 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 76 math
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
dcl_texcoord6 o7
def c31, 0.50000000, 1.00000000, 0.00000000, 0
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
dp4 r5.xy, v0, c1
dp4 r0.x, v0, c4
add r0, -r0.x, c10
mul r1, r1, r1
mov r4.z, r3.x
mov r4.w, c31.y
mad r2, r4.x, r0, r2
dp4 r3.yz, v0, c3
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
add r1, r2, c31.y
dp4 r2.z, r4, c20
dp4 r2.y, r4, c19
dp4 r2.x, r4, c18
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c31.z
mul r0, r0, r1
mul r1.xyz, r0.y, c15
mad r1.xyz, r0.x, c14, r1
mad r0.xyz, r0.z, c16, r1
mad r1.xyz, r0.w, c17, r0
mul r0, r4.xyzz, r4.yzzx
dp4 r4.w, r0, c23
dp4 r4.z, r0, c22
dp4 r4.y, r0, c21
mul r1.w, r3, r3
mad r0.w, r4.x, r4.x, -r1
add r0.xyz, r2, r4.yzww
mul r2.xyz, r0.w, c24
add r2.xyz, r0, r2
add o6.xyz, r2, r1
dp4 r5.z, v0, c0
dp4 r1.z, v0, c2
mov r0.w, r3.z
mov r0.z, r1
mov r0.x, r5.z
mov r0.y, r5
mul r4.yzw, r0.xxyw, c31.x
mov r1.x, r4.y
mul r1.y, r4.z, c8.x
mad o7.xy, r4.w, c9.zwzw, r1
mov r5.w, -r5.x
mov o0, r0
mad r0.xy, r3.y, c9.zwzw, r5.zwzw
mov r1.w, r3.y
mul r1.xy, r0, c31.x
mov o4, r1
mov o7.zw, r0
mov o5.z, r3.x
mov o5.y, r3.w
mov o5.x, r4
mad o1.zw, v2.xyxy, c27.xyxy, c27
mad o1.xy, v2, c26, c26.zwzw
mad o2.zw, v2.xyxy, c29.xyxy, c29
mad o2.xy, v2, c28, c28.zwzw
mad o3.xy, v2, c30, c30.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 54 math
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
eefiecedjojlbogbdfnpahllnjmbnnaggnlmahjaabaaaaaaleakaaaaadaaaaaa
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
naaiaaaaeaaaabaadeacaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaae
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
aaaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
abaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaafaaaaaa
egacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaai
ccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaai
ecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaa
aeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaa
aeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaa
aeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahecaabaaaaaaaaaaa
bkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakecaabaaaaaaaaaaaakaabaaa
abaaaaaaakaabaaaabaaaaaackaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaacmaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaa
aeaaaaaafgafbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaah
pcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaa
aeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaaaaaaaajpcaabaaaagaaaaaa
agaabaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaa
adaaaaaakgakbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaaj
pcaabaaaafaaaaaaegaobaaaagaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaa
dcaaaaajpcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaa
afaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaa
egaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaa
adaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaadaaaaaa
dcaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaaacaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaadaaaaaaegaobaaaabaaaaaadiaaaaai
hcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaak
hcaabaaaadaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaa
abaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
ajaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaagaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakfcaabaaaaaaaaaaaagadbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaahdccabaaaahaaaaaa
kgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_26;
  tmpvar_26 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_26.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_26.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_26.z);
  highp vec4 tmpvar_30;
  tmpvar_30 = (((tmpvar_27 * tmpvar_27) + (tmpvar_28 * tmpvar_28)) + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_31;
  tmpvar_31 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_27 * tmpvar_9.x) + (tmpvar_28 * tmpvar_9.y)) + (tmpvar_29 * tmpvar_9.z)) * inversesqrt(tmpvar_30))) * (1.0/((1.0 + (tmpvar_30 * unity_4LightAtten0)))));
  highp vec3 tmpvar_32;
  tmpvar_32 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_31.x) + (unity_LightColor[1].xyz * tmpvar_31.y)) + (unity_LightColor[2].xyz * tmpvar_31.z)) + (unity_LightColor[3].xyz * tmpvar_31.w)));
  tmpvar_5 = tmpvar_32;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
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
  tmpvar_25 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  lowp vec4 c_28;
  c_28.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * tmpvar_22) * 2.0));
  c_28.w = tmpvar_2;
  c_1.w = c_28.w;
  c_1.xyz = (c_28.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_29;
  highp vec2 pblend_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_32;
  tmpvar_32 = c_1.w;
  pblend_30.x = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = tmpvar_31.w;
  pblend_30.y = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_34.w = max (pblend_30.x, pblend_30.y);
  res_29 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35 = max (((pblend_30 - res_29.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_36;
  tmpvar_36 = (tmpvar_35 / (tmpvar_35.x + tmpvar_35.y));
  pblend_30 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((c_1.xyz * tmpvar_36.x) + (tmpvar_31.xyz * tmpvar_36.y));
  res_29.xyz = tmpvar_37;
  gl_FragData[0] = res_29;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  highp vec4 tmpvar_8;
  tmpvar_8 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_10;
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
  shlight_1 = tmpvar_12;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_27;
  tmpvar_27 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosX0 - tmpvar_27.x);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosY0 - tmpvar_27.y);
  highp vec4 tmpvar_30;
  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_27.z);
  highp vec4 tmpvar_31;
  tmpvar_31 = (((tmpvar_28 * tmpvar_28) + (tmpvar_29 * tmpvar_29)) + (tmpvar_30 * tmpvar_30));
  highp vec4 tmpvar_32;
  tmpvar_32 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_28 * tmpvar_10.x) + (tmpvar_29 * tmpvar_10.y)) + (tmpvar_30 * tmpvar_10.z)) * inversesqrt(tmpvar_31))) * (1.0/((1.0 + (tmpvar_31 * unity_4LightAtten0)))));
  highp vec3 tmpvar_33;
  tmpvar_33 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_32.x) + (unity_LightColor[1].xyz * tmpvar_32.y)) + (unity_LightColor[2].xyz * tmpvar_32.z)) + (unity_LightColor[3].xyz * tmpvar_32.w)));
  tmpvar_5 = tmpvar_33;
  highp vec4 o_34;
  highp vec4 tmpvar_35;
  tmpvar_35 = (tmpvar_8 * 0.5);
  highp vec2 tmpvar_36;
  tmpvar_36.x = tmpvar_35.x;
  tmpvar_36.y = (tmpvar_35.y * _ProjectionParams.x);
  o_34.xy = (tmpvar_36 + tmpvar_35.w);
  o_34.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = o_34;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform highp float _Depth;
uniform sampler2D _GrabTexture;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
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
  c_22.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x) * 2.0));
  c_22.w = tmpvar_2;
  c_1.w = c_22.w;
  c_1.xyz = (c_22.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_23;
  highp vec2 pblend_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_26;
  tmpvar_26 = c_1.w;
  pblend_24.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = tmpvar_25.w;
  pblend_24.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_24.x, pblend_24.y);
  res_23 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_24 - res_23.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_24 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = ((c_1.xyz * tmpvar_30.x) + (tmpvar_25.xyz * tmpvar_30.y));
  res_23.xyz = tmpvar_31;
  gl_FragData[0] = res_23;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out lowp vec3 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_26;
  tmpvar_26 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_26.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_26.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_26.z);
  highp vec4 tmpvar_30;
  tmpvar_30 = (((tmpvar_27 * tmpvar_27) + (tmpvar_28 * tmpvar_28)) + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_31;
  tmpvar_31 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_27 * tmpvar_9.x) + (tmpvar_28 * tmpvar_9.y)) + (tmpvar_29 * tmpvar_9.z)) * inversesqrt(tmpvar_30))) * (1.0/((1.0 + (tmpvar_30 * unity_4LightAtten0)))));
  highp vec3 tmpvar_32;
  tmpvar_32 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_31.x) + (unity_LightColor[1].xyz * tmpvar_31.y)) + (unity_LightColor[2].xyz * tmpvar_31.z)) + (unity_LightColor[3].xyz * tmpvar_31.w)));
  tmpvar_5 = tmpvar_32;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _WorldSpaceLightPos0;
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
  tmpvar_25 = textureProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  lowp vec4 c_28;
  c_28.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * tmpvar_22) * 2.0));
  c_28.w = tmpvar_2;
  c_1.w = c_28.w;
  c_1.xyz = (c_28.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_29;
  highp vec2 pblend_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_32;
  tmpvar_32 = c_1.w;
  pblend_30.x = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = tmpvar_31.w;
  pblend_30.y = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_34.w = max (pblend_30.x, pblend_30.y);
  res_29 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35 = max (((pblend_30 - res_29.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_36;
  tmpvar_36 = (tmpvar_35 / (tmpvar_35.x + tmpvar_35.y));
  pblend_30 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((c_1.xyz * tmpvar_36.x) + (tmpvar_31.xyz * tmpvar_36.y));
  res_29.xyz = tmpvar_37;
  _glesFragData[0] = res_29;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform lowp vec4 _WorldSpaceLightPos0;
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
  tmpvar_23 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD6.xyz);
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (tmpvar_23 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  lowp vec4 c_25;
  c_25.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * shadow_22) * 2.0));
  c_25.w = tmpvar_2;
  c_1.w = c_25.w;
  c_1.xyz = (c_25.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_26;
  highp vec2 pblend_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_29;
  tmpvar_29 = c_1.w;
  pblend_27.x = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = tmpvar_28.w;
  pblend_27.y = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_31.w = max (pblend_27.x, pblend_27.y);
  res_26 = tmpvar_31;
  highp vec2 tmpvar_32;
  tmpvar_32 = max (((pblend_27 - res_26.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_33;
  tmpvar_33 = (tmpvar_32 / (tmpvar_32.x + tmpvar_32.y));
  pblend_27 = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = ((c_1.xyz * tmpvar_33.x) + (tmpvar_28.xyz * tmpvar_33.y));
  res_26.xyz = tmpvar_34;
  gl_FragData[0] = res_26;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out lowp vec3 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _WorldSpaceLightPos0;
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
  tmpvar_23 = texture (_ShadowMapTexture, xlv_TEXCOORD6.xyz);
  shadow_22 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (shadow_22 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  lowp vec4 c_25;
  c_25.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * shadow_22) * 2.0));
  c_25.w = tmpvar_2;
  c_1.w = c_25.w;
  c_1.xyz = (c_25.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_26;
  highp vec2 pblend_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_29;
  tmpvar_29 = c_1.w;
  pblend_27.x = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = tmpvar_28.w;
  pblend_27.y = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_31.w = max (pblend_27.x, pblend_27.y);
  res_26 = tmpvar_31;
  highp vec2 tmpvar_32;
  tmpvar_32 = max (((pblend_27 - res_26.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_33;
  tmpvar_33 = (tmpvar_32 / (tmpvar_32.x + tmpvar_32.y));
  pblend_27 = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = ((c_1.xyz * tmpvar_33.x) + (tmpvar_28.xyz * tmpvar_33.y));
  res_26.xyz = tmpvar_34;
  _glesFragData[0] = res_26;
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
  c_1.xyz = (col_3 * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz), vec3((shadow_22 * 2.0))));
  c_1.w = tmpvar_2;
  lowp vec4 res_25;
  highp vec2 pblend_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_28;
  tmpvar_28 = c_1.w;
  pblend_26.x = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = tmpvar_27.w;
  pblend_26.y = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_30.w = max (pblend_26.x, pblend_26.y);
  res_25 = tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = max (((pblend_26 - res_25.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_32;
  tmpvar_32 = (tmpvar_31 / (tmpvar_31.x + tmpvar_31.y));
  pblend_26 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = ((c_1.xyz * tmpvar_32.x) + (tmpvar_27.xyz * tmpvar_32.y));
  res_25.xyz = tmpvar_33;
  gl_FragData[0] = res_25;
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
  c_1.xyz = (col_3 * min ((2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz), vec3((shadow_22 * 2.0))));
  c_1.w = tmpvar_2;
  lowp vec4 res_25;
  highp vec2 pblend_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_28;
  tmpvar_28 = c_1.w;
  pblend_26.x = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = tmpvar_27.w;
  pblend_26.y = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_30.w = max (pblend_26.x, pblend_26.y);
  res_25 = tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = max (((pblend_26 - res_25.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_32;
  tmpvar_32 = (tmpvar_31 / (tmpvar_31.x + tmpvar_31.y));
  pblend_26 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = ((c_1.xyz * tmpvar_32.x) + (tmpvar_27.xyz * tmpvar_32.y));
  res_25.xyz = tmpvar_33;
  _glesFragData[0] = res_25;
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
  mediump vec3 lm_25;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_25 = tmpvar_26;
  lowp vec3 tmpvar_27;
  tmpvar_27 = vec3((shadow_22 * 2.0));
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_3 * min (lm_25, tmpvar_27));
  c_1.xyz = tmpvar_28;
  c_1.w = tmpvar_2;
  lowp vec4 res_29;
  highp vec2 pblend_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_32;
  tmpvar_32 = c_1.w;
  pblend_30.x = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = tmpvar_31.w;
  pblend_30.y = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_34.w = max (pblend_30.x, pblend_30.y);
  res_29 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35 = max (((pblend_30 - res_29.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_36;
  tmpvar_36 = (tmpvar_35 / (tmpvar_35.x + tmpvar_35.y));
  pblend_30 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((c_1.xyz * tmpvar_36.x) + (tmpvar_31.xyz * tmpvar_36.y));
  res_29.xyz = tmpvar_37;
  gl_FragData[0] = res_29;
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
  mediump vec3 lm_25;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD4).xyz);
  lm_25 = tmpvar_26;
  lowp vec3 tmpvar_27;
  tmpvar_27 = vec3((shadow_22 * 2.0));
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_3 * min (lm_25, tmpvar_27));
  c_1.xyz = tmpvar_28;
  c_1.w = tmpvar_2;
  lowp vec4 res_29;
  highp vec2 pblend_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_32;
  tmpvar_32 = c_1.w;
  pblend_30.x = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = tmpvar_31.w;
  pblend_30.y = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_34.w = max (pblend_30.x, pblend_30.y);
  res_29 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35 = max (((pblend_30 - res_29.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_36;
  tmpvar_36 = (tmpvar_35 / (tmpvar_35.x + tmpvar_35.y));
  pblend_30 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((c_1.xyz * tmpvar_36.x) + (tmpvar_31.xyz * tmpvar_36.y));
  res_29.xyz = tmpvar_37;
  _glesFragData[0] = res_29;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_26;
  tmpvar_26 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_26.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_26.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_26.z);
  highp vec4 tmpvar_30;
  tmpvar_30 = (((tmpvar_27 * tmpvar_27) + (tmpvar_28 * tmpvar_28)) + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_31;
  tmpvar_31 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_27 * tmpvar_9.x) + (tmpvar_28 * tmpvar_9.y)) + (tmpvar_29 * tmpvar_9.z)) * inversesqrt(tmpvar_30))) * (1.0/((1.0 + (tmpvar_30 * unity_4LightAtten0)))));
  highp vec3 tmpvar_32;
  tmpvar_32 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_31.x) + (unity_LightColor[1].xyz * tmpvar_31.y)) + (unity_LightColor[2].xyz * tmpvar_31.z)) + (unity_LightColor[3].xyz * tmpvar_31.w)));
  tmpvar_5 = tmpvar_32;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform lowp vec4 _WorldSpaceLightPos0;
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
  tmpvar_23 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD6.xyz);
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (tmpvar_23 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  lowp vec4 c_25;
  c_25.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * shadow_22) * 2.0));
  c_25.w = tmpvar_2;
  c_1.w = c_25.w;
  c_1.xyz = (c_25.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_26;
  highp vec2 pblend_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_29;
  tmpvar_29 = c_1.w;
  pblend_27.x = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = tmpvar_28.w;
  pblend_27.y = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_31.w = max (pblend_27.x, pblend_27.y);
  res_26 = tmpvar_31;
  highp vec2 tmpvar_32;
  tmpvar_32 = max (((pblend_27 - res_26.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_33;
  tmpvar_33 = (tmpvar_32 / (tmpvar_32.x + tmpvar_32.y));
  pblend_27 = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = ((c_1.xyz * tmpvar_33.x) + (tmpvar_28.xyz * tmpvar_33.y));
  res_26.xyz = tmpvar_34;
  gl_FragData[0] = res_26;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out lowp vec3 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 pos_6;
  pos_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_7;
  tmpvar_7.xy = ((pos_6.xy + pos_6.w) * 0.5);
  tmpvar_7.zw = pos_6.zw;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  shlight_1 = tmpvar_11;
  tmpvar_5 = shlight_1;
  highp vec3 tmpvar_26;
  tmpvar_26 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosX0 - tmpvar_26.x);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosY0 - tmpvar_26.y);
  highp vec4 tmpvar_29;
  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_26.z);
  highp vec4 tmpvar_30;
  tmpvar_30 = (((tmpvar_27 * tmpvar_27) + (tmpvar_28 * tmpvar_28)) + (tmpvar_29 * tmpvar_29));
  highp vec4 tmpvar_31;
  tmpvar_31 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_27 * tmpvar_9.x) + (tmpvar_28 * tmpvar_9.y)) + (tmpvar_29 * tmpvar_9.z)) * inversesqrt(tmpvar_30))) * (1.0/((1.0 + (tmpvar_30 * unity_4LightAtten0)))));
  highp vec3 tmpvar_32;
  tmpvar_32 = (tmpvar_5 + ((((unity_LightColor[0].xyz * tmpvar_31.x) + (unity_LightColor[1].xyz * tmpvar_31.y)) + (unity_LightColor[2].xyz * tmpvar_31.z)) + (unity_LightColor[3].xyz * tmpvar_31.w)));
  tmpvar_5 = tmpvar_32;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _WorldSpaceLightPos0;
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
  tmpvar_23 = texture (_ShadowMapTexture, xlv_TEXCOORD6.xyz);
  shadow_22 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (shadow_22 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  lowp vec4 c_25;
  c_25.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, _WorldSpaceLightPos0.xyz)) * shadow_22) * 2.0));
  c_25.w = tmpvar_2;
  c_1.w = c_25.w;
  c_1.xyz = (c_25.xyz + (col_3 * xlv_TEXCOORD5));
  lowp vec4 res_26;
  highp vec2 pblend_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_29;
  tmpvar_29 = c_1.w;
  pblend_27.x = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = tmpvar_28.w;
  pblend_27.y = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_31.w = max (pblend_27.x, pblend_27.y);
  res_26 = tmpvar_31;
  highp vec2 tmpvar_32;
  tmpvar_32 = max (((pblend_27 - res_26.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_33;
  tmpvar_33 = (tmpvar_32 / (tmpvar_32.x + tmpvar_32.y));
  pblend_27 = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = ((c_1.xyz * tmpvar_33.x) + (tmpvar_28.xyz * tmpvar_33.y));
  res_26.xyz = tmpvar_34;
  _glesFragData[0] = res_26;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 49 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_GrabTexture] 2D 5
"3.0-!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 2, 0.5 } };
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
MAX R0.w, R2, R0;
ADD R4.x, R4, R3.w;
MAX R0.w, R4.x, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R0.w;
ADD R4, R4, c[2].x;
MAX R4, R4, c[3].x;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R3.xyz, R4.x, R3;
MUL R2.xyz, R4.y, R2;
ADD R2.xyz, R3, R2;
MUL R1.xyz, R4.z, R1;
ADD R1.xyz, R2, R1;
MUL R2.xyz, R4.w, R0;
ADD R1.xyz, R1, R2;
MUL R3.x, R0.w, c[3].z;
TXP R0, fragment.texcoord[3], texture[5], 2D;
MAX R1.w, R0, R3.x;
MOV R3.y, R0.w;
MUL R2.xyz, R1, c[1];
MOV R0.w, c[3].z;
ADD R3.xy, R3, -R1.w;
MAD R3.xy, R0.w, c[2].x, R3;
MAX R3.xy, R3, c[3].x;
ADD R2.w, R3.x, R3.y;
DP3 R0.w, fragment.texcoord[4], c[0];
RCP R2.w, R2.w;
MUL R3.xy, R3, R2.w;
MAX R0.w, R0, c[3].x;
MUL R2.xyz, R0.w, R2;
MUL R1.xyz, R1, fragment.texcoord[5];
MUL R0.xyz, R3.y, R0;
MAD R1.xyz, R2, c[3].y, R1;
MAD result.color.xyz, R1, R3.x, R0;
MOV result.color.w, R1;
END
# 49 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 43 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_GrabTexture] 2D 5
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
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
texld r4, v0, s0
texld r0, v1.zwzw, s3
texld r1, v2, s4
add_pp r1.w, r1, r4
add_pp r4.z, r4, r0.w
texld r2, v0.zwzw, s1
texld r3, v1, s2
add_pp r3.w, r4.y, r3
max r0.w, r1, r4.z
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
mul r2.xyz, r4.w, r1
texldp r1, v3, s5
add_pp r0.xyz, r0, r2
mul r3.x, r0.w, c3.y
max r0.w, r1, r3.x
mov r3.y, r1.w
mul_pp r2.xyz, r0, c1
mov r1.w, c2.x
add r3.xy, r3, -r0.w
mad r3.xy, c3.y, r1.w, r3
max r3.xy, r3, c3.x
add r2.w, r3.x, r3.y
dp3_pp r1.w, v4, c0
rcp r2.w, r2.w
mul r3.xy, r3, r2.w
max_pp r1.w, r1, c3.x
mul_pp r2.xyz, r1.w, r2
mul_pp r0.xyz, r0, v5
mul r1.xyz, r3.y, r1
mad_pp r0.xyz, r2, c3.z, r0
mad oC0.xyz, r0, r3.x, r1
mov_pp oC0.w, r0
"
}
SubProgram "d3d11 " {
// Stats: 34 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 48 [_Depth]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedfmjkegihenolnjhcgfmlleebfpncegmmabaaaaaaimahaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfeagaaaaeaaaaaaajfabaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
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
bcaabaaaacaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaaipcaabaaa
abaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaadaaaaaadeaaaaakpcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaaaaaaaaah
icaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaaaaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaaaeaaaaaaagaabaaaabaaaaaa
egacbaaaafaaaaaaegacbaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaakgakbaaa
abaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaa
pgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaagaaaaaabaaaaaaiicaabaaaaaaaaaaa
egbcbaaaafaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
aeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaafaaaaaaaagabaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
abaaaaaaakaabaaaacaaaaaadgaaaaafccaabaaaacaaaaaadkaabaaaabaaaaaa
aaaaaaaidcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegaabaaaacaaaaaa
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
SetTexture 5 [unity_Lightmap] 2D 5
SetTexture 6 [_GrabTexture] 2D 6
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
TXP R1, fragment.texcoord[3], texture[6], 2D;
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
TEX R0, fragment.texcoord[4], texture[5], 2D;
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
SetTexture 5 [unity_Lightmap] 2D 5
SetTexture 6 [_GrabTexture] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
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
texldp r0, v3, s6
max r2.w, r0, r4.x
mov r4.y, r0.w
add_pp r2.xyz, r2, r3
mul r1.xyz, r4.w, r1
add_pp r2.xyz, r2, r1
texld r1, v4, s5
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
// Stats: 47 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [unity_Lightmap] 2D 5
SetTexture 6 [_GrabTexture] 2D 6
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
TXP R1, fragment.texcoord[3], texture[6], 2D;
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
TEX R0, fragment.texcoord[4], texture[5], 2D;
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
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [unity_Lightmap] 2D 5
SetTexture 6 [_GrabTexture] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
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
texldp r0, v3, s6
max r2.w, r0, r4.x
mov r4.y, r0.w
add_pp r2.xyz, r2, r3
mul r1.xyz, r4.w, r1
add_pp r2.xyz, r2, r1
texld r1, v4, s5
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
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
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
// Stats: 51 math, 7 textures
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
SetTexture 6 [_GrabTexture] 2D 6
"3.0-!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 2, 0.5 } };
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
MAX R0.w, R2, R0;
ADD R4.x, R4, R3.w;
MAX R0.w, R4.x, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R0.w;
ADD R4, R4, c[2].x;
MAX R4, R4, c[3].x;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R3.xyz, R4.x, R3;
MUL R2.xyz, R4.y, R2;
ADD R2.xyz, R3, R2;
MUL R1.xyz, R4.z, R1;
ADD R2.xyz, R2, R1;
TXP R1, fragment.texcoord[3], texture[6], 2D;
MUL R3.x, R0.w, c[3].z;
MAX R0.w, R1, R3.x;
MOV R3.y, R1.w;
MUL R0.xyz, R4.w, R0;
ADD R0.xyz, R2, R0;
MUL R2.xyz, R0, c[1];
MOV R1.w, c[3].z;
ADD R3.xy, R3, -R0.w;
MAD R3.xy, R1.w, c[2].x, R3;
MAX R3.xy, R3, c[3].x;
ADD R1.w, R3.x, R3.y;
RCP R2.w, R1.w;
MUL R3.xy, R3, R2.w;
DP3 R1.w, fragment.texcoord[4], c[0];
TXP R4.x, fragment.texcoord[6], texture[5], 2D;
MAX R1.w, R1, c[3].x;
MUL R1.w, R1, R4.x;
MUL R2.xyz, R1.w, R2;
MUL R0.xyz, R0, fragment.texcoord[5];
MUL R1.xyz, R3.y, R1;
MAD R0.xyz, R2, c[3].y, R0;
MAD result.color.xyz, R0, R3.x, R1;
MOV result.color.w, R0;
END
# 51 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 44 math, 7 textures
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
SetTexture 6 [_GrabTexture] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c3, 0.00000000, 0.50000000, 2.00000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
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
add r4, r4, c2.x
max r4, r4, c3.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r2.xyz, r4.x, r2
mul r3.xyz, r4.y, r3
add_pp r2.xyz, r2, r3
mul r0.xyz, r4.z, r0
add_pp r2.xyz, r2, r0
mul r3.x, r0.w, c3.y
texldp r0, v3, s6
max r1.w, r0, r3.x
mov r3.y, r0.w
mul r1.xyz, r4.w, r1
add_pp r1.xyz, r2, r1
mul_pp r2.xyz, r1, c1
mov r0.w, c2.x
add r3.xy, r3, -r1.w
mad r3.xy, c3.y, r0.w, r3
max r3.xy, r3, c3.x
add r0.w, r3.x, r3.y
rcp r2.w, r0.w
mul r3.xy, r3, r2.w
dp3_pp r0.w, v4, c0
texldp r4.x, v6, s5
max_pp r0.w, r0, c3.x
mul_pp r0.w, r0, r4.x
mul_pp r2.xyz, r0.w, r2
mul_pp r1.xyz, r1, v5
mul r0.xyz, r3.y, r0
mad_pp r1.xyz, r2, c3.z, r1
mad oC0.xyz, r1, r3.x, r0
mov_pp oC0.w, r1
"
}
SubProgram "d3d11 " {
// Stats: 35 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Splat0] 2D 3
SetTexture 2 [_Splat1] 2D 4
SetTexture 3 [_Splat2] 2D 5
SetTexture 4 [_Splat3] 2D 6
SetTexture 5 [_ShadowMapTexture] 2D 0
SetTexture 6 [_GrabTexture] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedinfapaiohjoflejcpijmagiiommfdnmeabaaaaaaamaiaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefclmagaaaaeaaaaaaakpabaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadlcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaa
agaaaaaagcbaaaadlcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
agaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaa
aagabaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaacaaaaaaaaaaaaahecaabaaaacaaaaaadkaabaaaaaaaaaaa
ckaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaagaaaaaaaaaaaaahicaabaaaacaaaaaadkaabaaaabaaaaaa
dkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaacaaaaaackaabaaa
acaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaa
aagabaaaaeaaaaaaaaaaaaahccaabaaaacaaaaaabkaabaaaabaaaaaadkaabaaa
aeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaacaaaaaa
efaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
adaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaaabaaaaaadkaabaaaafaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaacaaaaaaaaaaaaai
pcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegaobaaaacaaaaaadiaaaaah
bcaabaaaacaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaaipcaabaaa
abaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaahaaaaaadeaaaaakpcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaaaaaaaaah
icaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaaaaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaaaoaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaaaeaaaaaaagaabaaaabaaaaaa
egacbaaaafaaaaaaegacbaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaakgakbaaa
abaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaa
pgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaagaaaaaaaoaaaaahmcaabaaaacaaaaaa
agbebaaaahaaaaaapgbpbaaaahaaaaaaefaaaaajpcaabaaaadaaaaaaogakbaaa
acaaaaaaeghobaaaafaaaaaaaagabaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaa
egbcbaaaafaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaa
aaaaaaaaagaabaaaadaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
aeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaagaaaaaaaagabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
abaaaaaaakaabaaaacaaaaaadgaaaaafccaabaaaacaaaaaadkaabaaaabaaaaaa
aaaaaaaidcaabaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegaabaaaacaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaandcaabaaaacaaaaaa
agiacaaaaaaaaaaaahaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
egaabaaaacaaaaaadeaaaaakdcaabaaaacaaaaaaegaabaaaacaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
acaaaaaaakaabaaaacaaaaaaaoaaaaahdcaabaaaacaaaaaaegaabaaaacaaaaaa
pgapbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaafgafbaaa
acaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaagaabaaaacaaaaaa
egacbaaaabaaaaaadoaaaaab"
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
SetTexture 5 [_ShadowMapTexture] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [_GrabTexture] 2D 7
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
TXP R2, fragment.texcoord[3], texture[7], 2D;
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
TEX R0, fragment.texcoord[4], texture[6], 2D;
MUL R3.xyz, R0.w, R0;
TXP R5.x, fragment.texcoord[5], texture[5], 2D;
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
SetTexture 5 [_ShadowMapTexture] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [_GrabTexture] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
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
texldp r2, v3, s7
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
texld r0, v4, s6
mul_pp r3.xyz, r0.w, r0
texldp r5.x, v5, s5
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
// Stats: 53 math, 8 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_ShadowMapTexture] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [_GrabTexture] 2D 7
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
TXP R2, fragment.texcoord[3], texture[7], 2D;
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
TEX R0, fragment.texcoord[4], texture[6], 2D;
MUL R3.xyz, R0.w, R0;
TXP R5.x, fragment.texcoord[5], texture[5], 2D;
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_ShadowMapTexture] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [_GrabTexture] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
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
texldp r2, v3, s7
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
texld r0, v4, s6
mul_pp r3.xyz, r0.w, r0
texldp r5.x, v5, s5
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
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
 //       d3d11 : 24 avg math (15..28)
 //        d3d9 : 28 avg math (22..31)
 //      opengl : 26 avg math (20..28)
 // Stats for Fragment shader:
 //       d3d11 : 35 avg math (32..42), 7 avg texture (6..8)
 //        d3d9 : 45 avg math (42..51), 7 avg texture (6..8)
 //      opengl : 53 avg math (48..59), 7 avg texture (6..8)
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
// Stats: 27 math
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
PARAM c[20] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
DP4 R2.xw, vertex.position, c[4];
MOV R1.w, R2.x;
MUL R2.xyz, vertex.normal, c[14].w;
DP4 R1.z, vertex.position, c[3];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MOV result.position, R1;
ADD R1.xy, R1, R2.w;
DP4 result.texcoord[6].z, R0, c[11];
DP4 result.texcoord[6].y, R0, c[10];
DP4 result.texcoord[6].x, R0, c[9];
MUL result.texcoord[3].xy, R1, c[0].x;
DP3 result.texcoord[4].z, R2, c[7];
DP3 result.texcoord[4].y, R2, c[6];
DP3 result.texcoord[4].x, R2, c[5];
ADD result.texcoord[5].xyz, -R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MOV result.texcoord[3].w, R2;
MOV result.texcoord[3].z, R1;
END
# 27 instructions, 3 R-regs
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
Matrix 8 [_LightMatrix0]
Vector 12 [_ScreenParams]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
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
dcl_texcoord6 o7
def c20, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r1.xw, v0, c3
dp4 r1.yz, v0, c1
dp4 r2.z, v0, c2
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov r2.y, r1.z
dp4 r2.x, v0, c0
mov r2.w, r1.x
mov r1.x, r2
mov r1.y, -r1
mov o0, r2
mad r2.xy, r1.w, c12.zwzw, r1
mul r1.xyz, v1, c14.w
dp4 o7.z, r0, c10
dp4 o7.y, r0, c9
dp4 o7.x, r0, c8
mul o4.xy, r2, c20.x
dp3 o5.z, r1, c6
dp3 o5.y, r1, c5
dp3 o5.x, r1, c4
add o6.xyz, -r0, c13
mad o1.zw, v2.xyxy, c16.xyxy, c16
mad o1.xy, v2, c15, c15.zwzw
mad o2.zw, v2.xyxy, c18.xyxy, c18
mad o2.xy, v2, c17, c17.zwzw
mad o3.xy, v2, c19, c19.zwzw
mov o4.w, r1
mov o4.z, r2
"
}
SubProgram "d3d11 " {
// Stats: 28 math
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
eefiecedhbjlpibjidookgeniajclemmmjheljbeabaaaaaacaahaaaaadaaaaaa
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
dmafaaaaeaaaabaaepabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagfaaaaadhccabaaa
ahaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaa
aiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
ajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaal
mccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaa
aaaaaaaaalaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaadcaaaaamdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaa
aaaaaaaadgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaadiaaaaakdccabaaa
aeaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhccabaaaagaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaahaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
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
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD5);
  lightDir_1 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (xlv_TEXCOORD6, xlv_TEXCOORD6);
  lowp vec4 c_24;
  c_24.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * texture2D (_LightTexture0, vec2(tmpvar_23)).w) * 2.0));
  c_24.w = tmpvar_2;
  lowp vec4 tmpvar_25;
  lowp vec4 res_26;
  highp vec2 pblend_27;
  lowp float tmpvar_28;
  tmpvar_28 = c_24.w;
  pblend_27.x = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_27.y = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_30.w = max (pblend_27.x, pblend_27.y);
  res_26 = tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = max (((pblend_27 - res_26.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_32;
  tmpvar_32 = (tmpvar_31 / (tmpvar_31.x + tmpvar_31.y));
  pblend_27 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 0.0;
  tmpvar_33.xyz = (c_24.xyz * tmpvar_32.x);
  tmpvar_25 = tmpvar_33;
  gl_FragData[0] = tmpvar_25;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
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
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD5);
  lightDir_1 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (xlv_TEXCOORD6, xlv_TEXCOORD6);
  lowp vec4 c_24;
  c_24.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * texture2D (_LightTexture0, vec2(tmpvar_23)).w) * 2.0));
  c_24.w = tmpvar_2;
  lowp vec4 tmpvar_25;
  lowp vec4 res_26;
  highp vec2 pblend_27;
  lowp float tmpvar_28;
  tmpvar_28 = c_24.w;
  pblend_27.x = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_27.y = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_30.w = max (pblend_27.x, pblend_27.y);
  res_26 = tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = max (((pblend_27 - res_26.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_32;
  tmpvar_32 = (tmpvar_31 / (tmpvar_31.x + tmpvar_31.y));
  pblend_27 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 0.0;
  tmpvar_33.xyz = (c_24.xyz * tmpvar_32.x);
  tmpvar_25 = tmpvar_33;
  gl_FragData[0] = tmpvar_25;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out mediump vec3 xlv_TEXCOORD5;
out highp vec3 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
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
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in mediump vec3 xlv_TEXCOORD5;
in highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD5);
  lightDir_1 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (xlv_TEXCOORD6, xlv_TEXCOORD6);
  lowp vec4 c_24;
  c_24.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * texture (_LightTexture0, vec2(tmpvar_23)).w) * 2.0));
  c_24.w = tmpvar_2;
  lowp vec4 tmpvar_25;
  lowp vec4 res_26;
  highp vec2 pblend_27;
  lowp float tmpvar_28;
  tmpvar_28 = c_24.w;
  pblend_27.x = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = textureProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_27.y = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_30.w = max (pblend_27.x, pblend_27.y);
  res_26 = tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = max (((pblend_27 - res_26.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_32;
  tmpvar_32 = (tmpvar_31 / (tmpvar_31.x + tmpvar_31.y));
  pblend_27 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 0.0;
  tmpvar_33.xyz = (c_24.xyz * tmpvar_32.x);
  tmpvar_25 = tmpvar_33;
  _glesFragData[0] = tmpvar_25;
}



#endif"
}
SubProgram "opengl " {
// Stats: 20 math
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
PARAM c[16] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
DP4 R1.xw, vertex.position, c[4];
MOV R0.w, R1.x;
MUL R1.xyz, vertex.normal, c[10].w;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MOV result.position, R0;
ADD R0.xy, R0, R1.w;
MUL result.texcoord[3].xy, R0, c[0].x;
DP3 result.texcoord[4].z, R1, c[7];
DP3 result.texcoord[4].y, R1, c[6];
DP3 result.texcoord[4].x, R1, c[5];
MOV result.texcoord[5].xyz, c[9];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[12].xyxy, c[12];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[14].xyxy, c[14];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MOV result.texcoord[3].w, R1;
MOV result.texcoord[3].z, R0;
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 22 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ScreenParams]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [unity_Scale]
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
dcl_texcoord5 o6
def c16, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r1.xw, v0, c3
dp4 r1.yz, v0, c1
dp4 r0.z, v0, c2
mov r0.y, r1.z
mov r0.w, r1.x
dp4 r0.x, v0, c0
mov o0, r0
mov r0.y, -r1
mul r1.xyz, v1, c10.w
mad r0.xy, r1.w, c8.zwzw, r0
mul o4.xy, r0, c16.x
dp3 o5.z, r1, c6
dp3 o5.y, r1, c5
dp3 o5.x, r1, c4
mov o6.xyz, c9
mad o1.zw, v2.xyxy, c12.xyxy, c12
mad o1.xy, v2, c11, c11.zwzw
mad o2.zw, v2.xyxy, c14.xyxy, c14
mad o2.xy, v2, c13, c13.zwzw
mad o3.xy, v2, c15, c15.zwzw
mov o4.w, r1
mov o4.z, r0
"
}
SubProgram "d3d11 " {
// Stats: 15 math
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
eefiecedkkpjcdkpfodpibabjinbgmcoalclldnhabaaaaaaciafaaaaadaaaaaa
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
aaklklklfdeieefcfmadaaaaeaaaabaanhaaaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
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
egaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaagaaaaaaegiccaaaabaaaaaa
aaaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = _WorldSpaceLightPos0.xyz;
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
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
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  lightDir_1 = xlv_TEXCOORD5;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * 2.0));
  c_22.w = tmpvar_2;
  lowp vec4 tmpvar_23;
  lowp vec4 res_24;
  highp vec2 pblend_25;
  lowp float tmpvar_26;
  tmpvar_26 = c_22.w;
  pblend_25.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_25.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_25.x, pblend_25.y);
  res_24 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_25 - res_24.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_25 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 0.0;
  tmpvar_31.xyz = (c_22.xyz * tmpvar_30.x);
  tmpvar_23 = tmpvar_31;
  gl_FragData[0] = tmpvar_23;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = _WorldSpaceLightPos0.xyz;
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
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
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  lightDir_1 = xlv_TEXCOORD5;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * 2.0));
  c_22.w = tmpvar_2;
  lowp vec4 tmpvar_23;
  lowp vec4 res_24;
  highp vec2 pblend_25;
  lowp float tmpvar_26;
  tmpvar_26 = c_22.w;
  pblend_25.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_25.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_25.x, pblend_25.y);
  res_24 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_25 - res_24.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_25 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 0.0;
  tmpvar_31.xyz = (c_22.xyz * tmpvar_30.x);
  tmpvar_23 = tmpvar_31;
  gl_FragData[0] = tmpvar_23;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out mediump vec3 xlv_TEXCOORD5;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = _WorldSpaceLightPos0.xyz;
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
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
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in mediump vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec3 lightDir_1;
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
  lightDir_1 = xlv_TEXCOORD5;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * (max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * 2.0));
  c_22.w = tmpvar_2;
  lowp vec4 tmpvar_23;
  lowp vec4 res_24;
  highp vec2 pblend_25;
  lowp float tmpvar_26;
  tmpvar_26 = c_22.w;
  pblend_25.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = textureProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_25.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_25.x, pblend_25.y);
  res_24 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_25 - res_24.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_25 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 0.0;
  tmpvar_31.xyz = (c_22.xyz * tmpvar_30.x);
  tmpvar_23 = tmpvar_31;
  _glesFragData[0] = tmpvar_23;
}



#endif"
}
SubProgram "opengl " {
// Stats: 28 math
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
PARAM c[20] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
DP4 R2.xw, vertex.position, c[4];
MOV R1.w, R2.x;
MUL R2.xyz, vertex.normal, c[14].w;
DP4 R1.z, vertex.position, c[3];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MOV result.position, R1;
ADD R1.xy, R1, R2.w;
DP4 result.texcoord[6].w, R0, c[12];
DP4 result.texcoord[6].z, R0, c[11];
DP4 result.texcoord[6].y, R0, c[10];
DP4 result.texcoord[6].x, R0, c[9];
MUL result.texcoord[3].xy, R1, c[0].x;
DP3 result.texcoord[4].z, R2, c[7];
DP3 result.texcoord[4].y, R2, c[6];
DP3 result.texcoord[4].x, R2, c[5];
ADD result.texcoord[5].xyz, -R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MOV result.texcoord[3].w, R2;
MOV result.texcoord[3].z, R1;
END
# 28 instructions, 3 R-regs
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
Matrix 8 [_LightMatrix0]
Vector 12 [_ScreenParams]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
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
dcl_texcoord6 o7
def c20, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r1.xw, v0, c3
dp4 r1.yz, v0, c1
dp4 r2.z, v0, c2
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov r2.y, r1.z
dp4 r2.x, v0, c0
mov r2.w, r1.x
mov r1.x, r2
mov r1.y, -r1
mov o0, r2
mad r2.xy, r1.w, c12.zwzw, r1
mul r1.xyz, v1, c14.w
dp4 o7.w, r0, c11
dp4 o7.z, r0, c10
dp4 o7.y, r0, c9
dp4 o7.x, r0, c8
mul o4.xy, r2, c20.x
dp3 o5.z, r1, c6
dp3 o5.y, r1, c5
dp3 o5.x, r1, c4
add o6.xyz, -r0, c13
mad o1.zw, v2.xyxy, c16.xyxy, c16
mad o1.xy, v2, c15, c15.zwzw
mad o2.zw, v2.xyxy, c18.xyxy, c18
mad o2.xy, v2, c17, c17.zwzw
mad o3.xy, v2, c19, c19.zwzw
mov o4.w, r1
mov o4.z, r2
"
}
SubProgram "d3d11 " {
// Stats: 28 math
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
eefiecedmjnhdmpjhbflcnojbmikmfckhgenfompabaaaaaacaahaaaaadaaaaaa
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
dmafaaaaeaaaabaaepabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagfaaaaadpccabaaa
ahaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaa
aiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
ajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaal
mccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaa
aaaaaaaaalaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaadcaaaaamdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaa
aaaaaaaadgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaadiaaaaakdccabaaa
aeaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhccabaaaagaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaa
aeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaahaaaaaa
egiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab
"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex));
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
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD5);
  lightDir_1 = tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD6.xy / xlv_TEXCOORD6.w) + 0.5);
  highp float tmpvar_24;
  tmpvar_24 = dot (xlv_TEXCOORD6.xyz, xlv_TEXCOORD6.xyz);
  lowp float atten_25;
  atten_25 = ((float((xlv_TEXCOORD6.z > 0.0)) * texture2D (_LightTexture0, P_23).w) * texture2D (_LightTextureB0, vec2(tmpvar_24)).w);
  lowp vec4 c_26;
  c_26.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * atten_25) * 2.0));
  c_26.w = tmpvar_2;
  lowp vec4 tmpvar_27;
  lowp vec4 res_28;
  highp vec2 pblend_29;
  lowp float tmpvar_30;
  tmpvar_30 = c_26.w;
  pblend_29.x = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_29.y = tmpvar_31;
  highp vec4 tmpvar_32;
  tmpvar_32.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_32.w = max (pblend_29.x, pblend_29.y);
  res_28 = tmpvar_32;
  highp vec2 tmpvar_33;
  tmpvar_33 = max (((pblend_29 - res_28.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_34;
  tmpvar_34 = (tmpvar_33 / (tmpvar_33.x + tmpvar_33.y));
  pblend_29 = tmpvar_34;
  highp vec4 tmpvar_35;
  tmpvar_35.w = 0.0;
  tmpvar_35.xyz = (c_26.xyz * tmpvar_34.x);
  tmpvar_27 = tmpvar_35;
  gl_FragData[0] = tmpvar_27;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex));
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
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD5);
  lightDir_1 = tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD6.xy / xlv_TEXCOORD6.w) + 0.5);
  highp float tmpvar_24;
  tmpvar_24 = dot (xlv_TEXCOORD6.xyz, xlv_TEXCOORD6.xyz);
  lowp float atten_25;
  atten_25 = ((float((xlv_TEXCOORD6.z > 0.0)) * texture2D (_LightTexture0, P_23).w) * texture2D (_LightTextureB0, vec2(tmpvar_24)).w);
  lowp vec4 c_26;
  c_26.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * atten_25) * 2.0));
  c_26.w = tmpvar_2;
  lowp vec4 tmpvar_27;
  lowp vec4 res_28;
  highp vec2 pblend_29;
  lowp float tmpvar_30;
  tmpvar_30 = c_26.w;
  pblend_29.x = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_29.y = tmpvar_31;
  highp vec4 tmpvar_32;
  tmpvar_32.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_32.w = max (pblend_29.x, pblend_29.y);
  res_28 = tmpvar_32;
  highp vec2 tmpvar_33;
  tmpvar_33 = max (((pblend_29 - res_28.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_34;
  tmpvar_34 = (tmpvar_33 / (tmpvar_33.x + tmpvar_33.y));
  pblend_29 = tmpvar_34;
  highp vec4 tmpvar_35;
  tmpvar_35.w = 0.0;
  tmpvar_35.xyz = (c_26.xyz * tmpvar_34.x);
  tmpvar_27 = tmpvar_35;
  gl_FragData[0] = tmpvar_27;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out mediump vec3 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex));
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
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in mediump vec3 xlv_TEXCOORD5;
in highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD5);
  lightDir_1 = tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD6.xy / xlv_TEXCOORD6.w) + 0.5);
  highp float tmpvar_24;
  tmpvar_24 = dot (xlv_TEXCOORD6.xyz, xlv_TEXCOORD6.xyz);
  lowp float atten_25;
  atten_25 = ((float((xlv_TEXCOORD6.z > 0.0)) * texture (_LightTexture0, P_23).w) * texture (_LightTextureB0, vec2(tmpvar_24)).w);
  lowp vec4 c_26;
  c_26.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * atten_25) * 2.0));
  c_26.w = tmpvar_2;
  lowp vec4 tmpvar_27;
  lowp vec4 res_28;
  highp vec2 pblend_29;
  lowp float tmpvar_30;
  tmpvar_30 = c_26.w;
  pblend_29.x = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = textureProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_29.y = tmpvar_31;
  highp vec4 tmpvar_32;
  tmpvar_32.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_32.w = max (pblend_29.x, pblend_29.y);
  res_28 = tmpvar_32;
  highp vec2 tmpvar_33;
  tmpvar_33 = max (((pblend_29 - res_28.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_34;
  tmpvar_34 = (tmpvar_33 / (tmpvar_33.x + tmpvar_33.y));
  pblend_29 = tmpvar_34;
  highp vec4 tmpvar_35;
  tmpvar_35.w = 0.0;
  tmpvar_35.xyz = (c_26.xyz * tmpvar_34.x);
  tmpvar_27 = tmpvar_35;
  _glesFragData[0] = tmpvar_27;
}



#endif"
}
SubProgram "opengl " {
// Stats: 27 math
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
PARAM c[20] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
DP4 R2.xw, vertex.position, c[4];
MOV R1.w, R2.x;
MUL R2.xyz, vertex.normal, c[14].w;
DP4 R1.z, vertex.position, c[3];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MOV result.position, R1;
ADD R1.xy, R1, R2.w;
DP4 result.texcoord[6].z, R0, c[11];
DP4 result.texcoord[6].y, R0, c[10];
DP4 result.texcoord[6].x, R0, c[9];
MUL result.texcoord[3].xy, R1, c[0].x;
DP3 result.texcoord[4].z, R2, c[7];
DP3 result.texcoord[4].y, R2, c[6];
DP3 result.texcoord[4].x, R2, c[5];
ADD result.texcoord[5].xyz, -R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MOV result.texcoord[3].w, R2;
MOV result.texcoord[3].z, R1;
END
# 27 instructions, 3 R-regs
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
Matrix 8 [_LightMatrix0]
Vector 12 [_ScreenParams]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
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
dcl_texcoord6 o7
def c20, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r1.xw, v0, c3
dp4 r1.yz, v0, c1
dp4 r2.z, v0, c2
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov r2.y, r1.z
dp4 r2.x, v0, c0
mov r2.w, r1.x
mov r1.x, r2
mov r1.y, -r1
mov o0, r2
mad r2.xy, r1.w, c12.zwzw, r1
mul r1.xyz, v1, c14.w
dp4 o7.z, r0, c10
dp4 o7.y, r0, c9
dp4 o7.x, r0, c8
mul o4.xy, r2, c20.x
dp3 o5.z, r1, c6
dp3 o5.y, r1, c5
dp3 o5.x, r1, c4
add o6.xyz, -r0, c13
mad o1.zw, v2.xyxy, c16.xyxy, c16
mad o1.xy, v2, c15, c15.zwzw
mad o2.zw, v2.xyxy, c18.xyxy, c18
mad o2.xy, v2, c17, c17.zwzw
mad o3.xy, v2, c19, c19.zwzw
mov o4.w, r1
mov o4.z, r2
"
}
SubProgram "d3d11 " {
// Stats: 28 math
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
eefiecedhbjlpibjidookgeniajclemmmjheljbeabaaaaaacaahaaaaadaaaaaa
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
dmafaaaaeaaaabaaepabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagfaaaaadhccabaaa
ahaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaa
aiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
ajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaal
mccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaa
aaaaaaaaalaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaadcaaaaamdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaapgapbaaa
aaaaaaaadgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaadiaaaaakdccabaaa
aeaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhccabaaaagaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaahaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
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
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD5);
  lightDir_1 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (xlv_TEXCOORD6, xlv_TEXCOORD6);
  lowp vec4 c_24;
  c_24.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * (texture2D (_LightTextureB0, vec2(tmpvar_23)).w * textureCube (_LightTexture0, xlv_TEXCOORD6).w)) * 2.0));
  c_24.w = tmpvar_2;
  lowp vec4 tmpvar_25;
  lowp vec4 res_26;
  highp vec2 pblend_27;
  lowp float tmpvar_28;
  tmpvar_28 = c_24.w;
  pblend_27.x = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_27.y = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_30.w = max (pblend_27.x, pblend_27.y);
  res_26 = tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = max (((pblend_27 - res_26.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_32;
  tmpvar_32 = (tmpvar_31 / (tmpvar_31.x + tmpvar_31.y));
  pblend_27 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 0.0;
  tmpvar_33.xyz = (c_24.xyz * tmpvar_32.x);
  tmpvar_25 = tmpvar_33;
  gl_FragData[0] = tmpvar_25;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
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
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD5);
  lightDir_1 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (xlv_TEXCOORD6, xlv_TEXCOORD6);
  lowp vec4 c_24;
  c_24.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * (texture2D (_LightTextureB0, vec2(tmpvar_23)).w * textureCube (_LightTexture0, xlv_TEXCOORD6).w)) * 2.0));
  c_24.w = tmpvar_2;
  lowp vec4 tmpvar_25;
  lowp vec4 res_26;
  highp vec2 pblend_27;
  lowp float tmpvar_28;
  tmpvar_28 = c_24.w;
  pblend_27.x = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_27.y = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_30.w = max (pblend_27.x, pblend_27.y);
  res_26 = tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = max (((pblend_27 - res_26.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_32;
  tmpvar_32 = (tmpvar_31 / (tmpvar_31.x + tmpvar_31.y));
  pblend_27 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 0.0;
  tmpvar_33.xyz = (c_24.xyz * tmpvar_32.x);
  tmpvar_25 = tmpvar_33;
  gl_FragData[0] = tmpvar_25;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out mediump vec3 xlv_TEXCOORD5;
out highp vec3 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = (_WorldSpaceLightPos0.xyz - (_Object2World * _glesVertex).xyz);
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
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
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in mediump vec3 xlv_TEXCOORD5;
in highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lightDir_1;
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
  mediump vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD5);
  lightDir_1 = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (xlv_TEXCOORD6, xlv_TEXCOORD6);
  lowp vec4 c_24;
  c_24.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * (texture (_LightTextureB0, vec2(tmpvar_23)).w * texture (_LightTexture0, xlv_TEXCOORD6).w)) * 2.0));
  c_24.w = tmpvar_2;
  lowp vec4 tmpvar_25;
  lowp vec4 res_26;
  highp vec2 pblend_27;
  lowp float tmpvar_28;
  tmpvar_28 = c_24.w;
  pblend_27.x = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = textureProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_27.y = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_30.w = max (pblend_27.x, pblend_27.y);
  res_26 = tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = max (((pblend_27 - res_26.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_32;
  tmpvar_32 = (tmpvar_31 / (tmpvar_31.x + tmpvar_31.y));
  pblend_27 = tmpvar_32;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 0.0;
  tmpvar_33.xyz = (c_24.xyz * tmpvar_32.x);
  tmpvar_25 = tmpvar_33;
  _glesFragData[0] = tmpvar_25;
}



#endif"
}
SubProgram "opengl " {
// Stats: 28 math
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
PARAM c[20] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
DP4 R2.xy, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MOV R1.w, R2.y;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[6].y, R0, c[10];
DP4 result.texcoord[6].x, R0, c[9];
MOV R0.y, R1;
MOV R0.x, R1;
MOV result.position, R1;
ADD R1.xy, R0, R2.x;
MUL R0.xyz, vertex.normal, c[14].w;
MUL result.texcoord[3].xy, R1, c[0].x;
DP3 result.texcoord[4].z, R0, c[7];
DP3 result.texcoord[4].y, R0, c[6];
DP3 result.texcoord[4].x, R0, c[5];
MOV result.texcoord[5].xyz, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MOV result.texcoord[3].w, R2.x;
MOV result.texcoord[3].z, R1;
END
# 28 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 29 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_ScreenParams]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
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
dcl_texcoord6 o7
def c20, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r2.zw, v0, c3
dp4 r2.xy, v0, c1
dp4 r1.z, v0, c2
dp4 r1.x, v0, c0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 o7.y, r0, c9
dp4 o7.x, r0, c8
mov r0.x, r1
mov r1.y, r2
mov r1.w, r2
mov r0.y, -r2.x
mov o0, r1
mad r1.xy, r2.z, c12.zwzw, r0
mul r0.xyz, v1, c14.w
mul o4.xy, r1, c20.x
dp3 o5.z, r0, c6
dp3 o5.y, r0, c5
dp3 o5.x, r0, c4
mov o6.xyz, c13
mad o1.zw, v2.xyxy, c16.xyxy, c16
mad o1.xy, v2, c15, c15.zwzw
mad o2.zw, v2.xyxy, c18.xyxy, c18
mad o2.xy, v2, c17, c17.zwzw
mad o3.xy, v2, c19, c19.zwzw
mov o4.w, r2.z
mov o4.z, r1
"
}
SubProgram "d3d11 " {
// Stats: 23 math
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
eefiecedjomonafnolakgojfhlkokggdojbmkhpeabaaaaaahmagaaaaadaaaaaa
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
adamaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
jiaeaaaaeaaaabaacgabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaadmccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaa
agaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaa
aiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
ajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaal
mccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaa
aaaaaaaaalaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaaidcaabaaaacaaaaaafgafbaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaa
dcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaabaaaaaa
egaabaaaacaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaafaaaaaa
kgakbaaaabaaaaaaegaabaaaabaaaaaadcaaaaakmccabaaaadaaaaaaagiecaaa
aaaaaaaaagaaaaaapgapbaaaabaaaaaaagaebaaaabaaaaaadcaaaaaldccabaaa
adaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaa
amaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaialpaaaaaaaaaaaaaaaapgapbaaaaaaaaaaadgaaaaafmccabaaaaeaaaaaa
kgaobaaaaaaaaaaadiaaaaakdccabaaaaeaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaa
afaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dgaaaaaghccabaaaagaaaaaaegiccaaaabaaaaaaaaaaaaaadoaaaaab"
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = _WorldSpaceLightPos0.xyz;
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
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
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lightDir_1;
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
  lightDir_1 = xlv_TEXCOORD5;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * texture2D (_LightTexture0, xlv_TEXCOORD6).w) * 2.0));
  c_22.w = tmpvar_2;
  lowp vec4 tmpvar_23;
  lowp vec4 res_24;
  highp vec2 pblend_25;
  lowp float tmpvar_26;
  tmpvar_26 = c_22.w;
  pblend_25.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_25.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_25.x, pblend_25.y);
  res_24 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_25 - res_24.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_25 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 0.0;
  tmpvar_31.xyz = (c_22.xyz * tmpvar_30.x);
  tmpvar_23 = tmpvar_31;
  gl_FragData[0] = tmpvar_23;
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
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = _WorldSpaceLightPos0.xyz;
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
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
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lightDir_1;
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
  lightDir_1 = xlv_TEXCOORD5;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * texture2D (_LightTexture0, xlv_TEXCOORD6).w) * 2.0));
  c_22.w = tmpvar_2;
  lowp vec4 tmpvar_23;
  lowp vec4 res_24;
  highp vec2 pblend_25;
  lowp float tmpvar_26;
  tmpvar_26 = c_22.w;
  pblend_25.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = texture2DProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_25.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_25.x, pblend_25.y);
  res_24 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_25 - res_24.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_25 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 0.0;
  tmpvar_31.xyz = (c_22.xyz * tmpvar_30.x);
  tmpvar_23 = tmpvar_31;
  gl_FragData[0] = tmpvar_23;
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
out highp vec4 xlv_TEXCOORD3;
out lowp vec3 xlv_TEXCOORD4;
out mediump vec3 xlv_TEXCOORD5;
out highp vec2 xlv_TEXCOORD6;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  lowp vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec4 pos_5;
  pos_5 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = ((pos_5.xy + pos_5.w) * 0.5);
  tmpvar_6.zw = pos_5.zw;
  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = _WorldSpaceLightPos0.xyz;
  tmpvar_4 = tmpvar_9;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat3_ST.xy) + _Splat3_ST.zw);
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_3;
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
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
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
in lowp vec3 xlv_TEXCOORD4;
in mediump vec3 xlv_TEXCOORD5;
in highp vec2 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 lightDir_1;
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
  lightDir_1 = xlv_TEXCOORD5;
  lowp vec4 c_22;
  c_22.xyz = ((col_3 * _LightColor0.xyz) * ((max (0.0, dot (xlv_TEXCOORD4, lightDir_1)) * texture (_LightTexture0, xlv_TEXCOORD6).w) * 2.0));
  c_22.w = tmpvar_2;
  lowp vec4 tmpvar_23;
  lowp vec4 res_24;
  highp vec2 pblend_25;
  lowp float tmpvar_26;
  tmpvar_26 = c_22.w;
  pblend_25.x = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = textureProj (_GrabTexture, xlv_TEXCOORD3).w;
  pblend_25.y = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_28.w = max (pblend_25.x, pblend_25.y);
  res_24 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29 = max (((pblend_25 - res_24.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_30;
  tmpvar_30 = (tmpvar_29 / (tmpvar_29.x + tmpvar_29.y));
  pblend_25 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 0.0;
  tmpvar_31.xyz = (c_22.xyz * tmpvar_30.x);
  tmpvar_23 = tmpvar_31;
  _glesFragData[0] = tmpvar_23;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 53 math, 7 textures
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightTexture0] 2D 5
SetTexture 6 [_GrabTexture] 2D 6
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2, 0.5 } };
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
ADD R4, R4, c[1].x;
MAX R4, R4, c[2].x;
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
MUL R1.x, R0.w, c[2].z;
TXP R0.w, fragment.texcoord[3], texture[6], 2D;
MAX R1.z, R0.w, R1.x;
MOV R1.y, R0.w;
ADD R1.xy, R1, -R1.z;
MOV R0.w, c[2].z;
MAD R1.xy, R0.w, c[1].x, R1;
MAX R1.xy, R1, c[2].x;
ADD R1.y, R1.x, R1;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, fragment.texcoord[5];
RCP R1.z, R1.y;
DP3 R0.w, fragment.texcoord[6], fragment.texcoord[6];
DP3 R1.y, fragment.texcoord[4], R2;
MUL R0.xyz, R0, c[0];
TEX R0.w, R0.w, texture[5], 2D;
MAX R1.y, R1, c[2].x;
MUL R0.w, R1.y, R0;
MUL R0.xyz, R0.w, R0;
MUL R0.w, R1.x, R1.z;
MUL R0.xyz, R0, c[2].y;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].x;
END
# 53 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 46 math, 7 textures
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightTexture0] 2D 5
SetTexture 6 [_GrabTexture] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c2, 0.00000000, 2.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
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
add r4, r4, c1.x
max r4, r4, c2.x
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
mul r1.x, r0.w, c2.z
texldp r0.w, v3, s6
max r1.z, r0.w, r1.x
mov r1.y, r0.w
add r1.xy, r1, -r1.z
mov r0.w, c1.x
mad r2.xy, c2.z, r0.w, r1
mul_pp r1.xyz, r0, c0
max r0.zw, r2.xyxy, c2.x
add r0.y, r0.z, r0.w
rcp r0.w, r0.y
dp3_pp r0.x, v5, v5
rsq_pp r0.x, r0.x
mul_pp r2.xyz, r0.x, v5
dp3 r0.x, v6, v6
dp3_pp r0.y, v4, r2
max_pp r0.y, r0, c2.x
texld r0.x, r0.x, s5
mul_pp r0.x, r0.y, r0
mul r0.w, r0.z, r0
mul_pp r1.xyz, r0.x, r1
mul_pp r0.xyz, r1, c2.y
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c2.x
"
}
SubProgram "d3d11 " {
// Stats: 36 math, 7 textures
Keywords { "POINT" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Splat0] 2D 3
SetTexture 2 [_Splat1] 2D 4
SetTexture 3 [_Splat2] 2D 5
SetTexture 4 [_Splat3] 2D 6
SetTexture 5 [_LightTexture0] 2D 0
SetTexture 6 [_GrabTexture] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecednckmmlemhimkjmiocfdocijklpbjmnejabaaaaaapmahaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefckmagaaaaeaaaaaaaklabaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaae
aahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaae
aahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaa
acaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagcbaaaadhcbabaaaahaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaa
ogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaah
ecaabaaaacaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaa
adaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaah
icaabaaaacaaaaaadkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaacaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaahccaabaaa
acaaaaaabkaabaaaabaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaabkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaaaaaaaaahbcaabaaaacaaaaaa
akaabaaaabaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaakaabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegaobaaaacaaaaaadiaaaaahbcaabaaaacaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaadpaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaa
aaaaaaaaahaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaa
dkaabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaa
aaaaaaaaaoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaa
diaaaaahhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaaj
hcaabaaaaeaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaaeaaaaaa
dcaaaaajhcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaa
aeaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaa
agaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegbcbaaaagaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaafaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaahaaaaaa
egbcbaaaahaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaa
afaaaaaaaagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaa
agaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaagaaaaaaaagabaaa
abaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaa
dgaaaaafccaabaaaacaaaaaadkaabaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegaabaaaacaaaaaadcaaaaandcaabaaaabaaaaaa
agiacaaaaaaaaaaaahaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
egaabaaaabaaaaaadeaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaaaoaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaa
dkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 48 math, 6 textures
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_GrabTexture] 2D 5
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2, 0.5 } };
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
ADD R4, R4, c[1].x;
MAX R4, R4, c[2].x;
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
MUL R1.x, R0.w, c[2].z;
TXP R0.w, fragment.texcoord[3], texture[5], 2D;
MAX R1.z, R0.w, R1.x;
MOV R1.y, R0.w;
ADD R1.xy, R1, -R1.z;
MOV R0.w, c[2].z;
MAD R1.xy, R0.w, c[1].x, R1;
MAX R2.xy, R1, c[2].x;
MOV R1.xyz, fragment.texcoord[5];
DP3 R0.w, fragment.texcoord[4], R1;
ADD R1.w, R2.x, R2.y;
MAX R0.w, R0, c[2].x;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0.w, R0;
RCP R1.x, R1.w;
MUL R0.w, R2.x, R1.x;
MUL R0.xyz, R0, c[2].y;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].x;
END
# 48 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 42 math, 6 textures
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_GrabTexture] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c2, 0.00000000, 2.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
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
add r4, r4, c1.x
max r4, r4, c2.x
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
mul r1.x, r0.w, c2.z
texldp r0.w, v3, s5
max r1.z, r0.w, r1.x
mov r1.y, r0.w
add r1.xy, r1, -r1.z
mov r0.w, c1.x
mad r1.xy, c2.z, r0.w, r1
max r2.xy, r1, c2.x
mov_pp r1.xyz, v5
dp3_pp r0.w, v4, r1
add r1.w, r2.x, r2.y
max_pp r0.w, r0, c2.x
mul_pp r0.xyz, r0, c0
mul_pp r0.xyz, r0.w, r0
rcp r1.x, r1.w
mul r0.w, r2.x, r1.x
mul_pp r0.xyz, r0, c2.y
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c2.x
"
}
SubProgram "d3d11 " {
// Stats: 32 math, 6 textures
Keywords { "DIRECTIONAL" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedadlkkimeijgghfoopdoegegipbkdkbmkabaaaaaadaahaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpiafaaaaeaaaaaaahoabaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaad
lcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaa
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
aaaaaaaaegaobaaaacaaaaaadiaaaaahbcaabaaaacaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaadpaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaa
aaaaaaaaadaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaa
dkaabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaa
aaaaaaaaaoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaa
diaaaaahhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaaj
hcaabaaaaeaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaaeaaaaaa
dcaaaaajhcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaa
aeaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
agaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaoaaaaahdcaabaaa
abaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaaaaaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaadgaaaaafccaabaaaacaaaaaa
dkaabaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egaabaaaacaaaaaadcaaaaandcaabaaaabaaaaaaagiacaaaaaaaaaaaadaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaegaabaaaabaaaaaadeaaaaak
dcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaa
aoaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaaaaaaaaaadiaaaaah
hccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 59 math, 8 textures
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
SetTexture 7 [_GrabTexture] 2D 7
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 0.5, 2 } };
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
ADD R4, R4, c[1].x;
MAX R4, R4, c[2].x;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
DP3 R1.w, fragment.texcoord[6], fragment.texcoord[6];
MUL R2.xyz, R4.y, R2;
MUL R3.xyz, R4.x, R3;
ADD R2.xyz, R3, R2;
MUL R1.xyz, R4.z, R1;
ADD R1.xyz, R2, R1;
MUL R0.xyz, R4.w, R0;
ADD R0.xyz, R1, R0;
MUL R1.x, R0.w, c[2].y;
TXP R0.w, fragment.texcoord[3], texture[7], 2D;
MAX R1.z, R0.w, R1.x;
MOV R1.y, R0.w;
ADD R1.xy, R1, -R1.z;
MOV R0.w, c[2].y;
MAD R1.xy, R0.w, c[1].x, R1;
MAX R1.xy, R1, c[2].x;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, fragment.texcoord[5];
ADD R1.y, R1.x, R1;
RCP R0.w, fragment.texcoord[6].w;
DP3 R1.z, fragment.texcoord[4], R2;
MAD R2.xy, fragment.texcoord[6], R0.w, c[2].y;
TEX R0.w, R2, texture[5], 2D;
SLT R2.x, c[2], fragment.texcoord[6].z;
MUL R0.w, R2.x, R0;
TEX R1.w, R1.w, texture[6], 2D;
MUL R1.w, R0, R1;
MAX R0.w, R1.z, c[2].x;
MUL R0.w, R0, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0.w, R0;
RCP R1.y, R1.y;
MUL R0.w, R1.x, R1.y;
MUL R0.xyz, R0, c[2].z;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].x;
END
# 59 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 51 math, 8 textures
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
SetTexture 7 [_GrabTexture] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c2, 0.00000000, 1.00000000, 2.00000000, 0.50000000
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6
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
add r4, r4, c1.x
max r4, r4, c2.x
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
mul_pp r2.xyz, r0, c0
mul r1.x, r0.w, c2.w
texldp r0.w, v3, s7
dp3_pp r0.x, v5, v5
max r1.z, r0.w, r1.x
mov r1.y, r0.w
add r1.xy, r1, -r1.z
mov r0.w, c1.x
mad r1.xy, c2.w, r0.w, r1
max r0.zw, r1.xyxy, c2.x
add r0.y, r0.z, r0.w
rsq_pp r0.x, r0.x
mul_pp r1.xyz, r0.x, v5
dp3_pp r1.z, v4, r1
rcp r0.x, v6.w
mad r1.xy, v6, r0.x, c2.w
texld r0.w, r1, s5
cmp r1.x, -v6.z, c2, c2.y
dp3 r0.x, v6, v6
mul_pp r0.w, r1.x, r0
texld r0.x, r0.x, s6
mul_pp r0.x, r0.w, r0
max_pp r0.w, r1.z, c2.x
mul_pp r0.x, r0.w, r0
rcp r0.y, r0.y
mul r0.w, r0.z, r0.y
mul_pp r1.xyz, r0.x, r2
mul_pp r0.xyz, r1, c2.z
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c2.x
"
}
SubProgram "d3d11 " {
// Stats: 42 math, 8 textures
Keywords { "SPOT" }
SetTexture 0 [_Control] 2D 3
SetTexture 1 [_Splat0] 2D 4
SetTexture 2 [_Splat1] 2D 5
SetTexture 3 [_Splat2] 2D 6
SetTexture 4 [_Splat3] 2D 7
SetTexture 5 [_LightTexture0] 2D 0
SetTexture 6 [_LightTextureB0] 2D 1
SetTexture 7 [_GrabTexture] 2D 2
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhlgjlcbgdmoadoifcjcfbbdgihlbceejabaaaaaapaaiaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefckaahaaaaeaaaaaaaoiabaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafkaaaaad
aagabaaaahaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaa
ahaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadhcbabaaaagaaaaaagcbaaaadpcbabaaaahaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacahaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaa
ahaaaaaapgbpbaaaahaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaafaaaaaaaagabaaaaaaaaaaadbaaaaahbcaabaaa
aaaaaaaaabeaaaaaaaaaaaaackbabaaaahaaaaaaabaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaa
aaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaahaaaaaa
egbcbaaaahaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaa
agaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaa
agaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagbjbaaaagaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaafaaaaaajgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaa
agaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaa
adaaaaaaaagabaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaadaaaaaaaaaaaaahecaabaaaadaaaaaadkaabaaa
abaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaaadaaaaaa
eghobaaaaeaaaaaaaagabaaaahaaaaaaaaaaaaahicaabaaaadaaaaaadkaabaaa
acaaaaaadkaabaaaaeaaaaaadeaaaaahccaabaaaaaaaaaaadkaabaaaadaaaaaa
ckaabaaaadaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaafaaaaaaaaaaaaahccaabaaaadaaaaaabkaabaaaacaaaaaa
dkaabaaaafaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
adaaaaaaefaaaaajpcaabaaaagaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaaeaaaaaaaaaaaaahbcaabaaaadaaaaaaakaabaaaacaaaaaadkaabaaa
agaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaadaaaaaa
aaaaaaaipcaabaaaacaaaaaafgafbaiaebaaaaaaaaaaaaaaegaobaaaadaaaaaa
diaaaaahbcaabaaaadaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaadpaaaaaaai
pcaabaaaacaaaaaaegaobaaaacaaaaaaagiacaaaaaaaaaaaahaaaaaadeaaaaak
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaa
aaaaaaahccaabaaaaaaaaaaackaabaaaacaaaaaabkaabaaaaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaadkaabaaaacaaaaaabkaabaaaaaaaaaaaaoaaaaahpcaabaaa
acaaaaaaegaobaaaacaaaaaafgafbaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaa
agajbaaaafaaaaaafgafbaaaacaaaaaadcaaaaajocaabaaaaaaaaaaaagaabaaa
acaaaaaaagajbaaaagaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaa
kgakbaaaacaaaaaaagajbaaaabaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaa
aaaaaaaapgapbaaaacaaaaaaagajbaaaaeaaaaaafgaobaaaaaaaaaaadiaaaaai
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaah
hcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaa
abaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaahaaaaaaaagabaaaacaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaaakaabaaaadaaaaaadgaaaaafccaabaaaadaaaaaa
dkaabaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egaabaaaadaaaaaadcaaaaandcaabaaaabaaaaaaagiacaaaaaaaaaaaahaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaegaabaaaabaaaaaadeaaaaak
dcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaa
aoaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaaaaaaaaaadiaaaaah
hccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 55 math, 8 textures
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
SetTexture 7 [_GrabTexture] 2D 7
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2, 0.5 } };
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
MAX R0.w, R2, R0;
ADD R4.x, R4, R3.w;
MAX R0.w, R4.x, R0;
MOV R4.z, R1.w;
MOV R4.y, R2.w;
ADD R4, R4, -R0.w;
ADD R4, R4, c[1].x;
MAX R4, R4, c[2].x;
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
MUL R1.x, R0.w, c[2].z;
TXP R0.w, fragment.texcoord[3], texture[7], 2D;
MAX R1.z, R0.w, R1.x;
MOV R1.y, R0.w;
ADD R1.xy, R1, -R1.z;
MOV R0.w, c[2].z;
MAD R1.xy, R0.w, c[1].x, R1;
MAX R1.xy, R1, c[2].x;
ADD R1.y, R1.x, R1;
DP3 R1.z, fragment.texcoord[6], fragment.texcoord[6];
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, fragment.texcoord[5];
RCP R2.w, R1.y;
TEX R0.w, fragment.texcoord[6], texture[6], CUBE;
TEX R1.w, R1.z, texture[5], 2D;
MUL R1.z, R1.w, R0.w;
DP3 R1.y, fragment.texcoord[4], R2;
MAX R0.w, R1.y, c[2].x;
MUL R0.w, R0, R1.z;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0.w, R0;
MUL R0.w, R1.x, R2;
MUL R0.xyz, R0, c[2].y;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].x;
END
# 55 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 47 math, 8 textures
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
SetTexture 7 [_GrabTexture] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_cube s6
dcl_2d s7
def c2, 0.00000000, 2.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
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
add r4, r4, c1.x
max r4, r4, c2.x
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
mul_pp r1.xyz, r0, c0
mul r0.x, r0.w, c2.z
texldp r0.w, v3, s7
max r0.z, r0.w, r0.x
mov r0.y, r0.w
add r0.zw, r0.xyxy, -r0.z
mov r0.x, c1
mad r0.zw, c2.z, r0.x, r0
max r0.zw, r0, c2.x
add r0.y, r0.z, r0.w
dp3_pp r0.x, v5, v5
rsq_pp r0.x, r0.x
mul_pp r2.xyz, r0.x, v5
rcp r1.w, r0.y
dp3_pp r0.y, v4, r2
dp3 r0.x, v6, v6
texld r0.w, v6, s6
texld r0.x, r0.x, s5
mul r0.x, r0, r0.w
max_pp r0.y, r0, c2.x
mul_pp r0.x, r0.y, r0
mul r0.w, r0.z, r1
mul_pp r1.xyz, r0.x, r1
mul_pp r0.xyz, r1, c2.y
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c2.x
"
}
SubProgram "d3d11 " {
// Stats: 37 math, 8 textures
Keywords { "POINT_COOKIE" }
SetTexture 0 [_Control] 2D 3
SetTexture 1 [_Splat0] 2D 4
SetTexture 2 [_Splat1] 2D 5
SetTexture 3 [_Splat2] 2D 6
SetTexture 4 [_Splat3] 2D 7
SetTexture 5 [_LightTextureB0] 2D 1
SetTexture 6 [_LightTexture0] CUBE 0
SetTexture 7 [_GrabTexture] 2D 2
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedaimkbffplkejmabkikemoknlgonnigjaabaaaaaafiaiaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcaiahaaaaeaaaaaaamcabaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafkaaaaad
aagabaaaahaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaafidaaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaa
ahaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadhcbabaaaagaaaaaagcbaaaadhcbabaaaahaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaagaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaadaaaaaaaaaaaaahecaabaaa
acaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaa
egbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaahaaaaaaaaaaaaahicaabaaa
acaaaaaadkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaacaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaafaaaaaaaaaaaaahccaabaaaacaaaaaa
bkaabaaaabaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaabkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaeaaaaaaaaaaaaahbcaabaaaacaaaaaaakaabaaa
abaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egaobaaaacaaaaaadiaaaaahbcaabaaaacaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaadpaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaa
ahaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaa
akaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaa
aoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaadiaaaaah
hcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaajhcaabaaa
aeaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaaeaaaaaadcaaaaaj
hcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaaegacbaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegbcbaaaagaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
afaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaahaaaaaaegbcbaaa
ahaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaaafaaaaaa
aagabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbcbaaaahaaaaaaeghobaaa
agaaaaaaaagabaaaaaaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
dkaabaaaadaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaaagaabaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaahaaaaaaaagabaaaacaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaadgaaaaaf
ccaabaaaacaaaaaadkaabaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaapgapbaia
ebaaaaaaaaaaaaaaegaabaaaacaaaaaadcaaaaandcaabaaaabaaaaaaagiacaaa
aaaaaaaaahaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaegaabaaa
abaaaaaadeaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaa
akaabaaaabaaaaaaaoaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaa
aaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 50 math, 7 textures
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightTexture0] 2D 5
SetTexture 6 [_GrabTexture] 2D 6
"3.0-!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2, 0.5 } };
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
ADD R4, R4, c[1].x;
MAX R4, R4, c[2].x;
ADD R1.w, R4.x, R4.y;
ADD R1.w, R4.z, R1;
ADD R1.w, R4, R1;
RCP R1.w, R1.w;
MUL R4, R4, R1.w;
MUL R1.xyz, R4.z, R1;
MUL R2.xyz, R4.y, R2;
MUL R3.xyz, R4.x, R3;
ADD R2.xyz, R3, R2;
ADD R1.xyz, R2, R1;
MUL R2.x, R0.w, c[2].z;
TXP R0.w, fragment.texcoord[3], texture[6], 2D;
MUL R0.xyz, R4.w, R0;
ADD R0.xyz, R1, R0;
MAX R1.w, R0, R2.x;
MOV R2.y, R0.w;
MOV R0.w, c[2].z;
ADD R2.xy, R2, -R1.w;
MAD R2.xy, R0.w, c[1].x, R2;
MAX R1.xy, R2, c[2].x;
ADD R0.w, R1.x, R1.y;
RCP R1.z, R0.w;
MOV R2.xyz, fragment.texcoord[5];
DP3 R1.y, fragment.texcoord[4], R2;
MUL R0.xyz, R0, c[0];
TEX R0.w, fragment.texcoord[6], texture[5], 2D;
MAX R1.y, R1, c[2].x;
MUL R0.w, R1.y, R0;
MUL R0.xyz, R0.w, R0;
MUL R0.w, R1.x, R1.z;
MUL R0.xyz, R0, c[2].y;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].x;
END
# 50 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 43 math, 7 textures
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightTexture0] 2D 5
SetTexture 6 [_GrabTexture] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c2, 0.00000000, 2.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xy
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
add r4, r4, c1.x
max r4, r4, c2.x
add r1.w, r4.x, r4.y
add r1.w, r4.z, r1
add r1.w, r4, r1
rcp r1.w, r1.w
mul r4, r4, r1.w
mul r1.xyz, r4.w, r1
mul r0.xyz, r4.z, r0
mul r3.xyz, r4.y, r3
mul r2.xyz, r4.x, r2
add_pp r2.xyz, r2, r3
add_pp r0.xyz, r2, r0
add_pp r0.xyz, r0, r1
mul r2.x, r0.w, c2.z
texldp r0.w, v3, s6
max r1.w, r0, r2.x
mov r2.y, r0.w
mov r0.w, c1.x
add r2.xy, r2, -r1.w
mad r2.xy, c2.z, r0.w, r2
max r1.xy, r2, c2.x
add r0.w, r1.x, r1.y
rcp r1.z, r0.w
mov_pp r2.xyz, v5
dp3_pp r1.y, v4, r2
mul_pp r0.xyz, r0, c0
texld r0.w, v6, s5
max_pp r1.y, r1, c2.x
mul_pp r0.w, r1.y, r0
mul_pp r0.xyz, r0.w, r0
mul r0.w, r1.x, r1.z
mul_pp r0.xyz, r0, c2.y
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c2.x
"
}
SubProgram "d3d11 " {
// Stats: 32 math, 7 textures
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Splat0] 2D 3
SetTexture 2 [_Splat1] 2D 4
SetTexture 3 [_Splat2] 2D 5
SetTexture 4 [_Splat3] 2D 6
SetTexture 5 [_LightTexture0] 2D 0
SetTexture 6 [_GrabTexture] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Float 112 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedkmccabapnkplablaaccahkjohccacdefabaaaaaajeahaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaneaaaaaa
agaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaaneaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefceeagaaaaeaaaaaaajbabaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaae
aahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaae
aahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaa
acaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaad
lcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaaaaaaaaaa
ogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaah
ecaabaaaacaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaefaaaaajpcaabaaa
adaaaaaaegbabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaah
icaabaaaacaaaaaadkaabaaaabaaaaaadkaabaaaadaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaacaaaaaackaabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaahccaabaaa
acaaaaaabkaabaaaabaaaaaadkaabaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaabkaabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaaaaaaaaahbcaabaaaacaaaaaa
akaabaaaabaaaaaadkaabaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaakaabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegaobaaaacaaaaaadiaaaaahbcaabaaaacaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaadpaaaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaa
aaaaaaaaahaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaa
dkaabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaa
aaaaaaaaaoaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaapgapbaaaaaaaaaaa
diaaaaahhcaabaaaaeaaaaaaegacbaaaaeaaaaaafgafbaaaabaaaaaadcaaaaaj
hcaabaaaaeaaaaaaagaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaaeaaaaaa
dcaaaaajhcaabaaaaaaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaa
aeaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
agaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaaeghobaaaafaaaaaaaagabaaa
aaaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaapgapbaaaabaaaaaa
diaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaoaaaaah
dcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaagaaaaaaaagabaaaabaaaaaadeaaaaah
icaabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaadgaaaaafccaabaaa
acaaaaaadkaabaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegaabaaaacaaaaaadcaaaaandcaabaaaabaaaaaaagiacaaaaaaaaaaa
ahaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaegaabaaaabaaaaaa
deaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaaaoaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaaaaaaaaaa
diaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
 //       d3d11 : 10 math
 //        d3d9 : 16 math
 //      opengl : 14 math
 // Stats for Fragment shader:
 //       d3d11 : 1 math
 //        d3d9 : 2 math
 //      opengl : 2 math
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="Geometry-99" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" "SplatCount"="4" }
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 14 math
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Vector 9 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[10] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..9] };
TEMP R0;
TEMP R1;
DP4 R1.xw, vertex.position, c[4];
MOV R0.w, R1.x;
MUL R1.xyz, vertex.normal, c[9].w;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MOV result.position, R0;
ADD R0.xy, R0, R1.w;
MUL result.texcoord[0].xy, R0, c[0].x;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[0].w, R1;
MOV result.texcoord[0].z, R0;
END
# 14 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 16 math
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ScreenParams]
Vector 9 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
def c10, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dp4 r1.xw, v0, c3
dp4 r1.yz, v0, c1
dp4 r0.z, v0, c2
mov r0.y, r1.z
mov r0.w, r1.x
dp4 r0.x, v0, c0
mov o0, r0
mov r0.y, -r1
mul r1.xyz, v1, c9.w
mad r0.xy, r1.w, c8.zwzw, r0
mul o1.xy, r0, c10.x
dp3 o2.z, r1, c6
dp3 o2.y, r1, c5
dp3 o2.x, r1, c4
mov o1.w, r1
mov o1.z, r0
"
}
SubProgram "d3d11 " {
// Stats: 10 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedfpllgjkpneheghcfckjhkbpgefjhhefiabaaaaaahiadaaaaadaaaaaa
cmaaaaaapeaaaaaageabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogiaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcamacaaaaeaaaabaaidaaaaaafjaaaaaeegiocaaaaaaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaamdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaa
pgapbaaaaaaaaaaadgaaaaafmccabaaaabaaaaaakgaobaaaaaaaaaaadiaaaaak
dccabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaaaaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaaaaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaaaaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 pos_2;
  pos_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((pos_2.xy + pos_2.w) * 0.5);
  tmpvar_3.zw = pos_2.zw;
  mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_1;
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
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 res_1;
  highp vec2 tmpvar_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec2 tmpvar_6;
  lowp float tmpvar_7;
  lowp vec3 col_8;
  highp vec2 pblend_9;
  mediump vec4 blend_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Control, tmpvar_2);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat0, tmpvar_3);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat1, tmpvar_4);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_Splat2, tmpvar_5);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_Splat3, tmpvar_6);
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
  highp vec4 val_20;
  val_20 = blend_10;
  highp float tmpvar_21;
  tmpvar_21 = max (val_20.x, max (val_20.y, max (val_20.z, val_20.w)));
  pblend_9.x = (tmpvar_21 * 0.5);
  lowp float tmpvar_22;
  tmpvar_22 = texture2DProj (_GrabTexture, xlv_TEXCOORD0).w;
  pblend_9.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (pblend_9.x, pblend_9.y);
  tmpvar_7 = tmpvar_23;
  highp vec2 tmpvar_24;
  tmpvar_24 = max (((pblend_9 - tmpvar_7) + (_Depth * 0.5)), vec2(0.0, 0.0));
  pblend_9 = (tmpvar_24 / (tmpvar_24.x + tmpvar_24.y));
  highp vec4 tmpvar_25;
  tmpvar_25 = max (((blend_10 - tmpvar_21) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_26;
  tmpvar_26 = (tmpvar_25 / (((tmpvar_25.x + tmpvar_25.y) + tmpvar_25.z) + tmpvar_25.w));
  blend_10 = tmpvar_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (blend_10.x * tmpvar_12).xyz;
  col_8 = tmpvar_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_8 + (blend_10.y * tmpvar_13).xyz);
  col_8 = tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = (col_8 + (blend_10.z * tmpvar_14).xyz);
  col_8 = tmpvar_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = (col_8 + (blend_10.w * tmpvar_15).xyz);
  col_8 = tmpvar_30;
  res_1.xyz = ((xlv_TEXCOORD1 * 0.5) + 0.5);
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
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 pos_2;
  pos_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((pos_2.xy + pos_2.w) * 0.5);
  tmpvar_3.zw = pos_2.zw;
  mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_1;
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
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 res_1;
  highp vec2 tmpvar_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec2 tmpvar_6;
  lowp float tmpvar_7;
  lowp vec3 col_8;
  highp vec2 pblend_9;
  mediump vec4 blend_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Control, tmpvar_2);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat0, tmpvar_3);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat1, tmpvar_4);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_Splat2, tmpvar_5);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_Splat3, tmpvar_6);
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
  highp vec4 val_20;
  val_20 = blend_10;
  highp float tmpvar_21;
  tmpvar_21 = max (val_20.x, max (val_20.y, max (val_20.z, val_20.w)));
  pblend_9.x = (tmpvar_21 * 0.5);
  lowp float tmpvar_22;
  tmpvar_22 = texture2DProj (_GrabTexture, xlv_TEXCOORD0).w;
  pblend_9.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (pblend_9.x, pblend_9.y);
  tmpvar_7 = tmpvar_23;
  highp vec2 tmpvar_24;
  tmpvar_24 = max (((pblend_9 - tmpvar_7) + (_Depth * 0.5)), vec2(0.0, 0.0));
  pblend_9 = (tmpvar_24 / (tmpvar_24.x + tmpvar_24.y));
  highp vec4 tmpvar_25;
  tmpvar_25 = max (((blend_10 - tmpvar_21) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_26;
  tmpvar_26 = (tmpvar_25 / (((tmpvar_25.x + tmpvar_25.y) + tmpvar_25.z) + tmpvar_25.w));
  blend_10 = tmpvar_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (blend_10.x * tmpvar_12).xyz;
  col_8 = tmpvar_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_8 + (blend_10.y * tmpvar_13).xyz);
  col_8 = tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = (col_8 + (blend_10.z * tmpvar_14).xyz);
  col_8 = tmpvar_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = (col_8 + (blend_10.w * tmpvar_15).xyz);
  col_8 = tmpvar_30;
  res_1.xyz = ((xlv_TEXCOORD1 * 0.5) + 0.5);
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
out highp vec4 xlv_TEXCOORD0;
out lowp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec3 tmpvar_1;
  highp vec4 pos_2;
  pos_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((pos_2.xy + pos_2.w) * 0.5);
  tmpvar_3.zw = pos_2.zw;
  mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_1;
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
in highp vec4 xlv_TEXCOORD0;
in lowp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 res_1;
  highp vec2 tmpvar_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec2 tmpvar_6;
  lowp float tmpvar_7;
  lowp vec3 col_8;
  highp vec2 pblend_9;
  mediump vec4 blend_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Control, tmpvar_2);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_Splat0, tmpvar_3);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Splat1, tmpvar_4);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (_Splat2, tmpvar_5);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture (_Splat3, tmpvar_6);
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
  highp vec4 val_20;
  val_20 = blend_10;
  highp float tmpvar_21;
  tmpvar_21 = max (val_20.x, max (val_20.y, max (val_20.z, val_20.w)));
  pblend_9.x = (tmpvar_21 * 0.5);
  lowp float tmpvar_22;
  tmpvar_22 = textureProj (_GrabTexture, xlv_TEXCOORD0).w;
  pblend_9.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = max (pblend_9.x, pblend_9.y);
  tmpvar_7 = tmpvar_23;
  highp vec2 tmpvar_24;
  tmpvar_24 = max (((pblend_9 - tmpvar_7) + (_Depth * 0.5)), vec2(0.0, 0.0));
  pblend_9 = (tmpvar_24 / (tmpvar_24.x + tmpvar_24.y));
  highp vec4 tmpvar_25;
  tmpvar_25 = max (((blend_10 - tmpvar_21) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_26;
  tmpvar_26 = (tmpvar_25 / (((tmpvar_25.x + tmpvar_25.y) + tmpvar_25.z) + tmpvar_25.w));
  blend_10 = tmpvar_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (blend_10.x * tmpvar_12).xyz;
  col_8 = tmpvar_27;
  mediump vec3 tmpvar_28;
  tmpvar_28 = (col_8 + (blend_10.y * tmpvar_13).xyz);
  col_8 = tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = (col_8 + (blend_10.z * tmpvar_14).xyz);
  col_8 = tmpvar_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = (col_8 + (blend_10.w * tmpvar_15).xyz);
  col_8 = tmpvar_30;
  res_1.xyz = ((xlv_TEXCOORD1 * 0.5) + 0.5);
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
MAD result.color.xyz, fragment.texcoord[1], c[0].y, c[0].y;
MOV result.color.w, c[0].x;
END
# 2 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 2 math
"ps_3_0
def c0, 0.50000000, 0.00000000, 0, 0
dcl_texcoord1 v1.xyz
mad_pp oC0.xyz, v1, c0.x, c0.x
mov_pp oC0.w, c0.y
"
}
SubProgram "d3d11 " {
// Stats: 1 math
"ps_4_0
eefiecedoljamidflfebnaocmppnciccehnmbifiabaaaaaaemabaaaaadaaaaaa
cmaaaaaajmaaaaaanaaaaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcheaaaaaaeaaaaaaabnaaaaaa
gcbaaaadhcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaadcaaaaaphccabaaa
aaaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
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
 //       d3d11 : 34 avg math (31..40), 8 avg texture (7..9)
 //        d3d9 : 43 avg math (39..51), 8 avg texture (7..9)
 //      opengl : 51 avg math (46..60), 8 avg texture (7..9)
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
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c17.w
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
mad o1.zw, v2.xyxy, c19.xyxy, c19
mad o1.xy, v2, c18, c18.zwzw
mad o2.zw, v2.xyxy, c21.xyxy, c21
mad o2.xy, v2, c20, c20.zwzw
mad o3.xy, v2, c22, c22.zwzw
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = -(log2(max (light_2, vec4(0.001, 0.001, 0.001, 0.001))));
  light_2.w = tmpvar_24.w;
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz + xlv_TEXCOORD5);
  light_2.xyz = tmpvar_25;
  lowp vec4 c_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (col_4 * light_2.xyz);
  c_26.xyz = tmpvar_27;
  c_26.w = tmpvar_3;
  c_1 = c_26;
  lowp vec4 col_28;
  col_28 = c_1;
  lowp vec4 res_29;
  highp vec2 pblend_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_32;
  tmpvar_32 = col_28.w;
  pblend_30.x = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = tmpvar_31.w;
  pblend_30.y = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_34.w = max (pblend_30.x, pblend_30.y);
  res_29 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35 = max (((pblend_30 - res_29.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_36;
  tmpvar_36 = (tmpvar_35 / (tmpvar_35.x + tmpvar_35.y));
  pblend_30 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((col_28.xyz * tmpvar_36.x) + (tmpvar_31.xyz * tmpvar_36.y));
  res_29.xyz = tmpvar_37;
  gl_FragData[0] = res_29;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = -(log2(max (light_2, vec4(0.001, 0.001, 0.001, 0.001))));
  light_2.w = tmpvar_24.w;
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz + xlv_TEXCOORD5);
  light_2.xyz = tmpvar_25;
  lowp vec4 c_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (col_4 * light_2.xyz);
  c_26.xyz = tmpvar_27;
  c_26.w = tmpvar_3;
  c_1 = c_26;
  lowp vec4 col_28;
  col_28 = c_1;
  lowp vec4 res_29;
  highp vec2 pblend_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_32;
  tmpvar_32 = col_28.w;
  pblend_30.x = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = tmpvar_31.w;
  pblend_30.y = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_34.w = max (pblend_30.x, pblend_30.y);
  res_29 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35 = max (((pblend_30 - res_29.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_36;
  tmpvar_36 = (tmpvar_35 / (tmpvar_35.x + tmpvar_35.y));
  pblend_30 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((col_28.xyz * tmpvar_36.x) + (tmpvar_31.xyz * tmpvar_36.y));
  res_29.xyz = tmpvar_37;
  gl_FragData[0] = res_29;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = textureProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = -(log2(max (light_2, vec4(0.001, 0.001, 0.001, 0.001))));
  light_2.w = tmpvar_24.w;
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz + xlv_TEXCOORD5);
  light_2.xyz = tmpvar_25;
  lowp vec4 c_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (col_4 * light_2.xyz);
  c_26.xyz = tmpvar_27;
  c_26.w = tmpvar_3;
  c_1 = c_26;
  lowp vec4 col_28;
  col_28 = c_1;
  lowp vec4 res_29;
  highp vec2 pblend_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_32;
  tmpvar_32 = col_28.w;
  pblend_30.x = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = tmpvar_31.w;
  pblend_30.y = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_34.w = max (pblend_30.x, pblend_30.y);
  res_29 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35 = max (((pblend_30 - res_29.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_36;
  tmpvar_36 = (tmpvar_35 / (tmpvar_35.x + tmpvar_35.y));
  pblend_30 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((col_28.xyz * tmpvar_36.x) + (tmpvar_31.xyz * tmpvar_36.y));
  res_29.xyz = tmpvar_37;
  _glesFragData[0] = res_29;
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
dcl_texcoord0 v1
dcl_texcoord1 v2
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
mad o1.zw, v1.xyxy, c17.xyxy, c17
mad o1.xy, v1, c16, c16.zwzw
mad o2.zw, v1.xyxy, c19.xyxy, c19
mad o2.xy, v1, c18, c18.zwzw
mad o3.xy, v1, c20, c20.zwzw
mov o4.w, r2.z
mad o6.xy, v2, c15, c15.zwzw
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
  lowp vec3 col_7;
  highp vec4 blend_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat3, xlv_TEXCOORD2);
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
  highp float tmpvar_18;
  tmpvar_18 = max (blend_8.x, max (blend_8.y, max (blend_8.z, blend_8.w)));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (((blend_8 - tmpvar_18) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 / (((tmpvar_19.x + tmpvar_19.y) + tmpvar_19.z) + tmpvar_19.w));
  blend_8 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20.x * tmpvar_10).xyz;
  col_7 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_7 + (tmpvar_20.y * tmpvar_11).xyz);
  col_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_7 + (tmpvar_20.z * tmpvar_12).xyz);
  col_7 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_7 + (tmpvar_20.w * tmpvar_13).xyz);
  col_7 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (tmpvar_18 * 0.5);
  tmpvar_6 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_5 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  light_5.w = tmpvar_27.w;
  highp float tmpvar_28;
  tmpvar_28 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_4 = tmpvar_28;
  lowp vec3 tmpvar_29;
  tmpvar_29 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lmFull_3 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  lmIndirect_2 = tmpvar_30;
  light_5.xyz = (tmpvar_27.xyz + mix (lmIndirect_2, lmFull_3, vec3(clamp (lmFade_4, 0.0, 1.0))));
  lowp vec4 c_31;
  mediump vec3 tmpvar_32;
  tmpvar_32 = (col_7 * light_5.xyz);
  c_31.xyz = tmpvar_32;
  c_31.w = tmpvar_6;
  c_1 = c_31;
  lowp vec4 col_33;
  col_33 = c_1;
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_37;
  tmpvar_37 = col_33.w;
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
  tmpvar_42 = ((col_33.xyz * tmpvar_41.x) + (tmpvar_36.xyz * tmpvar_41.y));
  res_34.xyz = tmpvar_42;
  gl_FragData[0] = res_34;
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
  lowp vec3 col_7;
  highp vec4 blend_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat3, xlv_TEXCOORD2);
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
  highp float tmpvar_18;
  tmpvar_18 = max (blend_8.x, max (blend_8.y, max (blend_8.z, blend_8.w)));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (((blend_8 - tmpvar_18) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 / (((tmpvar_19.x + tmpvar_19.y) + tmpvar_19.z) + tmpvar_19.w));
  blend_8 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20.x * tmpvar_10).xyz;
  col_7 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_7 + (tmpvar_20.y * tmpvar_11).xyz);
  col_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_7 + (tmpvar_20.z * tmpvar_12).xyz);
  col_7 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_7 + (tmpvar_20.w * tmpvar_13).xyz);
  col_7 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (tmpvar_18 * 0.5);
  tmpvar_6 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_5 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  light_5.w = tmpvar_27.w;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (unity_Lightmap, xlv_TEXCOORD5);
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (unity_LightmapInd, xlv_TEXCOORD5);
  highp float tmpvar_30;
  tmpvar_30 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_4 = tmpvar_30;
  lowp vec3 tmpvar_31;
  tmpvar_31 = ((8.0 * tmpvar_28.w) * tmpvar_28.xyz);
  lmFull_3 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((8.0 * tmpvar_29.w) * tmpvar_29.xyz);
  lmIndirect_2 = tmpvar_32;
  light_5.xyz = (tmpvar_27.xyz + mix (lmIndirect_2, lmFull_3, vec3(clamp (lmFade_4, 0.0, 1.0))));
  lowp vec4 c_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (col_7 * light_5.xyz);
  c_33.xyz = tmpvar_34;
  c_33.w = tmpvar_6;
  c_1 = c_33;
  lowp vec4 col_35;
  col_35 = c_1;
  lowp vec4 res_36;
  highp vec2 pblend_37;
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_39;
  tmpvar_39 = col_35.w;
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
  tmpvar_44 = ((col_35.xyz * tmpvar_43.x) + (tmpvar_38.xyz * tmpvar_43.y));
  res_36.xyz = tmpvar_44;
  gl_FragData[0] = res_36;
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
  lowp vec3 col_7;
  highp vec4 blend_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Splat3, xlv_TEXCOORD2);
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
  highp float tmpvar_18;
  tmpvar_18 = max (blend_8.x, max (blend_8.y, max (blend_8.z, blend_8.w)));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (((blend_8 - tmpvar_18) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 / (((tmpvar_19.x + tmpvar_19.y) + tmpvar_19.z) + tmpvar_19.w));
  blend_8 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20.x * tmpvar_10).xyz;
  col_7 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_7 + (tmpvar_20.y * tmpvar_11).xyz);
  col_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_7 + (tmpvar_20.z * tmpvar_12).xyz);
  col_7 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_7 + (tmpvar_20.w * tmpvar_13).xyz);
  col_7 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (tmpvar_18 * 0.5);
  tmpvar_6 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = textureProj (_LightBuffer, xlv_TEXCOORD4);
  light_5 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = -(log2(max (light_5, vec4(0.001, 0.001, 0.001, 0.001))));
  light_5.w = tmpvar_27.w;
  highp float tmpvar_28;
  tmpvar_28 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_4 = tmpvar_28;
  lowp vec3 tmpvar_29;
  tmpvar_29 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lmFull_3 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  lmIndirect_2 = tmpvar_30;
  light_5.xyz = (tmpvar_27.xyz + mix (lmIndirect_2, lmFull_3, vec3(clamp (lmFade_4, 0.0, 1.0))));
  lowp vec4 c_31;
  mediump vec3 tmpvar_32;
  tmpvar_32 = (col_7 * light_5.xyz);
  c_31.xyz = tmpvar_32;
  c_31.w = tmpvar_6;
  c_1 = c_31;
  lowp vec4 col_33;
  col_33 = c_1;
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_37;
  tmpvar_37 = col_33.w;
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
  tmpvar_42 = ((col_33.xyz * tmpvar_41.x) + (tmpvar_36.xyz * tmpvar_41.y));
  res_34.xyz = tmpvar_42;
  _glesFragData[0] = res_34;
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
dcl_texcoord0 v1
dcl_texcoord1 v2
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
mad o1.zw, v1.xyxy, c8.xyxy, c8
mad o1.xy, v1, c7, c7.zwzw
mad o2.zw, v1.xyxy, c10.xyxy, c10
mad o2.xy, v1, c9, c9.zwzw
mad o3.xy, v1, c11, c11.zwzw
mov o4.w, r2.z
mad o6.xy, v2, c6, c6.zwzw
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
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_23;
  mediump vec3 lm_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lm_24 = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26.w = 0.0;
  tmpvar_26.xyz = lm_24;
  mediump vec4 tmpvar_27;
  tmpvar_27 = (-(log2(max (light_2, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_26);
  light_2 = tmpvar_27;
  lowp vec4 c_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = (col_4 * tmpvar_27.xyz);
  c_28.xyz = tmpvar_29;
  c_28.w = tmpvar_3;
  c_1 = c_28;
  lowp vec4 col_30;
  col_30 = c_1;
  lowp vec4 res_31;
  highp vec2 pblend_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_34;
  tmpvar_34 = col_30.w;
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
  tmpvar_39 = ((col_30.xyz * tmpvar_38.x) + (tmpvar_33.xyz * tmpvar_38.y));
  res_31.xyz = tmpvar_39;
  gl_FragData[0] = res_31;
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
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (unity_Lightmap, xlv_TEXCOORD5);
  mediump vec3 lm_25;
  lowp vec3 tmpvar_26;
  tmpvar_26 = ((8.0 * tmpvar_24.w) * tmpvar_24.xyz);
  lm_25 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27.w = 0.0;
  tmpvar_27.xyz = lm_25;
  mediump vec4 tmpvar_28;
  tmpvar_28 = (-(log2(max (light_2, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_27);
  light_2 = tmpvar_28;
  lowp vec4 c_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = (col_4 * tmpvar_28.xyz);
  c_29.xyz = tmpvar_30;
  c_29.w = tmpvar_3;
  c_1 = c_29;
  lowp vec4 col_31;
  col_31 = c_1;
  lowp vec4 res_32;
  highp vec2 pblend_33;
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_35;
  tmpvar_35 = col_31.w;
  pblend_33.x = tmpvar_35;
  lowp float tmpvar_36;
  tmpvar_36 = tmpvar_34.w;
  pblend_33.y = tmpvar_36;
  highp vec4 tmpvar_37;
  tmpvar_37.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_37.w = max (pblend_33.x, pblend_33.y);
  res_32 = tmpvar_37;
  highp vec2 tmpvar_38;
  tmpvar_38 = max (((pblend_33 - res_32.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_39;
  tmpvar_39 = (tmpvar_38 / (tmpvar_38.x + tmpvar_38.y));
  pblend_33 = tmpvar_39;
  highp vec3 tmpvar_40;
  tmpvar_40 = ((col_31.xyz * tmpvar_39.x) + (tmpvar_34.xyz * tmpvar_39.y));
  res_32.xyz = tmpvar_40;
  gl_FragData[0] = res_32;
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
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = textureProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_23;
  mediump vec3 lm_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lm_24 = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26.w = 0.0;
  tmpvar_26.xyz = lm_24;
  mediump vec4 tmpvar_27;
  tmpvar_27 = (-(log2(max (light_2, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_26);
  light_2 = tmpvar_27;
  lowp vec4 c_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = (col_4 * tmpvar_27.xyz);
  c_28.xyz = tmpvar_29;
  c_28.w = tmpvar_3;
  c_1 = c_28;
  lowp vec4 col_30;
  col_30 = c_1;
  lowp vec4 res_31;
  highp vec2 pblend_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_34;
  tmpvar_34 = col_30.w;
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
  tmpvar_39 = ((col_30.xyz * tmpvar_38.x) + (tmpvar_33.xyz * tmpvar_38.y));
  res_31.xyz = tmpvar_39;
  _glesFragData[0] = res_31;
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
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c17.w
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
mad o1.zw, v2.xyxy, c19.xyxy, c19
mad o1.xy, v2, c18, c18.zwzw
mad o2.zw, v2.xyxy, c21.xyxy, c21
mad o2.xy, v2, c20, c20.zwzw
mad o3.xy, v2, c22, c22.zwzw
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = max (light_2, vec4(0.001, 0.001, 0.001, 0.001));
  light_2.w = tmpvar_24.w;
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz + xlv_TEXCOORD5);
  light_2.xyz = tmpvar_25;
  lowp vec4 c_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (col_4 * light_2.xyz);
  c_26.xyz = tmpvar_27;
  c_26.w = tmpvar_3;
  c_1 = c_26;
  lowp vec4 col_28;
  col_28 = c_1;
  lowp vec4 res_29;
  highp vec2 pblend_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_32;
  tmpvar_32 = col_28.w;
  pblend_30.x = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = tmpvar_31.w;
  pblend_30.y = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_34.w = max (pblend_30.x, pblend_30.y);
  res_29 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35 = max (((pblend_30 - res_29.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_36;
  tmpvar_36 = (tmpvar_35 / (tmpvar_35.x + tmpvar_35.y));
  pblend_30 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((col_28.xyz * tmpvar_36.x) + (tmpvar_31.xyz * tmpvar_36.y));
  res_29.xyz = tmpvar_37;
  gl_FragData[0] = res_29;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = max (light_2, vec4(0.001, 0.001, 0.001, 0.001));
  light_2.w = tmpvar_24.w;
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz + xlv_TEXCOORD5);
  light_2.xyz = tmpvar_25;
  lowp vec4 c_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (col_4 * light_2.xyz);
  c_26.xyz = tmpvar_27;
  c_26.w = tmpvar_3;
  c_1 = c_26;
  lowp vec4 col_28;
  col_28 = c_1;
  lowp vec4 res_29;
  highp vec2 pblend_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_32;
  tmpvar_32 = col_28.w;
  pblend_30.x = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = tmpvar_31.w;
  pblend_30.y = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_34.w = max (pblend_30.x, pblend_30.y);
  res_29 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35 = max (((pblend_30 - res_29.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_36;
  tmpvar_36 = (tmpvar_35 / (tmpvar_35.x + tmpvar_35.y));
  pblend_30 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((col_28.xyz * tmpvar_36.x) + (tmpvar_31.xyz * tmpvar_36.y));
  res_29.xyz = tmpvar_37;
  gl_FragData[0] = res_29;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = textureProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = max (light_2, vec4(0.001, 0.001, 0.001, 0.001));
  light_2.w = tmpvar_24.w;
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz + xlv_TEXCOORD5);
  light_2.xyz = tmpvar_25;
  lowp vec4 c_26;
  mediump vec3 tmpvar_27;
  tmpvar_27 = (col_4 * light_2.xyz);
  c_26.xyz = tmpvar_27;
  c_26.w = tmpvar_3;
  c_1 = c_26;
  lowp vec4 col_28;
  col_28 = c_1;
  lowp vec4 res_29;
  highp vec2 pblend_30;
  lowp vec4 tmpvar_31;
  tmpvar_31 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_32;
  tmpvar_32 = col_28.w;
  pblend_30.x = tmpvar_32;
  lowp float tmpvar_33;
  tmpvar_33 = tmpvar_31.w;
  pblend_30.y = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_34.w = max (pblend_30.x, pblend_30.y);
  res_29 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35 = max (((pblend_30 - res_29.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_36;
  tmpvar_36 = (tmpvar_35 / (tmpvar_35.x + tmpvar_35.y));
  pblend_30 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((col_28.xyz * tmpvar_36.x) + (tmpvar_31.xyz * tmpvar_36.y));
  res_29.xyz = tmpvar_37;
  _glesFragData[0] = res_29;
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
dcl_texcoord0 v1
dcl_texcoord1 v2
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
mad o1.zw, v1.xyxy, c17.xyxy, c17
mad o1.xy, v1, c16, c16.zwzw
mad o2.zw, v1.xyxy, c19.xyxy, c19
mad o2.xy, v1, c18, c18.zwzw
mad o3.xy, v1, c20, c20.zwzw
mov o4.w, r2.z
mad o6.xy, v2, c15, c15.zwzw
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
  lowp vec3 col_7;
  highp vec4 blend_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat3, xlv_TEXCOORD2);
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
  highp float tmpvar_18;
  tmpvar_18 = max (blend_8.x, max (blend_8.y, max (blend_8.z, blend_8.w)));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (((blend_8 - tmpvar_18) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 / (((tmpvar_19.x + tmpvar_19.y) + tmpvar_19.z) + tmpvar_19.w));
  blend_8 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20.x * tmpvar_10).xyz;
  col_7 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_7 + (tmpvar_20.y * tmpvar_11).xyz);
  col_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_7 + (tmpvar_20.z * tmpvar_12).xyz);
  col_7 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_7 + (tmpvar_20.w * tmpvar_13).xyz);
  col_7 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (tmpvar_18 * 0.5);
  tmpvar_6 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_5 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_27.w;
  highp float tmpvar_28;
  tmpvar_28 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_4 = tmpvar_28;
  lowp vec3 tmpvar_29;
  tmpvar_29 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lmFull_3 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  lmIndirect_2 = tmpvar_30;
  light_5.xyz = (tmpvar_27.xyz + mix (lmIndirect_2, lmFull_3, vec3(clamp (lmFade_4, 0.0, 1.0))));
  lowp vec4 c_31;
  mediump vec3 tmpvar_32;
  tmpvar_32 = (col_7 * light_5.xyz);
  c_31.xyz = tmpvar_32;
  c_31.w = tmpvar_6;
  c_1 = c_31;
  lowp vec4 col_33;
  col_33 = c_1;
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_37;
  tmpvar_37 = col_33.w;
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
  tmpvar_42 = ((col_33.xyz * tmpvar_41.x) + (tmpvar_36.xyz * tmpvar_41.y));
  res_34.xyz = tmpvar_42;
  gl_FragData[0] = res_34;
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
  lowp vec3 col_7;
  highp vec4 blend_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Splat3, xlv_TEXCOORD2);
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
  highp float tmpvar_18;
  tmpvar_18 = max (blend_8.x, max (blend_8.y, max (blend_8.z, blend_8.w)));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (((blend_8 - tmpvar_18) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 / (((tmpvar_19.x + tmpvar_19.y) + tmpvar_19.z) + tmpvar_19.w));
  blend_8 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20.x * tmpvar_10).xyz;
  col_7 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_7 + (tmpvar_20.y * tmpvar_11).xyz);
  col_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_7 + (tmpvar_20.z * tmpvar_12).xyz);
  col_7 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_7 + (tmpvar_20.w * tmpvar_13).xyz);
  col_7 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (tmpvar_18 * 0.5);
  tmpvar_6 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_5 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_27.w;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (unity_Lightmap, xlv_TEXCOORD5);
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (unity_LightmapInd, xlv_TEXCOORD5);
  highp float tmpvar_30;
  tmpvar_30 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_4 = tmpvar_30;
  lowp vec3 tmpvar_31;
  tmpvar_31 = ((8.0 * tmpvar_28.w) * tmpvar_28.xyz);
  lmFull_3 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((8.0 * tmpvar_29.w) * tmpvar_29.xyz);
  lmIndirect_2 = tmpvar_32;
  light_5.xyz = (tmpvar_27.xyz + mix (lmIndirect_2, lmFull_3, vec3(clamp (lmFade_4, 0.0, 1.0))));
  lowp vec4 c_33;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (col_7 * light_5.xyz);
  c_33.xyz = tmpvar_34;
  c_33.w = tmpvar_6;
  c_1 = c_33;
  lowp vec4 col_35;
  col_35 = c_1;
  lowp vec4 res_36;
  highp vec2 pblend_37;
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_39;
  tmpvar_39 = col_35.w;
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
  tmpvar_44 = ((col_35.xyz * tmpvar_43.x) + (tmpvar_38.xyz * tmpvar_43.y));
  res_36.xyz = tmpvar_44;
  gl_FragData[0] = res_36;
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
  lowp vec3 col_7;
  highp vec4 blend_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_Control, xlv_TEXCOORD0.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Splat0, xlv_TEXCOORD0.zw);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Splat1, xlv_TEXCOORD1.xy);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_Splat2, xlv_TEXCOORD1.zw);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Splat3, xlv_TEXCOORD2);
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
  highp float tmpvar_18;
  tmpvar_18 = max (blend_8.x, max (blend_8.y, max (blend_8.z, blend_8.w)));
  highp vec4 tmpvar_19;
  tmpvar_19 = max (((blend_8 - tmpvar_18) + _Depth), vec4(0.0, 0.0, 0.0, 0.0));
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 / (((tmpvar_19.x + tmpvar_19.y) + tmpvar_19.z) + tmpvar_19.w));
  blend_8 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20.x * tmpvar_10).xyz;
  col_7 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (col_7 + (tmpvar_20.y * tmpvar_11).xyz);
  col_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (col_7 + (tmpvar_20.z * tmpvar_12).xyz);
  col_7 = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (col_7 + (tmpvar_20.w * tmpvar_13).xyz);
  col_7 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (tmpvar_18 * 0.5);
  tmpvar_6 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = textureProj (_LightBuffer, xlv_TEXCOORD4);
  light_5 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = max (light_5, vec4(0.001, 0.001, 0.001, 0.001));
  light_5.w = tmpvar_27.w;
  highp float tmpvar_28;
  tmpvar_28 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_4 = tmpvar_28;
  lowp vec3 tmpvar_29;
  tmpvar_29 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lmFull_3 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  lmIndirect_2 = tmpvar_30;
  light_5.xyz = (tmpvar_27.xyz + mix (lmIndirect_2, lmFull_3, vec3(clamp (lmFade_4, 0.0, 1.0))));
  lowp vec4 c_31;
  mediump vec3 tmpvar_32;
  tmpvar_32 = (col_7 * light_5.xyz);
  c_31.xyz = tmpvar_32;
  c_31.w = tmpvar_6;
  c_1 = c_31;
  lowp vec4 col_33;
  col_33 = c_1;
  lowp vec4 res_34;
  highp vec2 pblend_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_37;
  tmpvar_37 = col_33.w;
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
  tmpvar_42 = ((col_33.xyz * tmpvar_41.x) + (tmpvar_36.xyz * tmpvar_41.y));
  res_34.xyz = tmpvar_42;
  _glesFragData[0] = res_34;
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
dcl_texcoord0 v1
dcl_texcoord1 v2
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
mad o1.zw, v1.xyxy, c8.xyxy, c8
mad o1.xy, v1, c7, c7.zwzw
mad o2.zw, v1.xyxy, c10.xyxy, c10
mad o2.xy, v1, c9, c9.zwzw
mad o3.xy, v1, c11, c11.zwzw
mov o4.w, r2.z
mad o6.xy, v2, c6, c6.zwzw
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
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_23;
  mediump vec3 lm_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lm_24 = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26.w = 0.0;
  tmpvar_26.xyz = lm_24;
  mediump vec4 tmpvar_27;
  tmpvar_27 = (max (light_2, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_26);
  light_2 = tmpvar_27;
  lowp vec4 c_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = (col_4 * tmpvar_27.xyz);
  c_28.xyz = tmpvar_29;
  c_28.w = tmpvar_3;
  c_1 = c_28;
  lowp vec4 col_30;
  col_30 = c_1;
  lowp vec4 res_31;
  highp vec2 pblend_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_34;
  tmpvar_34 = col_30.w;
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
  tmpvar_39 = ((col_30.xyz * tmpvar_38.x) + (tmpvar_33.xyz * tmpvar_38.y));
  res_31.xyz = tmpvar_39;
  gl_FragData[0] = res_31;
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
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (unity_Lightmap, xlv_TEXCOORD5);
  mediump vec3 lm_25;
  lowp vec3 tmpvar_26;
  tmpvar_26 = ((8.0 * tmpvar_24.w) * tmpvar_24.xyz);
  lm_25 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27.w = 0.0;
  tmpvar_27.xyz = lm_25;
  mediump vec4 tmpvar_28;
  tmpvar_28 = (max (light_2, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_27);
  light_2 = tmpvar_28;
  lowp vec4 c_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = (col_4 * tmpvar_28.xyz);
  c_29.xyz = tmpvar_30;
  c_29.w = tmpvar_3;
  c_1 = c_29;
  lowp vec4 col_31;
  col_31 = c_1;
  lowp vec4 res_32;
  highp vec2 pblend_33;
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2DProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_35;
  tmpvar_35 = col_31.w;
  pblend_33.x = tmpvar_35;
  lowp float tmpvar_36;
  tmpvar_36 = tmpvar_34.w;
  pblend_33.y = tmpvar_36;
  highp vec4 tmpvar_37;
  tmpvar_37.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_37.w = max (pblend_33.x, pblend_33.y);
  res_32 = tmpvar_37;
  highp vec2 tmpvar_38;
  tmpvar_38 = max (((pblend_33 - res_32.w) + (_Depth * 0.5)), vec2(0.0, 0.0));
  highp vec2 tmpvar_39;
  tmpvar_39 = (tmpvar_38 / (tmpvar_38.x + tmpvar_38.y));
  pblend_33 = tmpvar_39;
  highp vec3 tmpvar_40;
  tmpvar_40 = ((col_31.xyz * tmpvar_39.x) + (tmpvar_34.xyz * tmpvar_39.y));
  res_32.xyz = tmpvar_40;
  gl_FragData[0] = res_32;
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
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
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
  lowp vec4 tmpvar_23;
  tmpvar_23 = textureProj (_LightBuffer, xlv_TEXCOORD4);
  light_2 = tmpvar_23;
  mediump vec3 lm_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lm_24 = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26.w = 0.0;
  tmpvar_26.xyz = lm_24;
  mediump vec4 tmpvar_27;
  tmpvar_27 = (max (light_2, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_26);
  light_2 = tmpvar_27;
  lowp vec4 c_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = (col_4 * tmpvar_27.xyz);
  c_28.xyz = tmpvar_29;
  c_28.w = tmpvar_3;
  c_1 = c_28;
  lowp vec4 col_30;
  col_30 = c_1;
  lowp vec4 res_31;
  highp vec2 pblend_32;
  lowp vec4 tmpvar_33;
  tmpvar_33 = textureProj (_GrabTexture, xlv_TEXCOORD3);
  lowp float tmpvar_34;
  tmpvar_34 = col_30.w;
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
  tmpvar_39 = ((col_30.xyz * tmpvar_38.x) + (tmpvar_33.xyz * tmpvar_38.y));
  res_31.xyz = tmpvar_39;
  _glesFragData[0] = res_31;
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
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [_GrabTexture] 2D 6
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
TXP R1, fragment.texcoord[3], texture[6], 2D;
MUL R4.x, R0.w, c[1].y;
MAX R0.w, R1, R4.x;
MOV R4.y, R1.w;
ADD R2.xyz, R2, R3;
MUL R0.xyz, R4.w, R0;
ADD R2.xyz, R2, R0;
TXP R0.xyz, fragment.texcoord[4], texture[5], 2D;
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
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [_GrabTexture] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
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
texldp r0, v3, s6
max r1.w, r0, r4.x
mov r4.y, r0.w
add_pp r2.xyz, r2, r3
mul r1.xyz, r4.w, r1
add_pp r2.xyz, r2, r1
texldp r1.xyz, v4, s5
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
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [unity_LightmapInd] 2D 7
SetTexture 8 [_GrabTexture] 2D 8
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
TXP R2, fragment.texcoord[3], texture[8], 2D;
MAX R3.w, R2, R4.x;
MOV R4.y, R2.w;
MUL R1.xyz, R4.z, R1;
ADD R1.xyz, R3, R1;
MUL R0.xyz, R4.w, R0;
ADD R3.xyz, R1, R0;
TEX R1, fragment.texcoord[5], texture[6], 2D;
MOV R0.w, c[2].z;
ADD R4.xy, R4, -R3.w;
MAD R4.xy, R0.w, c[0].x, R4;
MAX R4.xy, R4, c[2].x;
ADD R0.w, R4.x, R4.y;
RCP R0.w, R0.w;
MUL R4.xy, R4, R0.w;
TEX R0, fragment.texcoord[5], texture[7], 2D;
MUL R0.xyz, R0.w, R0;
DP4 R0.w, fragment.texcoord[6], fragment.texcoord[6];
RSQ R0.w, R0.w;
RCP R0.w, R0.w;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R0, c[2].y;
MAD R5.xyz, R1, c[2].y, -R0;
TXP R1.xyz, fragment.texcoord[4], texture[5], 2D;
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
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [unity_LightmapInd] 2D 7
SetTexture 8 [_GrabTexture] 2D 8
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
texldp r2, v3, s8
max r3.w, r2, r4.x
mov r4.y, r2.w
mul r0.xyz, r4.z, r0
add_pp r0.xyz, r3, r0
mul r1.xyz, r4.w, r1
add_pp r3.xyz, r0, r1
texld r1, v5, s6
mov r0.w, c0.x
add r4.xy, r4, -r3.w
mad r4.xy, c2.z, r0.w, r4
max r4.xy, r4, c2.x
add r0.w, r4.x, r4.y
rcp r0.w, r0.w
mul r4.xy, r4, r0.w
texld r0, v5, s7
mul_pp r0.xyz, r0.w, r0
dp4 r0.w, v6, v6
rsq r0.w, r0.w
rcp r0.w, r0.w
mul_pp r1.xyz, r1.w, r1
mul_pp r0.xyz, r0, c2.y
mad_pp r5.xyz, r1, c2.y, -r0
texldp r1.xyz, v4, s5
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
// Stats: 51 math, 8 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [_GrabTexture] 2D 7
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 8, 0.5 } };
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
MUL R4.x, R0.w, c[1].z;
TXP R2, fragment.texcoord[3], texture[7], 2D;
MAX R1.w, R2, R4.x;
MOV R4.y, R2.w;
MUL R1.xyz, R4.z, R1;
ADD R1.xyz, R3, R1;
MUL R0.xyz, R4.w, R0;
ADD R3.xyz, R1, R0;
TXP R1.xyz, fragment.texcoord[4], texture[5], 2D;
MOV R0.w, c[1].z;
ADD R4.xy, R4, -R1.w;
MAD R4.xy, R0.w, c[0].x, R4;
MAX R4.xy, R4, c[1].x;
ADD R0.w, R4.x, R4.y;
RCP R0.w, R0.w;
MUL R4.xy, R4, R0.w;
TEX R0, fragment.texcoord[5], texture[6], 2D;
LG2 R1.x, R1.x;
LG2 R1.z, R1.z;
LG2 R1.y, R1.y;
MUL R0.xyz, R0.w, R0;
MAD R0.xyz, R0, c[1].y, -R1;
MUL R1.xyz, R4.y, R2;
MUL R0.xyz, R3, R0;
MAD result.color.xyz, R0, R4.x, R1;
MOV result.color.w, R1;
END
# 51 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 43 math, 8 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [_GrabTexture] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c1, 0.00000000, 8.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4
dcl_texcoord5 v5.xy
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
mul r4.x, r0.w, c1.z
mul r3.xyz, r4.y, r3
add_pp r3.xyz, r2, r3
texldp r2, v3, s7
max r1.w, r2, r4.x
mov r4.y, r2.w
mul r0.xyz, r4.z, r0
add_pp r0.xyz, r3, r0
mul r1.xyz, r4.w, r1
add_pp r3.xyz, r0, r1
texldp r1.xyz, v4, s5
mov r0.w, c0.x
add r4.xy, r4, -r1.w
mad r4.xy, c1.z, r0.w, r4
max r4.xy, r4, c1.x
add r0.w, r4.x, r4.y
rcp r0.w, r0.w
mul r4.xy, r4, r0.w
texld r0, v5, s6
log_pp r1.x, r1.x
log_pp r1.z, r1.z
log_pp r1.y, r1.y
mul_pp r0.xyz, r0.w, r0
mad_pp r0.xyz, r0, c1.y, -r1
mul r1.xyz, r4.y, r2
mul_pp r0.xyz, r3, r0
mad oC0.xyz, r0, r4.x, r1
mov_pp oC0.w, r1
"
}
SubProgram "d3d11 " {
// Stats: 33 math, 8 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_LightBuffer] 2D 6
SetTexture 6 [unity_Lightmap] 2D 7
SetTexture 7 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 192
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedahdeelkdclngflmdbdifljpljpdicjolabaaaaaaneahaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjmagaaaaeaaaaaaakhabaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
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
aoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaaagaaaaaa
cpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaadaaaaaa
ogbkbaaaadaaaaaaeghobaaaagaaaaaaaagabaaaahaaaaaadiaaaaahicaabaaa
aaaaaaaadkaabaaaadaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaa
abaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaahaaaaaaaagabaaaaaaaaaaadeaaaaahicaabaaa
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
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [_GrabTexture] 2D 6
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
TXP R1, fragment.texcoord[3], texture[6], 2D;
MUL R4.x, R0.w, c[1].y;
MAX R0.w, R1, R4.x;
MOV R4.y, R1.w;
ADD R2.xyz, R2, R3;
MUL R0.xyz, R4.w, R0;
ADD R2.xyz, R2, R0;
TXP R0.xyz, fragment.texcoord[4], texture[5], 2D;
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
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [_GrabTexture] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
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
texldp r0, v3, s6
max r1.w, r0, r4.x
mov r4.y, r0.w
add_pp r2.xyz, r2, r3
mul r1.xyz, r4.w, r1
add_pp r2.xyz, r2, r1
texldp r1.xyz, v4, s5
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
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [unity_LightmapInd] 2D 7
SetTexture 8 [_GrabTexture] 2D 8
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
TXP R1, fragment.texcoord[3], texture[8], 2D;
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
TEX R0, fragment.texcoord[5], texture[6], 2D;
MUL R3.xyz, R0.w, R0;
TEX R0, fragment.texcoord[5], texture[7], 2D;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, c[2].y;
DP4 R1.w, fragment.texcoord[6], fragment.texcoord[6];
RSQ R0.w, R1.w;
RCP R0.w, R0.w;
MAD R3.xyz, R3, c[2].y, -R0;
MAD_SAT R0.w, R0, c[1].z, c[1];
MAD R3.xyz, R0.w, R3, R0;
TXP R0.xyz, fragment.texcoord[4], texture[5], 2D;
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
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [unity_LightmapInd] 2D 7
SetTexture 8 [_GrabTexture] 2D 8
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
texldp r0, v3, s8
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
texld r1, v5, s6
mul_pp r3.xyz, r1.w, r1
texld r1, v5, s7
dp4 r0.w, v6, v6
mul_pp r1.xyz, r1.w, r1
mul_pp r1.xyz, r1, c2.y
rsq r0.w, r0.w
rcp r0.w, r0.w
mad_pp r3.xyz, r3, c2.y, -r1
mad_sat r0.w, r0, c1.z, c1
mad_pp r3.xyz, r0.w, r3, r1
texldp r1.xyz, v4, s5
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
// Stats: 48 math, 8 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [_GrabTexture] 2D 7
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 8, 0.5 } };
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
MUL R4.x, R0.w, c[1].z;
TXP R2, fragment.texcoord[3], texture[7], 2D;
MAX R1.w, R2, R4.x;
MOV R4.y, R2.w;
MUL R1.xyz, R4.z, R1;
ADD R1.xyz, R3, R1;
MUL R0.xyz, R4.w, R0;
ADD R3.xyz, R1, R0;
MOV R0.w, c[1].z;
ADD R4.xy, R4, -R1.w;
MAD R4.xy, R0.w, c[0].x, R4;
MAX R4.xy, R4, c[1].x;
ADD R0.w, R4.x, R4.y;
RCP R0.w, R0.w;
MUL R4.xy, R4, R0.w;
TEX R0, fragment.texcoord[5], texture[6], 2D;
TXP R1.xyz, fragment.texcoord[4], texture[5], 2D;
MUL R0.xyz, R0.w, R0;
MAD R0.xyz, R0, c[1].y, R1;
MUL R1.xyz, R4.y, R2;
MUL R0.xyz, R3, R0;
MAD result.color.xyz, R0, R4.x, R1;
MOV result.color.w, R1;
END
# 48 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 40 math, 8 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Depth]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Splat0] 2D 1
SetTexture 2 [_Splat1] 2D 2
SetTexture 3 [_Splat2] 2D 3
SetTexture 4 [_Splat3] 2D 4
SetTexture 5 [_LightBuffer] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
SetTexture 7 [_GrabTexture] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c1, 0.00000000, 8.00000000, 0.50000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3
dcl_texcoord4 v4
dcl_texcoord5 v5.xy
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
mul r4.x, r0.w, c1.z
mul r3.xyz, r4.y, r3
add_pp r3.xyz, r2, r3
texldp r2, v3, s7
max r1.w, r2, r4.x
mov r4.y, r2.w
mul r0.xyz, r4.z, r0
add_pp r0.xyz, r3, r0
mul r1.xyz, r4.w, r1
add_pp r3.xyz, r0, r1
mov r0.w, c0.x
add r4.xy, r4, -r1.w
mad r4.xy, c1.z, r0.w, r4
max r4.xy, r4, c1.x
add r0.w, r4.x, r4.y
rcp r0.w, r0.w
mul r4.xy, r4, r0.w
texld r0, v5, s6
texldp r1.xyz, v4, s5
mul_pp r0.xyz, r0.w, r0
mad_pp r0.xyz, r0, c1.y, r1
mul r1.xyz, r4.y, r2
mul_pp r0.xyz, r3, r0
mad oC0.xyz, r0, r4.x, r1
mov_pp oC0.w, r1
"
}
SubProgram "d3d11 " {
// Stats: 32 math, 8 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Splat0] 2D 2
SetTexture 2 [_Splat1] 2D 3
SetTexture 3 [_Splat2] 2D 4
SetTexture 4 [_Splat3] 2D 5
SetTexture 5 [_LightBuffer] 2D 6
SetTexture 6 [unity_Lightmap] 2D 7
SetTexture 7 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 192
Float 48 [_Depth]
BindCB  "$Globals" 0
"ps_4_0
eefiecedcaaildlikkbpcllnidldjbaommbbogkjabaaaaaalmahaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcieagaaaaeaaaaaaakbabaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
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
aoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaafaaaaaaaagabaaaagaaaaaa
efaaaaajpcaabaaaadaaaaaaogbkbaaaadaaaaaaeghobaaaagaaaaaaaagabaaa
ahaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaadaaaaaaabeaaaaaaaaaaaeb
dcaaaaajhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaaegacbaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaahaaaaaaaagabaaaaaaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaadgaaaaaf
ccaabaaaacaaaaaadkaabaaaabaaaaaaaaaaaaaidcaabaaaacaaaaaapgapbaia
ebaaaaaaaaaaaaaaegaabaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaandcaabaaaacaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaaegaabaaaacaaaaaadeaaaaakdcaabaaa
acaaaaaaegaabaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaaaoaaaaah
dcaabaaaacaaaaaaegaabaaaacaaaaaapgapbaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaafgafbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaaaaaaaaaagaabaaaacaaaaaaegacbaaaabaaaaaadoaaaaab"
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