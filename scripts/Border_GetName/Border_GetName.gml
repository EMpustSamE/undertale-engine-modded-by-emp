function Border_GetName(Border_Number){
	var result = "";
	switch(Border_Number){
		case 0:
			result = Lang_GetString("settings.border.none");
			break;
		case 1:
			result  = Lang_GetString("settings.border.simple");
			break;
	}
	return result;
}