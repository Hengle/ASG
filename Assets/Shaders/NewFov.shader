// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

// Shader created with Shader Forge v1.02 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.02;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3836,x:33052,y:32857,varname:node_3836,prsc:2|diff-4128-OUT;n:type:ShaderForge.SFN_Tex2d,id:3490,x:32471,y:32852,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_3490,prsc:2,tex:cce54960e1359c14bbbb05078dd77c20,ntxv:0,isnm:False|UVIN-671-OUT;n:type:ShaderForge.SFN_Slider,id:205,x:32705,y:32604,ptovrint:False,ptlb:Blur,ptin:_Blur,varname:node_205,prsc:2,min:0,cur:0.5982906,max:1;n:type:ShaderForge.SFN_Add,id:671,x:32238,y:32883,varname:node_671,prsc:2|A-8407-UVOUT,B-1760-OUT;n:type:ShaderForge.SFN_Vector2,id:1760,x:32001,y:32925,varname:node_1760,prsc:2,v1:0,v2:0.01;n:type:ShaderForge.SFN_TexCoord,id:8407,x:32001,y:32776,varname:node_8407,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:236,x:32238,y:33002,varname:node_236,prsc:2|A-8407-UVOUT,B-1370-OUT;n:type:ShaderForge.SFN_Vector2,id:1370,x:32001,y:33056,varname:node_1370,prsc:2,v1:0.01,v2:0;n:type:ShaderForge.SFN_Vector2,id:3408,x:32001,y:33160,varname:node_3408,prsc:2,v1:-0.1,v2:0;n:type:ShaderForge.SFN_Vector2,id:2206,x:32001,y:33276,varname:node_2206,prsc:2,v1:0,v2:-0.1;n:type:ShaderForge.SFN_Add,id:8833,x:32238,y:33118,varname:node_8833,prsc:2|A-8407-UVOUT,B-3408-OUT;n:type:ShaderForge.SFN_Add,id:3483,x:32238,y:33234,varname:node_3483,prsc:2|A-8407-UVOUT,B-2206-OUT;n:type:ShaderForge.SFN_Tex2d,id:3481,x:32471,y:33028,ptovrint:False,ptlb:Texture_copy,ptin:_Texture_copy,varname:node_3490,prsc:2,tex:cce54960e1359c14bbbb05078dd77c20,ntxv:0,isnm:False|UVIN-236-OUT;n:type:ShaderForge.SFN_Add,id:1802,x:32657,y:32948,varname:node_1802,prsc:2|A-3490-RGB,B-3481-RGB;n:type:ShaderForge.SFN_Vector1,id:8834,x:32657,y:33098,varname:node_8834,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Divide,id:4128,x:32843,y:32970,varname:node_4128,prsc:2|A-1802-OUT,B-8834-OUT;proporder:3490-205-3481;pass:END;sub:END;*/

Shader "Shader Forge/NewFov" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
        _Blur ("Blur", Range(0, 1)) = 0.5982906
        _Texture_copy ("Texture_copy", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            // float4 unity_LightmapST;
            #ifdef DYNAMICLIGHTMAP_ON
                // float4 unity_DynamicLightmapST;
            #endif
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform sampler2D _Texture_copy; uniform float4 _Texture_copy_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
                #ifndef LIGHTMAP_OFF
                    float4 uvLM : TEXCOORD6;
                #else
                    float3 shLight : TEXCOORD6;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(_Object2World, float4(v.normal,0)).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 indirectDiffuse = float3(0,0,0);
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float2 node_671 = (i.uv0+float2(0,0.01));
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(node_671, _Texture));
                float2 node_236 = (i.uv0+float2(0.01,0));
                float4 _Texture_copy_var = tex2D(_Texture_copy,TRANSFORM_TEX(node_236, _Texture_copy));
                float3 diffuse = (directDiffuse + indirectDiffuse) * ((_Texture_var.rgb+_Texture_copy_var.rgb)/0.5);
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            // float4 unity_LightmapST;
            #ifdef DYNAMICLIGHTMAP_ON
                // float4 unity_DynamicLightmapST;
            #endif
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform sampler2D _Texture_copy; uniform float4 _Texture_copy_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                #ifndef LIGHTMAP_OFF
                    float4 uvLM : TEXCOORD5;
                #else
                    float3 shLight : TEXCOORD5;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(_Object2World, float4(v.normal,0)).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float2 node_671 = (i.uv0+float2(0,0.01));
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(node_671, _Texture));
                float2 node_236 = (i.uv0+float2(0.01,0));
                float4 _Texture_copy_var = tex2D(_Texture_copy,TRANSFORM_TEX(node_236, _Texture_copy));
                float3 diffuse = directDiffuse * ((_Texture_var.rgb+_Texture_copy_var.rgb)/0.5);
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
