if(Shop_GetNextMenu() == SHOP_MENU.EXIT){
	Dialog_Add("* 拜。")
}

if(Shop_GetState() == SHOP_STATE.DIALOG && Shop_GetNextMenu() == SHOP_MENU.TALK){
	switch(Shop_GetTalkChoice()){
		case 0:
			Dialog_Add("* 这游戏?{sleep 10}&* 没整完呢。");
			break;
		case 1:
			Dialog_Add("* 我?{sleep 10}&* 我啥也不是。");
			break;
		case 2:
			Dialog_Add("* Bug?{sleep 10}&* 联系我就好。");
			break;
		case 3:
			Dialog_Add("* 是我知道。{sleep 10}&* 但我没钱约贴图,{sleep 10}&  所以我只能自己整了。");
	}
}
