/// @description Insert description here
// You can write your code in this editor
if (!global.freezeactors) {
	image_speed = 1;
	var velx = 0;
	var vely = 0;
	switch (v_ball_state) {
		#region // rolling
		case enum_ball_state.rolling:
		v_act_vel_y = 0;
		if (v_act_faceright) velx = v_act_vel_x_max; //clamp(v_act_vel_x + v_act_vel_runaccel, v_act_vel_x_max * -1, v_act_vel_x_max);
		else velx = v_act_vel_x_max *-1; //clamp(v_act_vel_x - v_act_vel_runaccel, v_act_vel_x_max * -1, v_act_vel_x_max);
		
		//handle walls to determine xvel
		if (place_meeting(scr_act_potxpos(id, velx), y, o_wall)) {
			v_ball_life--;
			velx = scr_obj_approachdist_x_at_y_against_obj(id, velx, y, o_wall);
			if (v_act_faceright) v_act_faceright = false;
			else v_act_faceright = true;
		}
		
		//check for falling
		if (!place_meeting(scr_act_potxpos(id, velx), y + 1, o_wall)) v_ball_state = enum_ball_state.falling;
		break;
		#endregion
		#region // falling
		case enum_ball_state.falling:
		//no horizontal motion
		vely = v_act_vel_y + v_act_grv;
		if (place_meeting(x, scr_act_potypos(id, vely), o_wall)) {
			vely = scr_obj_approachdist_y_at_x_against_obj(id, vely, x, o_wall);
			v_ball_state = enum_ball_state.rolling;
		}
		break;
		#endregion
		case enum_ball_state.dying:
		break;
	}
	v_act_vel_x = velx;
	v_act_vel_y = vely;
	event_inherited();
} else image_speed = 0;

if (x < 0) || (x > room_width) instance_destroy(id);
if (y < 0) || (y > room_height) instance_destroy(id);
if (v_ball_life <= 0) instance_destroy(id);