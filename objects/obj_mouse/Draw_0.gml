live

for (var i = 0; i < ds_list_size(xuanzhong); i++) {
    var _inst = xuanzhong[| i];
    if (instance_exists(_inst)) {
        var _sprite = _inst.sprite_index
        var _scale = 1.6
		var _scalex=_inst.image_xscale
        var _color = c_fuchsia
        var _angle = _inst.image_angle;
depth = DEPTH_BATTLE.BULLET
	surface_set_target(Battle_GetBoardSurface());{
        draw_sprite_ext(_sprite,-1,_inst.x,_inst.y,_scalex,_scale,_angle,_color,1)
        draw_sprite_ext(_sprite, -1, _inst.x, _inst.y,_inst.image_xscale,_inst.image_yscale,_inst.image_angle,_inst.image_blend,_inst.image_alpha);
		}surface_reset_target();
	}
	
}

for (var i = 0; i < ds_list_size(danmu); i++) {
    var _inst = danmu[| i];
    if (instance_exists(_inst)) {
        var _sprite = _inst.sprite_index
        var _scale = 1.6
		var _scalex=_inst.image_xscale
        var _color = c_fuchsia
        var _angle = _inst.image_angle;
depth = DEPTH_BATTLE.BULLET
	surface_set_target(Battle_GetBoardSurface());{
        draw_sprite_ext(_sprite,-1,_inst.x,_inst.y,_scalex,_scale,_angle,_color,1)
        draw_sprite_ext(_sprite, -1, _inst.x, _inst.y,_inst.image_xscale,_inst.image_yscale,_inst.image_angle,_inst.image_blend,_inst.image_alpha);
		}surface_reset_target();
	}
	
}
