/// @description Debug Info

if (v_plr_data) {
	//debug states
	var x_offset = 1;
	draw_set_font(f_debug);
	var s_height = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
	draw_set_alpha(1);
	draw_set_color(c_dkgray);
	var num_of_items = 16;
	draw_rectangle(0, 0, 67, (s_height * num_of_items), false);
	
	draw_set_color(c_lime);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	//the y value in these is incrementing place for the text
	var y_offset = 1;
	draw_text(x_offset, y_offset++ * s_height, "FPS: " + string(fps_real));
	draw_text(x_offset, y_offset++ * s_height, "X:" + string(x) + " Y:" + string(y));
	
	draw_text(x_offset, y_offset++ * s_height, "Vel X: " + string(v_act_vel_x));
	draw_text(x_offset, y_offset++ * s_height, "Vel Y: " + string(v_act_vel_y));
	
	draw_text(x_offset, y_offset++ * s_height, "Start X: " + string(v_act_input_x_start));
	draw_text(x_offset, y_offset++ * s_height, "Start Y: " + string(v_act_input_y_start));
	
	if (v_act_state_cur != undefined) draw_text(x_offset, y_offset++ * s_height, v_act_state_cur.v_state_name);
	else draw_text(x_offset, y_offset++ * s_height, "Undefined");
	
	draw_text(x_offset, y_offset++ * s_height, "I Lock: " + string(v_act_inputlocktime));
	
	if (v_act_image_change) draw_text(x_offset, y_offset++ * s_height, "img c: true");
	else draw_text(x_offset, y_offset++ * s_height, "img c:");
	
	if (v_act_sprite_change) draw_text(x_offset, y_offset++ * s_height, "spr c: true");
	else draw_text(x_offset, y_offset++ * s_height, "spr c:");
}

//scr_debug_blocking();
