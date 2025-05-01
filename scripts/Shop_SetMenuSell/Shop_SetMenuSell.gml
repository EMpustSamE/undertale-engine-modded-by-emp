///@arg menu_0_for_menu_1_for_confirm
function Shop_SetMenuSell(){
	var MENU = argument[0];
	
	shop._menu_sell = MENU;
	
	if(MENU = 0){
		//更新文字
		var text="";
		var text2="";
		for(i=0;i<8;i+=2){
			if(Item_GetTypeManager().Contains(Item_GetInventoryItems().GetOrEmpty(i))){
				text += string(Item_GetInventoryItems().GetItemPriceSell(i))+"G - "+Item_GetInventoryItems().GetItemName(i)+"&";
			}
			if(Item_GetTypeManager().Contains(Item_GetInventoryItems().GetOrEmpty(i+1))){
				text2 += string(Item_GetInventoryItems().GetItemPriceSell(i+1))+"G - "+Item_GetInventoryItems().GetItemName(i+1)+"&";
			}
		}
		for(i=0;i<4-((Item_GetNumber()+1) div 2);i+=1){
			text += "&";
		}
		text += Lang_GetString("shop.menu.exit");
		Shop_SetDialog(text,true);
		Shop_SetDialog(text2,true,true);
		Dialog_Clear();
	}
	else{
		Shop_SetDialog("{choice_switch_sound false}{instant true}{define `ITEM` `"+string(Item_GetInventoryItems().GetItemName(shop._sell_choice))+"`}{define `PRICE` `"+string(Item_GetInventoryItems().GetItemPriceSell(shop._sell_choice))+"`}{font 1}{space_y 4}{scale 2}{shadow true}{gui false}{depth "+string(DEPTH_SHOP.DIALOG)+"}"+Lang_GetString("shop.menu.sell.confirm"));
		if(instance_exists(shop._inst_dialog[1])){
			instance_destroy(shop._inst_dialog[1]);
		}
	}
	
	return true;
}