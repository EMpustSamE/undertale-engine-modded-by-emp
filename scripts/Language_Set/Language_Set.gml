function Language_Set(Language,Default = 0){
	if(Lang_IsExists(Language)){
		Lang_Uninit();
		Lang_Init();
		Lang_LoadList();
		Lang_LoadFont(Language);
		Lang_LoadSprite(Language);
		Lang_LoadString(Language);
		Encounter_Custom();
		Shop_Custom();
		with(text_typer){
			event_user(5);
		}
	}else{
		Lang_Uninit();
		Lang_Init();
		Lang_LoadList();
		Lang_LoadFont(Default);
		Lang_LoadSprite(Default);
		Lang_LoadString(Default);
		Encounter_Custom();
		Shop_Custom();
		with(text_typer){
			event_user(5);
		}
	}
}