//global.grid = mp_grid_create(0,0, room_width / TILE_WIDTH, room_height / TILE_HEIGHT, TILE_WIDTH, TILE_HEIGHT);

var i = 0;
var j = 0;



for(i = 0; i < numTilesInARow; i++){
	for(j = 0; j < numTilesInAColumn; j++){
		var newGridCell = instance_create_layer(j * TILE_WIDTH, i * TILE_HEIGHT + MENU_VERTICAL_OFFSET, "Grid", obj_gridCell);
		newGridCell.grid_id = i*numTilesInARow + j;
		newGridCell.grid_row = i;
		newGridCell.grid_col = j;
		array_push(the_grid, newGridCell);
	}
}

var cell1 = get_grid_cell_by_id(10);

var cell2 = get_grid_cell_by_row_col(4,2);

cell1.toString();
cell2.toString();


//Add a generator to a random cell!
var emptyGridCell = get_random_empty_grid_cell();
if(emptyGridCell != pointer_null){

	emptyGridCell.addGameObjectToCell(obj_generator, spr_weapon_generators, pointer_null);
}
emptyGridCell = get_random_empty_grid_cell();
if(emptyGridCell != pointer_null){

	emptyGridCell.addGameObjectToCell(obj_generator, spr_book_generators, pointer_null);
}
emptyGridCell = get_random_empty_grid_cell();
if(emptyGridCell != pointer_null){

	emptyGridCell.addGameObjectToCell(obj_generator, spr_food_generators, pointer_null);
}


//add_game_object_to_grid_cell(2,2,obj_generator,spr_open_bag);