
/*
draw_set_color(c_yellow)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
var _y = 20
for (var i = 0; i < array_length(collided_instance); i++) 
{
    var inst = collided_instance[i]
    draw_text(20, _y, "Obj " + string(i+1) + ": X=" + string(round(inst.x)) + ", Y=" + string(round(inst.y)))
    _y += 20
}