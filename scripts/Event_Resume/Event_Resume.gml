///@arg event
function Event_Resume(){
	var EVENT = argument[0];
	
	EVENT.paused = false;
	
	return true;
}