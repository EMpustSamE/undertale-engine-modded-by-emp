#region choice
if(Input_IsPressed(INPUT.DOWN) && choice < 5){
	audio_play_sound(snd_menu_switch,0,false);
	choice += 1;
}
if(Input_IsPressed(INPUT.UP) && choice > 0){
	audio_play_sound(snd_menu_switch,0,false);
	choice -= 1;
}
#endregion

#region press left
if(Input_IsPressed(INPUT.LEFT)){
	alarm[0] = 1;
	switch(choice){
		case 0:
			if(Lang_IsExists(_language - 1)){
				_language -= 1;
				audio_play_sound(snd_menu_confirm,0,false);
			}
			break;
		case 2:
			if(_border > 0){
				_border -= 1;
				audio_play_sound(snd_menu_confirm,0,false);
			}
			break;
		case 3:
			if(!(os_type == os_android || os_type == os_ios || os_type == os_winphone)){
				if(_fullscreen){
					_fullscreen = false;
					window_set_fullscreen(_fullscreen);
					audio_play_sound(snd_menu_confirm,0,false);
				}
			}
			break;
		case 4:
			if(_classic_ui){
				_classic_ui = false;
				global.classic_ui = _classic_ui;
				audio_play_sound(snd_menu_confirm,0,false);
			}
			break;
	}
}
#endregion
#region press right
if(Input_IsPressed(INPUT.RIGHT)){
	alarm[0] = 1;
	switch(choice){
		case 0:
			if(Lang_IsExists(_language + 1)){
				_language += 1;
				audio_play_sound(snd_menu_confirm,0,false);
			}
			break;
		case 2:
			if(_border < 1){
				_border += 1;
				audio_play_sound(snd_menu_confirm,0,false);
			}
			break;
		case 3:
			if(!(os_type == os_android || os_type == os_ios || os_type == os_winphone)){
				if(!_fullscreen){
					_fullscreen = true;
					window_set_fullscreen(_fullscreen);
					audio_play_sound(snd_menu_confirm,0,false);
				}
			}
			break;
		case 4:
			if(!_classic_ui){
				_classic_ui = true;
				global.classic_ui = _classic_ui;
				audio_play_sound(snd_menu_confirm,0,false);
			}
			break;
	}
}
#endregion

#region volume
if(Input_IsHeld(INPUT.LEFT)){
	if(choice == 1 && _volume > 0){
		_volume -= 0.01;
	}
}
if(Input_IsHeld(INPUT.RIGHT)){
	if(choice == 1 && _volume < 1){
		_volume += 0.01;
	}
}
world.volume = _volume;
#endregion

if(Input_IsPressed(INPUT.CONFIRM) && choice == 5){
	flag.SaveToFile();
	room_goto(room_menu);
}

with(text_typer){
	if(variable_instance_exists(id,"_id")){
		if(_id == other.choice){
			override_color_text = c_yellow;
		}else{
			override_color_text = c_white;
		}
	}
}
