/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function what_kind_of_generator_am_I(){
	if(self.sprite_index == spr_food_generators){
		return spr_meat;	
	}
	else if(self.sprite_index == spr_book_generators){
		return spr_books;
	}
	else if(self.sprite_index == spr_weapon_generators){
		return spr_swords;	
	}
	else{
		show_debug_message("uh oh unrecognized sprite index");
		show_debug_message(string(self.sprite_index));
	}
}

