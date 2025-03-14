///@desc Group & Macro
ds_map_add(_map_macro,"true",true);
ds_map_add(_map_macro,"false",false);

ds_map_add(_map_macro,"DIR.UP",DIR.UP);
ds_map_add(_map_macro,"DIR.DOWN",DIR.DOWN);
ds_map_add(_map_macro,"DIR.LEFT",DIR.LEFT);
ds_map_add(_map_macro,"DIR.RIGHT",DIR.RIGHT);

ds_map_add(_map_macro,"FONT.DIALOG",0);
ds_map_add(_map_macro,"FONT.MENU",1);
ds_map_add(_map_macro,"FONT.BATTLE",2);
ds_map_add(_map_macro,"FONT.SANS",3);
ds_map_add(_map_macro,"FONT.PAPYRUS",4);

ds_map_add(_map_macro,"VOICE.NULL",-1);
ds_map_add(_map_macro,"VOICE.DEFAULT",0);
ds_map_add(_map_macro,"VOICE.TYPER",1);
ds_map_add(_map_macro,"VOICE.FLOWEY",2);
ds_map_add(_map_macro,"VOICE.TORIEL",3);
ds_map_add(_map_macro,"VOICE.SANS",4);
ds_map_add(_map_macro,"VOICE.PAPYRUS",5);

_group_font[0,0]=Lang_GetFont(Lang_GetString("font.dialog.0"));
_group_font_scale_x[0,0]=real(Lang_GetString("font.dialog.0.scale.x"));
_group_font_scale_y[0,0]=real(Lang_GetString("font.dialog.0.scale.y"));
_group_font_space_x[0,0]=real(Lang_GetString("font.dialog.0.space.x"));
_group_font[0,1]=Lang_GetFont(Lang_GetString("font.dialog.1"));
_group_font_scale_x[0,1]=real(Lang_GetString("font.dialog.1.scale.x"));
_group_font_scale_y[0,1]=real(Lang_GetString("font.dialog.1.scale.y"));
_group_font_space_x[0,1]=real(Lang_GetString("font.dialog.1.space.x"));
_group_font_space_y[0]=real(Lang_GetString("font.dialog.space.y"));

_group_font[1,0]=Lang_GetFont(Lang_GetString("font.menu.0"));
_group_font_scale_x[1,0]=real(Lang_GetString("font.menu.0.scale.x"));
_group_font_scale_y[1,0]=real(Lang_GetString("font.menu.0.scale.y"));
_group_font_space_x[1,0]=real(Lang_GetString("font.menu.0.space.x"));
_group_font[1,1]=Lang_GetFont(Lang_GetString("font.menu.1"));
_group_font_scale_x[1,1]=real(Lang_GetString("font.menu.1.scale.x"));
_group_font_scale_y[1,1]=real(Lang_GetString("font.menu.1.scale.y"));
_group_font_space_x[1,1]=real(Lang_GetString("font.menu.1.space.x"));
_group_font_space_y[1]=real(Lang_GetString("font.menu.space.y"));

_group_font[2,0]=Lang_GetFont(Lang_GetString("font.battle.0"));
_group_font_scale_x[2,0]=real(Lang_GetString("font.battle.0.scale.x"));
_group_font_scale_y[2,0]=real(Lang_GetString("font.battle.0.scale.y"));
_group_font_space_x[2,0]=real(Lang_GetString("font.battle.0.space.x"));
_group_font[2,1]=Lang_GetFont(Lang_GetString("font.battle.1"));
_group_font_scale_x[2,1]=real(Lang_GetString("font.battle.1.scale.x"));
_group_font_scale_y[2,1]=real(Lang_GetString("font.battle.1.scale.y"));
_group_font_space_x[2,1]=real(Lang_GetString("font.battle.1.space.x"));
_group_font_space_y[2]=real(Lang_GetString("font.battle.space.y"));

_group_font[3,0]=Lang_GetFont(Lang_GetString("font.sans.0"));
_group_font_scale_x[3,0]=real(Lang_GetString("font.sans.0.scale.x"));
_group_font_scale_y[3,0]=real(Lang_GetString("font.sans.0.scale.y"));
_group_font_space_x[3,0]=real(Lang_GetString("font.sans.0.space.x"));
_group_font[3,1]=Lang_GetFont(Lang_GetString("font.sans.1"));
_group_font_scale_x[3,1]=real(Lang_GetString("font.sans.1.scale.x"));
_group_font_scale_y[3,1]=real(Lang_GetString("font.sans.1.scale.y"));
_group_font_space_x[3,1]=real(Lang_GetString("font.sans.1.space.x"));
_group_font_space_y[3]=real(Lang_GetString("font.sans.space.y"));

_group_font[4,0]=Lang_GetFont(Lang_GetString("font.papyrus.0"));
_group_font_scale_x[4,0]=real(Lang_GetString("font.papyrus.0.scale.x"));
_group_font_scale_y[4,0]=real(Lang_GetString("font.papyrus.0.scale.y"));
_group_font_space_x[4,0]=real(Lang_GetString("font.papyrus.0.space.x"));
_group_font[4,1]=Lang_GetFont(Lang_GetString("font.papyrus.1"));
_group_font_scale_x[4,1]=real(Lang_GetString("font.papyrus.1.scale.x"));
_group_font_scale_y[4,1]=real(Lang_GetString("font.papyrus.1.scale.y"));
_group_font_space_x[4,1]=real(Lang_GetString("font.papyrus.1.space.x"));
_group_font_space_y[4]=real(Lang_GetString("font.papyrus.space.y"));

_group_voice[0,0]=snd_text_voice_default;
_group_voice[1,0]=snd_text_voice_typer;
_group_voice[2,0]=snd_text_voice_flowey;
_group_voice[3,0]=snd_text_voice_toriel;
_group_voice[4,0]=snd_text_voice_sans;
_group_voice[5,0]=snd_text_voice_papyrus;

_group_face[0]=face;
