Shader "Wireframe/Wireframe" {
	Properties 
	{
		_WireframeColor ("Wireframe Color",Color) = (0,0,1,1)
        _LineWidth ("Line Width", float) = .05
        [MaterialToggle] _LineWidthDistanceDependent("Line Width Distance Wise", Float) = 1
        _FrameSharpness("Frame Sharpness", Range(0.0,0.5)) = 0.5
        _GradientTex ("Gradient Texture", 2D) = "white" {}
        [MaterialToggle] _ActivateGradient("Color Gradient", Float) = 1        
        _VertSize("Vertice Size", Range(0.0,0.5)) = 0.09
        [MaterialToggle] _AttenuateBackFace("Attenuate Backfaces", Float) = 1
        _BackFaceAttenuation("BackFace Attenuation", Range(0.0,1.0)) = 0.5  
	}

   
    Subshader 
    {
    	Tags { "Queue"="Transparent" "RenderType"="Transparent" }
    	Blend SrcAlpha OneMinusSrcAlpha // use alpha blending
		LOD 250
    	ZWrite On		
		
		Pass
        {
        	Name "WIRE"
		
            Cull Off
            CGPROGRAM
            #pragma vertex VertShader 
            #pragma geometry GS_Main
 			#pragma fragment FragShader
 			#pragma debug
			
			struct GS_INPUT
			{
				float4	pos		: POSITION;
				float3	normal	: NORMAL;
				float2 ampl : TEXCOORD0;
			};
				
            struct appdata_t 
            {
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};
 
			struct FS_INPUT
			{
				float4	pos		: POSITION;
				float2 uv : TEXCOORD0;
			};

            fixed _LineWidth;
            
            float _FrameSharpness;
            float _VertSize;
            bool _LineWidthDistanceDependent;
            bool _ActivateGradient;
			bool _AttenuateBackFace;
			float _BackFaceAttenuation;
            
            GS_INPUT VertShader (appdata_t v) 
            {
        		GS_INPUT output = (GS_INPUT)0;

				output.pos =  mul(_Object2World, v.vertex);
				output.normal = mul(_Object2World,v.normal);
				
				//ampl in [0.5;1]
				output.ampl = float2((dot(  _WorldSpaceCameraPos - output.pos,output.normal)>=0)*_BackFaceAttenuation+(1-_BackFaceAttenuation),0);
				
				return output;
			    
            }
            
            // Geometry Shader -----------------------------------------------------
			[maxvertexcount(27)]
			void GS_Main(triangle GS_INPUT p[3], inout TriangleStream<FS_INPUT> triStream)
			{					
				float3 vect01 = (p[1].pos - p[0].pos)*_FrameSharpness;
				float3 vect12 = (p[2].pos - p[1].pos)*_FrameSharpness;
				float3 vect20 = (p[0].pos - p[2].pos)*_FrameSharpness;
				float3 vect10 = -vect01;
				float3 vect21 = -vect12;
				float3 vect02 = -vect20;
				
				float3 ZComp =distance( _WorldSpaceCameraPos , ((p[0].pos + p[1].pos + p[2].pos) / 3));
				float effWireframeSize = _LineWidth * (ZComp * 0.1 * (1-_LineWidthDistanceDependent) + _LineWidthDistanceDependent);
				
				//draw wireframe 
				float3 currentTangent = normalize(cross((p[0].pos - p[1].pos), p[0].normal));
				float4 v[27]; //Wireframe Vertices
				float uMap[27]; //Useful to map the color gradient to Vertices
				v[0] = p[0].pos;
				v[1] = float4(p[0].pos + effWireframeSize * currentTangent+vect01, 1.0f);				
				v[2] = p[1].pos;
				
				v[18] = v[1];
				v[19] = float4(p[1].pos + effWireframeSize * currentTangent+vect10, 1.0f);				
				v[20] = v[2];
				
				uMap[0] = 0;
				uMap[1] = _FrameSharpness;				
				uMap[2] = 1;
							
				uMap[18] = uMap[1];
				uMap[19] = 1-_FrameSharpness;				
				uMap[20] = uMap[2];
								
				currentTangent = normalize(cross((p[1].pos - p[2].pos), p[1].normal));
				v[3] = p[1].pos;
				v[4] = float4(p[1].pos + effWireframeSize * currentTangent+vect12, 1.0f);				
				v[5] = p[2].pos;
				
				v[21] = v[4];
				v[22] = float4(p[2].pos + effWireframeSize * currentTangent+vect21, 1.0f);				
				v[23] = v[5];
				
				uMap[3] = 0;
				uMap[4] = _FrameSharpness;				
				uMap[5] = 1;
				
				uMap[21] = uMap[4];
				uMap[22] = 1-_FrameSharpness;				
				uMap[23] = uMap[5];
				
				currentTangent = normalize(cross((p[2].pos - p[0].pos), p[1].normal));
				v[6] = p[2].pos;
				v[7] = float4(p[2].pos + effWireframeSize * currentTangent+vect20, 1.0f);				
				v[8] = p[0].pos;
				
				v[24] = v[7];
				v[25] = float4(p[0].pos + effWireframeSize * currentTangent+vect02, 1.0f);				
				v[26] = v[8];
				
				uMap[6] = 0;
				uMap[7] = _FrameSharpness;				
				uMap[8] = 1;
				
				uMap[24] = uMap[7];
				uMap[25] = 1-_FrameSharpness;				
				uMap[26] = uMap[8];
				
				//draw vertices (corners)				
				v[9] = p[0].pos;
				v[10] = p[0].pos+normalize(p[1].pos - p[0].pos)*_VertSize;				
				v[11] = p[0].pos+normalize(p[2].pos - p[0].pos)*_VertSize;
				
				v[12] = p[1].pos;
				v[13] = p[1].pos+normalize(p[0].pos - p[1].pos)*_VertSize;				
				v[14] = p[1].pos+normalize(p[2].pos - p[1].pos)*_VertSize;
				
				v[15] = p[2].pos;
				v[16] = p[2].pos+normalize(p[1].pos - p[2].pos)*_VertSize;				
				v[17] = p[2].pos+normalize(p[0].pos - p[2].pos)*_VertSize;
				
				uMap[9] = 0;
				uMap[10] = 0.25;				
				uMap[11] = 0.25;
				
				uMap[12] = 0;
				uMap[13] = 0.25;				
				uMap[14] = 0.25;
				
				uMap[15] = 0;
				uMap[16] = 0.25;				
				uMap[17] = 0.25;
				
				


				
				//Create triangle stream
				float4x4 vp = mul(UNITY_MATRIX_MVP, _World2Object);
				FS_INPUT pIn;
								
				int idx;
		
				for(idx = 0;idx<9;idx++)
				{
					pIn.pos = mul(vp, v[idx]);
					pIn.uv = float2(uMap[idx],p[0].ampl.x);
					triStream.Append(pIn);						
				}
				
				triStream.RestartStrip();
				
				for(idx = 18;idx<21;idx++)
				{
					pIn.pos = mul(vp, v[idx]);
					pIn.uv = float2(uMap[idx],p[0].ampl.x);
					triStream.Append(pIn);						
				}
				triStream.RestartStrip();
				
				for(idx = 21;idx<24;idx++)
				{
					pIn.pos = mul(vp, v[idx]);
					pIn.uv = float2(uMap[idx],p[0].ampl.x);
					triStream.Append(pIn);						
				}
				triStream.RestartStrip();
				
				for(idx = 24;idx<27;idx++)
				{
					pIn.pos = mul(vp, v[idx]);
					pIn.uv = float2(uMap[idx],p[0].ampl.x);
					triStream.Append(pIn);						
				}
				triStream.RestartStrip();
		
				for(idx = 9;idx<12;idx++)
				{
					pIn.pos = mul(vp, v[idx]);
					pIn.uv = float2(uMap[idx],p[0].ampl.x);
					triStream.Append(pIn);						
				}
				triStream.RestartStrip();
				for(idx = 12;idx<15;idx++)
				{
					pIn.pos = mul(vp, v[idx]);
					pIn.uv = float2(uMap[idx],p[0].ampl.x);
					triStream.Append(pIn);						
				}
				triStream.RestartStrip();
				for(idx = 15;idx<18;idx++)
				{
					pIn.pos = mul(vp, v[idx]);
					pIn.uv = float2(uMap[idx],p[0].ampl.x);
					triStream.Append(pIn);						
				}
				triStream.RestartStrip();
				
				
			}
            
            fixed4 _WireframeColor;
			sampler2D _GradientTex;
            fixed4 FragShader(FS_INPUT i) :COLOR 
			{
				fixed4 col = tex2D(_GradientTex, float2(i.uv.x,0));
				float ampl = i.uv.y;
				fixed4 finalColor = fixed4(_WireframeColor.r*(col.r*_ActivateGradient-_ActivateGradient+1),_WireframeColor.g*(col.g*_ActivateGradient-_ActivateGradient+1),_WireframeColor.b*(col.b*_ActivateGradient-_ActivateGradient+1),_WireframeColor.a*(col.a*_ActivateGradient-_ActivateGradient+1));
 		    	finalColor = finalColor * (_AttenuateBackFace * ampl - _AttenuateBackFace +1);
 		    	
 		    	return finalColor;
			}
                        
            ENDCG
        }       
       
    }
    Fallback "Diffuse"
}