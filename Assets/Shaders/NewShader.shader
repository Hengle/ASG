// Shader created with Shader Forge v1.02 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.02;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4726,x:33417,y:32713,varname:node_4726,prsc:2|diff-8474-OUT;n:type:ShaderForge.SFN_Tex2d,id:908,x:32423,y:32731,ptovrint:False,ptlb:biome,ptin:_biome,varname:node_908,prsc:2,tex:56c62eab28431764c8e50392c71fe979,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:7864,x:32782,y:32733,varname:node_7864,prsc:2|A-9478-RGB,B-2431-RGB,T-908-B;n:type:ShaderForge.SFN_Lerp,id:8474,x:33050,y:32732,varname:node_8474,prsc:2|A-7864-OUT,B-3905-RGB,T-908-R;n:type:ShaderForge.SFN_Tex2d,id:9478,x:32362,y:32967,ptovrint:False,ptlb:grassland,ptin:_grassland,varname:node_9478,prsc:2,tex:27c56bd80de6c004bb931e4edca39742,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3905,x:32763,y:32907,ptovrint:False,ptlb:desert,ptin:_desert,varname:node_3905,prsc:2,tex:2cfd257e7d23b5c488042dc1d1d9f66a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8685,x:33011,y:32936,ptovrint:False,ptlb:forest,ptin:_forest,varname:node_8685,prsc:2,ntxv:0,isnm:False|MIP-908-A;n:type:ShaderForge.SFN_Tex2d,id:2431,x:32423,y:32547,ptovrint:False,ptlb:water,ptin:_water,varname:node_2431,prsc:2,tex:53356ef0674fd514aa262fd51db82e01,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:2264,x:32901,y:32520,varname:node_2264,prsc:2,uv:0;proporder:908-9478-3905-2431;pass:END;sub:END;*/

Shader "Shader Forge/NewShader" {
    Properties {
        _biome ("biome", 2D) = "white" {}
        _grassland ("grassland", 2D) = "white" {}
        _desert ("desert", 2D) = "white" {}
        _water ("water", 2D) = "white" {}
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
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _biome; uniform float4 _biome_ST;
            uniform sampler2D _grassland; uniform float4 _grassland_ST;
            uniform sampler2D _desert; uniform float4 _desert_ST;
            uniform sampler2D _water; uniform float4 _water_ST;
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
                float4 _grassland_var = tex2D(_grassland,TRANSFORM_TEX(i.uv0, _grassland));
                float4 _water_var = tex2D(_water,TRANSFORM_TEX(i.uv0, _water));
                float4 _biome_var = tex2D(_biome,TRANSFORM_TEX(i.uv0, _biome));
                float4 _desert_var = tex2D(_desert,TRANSFORM_TEX(i.uv0, _desert));
                float3 node_8474 = lerp(lerp(_grassland_var.rgb,_water_var.rgb,_biome_var.b),_desert_var.rgb,_biome_var.r);
                float3 diffuse = (directDiffuse + indirectDiffuse) * node_8474;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _biome; uniform float4 _biome_ST;
            uniform sampler2D _grassland; uniform float4 _grassland_ST;
            uniform sampler2D _desert; uniform float4 _desert_ST;
            uniform sampler2D _water; uniform float4 _water_ST;
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
                float4 _grassland_var = tex2D(_grassland,TRANSFORM_TEX(i.uv0, _grassland));
                float4 _water_var = tex2D(_water,TRANSFORM_TEX(i.uv0, _water));
                float4 _biome_var = tex2D(_biome,TRANSFORM_TEX(i.uv0, _biome));
                float4 _desert_var = tex2D(_desert,TRANSFORM_TEX(i.uv0, _desert));
                float3 node_8474 = lerp(lerp(_grassland_var.rgb,_water_var.rgb,_biome_var.b),_desert_var.rgb,_biome_var.r);
                float3 diffuse = directDiffuse * node_8474;
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
