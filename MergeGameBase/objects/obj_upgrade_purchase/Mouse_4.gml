/// @description Insert description here
// You can write your code in this editor


if(obj_manager.currentMoney > self.upgradeCost){
	obj_manager.currentMoney -= self.upgradeCost;
	
	//we need to add another generator to the board now!
	var emptyGridCell = obj_grid.get_random_empty_grid_cell();
	emptyGridCell.addGameObjectToCell(obj_generator, sprite_index, self);
	
	/*
	var newGeneratorInstance = instance_create_layer(x,y, "Instances", obj_generator);
	newGeneratorInstance.sprite_index = sprite_index;
	newGeneratorInstance.image_index = image_index;
	newGeneratorInstance.image_speed = 0;
	*/
	
}
else{
	show_debug_message("You can't afford this!");
}