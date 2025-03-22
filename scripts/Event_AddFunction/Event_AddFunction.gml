///@arg event
///@arg init
///@arg *update (continue when returns false)
///@arg *delay (after execution)
function Event_AddFunction(){
	var EVENT = argument[0];
	var INIT = argument[1];
	var UPDATE = function(){return false;};
	var PAUSE = 0;
	if(argument_count >= 3){
		UPDATE = argument[2];
	}
	if(argument_count >= 4){
		PAUSE = argument[3];
	}
	
	array_push(EVENT.functions,{init: INIT,update: UPDATE});
	array_push(EVENT.delays,PAUSE);
	
	return true;
}