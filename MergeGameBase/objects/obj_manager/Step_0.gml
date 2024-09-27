/// @description Insert description here
// You can write your code in this editor


if(currentEnergy < maxEnergy){
	secondsRemainingForMoreEnergy -= convertDeltaTimeToSeconds(delta_time);
	if(secondsRemainingForMoreEnergy <= 0){
		currentEnergy += energyReplenishmentAmount;
		secondsRemainingForMoreEnergy = maxWaitTimeForMoreEnergy;
		
	}
}

if(currentEnergy >= maxEnergy || secondsRemainingForMoreEnergy <= 0){
	secondsRemainingForMoreEnergy = maxWaitTimeForMoreEnergy;
}

if(keyboard_check_pressed(vk_space)){
	decrementEnergy();
	show_debug_message("deplete some energy! Now it is " + string(currentEnergy));
}
