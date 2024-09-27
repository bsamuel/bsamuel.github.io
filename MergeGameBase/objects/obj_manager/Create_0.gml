/// @description Insert description here
// You can write your code in this editor

totalObjectsCreated = 0;

currentEnergy = 100;
maxEnergy = 100;
currentMoney = 0;
maxWaitTimeForMoreEnergy = 125;
secondsRemainingForMoreEnergy = maxWaitTimeForMoreEnergy;
energyReplenishmentAmount = 1;


//start the customer generation train.
alarm[0] = irandom_range(1200, 2400);


function convertDeltaTimeToSeconds(deltaTime){
	return deltaTime/1000000;
}

function getRemainingEnergyPercentage(){
	return currentEnergy/maxEnergy;	
}

function decrementEnergy(){
	if(currentEnergy <= 0){
		return;	
	}
	else{
		currentEnergy -= 1;	
	}
}

//maybe someday we will make things cost different amounts I don't know.
function canAffordGeneration(){
 if(currentEnergy > 0){
	return true;	 
 }
 return false;
}

function convertMinutesAndSecondsToFormattedClockString(minutes, seconds){
	var minutesWithSpaces = string_format(minutes,2,0);
	var secondsWithSpaces = string_format(seconds,2,0);
	
	var minutesWithZeroes = string_replace_all(minutesWithSpaces, " ", "0");
	var secondsWithZeroes = string_replace_all(secondsWithSpaces, " ", "0");
	
	return minutesWithZeroes + ":" + secondsWithZeroes;
}