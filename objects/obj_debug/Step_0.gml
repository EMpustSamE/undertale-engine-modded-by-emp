if(keyboard_check_pressed(vk_insert)){
	console_enable = (!console_enable);
}

if(console_enable && !instance_exists(obj_console)){
	instance_create_depth(0,0,0,obj_console);
}
if(!console_enable){
	instance_destroy(obj_console);
}
