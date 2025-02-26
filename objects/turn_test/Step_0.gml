if(start){
	audio_time ++;
	time ++;
}
if(audio_is_playing(audio)){
	if(abs((audio_sound_get_track_position(audio) - (audio_time / 60))) >= 0.02){
		audio_sound_set_track_position(audio,(audio_time / 60));
	}
}
if(keyboard_check_pressed(ord("T"))){
	game_set_speed(60,gamespeed_fps);
}
if(keyboard_check_pressed(ord("I"))){
	game_set_speed(180,gamespeed_fps);
}
if(keyboard_check_pressed(ord("J"))){
	game_set_speed(300,gamespeed_fps);
}
if(keyboard_check_pressed(ord("K"))){
	game_set_speed(600,gamespeed_fps);
}

if(time % beat.bpmToFrames(1) == 0){
	var rand = choose(0,1)
	Battle_MakeBoneTwoV((rand == 0 ? 20 : 620),320,(rand == 0 ? 5 : -5),0,false,0,20,true);
	audio_play_sound(snd_bone_out,0,false);
}

if(Player_GetHp() == 1){
	Player_SetHp(Player_GetHpMax());
	Player_SetKr(0);
}
