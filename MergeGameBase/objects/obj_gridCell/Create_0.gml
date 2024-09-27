grid_id = 0;
grid_row = 0;
grid_col = 0;
center = [x + TILE_WIDTH/2, y + TILE_HEIGHT/2];


//ingredients = [obj_bag_of_flour, obj_cookie, obj_mixing_bowl, obj_strawberry_shortcake];

/*
ingredients = [
 spr_bag_of_flour,
 spr_cookie,
 spr_mixing_bowl,
 spr_strawberry_shortcake
];
*/

contents = pointer_null;

function toString(){

	if(contents){
		show_debug_message("id is:" + string(self.grid_id) + " row is: " + string(self.grid_row) + " col is: " + string(self.grid_col) + " contents is: " + object_get_name(contents.object_index));	
	}
	else{
		show_debug_message("id is:" + string(self.grid_id) + " row is: " + string(self.grid_row) + " col is: " + string(self.grid_col) + " contents is EMPTY!");	

	}
}

function addGameObjectToCell(newObject, newSprite, generatorThatProducedMergeItem){
	//Instantiate a new item
	var newItem;
	if(generatorThatProducedMergeItem != pointer_null){
		newItem = instance_create_layer(generatorThatProducedMergeItem.x, generatorThatProducedMergeItem.y, "Instances", newObject);
	}
	else{
		newItem = instance_create_layer(center[0], center[1], "Instances", newObject);

	}
	//make the merge item look like the ingredient
	newItem.sprite_index = newSprite;
	
	var upgradeLevelHelper;
	if(generatorThatProducedMergeItem == pointer_null){upgradeLevelHelper = 0;}
	else{ upgradeLevelHelper = generatorThatProducedMergeItem.image_index; }
	
	
	//investigate the 'generator'
	//if case -- we are buying a new generator
	if(generatorThatProducedMergeItem != pointer_null && generatorThatProducedMergeItem.object_index == obj_upgrade_purchase){
		newItem.image_index = generatorThatProducedMergeItem.image_index;
	}
	else{
		//we are using a generator to create a merge item.
		var chance = random(100);
		if(chance < 35){
				newItem.image_index = 0; // usually zero
		}
		else if(chance < 75){
			newItem.image_index = irandom_range(0, upgradeLevelHelper - 1);
		}
		else{
			newItem.image_index = irandom_range(0,upgradeLevelHelper);
		}
		//var range = irandom_range(0, generatorThatProducedMergeItem.image_index + 1 );
		newItem.image_index = max(0, newItem.image_index);
		newItem.image_index = min(newItem.image_index, upgradeLevelHelper);
	}
	//newItem.image_index = 0;
	newItem.gridCellWhereILive = self;
	newItem.creationNumber = obj_manager.totalObjectsCreated;
	
	//make the merge item travel to the intended location
	newItem.set_is_moving(center[0], center[1],false);
	
	
	contents = newItem;
	obj_manager.totalObjectsCreated += 1;
	
	//deplete the user's energy by a little bit.
	obj_manager.decrementEnergy();
	
	show_debug_message("adding to grid! This square is now:");
	self.toString();
}