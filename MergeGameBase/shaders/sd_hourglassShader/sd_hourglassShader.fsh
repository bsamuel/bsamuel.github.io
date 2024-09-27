//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_uv;
uniform float u_flashTime;


vec3 hsv2rgb(vec3 c){
	vec4 K = vec4(1.0, 2.0 / 3.0, 1.0/3.0, 3.0);
	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
	float yPos = (v_vTexcoord.y - u_uv[0]) / (u_uv[1] - u_uv[0]);
	
	float invertedFlashTime = 1.0 - u_flashTime;
	
	vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
	
	vec4 finalColor;
	if(yPos >= invertedFlashTime){
		finalColor = vec4(0,0,0, texColor.a);
	}
	else{
		finalColor = vec4(texColor.rgba);	
	}
	
	/*
	float amountOfWhite = (1.0 * (1.0 - u_flashTime)); 
	float amountOfRed = (texColor.r * u_flashTime);
	float newRed = (amountOfWhite + amountOfRed);
	
	float amountOfGreen = (texColor.g * u_flashTime);
	float newGreen = (amountOfWhite + amountOfGreen);
	
	float amountOfBlue = (texColor.b * u_flashTime);
	float newBlue = (amountOfWhite + amountOfBlue);
	
	vec4 finalColor = vec4(newRed, newGreen, newBlue, texColor.a);
	*/
	
	
	//vec3 col = vec3(u_section * ((u_time * u_speed) + pos), u_saturation, u_brightness);
	//vec4 finalCol = mix(texColor, vec4(hsv2rgb(col), texColor.a), u_mix);
	
	gl_FragColor = v_vColour * finalColor;
	
}
