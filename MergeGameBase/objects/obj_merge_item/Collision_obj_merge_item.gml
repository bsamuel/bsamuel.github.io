/// @description Insert description here
// You can write your code in this editor

//if either of the objects in question "are moving" (i.e., flying out of the bag)
//then don't register this as a collision
if(self.isMoving || other.isMoving) return;

if(other.sprite_index == self.sprite_index){
	//so you're saying there's a chance...
	if(other.image_index == self.image_index){
		//only one thing left to test -- are we at the end of the merge chain?
		if(self.image_index + 1 != image_number){
			//show_debug_message("MERGABLE MERGABLE MERGABLE");	
			is_colliding_with_mergeable_object = true;
		}
	}
}