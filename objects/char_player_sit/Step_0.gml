event_inherited();

image_yscale = (yscale + ((-(sin((_sin * 0.3)))) * a));
if(left){
    image_xscale = yscale + (sin((_sin * -0.3)) * a);
}else{
    image_xscale = -yscale + (sin(_sin * -0.3) * a);
}
if(a > 0){
    a -= 0.02;
}else{
    a = 0;
}
_sin ++;

if(Input_IsPressed(INPUT.LEFT) || Input_IsPressed(INPUT.RIGHT) || Input_IsPressed(INPUT.DOWN)){
	instance_destroy();
    char_player.visible = true;
    char_player._moveable_sit = true;
    char_player.x = x + (left ? -4 : 4);
    char_player.y = y + 15;
}