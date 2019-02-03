/// @description for drawing text fades

if (v_intro_alpha > 0) {
	draw_set_alpha(v_intro_alpha);
	draw_set_color(c_black);
	draw_rectangle(0, 0, global.resolution_width, global.resolution_height, false);
}