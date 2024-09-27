/// @description Insert description here
// You can write your code in this editor

isTryingToHold = false;

show_debug_message("*****MERGE OBJECT ON RELEASE HAPPENED******");
if(!isHeld){
	show_debug_message("$$$oops you don't need need to do anything here");
	return;
	}

//We need to find the closest unoccupied grid cell and 
//then eventually move to it's center in a nice way.
//var newCellToCallHome = obj_grid.get_closest_empty_grid_cell_to_point(x,y);
var newCellToCallHome = pointer_null;

if(isHeld){
	newCellToCallHome = obj_grid.get_closest_grid_cell_to_point(x,y);
}

//Hey this works great in terms of updating the x and y of the object!
if(newCellToCallHome != pointer_null){
	//show_debug_message("id of my current cell: " + string(gridCellWhereILive.grid_id));
	//show_debug_message("id of the cell I found: " + string(newCellToCallHome.grid_id));
	//first, we assume we live in a world where the cell is empty:
	if(newCellToCallHome.contents == pointer_null){
		show_debug_message("*****dropping into an empty place******");
		x = newCellToCallHome.center[0];
		y = newCellToCallHome.center[1];
		self.gridCellWhereILive.contents = pointer_null;
		gridCellWhereILive = newCellToCallHome;
		gridCellWhereILive.contents = self;
	}
	
	

	
	
	//Now, let's see the world where WE live in this cell.
	else if(newCellToCallHome.grid_id == gridCellWhereILive.grid_id){
		show_debug_message("*****the world where we leave ourselves where we were " + string(self.creationNumber) + " !!******");
		x = newCellToCallHome.center[0];
		y = newCellToCallHome.center[1];
	}
	
	//Now, let's do the swap if there's something else that lives in this cell.
	else if(newCellToCallHome.contents != pointer_null && !is_the_same_as_me(newCellToCallHome.contents)){
		swap_merge_object_locations(newCellToCallHome);
		
	
		//show_debug_message("Starting cell id is: " + string(myCurrentGridcell.grid_id));
		//show_debug_message("Target cell id is: " + string(gridCellInQuestion.grid_id));
		//show_debug_message("my instance id: " + string(myCurrentContents.creationNumber));
		//show_debug_message("id of the thing I am swapping with: " + string(otherGridCellContents.creationNumber));
		
		/*
		var otherObject = newCellToCallHome.contents;
				
		otherObject.gridCellWhereILive = self.gridCellWhereILive;
		otherObject.gridCellWhereILive.contents = otherObject;
		
		newCellToCallHome.contents = self;
		gridCellWhereILive = newCellToCallHome;
		
		x = gridCellWhereILive.center[0];
		y = gridCellWhereILive.center[1];
		
		otherObject.x = otherObject.gridCellWhereILive.center[0];
		otherObject.y = otherObject.gridCellWhereILive.center[1];
		*/
	}
	else if(newCellToCallHome.contents != pointer_null && is_the_same_as_me(newCellToCallHome.contents)){
		show_debug_message("WE FOUND A MATCH! WE SHOULD MERGE!");
		
		//what does merging mean?
		//It means one instance gets destroyed (the one the player is holding)
		//It means the cell that the instance 'came from' should get cleared out.
		//The surviving one advances it's image frame.
		//I think that's it!
		if(newCellToCallHome.contents.image_index + 1 == image_number){
		 //just swap them 
		 swap_merge_object_locations(newCellToCallHome);
		}
		else{
			self.gridCellWhereILive.contents = pointer_null; // clear out my home.
			instance_destroy(self);
			newCellToCallHome.contents.image_index += 1;
		}
		
	}
}

timeHeldDown = 0;
isHeld = false;
held_object = pointer_null;


//But now we need to empty out the 'old cell'
//and mark the 'new cell' as occupied!


//The above also works great.
//But there's other ways to make it better...
//we can...

//find not just the closest unoccupied cell, but the closest cell period
//if it IS occupied, perform a 'swap'

//If it IS occupied with "itself" (i.e., player puts it back where it came from), let them!
//right now it still treats it as "occupied".

//Have in animate to the new location over time

//Make it so that you have to have "held down" on the item for more than
//just a frame. Otherwise it interprets clicks as frames.
