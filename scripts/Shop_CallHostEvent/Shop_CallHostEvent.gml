///@arg event
function Shop_CallHostEvent(){
	var EVENT=argument[0];
	var INST=Shop_GetHost(Storage_GetTempFlag(FLAG_TEMP_SHOP));
	if(instance_exists(INST)){
		with(INST){
			event_user(EVENT);
		}
	}
	return true;
}