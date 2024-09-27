_time += 1 / game_get_speed(gamespeed_fps);


if(_isFlashing){
	_flashTime += delta_time / 1000000;
	_flashPercentage = _flashTime / _maxFlashTime;
	show_debug_message("flash percentage is: " + string(_flashPercentage));
	if(_flashTime >= _maxFlashTime){
		_isFlashing = false;	
		_flashTime = 0;
	}
}
