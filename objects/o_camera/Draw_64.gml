/// @description 

if (global.debug_keys_active) {
	draw_set_alpha(1);
	draw_set_color(c_lime);
	draw_set_font(f_debug);
	var line = 0;
	var txtheight = string_height("A");
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_text(global.resolution_width, txtheight * line++, "camera_w: " + string(camera_get_view_width(v_camera)));
	draw_text(global.resolution_width, txtheight * line++, "camera_h: " + string(camera_get_view_height(v_camera)));
	draw_text(global.resolution_width, txtheight * line++, "res_w: " + string(global.resolution_width));
	draw_text(global.resolution_width, txtheight * line++, "res_h: " + string(global.resolution_height));
}
