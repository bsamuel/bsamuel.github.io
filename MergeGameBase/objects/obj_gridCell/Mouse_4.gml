show_debug_message("id is:" + string(self.grid_id) + " row is: " + string(self.grid_row) + " col is: " + string(self.grid_col));

if(self.contents != pointer_null){
	show_debug_message("content id is :" + string(self.contents.creationNumber));
}
else{
	show_debug_message("This cell is empty!");
}


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