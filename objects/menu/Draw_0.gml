if(_menu==0){
	if(_mode==1){
		draw_sprite(spr_bg_area_1,0,0,-120);
	}
}

if(_menu==1){
	draw_set_color(c_white);
	draw_set_font(Lang_GetFont(Lang_GetString("font.menu.0")));
	draw_text_transformed(280/2,110/2,_naming_name,1,1,0);
}

if(_menu==2||_menu==3){
	draw_set_color(c_white);
	draw_set_font(Lang_GetFont(Lang_GetString("font.menu.0")));
	draw_text_transformed((_confirm_name_x+_confirm_name_offset_x)/2,(_confirm_name_y+_confirm_name_offset_y)/2,_naming_name,_confirm_name_scale/2,_confirm_name_scale/2,_confirm_name_angle);
}