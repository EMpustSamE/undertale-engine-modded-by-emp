live;

obj_title = noone;
#region left texts
obj_language = noone;
obj_volume = noone;
obj_border = noone;
obj_fullscreen = noone;
obj_classic_ui = noone;
obj_back = noone;
#endregion

#region right texts
language_index = noone;
border_index = noone;
fullscreen_index = noone;
classic_ui_index = noone;
#endregion

#region flag
flag_settings = Storage_GetSettingsGeneral();
flag = Storage_GetSettings();
#endregion

#region get values from flag
_language = flag_settings.Get(FLAG_SETTINGS_LANGUAGE,0);
_volume = flag_settings.Get(FLAG_SETTINGS_VOLUME,1);
_border = flag_settings.Get(FLAG_SETTINGS_BORDER,0);
_fullscreen = flag_settings.Get(FLAG_SETTINGS_FULLSCREEN,false);
_classic_ui = flag_settings.Get(FLAG_SETTINGS_CLASSIC_UI,global.classic_ui);
#endregion

#region variables
_pre = "{font FONT.MENU}{instant true}{scale 2}";

choice = 0;
#endregion

event_user(0);
