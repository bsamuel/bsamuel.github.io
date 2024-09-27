//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//uniform vec4 u_colour;

void main()
{
	vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
	//float gray = (texColor.r + texColor.g + texColor.b) / 3.0;
	float gray = dot(texColor.rgb, vec3(0.299, 0.587, 0.144));
    gl_FragColor = v_vColour * vec4(gray,gray,gray, texColor.a);
	
}
