if(!_gui){
	if(_choice!=-1){
		surface_set_target(_surface_target);
		draw_sprite_ext(spr_battle_soul,0,x+_choice_soul_x,y+_choice_soul_y,1,1,90 * !global.classic_ui,c_red,1);
		surface_reset_target();
	}
}
