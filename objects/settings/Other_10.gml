live;

obj_title = instance_create_depth(320,40,0,text_typer,{_id : -1});
#region left texts
obj_language = instance_create_depth(80,120,0,text_typer,{_id : 0});
obj_volume = instance_create_depth(80,160,0,text_typer,{_id : 1});
obj_border = instance_create_depth(80,200,0,text_typer,{_id : 2});
obj_fullscreen = instance_create_depth(80,240,0,text_typer,{_id : 3});
obj_classic_ui = instance_create_depth(80,280,0,text_typer,{_id : 4});
obj_back = instance_create_depth(80,320,0,text_typer,{_id : 5});
obj_language.override_color_text_enabled = true;
obj_volume.override_color_text_enabled = true;
obj_border.override_color_text_enabled = true;
obj_fullscreen.override_color_text_enabled = true;
obj_classic_ui.override_color_text_enabled = true;
obj_back.override_color_text_enabled = true;
#endregion

#region right texts
language_index = instance_create_depth(560,120,0,text_typer,{_id : 0});
border_index = instance_create_depth(560,200,0,text_typer,{_id : 2});
fullscreen_index = instance_create_depth(560,240,0,text_typer,{_id : 3});
classic_ui_index = instance_create_depth(560,280,0,text_typer,{_id : 4});
language_index.override_color_text_enabled = true;
border_index.override_color_text_enabled = true;
fullscreen_index.override_color_text_enabled = true;
classic_ui_index.override_color_text_enabled = true;
#endregion

with(text_typer){
	if(variable_instance_exists(id,"_id")){
		depth = other.depth - 1;
	}
}

#region left texts text
obj_title.text = _pre + "{outline true}{align 1}" + Lang_GetString("settings.title");
obj_language.text = _pre + Lang_GetString("settings.language");
obj_volume.text = _pre + Lang_GetString("settings.volume");
obj_border.text = _pre + Lang_GetString("settings.border");
obj_fullscreen.text = _pre + Lang_GetString("settings.fullscreen");
obj_classic_ui.text = _pre + Lang_GetString("settings.classic");
obj_back.text = _pre + Lang_GetString("settings.back");
#endregion

#region right texts text
language_index.text = _pre + "{align 2}" + Lang_GetString("settings.language.index");
border_index.text = _pre + "{align 2}" + Border_GetName(_border);
fullscreen_index.text = _pre + "{align 2}" + ((os_type == os_android || os_type == os_ios || os_type == os_winphone) ? Lang_GetString("settings.na") : (_fullscreen ? Lang_GetString("settings.on") : Lang_GetString("settings.off")));
classic_ui_index.text = _pre + "{align 2}" + ((os_type == os_android || os_type == os_ios || os_type == os_winphone) ? Lang_GetString("settings.na") : (_classic_ui ? Lang_GetString("settings.on") : Lang_GetString("settings.off")));
#endregion
