/// @description Insert description here
// You can write your code in this editor
xx = 0
yy = 0
image_speed = 0; // don't cycle through the animation
image_index = 0;

timeHeldDown = 0;
thresholdToConsiderHolding = 75000;

gridCellWhereILive = pointer_null;
held_object = pointer_null;

creationNumber = -1;

isHeld = false;
isTryingToHold = false;


isMoving = false; // for if it is in the act of merging/swapping/etc.
targetX = -99;
targetY = -99;
movementSpeed = 1;
movingTowardsCustomer = false;
whichCustomerMovingTowards = pointer_null;

totalFramesToMoveFor = 3;
amountOfFramesSpentMoving = 0;

is_colliding_with_mergeable_object = false;

function set_is_moving(newTargetX, newTargetY, isForCustomer, customerInstance=pointer_null){
	isMoving = true;
	targetX = newTargetX;
	targetY = newTargetY;
	movingTowardsCustomer = isForCustomer;
	whichCustomerMovingTowards = customerInstance;
	
	var totalDistanceToCover = point_distance(x,y,targetX, targetY);
	var distanceToTravelPerFrame = totalDistanceToCover / totalFramesToMoveFor;
	movementSpeed = distanceToTravelPerFrame;
	
	show_debug_message("I am id " +string(creationNumber) + " and I am moving towards " + string(targetX) + "," + string(targetY) + " with a speed of " + string(movementSpeed) + " and this distance to cover: " + string(totalDistanceToCover));
}

function is_the_same_as_me(otherMergeObjectInstance){
	if(self.sprite_index == otherMergeObjectInstance.sprite_index){
		//ok, we have the same sprite index... but are we on the same stage of the sprite index?
		if(self.image_index == otherMergeObjectInstance.image_index){
			//we do! it is merge time!
				show_debug_message("MERGE BABY MERGE!");

			return true;
		}
	}
	return false;
}

function swap_merge_object_locations(newCellToCallHome){
		show_debug_message("*****I'm in this special case and my id is " + string(self.creationNumber) + " !!******");
		
		
		var myCurrentGridcell = variable_clone(gridCellWhereILive);
		var myCurrentContents = variable_clone(gridCellWhereILive.contents);
		var gridCellInQuestion = variable_clone(newCellToCallHome);
		var otherGridCellContents = variable_clone(gridCellInQuestion.contents);
		
		
		
		
		//update which cell both objects belong in
		gridCellWhereILive = newCellToCallHome
		gridCellWhereILive.contents = self;
		
		
		myCurrentGridcell.contents = otherGridCellContents;
		myCurrentGridcell.contents.gridCellWhereILive = myCurrentGridcell;
	
		//update where both objects should be
		//x = gridCellWhereILive.center[0];
		//y = gridCellWhereILive.center[1];
		set_is_moving(gridCellWhereILive.center[0],gridCellWhereILive.center[1], false);
		
		//otherGridCellContents.x = otherGridCellContents.gridCellWhereILive.center[0];
		//otherGridCellContents.y = otherGridCellContents.gridCellWhereILive.center[1];
		otherGridCellContents.set_is_moving( otherGridCellContents.gridCellWhereILive.center[0], otherGridCellContents.gridCellWhereILive.center[1], false);
	
}