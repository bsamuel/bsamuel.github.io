/// @description Insert description here
// You can write your code in this editor
draw_self();

if(is_colliding_with_mergeable_object){

	show_debug_message("MERGABLE MERGABLE MERGABLE");	

	draw_sprite_ext(spr_shinyOverlap,0,self.x,self.y,1,1,0,c_white,0.5);
}