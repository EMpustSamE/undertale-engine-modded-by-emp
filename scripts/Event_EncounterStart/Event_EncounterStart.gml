///@arg event
///@arg encounter_id
///@arg *anim
///@arg *exclamation
function Event_EncounterStart(){
	var EVENT = argument[0];
	var ENCOUNTER_ID = argument[1];
	var ANIM = true;
	var EXCLAMATION = true;
	if(argument_count >= 3){
		ANIM = argument[2];
	}
	if(argument_count >= 4){
		EXCLAMATION = argument[3];
	}
	
	Event_AddFunction(EVENT,
	method(
	{
		ENCOUNTER_ID: ENCOUNTER_ID,
		ANIM: ANIM,
		EXCLAMATION: EXCLAMATION
	},
	function(){
		Encounter_Start(ENCOUNTER_ID,ANIM,EXCLAMATION);
	}),
	function(){
		return (instance_exists(encounter_anim)||room == room_battle);
	});
	
	return true;
}