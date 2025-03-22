var _inst = instance_position(x,y, battle_bullet)
if _inst!= noone
{
    var _index = ds_list_find_index(xuanzhong, _inst)
    if _index!=-1 {
        ds_list_delete(xuanzhong, _index)
    }
}