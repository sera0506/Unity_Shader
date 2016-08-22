///********************************************
///vertex shader -communicate-> fragment shader
///********************************************

Shader "Unity Shaders Book/Chapter 5/Simple Shader 2"
{
	SubShader
	{
		Pass
		{
				CGPROGRAM

				#pragma vertex vert 
				#pragma fragment frag 

				struct a2v{
					float4 vertex : POSITION; // object space position for vertex
					float3 normal : NORMAL; // object space normal vector
					float4 texcoord : TEXCOORD0; // copies first texture coordinate data 
					//from the source as color data in the destination.
				};

				struct v2f{
					float4 pos : SV_POSITION; // vertex in clip space中的位置資訊
					fixed3 color : COLOR0; // store color data
				};

				v2f vert ( a2v v)
				{
					v2f o; // output struct o

					//vertex from object space to clip space
					//POSITION->SV_POSITION
					o.pos = mul(UNITY_MATRIX_MVP, v.vertex);

					//normal vector range [-1.0, 1.0]
					//we should mapping to [0.0, 1.0] then store in color for fragment shader
					o.color = v.normal * 0.5 + fixed3(0.5, 0.5, 0.5);
					return o;
				}

				fixed4 frag(v2f i) : SV_Target
				{
					//fixed4(r,g,b,a)
					return fixed4(i.color, 1.0);
				}
				ENDCG
		}
	}
}
