/// @description Debug Info

if (global.player_data) {
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
	
	if (v_act_state_cur != undefined) draw_text(x_offset, y_offset++ * s_height, v_act_state_cur.v_state_name);
	else draw_text(x_offset, y_offset++ * s_height, "Undefined");
	
	draw_text(x_offset, y_offset++ * s_height, "I Lock: " + string(v_act_inputlocktime));
	
	if (v_act_image_change) draw_text(x_offset, y_offset++ * s_height, "img c: true");
	else draw_text(x_offset, y_offset++ * s_height, "img c:");
	
	if (v_act_sprite_change) draw_text(x_offset, y_offset++ * s_height, "spr c: true");
	else draw_text(x_offset, y_offset++ * s_height, "spr c:");
}

/*OLD CODE
if (global.draw_hud) && (v_plr_state != enum_plr_state.dead)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_rectangle(0, 0, global.resolution_width, 16, false);
	for (i = 0; i < global.player_health; i++)
	{
		draw_sprite(s_heart, 10, 0 + i*13, 0);
	}
	
	draw_set_font(f_menu);
	draw_set_color(c_white);
	draw_text(75, 2, "The Wizard's Tower   Area: " + room_get_name(room));
	draw_set_halign(fa_right);
	draw_text(global.resolution_width-10, 2, "Alpha Build");
}

if (global.player_data)
{
	//debug states
	var x_offset = 3;
	draw_set_font(f_debug);
	var s_height = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
	draw_set_alpha(1);
	draw_set_color(c_dkgray);
	var num_of_items = 16;
	draw_rectangle(0, 0, v_plr_boxlength, (s_height * num_of_items), false);
	
	draw_set_color(c_lime);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	//the y value in these is incrementing place for the text
	var y_offset = 1;
	draw_text(x_offset, y_offset++ * s_height, "FPS: " + string(fps_real));
	draw_text(x_offset, y_offset++ * s_height, "X:" + string(x) + " Y:" + string(y));
	
	draw_text(x_offset, y_offset++ * s_height, "Player State:");

	switch (v_plr_state)
	{
		case enum_plr_state.spawn:
		draw_text(x_offset, y_offset++ * s_height, "spawn");
		break;
		case enum_plr_state.gnd_idle:
		draw_text(x_offset, y_offset++ * s_height, "gnd_idle");
		break;
		case enum_plr_state.gnd_run:
		draw_text(x_offset, y_offset++ * s_height, "gnd_run");
		break;
		case enum_plr_state.gnd_struggle:
		draw_text(x_offset, y_offset++ * s_height, "struggle");
		break;
		case enum_plr_state.gnd_crouch:
		draw_text(x_offset, y_offset++ * s_height, "gnd_crouch");
		break;
		case enum_plr_state.air_up:
		draw_text(x_offset, y_offset++ * s_height, "air_up");
		break;
		case enum_plr_state.air_dn:
		draw_text(x_offset, y_offset++ * s_height, "air_dn");
		break;
		case enum_plr_state.ladder_idle:
		draw_text(x_offset, y_offset++ * s_height, "ladder_idle");
		break;
		case enum_plr_state.ladder_up:
		draw_text(x_offset, y_offset++ * s_height, "ladder_up");
		break;
		case enum_plr_state.ladder_dn:
		draw_text(x_offset, y_offset++ * s_height, "ladder_dn");
		break;
		case enum_plr_state.ladder_fall:
		draw_text(x_offset, y_offset++ * s_height, "ladder_fall");
		break;
		case enum_plr_state.hurt:
		draw_text(x_offset, y_offset++ * s_height, "hurt");
		break;
		case enum_plr_state.hurt_ladder:
		draw_text(x_offset, y_offset++ * s_height, "hurt_ladder");
		break;
		case enum_plr_state.dead:
		draw_text(x_offset, y_offset++ * s_height, "dead");
		break;
		case enum_plr_state.door:
		draw_text(x_offset, y_offset++ * s_height, "door");
		break;
		case enum_plr_state.elevator:
		draw_text(x_offset, y_offset++ * s_height, "elevator");
		break;
		case enum_plr_state.wall_slide:
		draw_text(x_offset, y_offset++ * s_height, "wall_slide");
		break;
		case enum_plr_state.gnd_attack:
		draw_text(x_offset, y_offset++ * s_height, "attack");
		break;
		case enum_plr_state.gnd_crouchattack:
		draw_text(x_offset, y_offset++ * s_height, "gnd_c_attack");
		break;
	}

	draw_text(x_offset, y_offset++ * s_height, "Img Spd:" + string(image_speed));
	draw_text(x_offset, y_offset++ * s_height, "Img Idx:" + string(image_index));

	draw_text(x_offset, y_offset++ * s_height, "Vel X:" + string(v_act_vel_x));
	draw_text(x_offset, y_offset++ * s_height, "Vel Y:" + string(v_act_vel_y));

	draw_text(x_offset, y_offset++ * s_height, "X Start:" + string(v_act_input_x_start));
	draw_text(x_offset, y_offset++ * s_height, "Y Start:" + string(v_act_input_y_start));

	draw_text(x_offset, y_offset++ * s_height, "Frz Act:" + string(global.freezeactors));

	draw_text(x_offset, y_offset++ * s_height, "Ladr:" + string(v_plr_ladder_on_obj));

	draw_text(x_offset, y_offset++ * s_height, "b_left:" + string(bbox_left));
	draw_text(x_offset, y_offset++ * s_height, "b_right:" + string(bbox_right));
	draw_text(x_offset, y_offset++ * s_height, "b_top:" + string(bbox_top));
	draw_text(x_offset, y_offset++ * s_height, "b_bot:" + string(bbox_bottom));
}

