/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_coin_sheet,23,25,25);

draw_set_font(fnt_moneyCount);
draw_text(50, 5, " " + string(currentMoney));