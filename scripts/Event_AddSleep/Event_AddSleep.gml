///@arg event
///@arg sleep
function Event_AddSleep(){
	var EVENT = argument[0];
	var DELAY = argument[1];
	
	array_push(EVENT.functions,{init: function(){},update: function(){return false;}});
	array_push(EVENT.delays,DELAY);
	
	return true;
}