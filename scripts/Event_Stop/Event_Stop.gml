///@arg event
function Event_Stop(){
	var EVENT = argument[0];
	
	EVENT.active = false;
	
	return true;
}