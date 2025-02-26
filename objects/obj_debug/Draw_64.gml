draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(font_mars_needs_cunnilingus);
//draw_set_color(make_color_hsv(hue % 255,255,255));
draw_text_color(0,0,"DEBUG", make_color_rgb(random(256), random(256), random(256)), make_color_rgb(random(256), random(256), random(256)), make_color_rgb(random(256), random(256), random(256)), make_color_rgb(random(256), random(256), random(256)),1);
draw_set_font(Lang_GetFont(Lang_GetString("font.battle.0")));
draw_text_transformed_color(0,30,string("Console Enable:{0}",console_enable),1,1,0, make_color_rgb(random(256), random(256), random(256)), make_color_rgb(random(256), random(256), random(256)), make_color_rgb(random(256), random(256), random(256)), make_color_rgb(random(256), random(256), random(256)),1);
