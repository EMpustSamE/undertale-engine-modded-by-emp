///@arg event
///@arg char
///@arg dir
///@arg duration
function Event_CharMove(){
	var EVENT = argument[0];
	var CHAR = argument[1];
	var DIRECTION = argument[2];
	var DURATION = argument[3];
	
	Event_AddFunction(EVENT,
	method(
	{
		CHAR: CHAR,
		DIRECTION: DIRECTION,
		DURATION: DURATION
	},
	function(){
		CHAR.move[DIRECTION] = DURATION;
	}),
	method(
	{
		CHAR: CHAR,
		DIRECTION: DIRECTION
	},
	function(){
		return !(CHAR.move[DIRECTION]=0);
	}));
	
	return true;
}