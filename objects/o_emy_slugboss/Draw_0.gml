event_inherited();

if (v_act_state_cur != undefined) {
	draw_set_font(f_debug);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_color(c_white);
	draw_text(x, y, v_act_state_cur.v_state_name);
}
