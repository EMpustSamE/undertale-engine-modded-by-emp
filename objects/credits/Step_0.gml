_y -= 0.5;
_a += 0.08;

text.y = _y;

if(_y == -text.height - 24 || Input_IsPressed(INPUT.CONFIRM)){
	event_user(1);
}