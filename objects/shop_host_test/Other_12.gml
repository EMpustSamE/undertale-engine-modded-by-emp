if(Shop_GetState() == SHOP_STATE.MENU && Shop_GetMenu() == SHOP_MENU.BUY){
	//if(Shop_GetBuyResult() == SHOP_BUY_RESULT.NULL){
		var tt = Lang_GetString("shop.menu.buy");
		if(Shop_GetRightDialog() != tt){
			Shop_SetRightDialog(tt);
		}
	//}
}
if(Shop_GetState() == SHOP_STATE.MENU && Shop_GetMenu() == SHOP_MENU.TALK){
	var tt = Lang_GetString("shop.menu.talk");
	if(Shop_GetRightDialog() != tt){
		Shop_SetRightDialog(tt);
	}
}
