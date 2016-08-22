Shader "Unity Shaders Book/Chapter 5/False Color" {
	SubShader{
		Pass{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			struct v2f
			{
				float4 pos : SV_POSITION;
				fixed4 color : COLOR0;	
			};

			v2f vert(appdata_full v)
			{
				v2f o;
				//UNITY_MATRIX_MVP : Current model * view * projection matrix.
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);

				//visualizing normals
				o.color = fixed4(v.normal * 0.5 + fixed3(0.5, 0.5, 0.5), 1.0);

				//visualizing tangents
				//tangent is store in vertices
				//tangent's x,y and z components are visualized as RGB colors.
				o.color = v.tangent * 0.5 + 0.5;

				//visualizing binormals
				//binormal(or bitangent) is derived from the normal and tangent values.
				//It needs to be scaled and biased into a displayable 0 to 1 range.
				fixed3 binormal = cross(v.normal, v.tangent.xyz) * v.tangent.w;
				o.color.xyz = binormal * 0.5 + 0.5;
				o.color.w = 1.0;

				//Visualizing first texture coordinate
				o.color = fixed4(v.texcoord.xy, 0.0, 1.0);

				// an additional blue tint has been applied to coordinates outside of the 0 to 1 range
				o.color = frac(v.texcoord);
				if(any(saturate(v.texcoord)- v.texcoord))
				{
					o.color.b = 0.5;
				}
				o.color.a = 1.0;


				//Visualizing second texture coordinate
				o.color = fixed4(v.texcoord1.xy, 0.0, 1.0);

				// an additional blue tint has been applied to coordinates outside of the 0 to 1 range
				o.color = frac(v.texcoord1);
				if(any(saturate(v.texcoord1)- v.texcoord1))
				{
					o.color.b = 0.5;
				}
				o.color.a = 1.0;


				//Visualizing vertex colors
				o.color = v.color;

				return o;

			}

			fixed4 frag(v2f i) : SV_Target
			{
				return i.color;
			}

			ENDCG
		}
	}
}
