/// @description Draw Debug

if (global.debug_keys_active) {
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_set_alpha(1);
	draw_set_font(f_debug);
	draw_set_color(c_lime);
	var display_x = global.resolution_width;
	var display_y = global.resolution_height;
	draw_text(display_x, display_y, "DEBUG")
}