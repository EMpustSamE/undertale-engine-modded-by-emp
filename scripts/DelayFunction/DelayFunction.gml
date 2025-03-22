///@arg function
///@arg delay
function DelayFunction(){
	var FUNCTION = argument[0];
	var DELAY = argument[1];
	
	e = Event_Create();
	Event_AddSleep(e,DELAY);
	Event_AddFunction(e,FUNCTION);
	Event_AddFunction(e,
	function(){
		Event_Delete(e);
	});
	Event_Push(e);
	Event_Start(e);
	
	return e;
}