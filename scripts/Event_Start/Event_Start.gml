///@arg event
function Event_Start(){
	var EVENT = argument[0];
	
	with(EVENT){
		currentIndex = 0;
	    timer = 0;
	    active = true;
	    paused = false;
	    lastCustomIndex = -1;
	}
	
	return true;
}