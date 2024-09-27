/// @description Insert description here
// You can write your code in this editor
//direction = irandom_range(0, 359);
//speed = irandom_range(2, 6);


moveX = irandom_range(-4,4);
moveY = irandom_range(-20,-10);
myGravity = 1;

image_index = irandom_range(0,4);
image_speed = 0;

soundToPlay = choose(snd_coin1,snd_coin2,snd_coin3,snd_coin4,snd_coin5);

audio_play_sound(soundToPlay,10,false);