///@arg event
///@arg text
///@arg result
function Event_Choice(){
	var EVENT = argument[0];
	var TEXT = argument[1];
	var RESULT = argument[2];
	
	Event_AddFunction(EVENT,
	method(
	{
		TEXT: TEXT
	},
	function(){
		Dialog_Add(TEXT+"{choice `CHOICE`}");
		Dialog_Start();
	}),
	method(
	{
		RESULT: RESULT
	},
	function(){
		if(!Dialog_IsEmpty()||(instance_exists(ui_dialog)&&instance_exists(ui_dialog._inst))){
			return true;
		}
		else{
			RESULT(Player_GetTextTyperChoice());
			if(!Dialog_IsEmpty()||(instance_exists(ui_dialog)&&instance_exists(ui_dialog._inst))){
				return true;
			}
			else{
				return false;
			}
		}
	}));
	
	return true;
}