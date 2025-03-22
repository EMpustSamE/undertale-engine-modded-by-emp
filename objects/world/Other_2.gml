Anim_Init();
Lang_Init();
Shop_Init();
Event_Init();
Item_Init();
Storage_Init();
Encounter_Init();
BGM_Init();
Dialog_Init();
Demo_Init();
Console_Init();
Console_SetStatusNumber(3);
Console_SetStatusRatio(0,2/11);
Console_SetStatusRatio(1,8/11);
Console_SetStatusRatio(2,11/11);

Input_Init();
Input_Bind(INPUT.CONFIRM,INPUT_TYPE.KEYBOARD,0,vk_enter);
Input_Bind(INPUT.CONFIRM,INPUT_TYPE.KEYBOARD,0,ord("Z"));
Input_Bind(INPUT.CANCEL,INPUT_TYPE.KEYBOARD,0,vk_shift);
Input_Bind(INPUT.CANCEL,INPUT_TYPE.KEYBOARD,0,ord("X"));
Input_Bind(INPUT.MENU,INPUT_TYPE.KEYBOARD,0,vk_control);
Input_Bind(INPUT.MENU,INPUT_TYPE.KEYBOARD,0,ord("C"));
Input_Bind(INPUT.UP,INPUT_TYPE.KEYBOARD,0,vk_up);
Input_Bind(INPUT.DOWN,INPUT_TYPE.KEYBOARD,0,vk_down);
Input_Bind(INPUT.LEFT,INPUT_TYPE.KEYBOARD,0,vk_left);
Input_Bind(INPUT.RIGHT,INPUT_TYPE.KEYBOARD,0,vk_right);

Lang_LoadList();
Lang_LoadString(1);
Lang_LoadSprite(1);
Lang_LoadFont(1);

instance_create_depth(0,0,0,camera);
instance_create_depth(0,0,0,fader);
instance_create_depth(0,0,0,border);
instance_create_depth(0,0,0,closed_captions);
instance_create_depth(0,0,0,obj_debug);

application_surface_draw_enable(false);

show_debug_message("UNDERTALE by Toby Fox");
show_debug_message("UNDERTALE Engine by TML");
show_debug_message("UNDERTALE Engine Ultra by znm");
show_debug_message("UNDERTALE Engine Modded By EMP by EMpustSamE");
show_debug_message("Engine Version: "+ENGINE_VERSION);
show_debug_message("Game Name: "+GAME_NAME);
show_debug_message("Game Author: "+GAME_AUTHOR);
show_debug_message("Game Version: "+GAME_VERSION);

if(os_type == os_android || os_type == os_ios || os_type == os_winphone){
	instance_create_depth(0,0,0,mobile_controller);
}

Storage_GetSettings().LoadFromFile();
volume = Storage_GetSettingsFlag(FLAG_SETTINGS_VOLUME,1);
global.classic_ui = Storage_GetSettingsFlag(FLAG_SETTINGS_CLASSIC_UI,global.classic_ui);

room_goto_next();