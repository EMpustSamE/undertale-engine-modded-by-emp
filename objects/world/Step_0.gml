Anim_Step();
BGM_Step();
Event_Step();

if(_time>=60){
	var z=Storage_GetStaticGeneral();
	var time=z.Get(FLAG_STATIC_TIME,0);
	z.Set(FLAG_STATIC_TIME,time+1);
	_time=0;
}else{
	_time+=1;
}

if(Game_GetFrameSkip()>0){
	if(_frame_skip>=Game_GetFrameSkip()){
		draw_enable_drawevent(true);
		_frame_skip=0;
	}else{
		_frame_skip+=1;
		draw_enable_drawevent(false);
	}
}else{
	draw_enable_drawevent(true);
}

if(keyboard_check_pressed(vk_f2)){
	game_restart();
}

if(keyboard_check_pressed(192)){
	Console_SetVisible(!Console_IsVisible());
}

Console_SetStatusText(0,"FPS: "+string(fps));
Console_SetStatusText(1,"Room: "+string(room)+"("+room_get_name(room)+")");
Console_SetStatusText(2,"InstC: "+string(instance_count));

Console_Step();

if(keyboard_check_pressed(vk_f4)&&!keyboard_check(vk_alt)&&!keyboard_check(vk_control)&&!keyboard_check(vk_shift)){
	window_set_fullscreen(!window_get_fullscreen());
}

if(volume >= 1){
	volume = 1;
}
if(volume <= 0){
	volume = 0;
}

audio_master_gain(volume);
