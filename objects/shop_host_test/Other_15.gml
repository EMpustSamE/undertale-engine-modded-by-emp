bc = Shop_GetBuyChoice();
if(Shop_GetBuyResult() == SHOP_BUY_RESULT.YES){
	if(Player_GetGold() >= Shop_GetBuyPrice(bc)){
		if(Item_GetNumber() < 8){
			audio_play_sound(snd_buyitem,0,false);
			Player_SetGold(Player_GetGold() - Shop_GetBuyPrice(bc));
			Item_GetInventoryItems().Add(ITEM_DICE);
		}
	}
}
