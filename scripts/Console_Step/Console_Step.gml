function Console_Step() {
	if(GMU_CONSOLE_ENABLED){
		repeat(Console_GetInputNumber()){
			var input=Console_GetInput();
			show_debug_message("] "+input);
			Console_ExecuteCmd(input);
			Console_PopInput();
		}
		return true;
	}else{
		return false;
	}


}
