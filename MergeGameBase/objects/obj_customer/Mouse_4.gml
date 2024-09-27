/// @description Insert description here
// You can write your code in this editor
show_debug_message("Clicked!");

var gridCell = obj_grid.find_grid_cell_with_target_item(desired_item_type, desired_item_level);

if(gridCell != pointer_null){
 	show_debug_message("yes! What you want is in row " + string(gridCell.grid_row) + " col " + string(gridCell.grid_col));

	sell_item_at_grid_cell(gridCell);

}
else{
	show_debug_message("sorry, I don't think we have this in stock! We want type " + string(desired_item_type) + " and level " + string(desired_item_level));	
}