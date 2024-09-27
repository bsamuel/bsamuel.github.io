/// @description Insert description here
// You can write your code in this editor
draw_self();

var maxXScale = 114; // because the border and background are combined. Maybe should have separated them out.

var currentScale = maxXScale * obj_manager.getRemainingEnergyPercentage();


//draw the bar!
draw_sprite_ext(spr_barColor,0, self.x, self.y,currentScale,1,0,c_white,1);

//Draw time remaining
//figure out minutes and seconds left
var minutesRemaining = floor(obj_manager.secondsRemainingForMoreEnergy / 60);
var secondsRemaining = floor(obj_manager.secondsRemainingForMoreEnergy % 60);
draw_set_font(fnt_Text);
//draw_text(self.x, self.y + 30, string_format(minutesRemaining,2,0) + ":" + string_format(secondsRemaining,2,0));
draw_text(self.x - 60, self.y, obj_manager.convertMinutesAndSecondsToFormattedClockString(minutesRemaining, secondsRemaining));