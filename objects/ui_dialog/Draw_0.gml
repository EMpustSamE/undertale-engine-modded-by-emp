if (!surface_exists(_surface_text)) _surface_text = surface_create(640, 480);
surface_set_target(global.surface_gui);
if (_top) {
    draw_sprite_ext(spr_pixel, 0, 32, 10, 578, 152, 0, c_white, 1);
    draw_sprite_ext(spr_pixel, 0, 38, 16, 566, 140, 0, c_black, 1);
} else {
    draw_sprite_ext(spr_pixel, 0, 32, 320, 578, 152, 0, c_white, 1);
    draw_sprite_ext(spr_pixel, 0, 38, 326, 566, 140, 0, c_black, 1);
}
draw_surface(_surface_text, 0, 0);
surface_reset_target();
surface_set_target(_surface_text);
draw_clear_alpha(c_white, 0);
surface_reset_target();