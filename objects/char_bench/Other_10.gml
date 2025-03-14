event_inherited();
if(char_player.dir != DIR.DOWN){
	var player = instance_create_depth(x - (left ? 2 : -2),y + 10,depth - 1,char_player_sit);
	player.left = left;
}
