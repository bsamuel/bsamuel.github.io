/// @description Insert description here
// You can write your code in this editor

char_id = irandom(7);
image_index = char_id * 3;
start_image_index = image_index;
max_image_index = start_image_index + 2;
image_xscale = 3;
image_yscale = 3;

//FOR TESTING
//desired_item_type = spr_swords;
//desired_item_level = 0


//FOR REAL
desired_item_type = choose(spr_books,spr_meat,spr_swords);
desired_item_level = irandom_range(0, sprite_get_number(desired_item_type)-1)


moneyTheyWillPay = desired_item_level * 2 + irandom_range(-1,2);
if(moneyTheyWillPay <= 0){
	moneyTheyWillPay = 1;	
}

function sell_item_at_grid_cell(gridCell){
	gridCell.contents.set_is_moving(x,y,true,self); // make the merge object fly towards the customer
	gridCell.contents = pointer_null; // make it so that the object isn't in teh grid cell any more.
}