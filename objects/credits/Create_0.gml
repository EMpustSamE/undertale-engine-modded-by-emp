text = noone;
_y = 480
_a = 0;

fader.color = c_black;
Fader_Fade(1,0,60);

bg0 = instance_create_depth(640,480,0,battle_bg);
bg0.image_blend = c_black;
bg0.image_yscale = 2;
bg0.image_angle = 180;
bg0.sin_enable = false;

bg1 = instance_create_depth(0,0,0,battle_bg);
bg1.image_blend = c_black;
bg1.image_yscale = 2;
bg1.sin_enable = false;

event_user(0);