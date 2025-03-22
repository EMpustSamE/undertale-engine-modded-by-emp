
ds_list_clear(danmu);


var _temp_list = ds_list_create()
var _count = instance_place_list(x, y, battle_bullet, _temp_list, false);


for (var i = 0; i < _count; i++) {
    var _inst = _temp_list[| i]
    ds_list_add(danmu, _inst)
}


ds_list_destroy(_temp_list)

x=mouse_x
y=mouse_y
