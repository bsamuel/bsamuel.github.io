/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Fist check to see if we can afford this!
//If we can't, then don't both doing anything else!
if(!obj_manager.canAffordGeneration()){
	return;
}

//Find an empty grid cell
var emptyGridCell = obj_grid.get_random_empty_grid_cell();


//Assuming we were able to find an empty cell...
if(emptyGridCell != pointer_null){
	var thing_to_spawn = what_kind_of_generator_am_I();	
	emptyGridCell.addGameObjectToCell(obj_merge_item, thing_to_spawn, self);
}

//produce a new item

//First -- find an empty grid cell.



//show_debug_message("id is:" + string(self.grid_id) + " row is: " + string(self.grid_row) + " col is: " + string(self.grid_col));

//this will be a referene to a sprite.

//This works and I like it...
//BUT
//I think I want generators to spawn new items.
/*

if(self.contents == pointer_null){
//var ingredientIndex = random_range(0, array_length(ingredients));
//var ingredientSprite = ingredients[ingredientIndex];

//Instantiate a new merge item
var newItem = instance_create_layer(center[0], center[1], "Instances", obj_merge_item);

//make the merge item look like the ingredient
//newItem.sprite_index = ingredientSprite;



//show_debug_message( variable_instance_get(newItem,));
contents = newItem.object_index;
self.toString();
}
else{
 	show_debug_message("can't add another thing here, occupied!");
	self.toString();
}
*/