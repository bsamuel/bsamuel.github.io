/// @description Insert description here
// You can write your code in this editor\

is_colliding_with_mergeable_object = false; // assume this isn't the case

if(isTryingToHold){
	timeHeldDown += delta_time;
	//show_debug_message("time held down is " + string(timeHeldDown));
	if(timeHeldDown >= thresholdToConsiderHolding){
		isHeld = true;	
		held_object = self;
	}
}

if(isHeld){
	x = mouse_x; //+ xx;
	y = mouse_y; // + yy;
}

if(isMoving){
	
	/*
	amountOfFramesSpentMoving += 1;
	move_towards_point(targetX, targetY, movementSpeed);
	show_debug_message("It is frame " + string(amountOfFramesSpentMoving) + " and I (" + string(creationNumber) +") am at " + string(x) + "," + string(y));
	if((x == targetX && y == targetY) ||  (amountOfFramesSpentMoving == totalFramesToMoveFor+1)){
		x = targetX;
		y = targetY;
		speed = 0;
		movementSpeed = 0;
		isMoving = false;
		amountOfFramesSpentMoving = 0;
	}
	*/
	
	
	/*
	var percentageOfDistanceCrossed = amountOfFramesSpentMoving/totalFramesToMoveFor;
	
	if(percentageOfDistanceCrossed <= 0.5){
		movementSpeed = 10;
	}
	else if(percentageOfDistanceCrossed <= 0.75){
		movementSpeed = 5;	
	}
	else{
		movementSpeed = 3;	
	}
	
	if(distance_to_point(targetX, targetY) > .0001){
		move_towards_point(targetX, targetY, movementSpeed);	
	}
	else{
		x = targetX;
		y = targetY;
		speed = 0; // move_towards_point changes speed.
		isMoving = false;
		amountOfFramesSpentMoving = 0;
	}
	*/
	
	
	
	x = lerp(x, targetX, .25);
	y = lerp(y, targetY, .25);
	if(point_distance(x,y,targetX, targetY) < 1){
		show_debug_message("MERGE ITEM REACHED TARGET DESTINATION!");
		x = targetX;
		y = targetY;
		targetX = -99;
		targetY = -99;
		isMoving = false;
	}	
	
	/*
	if(movingTowardsCustomer && point_distance(x,y,targetX, targetY) < 3){
		instance_destroy();	
		instance_destroy(whichCustomerMovingTowards);
	}
	*/
	
}

/*
//we are far away from the point! Move towards it!
if(isMoving && distance_to_point(targetX, targetY) > .01){
	x = lerp(x, targetX, .1);
	y = lerp(y, targetY, .1);
}
//we are close enough to the point. Let's just say that we got there.
else if(isMoving && distance_to_point(targetX, targetY) < .01){
	x = targetX;
	y = targetY;
	isMoving = false;
}
*/