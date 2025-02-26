live;

draw_rectangle_color(460,166,560,188,c_red,c_green,c_green,c_red,false);

draw_set_color(c_black);
draw_rectangle(561,189,459 + (_volume * 102),165,false);

draw_set_halign(fa_center);
draw_set_font(Lang_GetFont(Lang_GetString("font.menu.0")));
var color = (choice == 1 ? c_yellow : c_white);
draw_text_transformed_color(510,160,string(round(_volume * 100)) + "%",2,2,0,color,color,color,color,1);
