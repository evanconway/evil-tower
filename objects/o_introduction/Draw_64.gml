/// @description Insert description here
// You can write your code in this editor

draw_set_font(f_menu);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
var xx = global.gui_width/intro_x;
var yy = global.gui_height/intro_y;
for (i = 0; i < ds_list_size(stringstodraw); i++) {
	var text = ds_list_find_value(stringstodraw, i);
	draw_text_transformed(xx, yy + lineheight * i * spacer * global.menu_scale_y, text, global.menu_scale_x, global.menu_scale_y, 0);
	//draw_text(xx, yy + lineheight * i, text);
}

if (intro_showbutton) {
	v_intro_blinkalpha += v_intro_blinkrate;
	if (v_intro_blinkalpha > global.menu_maxalpha) {
		v_intro_blinkalpha = v_intro_maxalpha;
		v_intro_blinkrate = v_intro_blinkrate * -1;
	}
	if (v_intro_blinkalpha < 0) {
		v_intro_blinkalpha = 0;
		v_intro_blinkrate = v_intro_blinkrate * -1;
	}	
	
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);	
	draw_text_transformed(global.gui_width/2, global.gui_height/intro_continue_y, intro_cont_text, global.menu_scale_x, global.menu_scale_y, 0);
	
	draw_set_color(c_black);
	draw_set_alpha(v_intro_blinkalpha);
	draw_text_transformed(global.gui_width/2, global.gui_height/intro_continue_y, intro_cont_text, global.menu_scale_x, global.menu_scale_y, 0);
}

if (intro_state == enum_intro_state.fading) {
	draw_set_color(c_black);
	draw_set_alpha(clamp(floor(fade_percent * fade_steps)/fade_steps, 0, 1));
	draw_rectangle(0, 0, global.gui_width, global.gui_height, false);
}