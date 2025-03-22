///@arg event
function Event_Pause(){
	var EVENT = argument[0];
	
	EVENT.paused = true;
	
	return true;
}