with(text_typer){
	if(variable_instance_exists(id,"_id")){
		instance_destroy();
	}
}

Language_Set(_language);

Border_SetEnabled(_border == 0 ? false : true);

if(_border != 0){
	Border_SetSprite(Border_Sprite(_border));
}

#region flags
flag_settings.Set(FLAG_SETTINGS_LANGUAGE,_language);
flag_settings.Set(FLAG_SETTINGS_VOLUME,_volume);
flag_settings.Set(FLAG_SETTINGS_BORDER,_border);
flag_settings.Set(FLAG_SETTINGS_FULLSCREEN,_fullscreen);
flag_settings.Set(FLAG_SETTINGS_CLASSIC_UI,_classic_ui);
#endregion

event_user(0);
