function Border_Sprite(Border_number){
	var result = noone;
	switch(Border_number){
		case 0:
			result = noone;
			break;
		case 1:
			result = spr_border_simple;
			break;
	}
	return result;
}