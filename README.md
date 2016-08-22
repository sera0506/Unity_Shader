# Unity_Shader
my shader learning journey


###註記
POSITION為vertex shader中頂點位於object space時的坐標位置。  
SV_POSITION用於Pixel shader，  
表示頂點經過坐標變換後來到clip space時的坐標位置。  
SV為System value的簡寫。

SV_Position can be specified as an input to a vertex shader as well as an output.   
Pixel shaders can only write to parameters with the SV_Depth and SV_Target system-value semantics.  

#SimpleShader
	Prepare
		one material-SimpleShderMat
		one shader-SimpleShader
		one Sphere in scene. Shere has SimpleShaderMat.

	Result
		red Sphere

#Simple shader 2
使用a2f struct將model數據由application傳到vertex shader中，  
這次傳送的數據有POSITION、NORMAL、TEXCOORD0。  
struct v2f defined output of vertex shader.  
vertex shader的輸出一定要有SV_POSITION,   
才能將vertex render在畫面上。  

而我們在vert func中把normal vector由[-1, 1]映射到[0, 1]範圍中，  
並把獲得的color 數值丟給fragment shader來渲染。  
![Result](http://imgur.com/JPqgwQq.jpg)

###自訂義struct
	struct StructName{
		Type Name : System semantic;
		Type Name : System semantic;
		...
	};
