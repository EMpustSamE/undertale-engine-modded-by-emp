///@arg event
///@arg text
function Event_Dialog(){
	var EVENT = argument[0];
	var TEXT = argument[1];
	
	Event_AddFunction(EVENT,
	method(
	{
		TEXT: TEXT
	},
	function(){
		if(is_array(TEXT)){
			var len = array_length(TEXT);
			for(i=0;i<len;++i){
				Dialog_Add(TEXT[i]);
			}
		}
		else {
			Dialog_Add(TEXT);	
		}
		Dialog_Start();
	}),
	function(){
		return !Dialog_IsEmpty()||(instance_exists(ui_dialog)&&instance_exists(ui_dialog._inst));
	});
	
	return true;
}