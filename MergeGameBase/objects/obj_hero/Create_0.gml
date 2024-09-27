//Create Event
_uniColor = shader_get_uniform(sd_colorOverlay, "u_colour");
_color = [1.0, 1.0, 0.0, 1.0];

_uniUV = shader_get_uniform(sd_rainbowShader, "u_uv");
_uniUVHourglass = shader_get_uniform(sd_hourglassShader, "u_uv");

_uniTime = shader_get_uniform(sd_rainbowShader, "u_time");

_uniSpeed = shader_get_uniform(sd_rainbowShader, "u_speed");

_time = 0;
_speed = 1.0;


_uniSection    = shader_get_uniform(sd_rainbowShader, "u_section");
_uniSaturation = shader_get_uniform(sd_rainbowShader, "u_saturation"); 
_uniBrightness = shader_get_uniform(sd_rainbowShader, "u_brightness");
_uniMix        = shader_get_uniform(sd_rainbowShader, "u_mix");

_uniFlashTime  = shader_get_uniform(sd_flashShader, "u_flashTime");

_section = 0.5;
_saturation = 0.7;
_brightness = 0.8;
_mix = 1.0;

_isFlashing = false;
_flashTime = 0;
_flashPercentage = 0;
_maxFlashTime = 5.0;