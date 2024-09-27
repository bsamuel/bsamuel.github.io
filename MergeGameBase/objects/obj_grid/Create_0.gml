#macro TILE_HEIGHT 64
#macro TILE_WIDTH 64
#macro MENU_VERTICAL_OFFSET 160
numTilesInARow = room_width / TILE_WIDTH;
numTilesInAColumn = (room_height-MENU_VERTICAL_OFFSET) / TILE_HEIGHT;

show_debug_message("num tiles in a row is " + string(numTilesInARow));
show_debug_message("num tiles in a col is " + string(numTilesInAColumn));

the_grid = [];

function get_grid_cell_by_id(grid_id){
	return the_grid[grid_id];
}

function get_grid_cell_by_row_col(row, col){
	var index = row * numTilesInARow + col;
	return the_grid[index];
}

function add_game_object_to_grid_cell(row, col, newGameObject, newGameSprite){
	get_grid_cell_by_row_col(row, col).addGameObjectToCell(newGameObject, newGameSprite);	
}

function get_random_empty_grid_cell(){
	var empty_grid_cells = [];
	for(var i = 0; i < numTilesInARow; i++){
		for(var j = 0; j < numTilesInAColumn; j++){
			//show_debug_message("This is what is at the grid at this spot: " + string(the_grid[i][j]));
			var gridCell = get_grid_cell_by_row_col(i,j);
			
			if(gridCell != pointer_null){
				if(gridCell.contents == pointer_null){
					array_push(empty_grid_cells, gridCell);
				}
			}
			else{
				show_debug_message("uh oh, grid cell is null I guess");	
			}
			
		}
	}
	if(array_length(empty_grid_cells) > 0){
		return empty_grid_cells[irandom_range(0, array_length(empty_grid_cells)-1)];
	}
	else{
		show_debug_message("Uh oh, there is no space left!");
		return pointer_null;
	}
}

function get_closest_empty_grid_cell_to_point(pointX, pointY){
  bestDist = 999999999;
  var currentDistance = 9999999999;
  bestGridCell = pointer_null;
 
  for(var i = 0; i < numTilesInARow; i++){
	for(var j = 0; j < numTilesInAColumn; j++){
		var gridCell = get_grid_cell_by_row_col(i,j);
		if(gridCell.contents == pointer_null){
			//This grid cell is empty!
			currentDistance = point_distance(gridCell.center[0], gridCell.center[1], pointX, pointY);
			if(currentDistance < bestDist){
					bestDist = currentDistance;
					bestGridCell = gridCell;
			}
		}
	}
  }
 
  return bestGridCell;	
}


function get_closest_grid_cell_to_point(pointX, pointY){
  bestDist = 999999999;
  var currentDistance = 9999999999;
  bestGridCell = pointer_null;
 
  for(var i = 0; i < numTilesInARow; i++){
	for(var j = 0; j < numTilesInAColumn; j++){
		var gridCell = get_grid_cell_by_row_col(i,j);

		currentDistance = point_distance(gridCell.center[0], gridCell.center[1], pointX, pointY);
		if(currentDistance < bestDist){
			bestDist = currentDistance;
			bestGridCell = gridCell;
		}
	}
  }
 
  return bestGridCell;	
}

function find_grid_cell_with_target_item(itemType, itemLevel){
  for(var i = 0; i < numTilesInARow; i++){
	for(var j = 0; j < numTilesInAColumn; j++){
		var gridCell = get_grid_cell_by_row_col(i,j);
		
		if(gridCell.contents != pointer_null){
			//it has something... does it have the RIGHT thing?
			if(gridCell.contents.sprite_index == itemType && gridCell.contents.image_index == itemLevel){
				show_debug_message("yes!");
				return gridCell;	
			}
			else{
				show_debug_message("row " + string(gridCell.grid_row) + " col " + string(gridCell.grid_col) + " has sprite index " + string(gridCell.contents.sprite_index) + " and image index " + string(gridCell.contents.image_index));
			}
		}
		else{
			show_debug_message("row " + string(gridCell.grid_row) + " col " + string(gridCell.grid_col) + " is empty");
		}
	}
	
  }
  return pointer_null;
}



/*
	for(var i = 0; i < the_grid.size; i++){
		var currentCell = the_grid[i];
		if currentCell.grid_id
	}
	*/