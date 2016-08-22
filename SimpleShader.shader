Shader "Unity Shaders Book/Chapter 5/Simple Shader"
{
	SubShader
	{
		Pass
		{
				CGPROGRAM

				#pragma vertex vert //vertex shader function name is vert
				#pragma fragment frag // fragment shader function name is frag
				// vert 和 frag是function name，你可以命名其它名稱

				//輸入：OBJECT SPACE中頂點v的位置，型態為POSITION
				//輸出：v在CLIP SPACE中的位置，型態為SV_POSITION，Homogeneous coordinate
				float4 vert ( float4 v: POSITION) : SV_POSITION
				{
					//將頂點透過MVP矩陣由object space轉到clip space中
					return mul(UNITY_MATRIX_MVP, v);
				}

				//沒有輸入，使用SV_Target來限定使用者的輸出顏色存到一個render target中
				//這裡會返回一個紅色的fixed4變數。
				fixed4 frag() : SV_Target
				{
					//fixed4(r,g,b,a)
					return fixed4(1.0, 0.0, 0.0, 1.0);
				}
				ENDCG
		}
	}
}
