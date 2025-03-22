///@arg event
function Event_Push(){
	var EVENT = argument[0];
	
	array_push(global.events,EVENT);
	
	return true;
}