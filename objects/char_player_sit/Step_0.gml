event_inherited();

image_yscale = yscale + -sin(_sin * 0.3) * a;
_sin += 1;
if(a > 0){
	a -= 0.02;
}

if(Input_IsPressed(INPUT.LEFT) || Input_IsPressed(INPUT.RIGHT) || Input_IsPressed(INPUT.DOWN)){
	char_player._moveable_sit = true;
	char_player.visible = true;
	instance_destroy();
}