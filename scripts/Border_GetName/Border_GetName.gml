function Border_GetName(Border_Number){
	var result = "";
	switch(Border_Number){
		case 0:
			result = "None";
			break;
		case 1:
			result  = "Simple";
			break;
	}
	return result;
}