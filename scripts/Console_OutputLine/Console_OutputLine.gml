///@arg text
function show_debug_message() {
	if(GMU_CONSOLE_ENABLED){
		return external_call(global._gmu_console_function_output_line,argument[0]);
	}else{
		return false;
	}


}
