/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
draw_self()
for (var i = 0; i < ds_list_size(danmu); i++) 
{
    var _inst = danmu[| i]
    draw_set_color(c_white)
    draw_text(_inst.x,_inst.y-20,"Collision:\nX: "+string(_inst.x)+"\nY: "+string(_inst.y)+"\nAngle: "+string(_inst.image_angle))
}
for (var i = 0; i < ds_list_size(xuanzhong); i++)
{
    var _inst = xuanzhong[| i]
    if instance_exists(_inst)
	{
        draw_set_color(#FF00EE)
        draw_text(_inst.x,_inst.y-20,"SELECTED:\nX: "+string(_inst.x)+"\nY: "+string(_inst.y)+"\nAngle: "+string(_inst.image_angle))
    }
	else
	{
        ds_list_delete(xuanzhong, i)
        i--
    }
}