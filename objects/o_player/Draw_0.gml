//this is gross, it draws a massive black box behind the player
//we can't do this in the draw_gui event because then we draw over the player
//but it works!
if (v_plr_state == enum_plr_state.dead)
{
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_rectangle(0, 0, room_width, room_height, false);
}

event_inherited();