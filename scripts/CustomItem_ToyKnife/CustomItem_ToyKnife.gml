function CustomItem_ToyKnife() : ItemTypeSimple("toy_knife") constructor{
	price =1145;
	_shop_description = "Toyknife"
	function OnUse(inventory,index){
		Dialog_Add(Item_GetTextEquip(GetName()));
		Dialog_Start();

		var curWeapon=Player_GetItemWeapon();
		inventory.Set(index,curWeapon);
		Player_SetItemWeapon(ITEM_TOY_KNIFE);

		Player_SetAtkItem(3);

		audio_play_sound(snd_item_equip,0,false);
	}
}