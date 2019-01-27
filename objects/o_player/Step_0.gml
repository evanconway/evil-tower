/// @description Main Logic

if (!global.freezeplayer && !global.pauseactive && !global.scene_active) {
	#region//input

	v_plr_key_left = scr_input_check(false, enum_input.left);
	v_plr_key_right = scr_input_check(false, enum_input.right);
	v_plr_key_up = scr_input_check(false, enum_input.up);
	v_plr_key_dn = scr_input_check(false, enum_input.down);
	v_plr_key_jump = scr_input_check(true, enum_input.button1);

	v_plr_key_pause = scr_input_check(true, enum_input.start);
	v_plr_key_constant_left = keyboard_check_pressed(vk_left);
	v_plr_key_constant_right = keyboard_check_pressed(vk_right);
	v_plr_key_constant_up = keyboard_check_pressed(vk_up);
	v_plr_key_constant_dn = keyboard_check_pressed(vk_down);
	
	if (v_plr_jump_committime > 0) v_plr_jump_committime--;
	
	#endregion
	#region//input lock

	if (!v_plr_input_lock) && (global.input_debugging) {
		if (v_plr_key_constant_left) || 
		(v_plr_key_constant_right) || 
		(v_plr_key_constant_up) || 
		(v_plr_key_constant_dn) {
			v_plr_input_lock = true;
			v_act_input_x = v_plr_key_constant_right - v_plr_key_constant_left;
			v_act_input_y = v_plr_key_constant_dn - v_plr_key_constant_up;
		}
	}

	if (v_plr_key_left) || 
	(v_plr_key_right) || 
	(v_plr_key_up) || 
	(v_plr_key_dn) || 
	(v_plr_key_jump) v_plr_input_lock = false;

	if (!v_plr_input_lock) {
		v_act_input_x = v_plr_key_right - v_plr_key_left;
		v_act_input_y = v_plr_key_dn - v_plr_key_up;
	}
	
	#endregion
	#region//enemy collisions and recovery
	
	if (v_plr_emyhit) && (v_plr_invulnerabletime > 0) v_plr_emyhit = false;
	
	if (v_plr_emyhit) &&
	(v_plr_invulnerabletime <= 0) && 
	(v_plr_state != enum_plr_state.dead) && 
	(v_plr_state != enum_plr_state.hurt) && 
	(v_plr_state != enum_plr_state.hurt_ladder) {
		v_plr_attack_stage = enum_attack_stage.startup;
		global.player_health--;
		if (global.player_health <= 0) {
			scr_plr_setstate(id, enum_plr_state.dead);
		} else {
			scr_playsfx(snd_hurt);
			scr_plr_setstate(id, enum_plr_state.hurt);
			v_plr_hitx = x;
		}
	}
	if (v_plr_invulnerabletime > 0) {
		image_alpha = 0.3;
		v_plr_invulnerabletime--;
	}
	else image_alpha = 1;
	#endregion
	#region//states
	switch (v_plr_state)
	{
		#region//gnd_idle
		case enum_plr_state.gnd_idle:
		v_plr_jump_committime = 0;
		image_speed = 1;
		#region//interacts detect
		if (v_act_input_y != 0) && (v_act_input_x == 0)
		{
			#region//ladders
			if (v_act_input_y < 0) && (place_meeting(x, y, o_ladder))
			{
				v_plr_ladder_on_obj = instance_place(x, y, o_ladder);
				v_plr_climbdelay = v_plr_climbdelay_max;
				scr_plr_setstate(id, enum_plr_state.ladder_idle);
				v_act_vel_x = 0;
				v_act_vel_y = 0;
				break;
			}
			if (v_act_input_y > 0)
			{
				for (i = bbox_left; i <= bbox_right; i++)
				{
					if (position_meeting(i, bbox_bottom + 1, o_ladder))
					{
						v_plr_ladder_on_obj = instance_place(x, bbox_bottom + 1, o_ladder);
						y++;
						v_plr_climbdelay = v_plr_climbdelay_max;
						scr_plr_setstate(id, enum_plr_state.ladder_idle);
						v_act_vel_x = 0;
						v_act_vel_y = 0;
						break;
					}
				}
			}
			#endregion
			#region//doors
			if (scr_input_check(true, enum_input.up)) && (place_meeting(x, y, o_door))
			{
				global.door_playerentered = instance_place(x, y, o_door);
				global.door_newroom = global.door_playerentered.v_door_target_room;
				global.door_exiting = global.door_playerentered.v_door_target_door;
				x = global.door_playerentered.x;
				scr_transition(enum_transition_state.goto,global.door_newroom);
				scr_plr_setstate(id, enum_plr_state.door);
			}
			#endregion
			#region//elevator
			if (scr_input_check(true, enum_input.up)) && (place_meeting(x, y, o_elevator))
			{
				var elevator = instance_place(x, y, o_elevator);
				if (elevator.v_elevator_type == enum_elevator_type.lvl_end || 
				elevator.v_elevator_type = enum_elevator_type.move)
				{
					elevator.v_elevator_playerentered = true;//this is what sets the elevator in motion
					x = elevator.x;
					scr_plr_setstate(id, enum_plr_state.elevator);
				}
			}
			#endregion
		}
		#endregion
		if (scr_input_check(true, enum_input.button1)) scr_playsfx(snd_jump);
		var new_vel_x = clamp(v_act_input_x * v_act_vel_runaccel, v_act_vel_x_max * -1, v_act_vel_x_max);
		var new_vel_y = clamp(v_plr_key_jump * v_act_jumppwr, v_act_vel_y_max * -1, v_act_vel_y_max);
		if (new_vel_x != 0) {
			if (new_vel_y != 0) {
				if (place_meeting(scr_act_potxpos(id, new_vel_x), y, o_wall)) || (place_meeting(x + sign(new_vel_x), y, o_wall)) {
					v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, y, o_wall);
					if (place_meeting(scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall)) {
						v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, scr_act_potxpos(id, v_act_vel_x), o_wall);
						scr_plr_setstate(id, enum_plr_state.air_dn);
					} else {
						v_act_vel_y = new_vel_y;
						scr_plr_setstate(id, enum_plr_state.air_up);
					}
				} else {
					v_act_vel_x = new_vel_x;
					if (place_meeting(scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall)) {
						v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, scr_act_potxpos(id, v_act_vel_x), o_wall);
						scr_plr_setstate(id, enum_plr_state.air_dn);
					} else {
						v_act_vel_y = new_vel_y;
						scr_plr_setstate(id, enum_plr_state.air_up);
					}
				}
			} else {
				v_act_vel_y = new_vel_y;
				if (place_meeting(scr_act_potxpos(id, new_vel_x), y, o_wall)) || (place_meeting(x + sign(new_vel_x), y, o_wall)) {
					v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, y, o_wall);
					if (place_meeting(scr_act_potxpos(id, v_act_vel_x), y + 1, o_wall)) scr_plr_setstate(id, enum_plr_state.gnd_struggle);
					else scr_plr_setstate(id, enum_plr_state.air_dn);
				} else {
					v_act_vel_x = new_vel_x;
					if (place_meeting(scr_act_potxpos(id, v_act_vel_x), y + 1, o_wall)) scr_plr_setstate(id, enum_plr_state.gnd_run);
					else scr_plr_setstate(id, enum_plr_state.air_dn);
				}
			}
		} else {
			v_act_vel_x = new_vel_x;
			if (new_vel_y !=0 ) {
				if (place_meeting(x, scr_act_potypos(id, new_vel_y), o_wall)) {
					v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, x, o_wall);
					scr_plr_setstate(id, enum_plr_state.air_dn);
				} else {
					v_act_vel_y = new_vel_y;
					scr_plr_setstate(id, enum_plr_state.air_up);
				}
			} else {
				v_act_vel_x = new_vel_x;
				v_act_vel_y = new_vel_y;
			}
		}
		//attacking
		if (scr_input_check(true, enum_input.button2)) {
			if (v_plr_state == enum_plr_state.gnd_idle) || (v_plr_state == enum_plr_state.gnd_run) {
				scr_plr_setstate(id, enum_plr_state.gnd_attack);
				v_act_vel_x = 0;
				v_act_vel_y = 0;
			}
		}
		//crouching
		if (scr_input_check(false, enum_input.down) && 
			sprite_index != s_plr_gnd_static_back) {
			if (v_plr_state == enum_plr_state.gnd_idle) || (v_plr_state == enum_plr_state.gnd_run) {
				scr_plr_setstate(id, enum_plr_state.gnd_crouch);
				v_act_vel_x = 0;
				v_act_vel_y = 0;
			}
		}
		break;
		#endregion
		#region//gnd_run
		case enum_plr_state.gnd_run:
		v_plr_jump_committime = 0;
		image_speed = 1;
		var new_vel_x = clamp(v_act_vel_x + v_act_input_x * v_act_vel_runaccel, v_act_vel_x_max * -1, v_act_vel_x_max);
		if (v_act_input_x == 0) new_vel_x += sign(v_act_vel_x) * v_act_vel_runaccel * -1;//deccelerate if no input
		if (v_act_vel_x != 0) && (sign(new_vel_x) != sign(v_act_vel_x)) new_vel_x = 0;//set velocity to 0 if direction has changed
		var new_vel_y = clamp(v_plr_key_jump * v_act_jumppwr, v_act_vel_y_max * -1, v_act_vel_y_max);
		if (scr_input_check(true, enum_input.button1)) scr_playsfx(snd_jump);
		if (new_vel_x != 0) {
			if (new_vel_y != 0) {
				if (place_meeting(scr_act_potxpos(id, new_vel_x), y, o_wall)) || (place_meeting(x + sign(new_vel_x), y, o_wall)) {
					v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, y, o_wall);
					if (place_meeting(scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall)) {
						v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, scr_act_potxpos(id, v_act_vel_x), o_wall);
						scr_plr_setstate(id, enum_plr_state.air_dn);
					} else {
						v_act_vel_y = new_vel_y;
						scr_plr_setstate(id, enum_plr_state.air_up);
					}
				} else {
					v_act_vel_x = new_vel_x;
					if (place_meeting(scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall)) {
						v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, scr_act_potxpos(id, v_act_vel_x), o_wall);
						scr_plr_setstate(id, enum_plr_state.air_dn);
					} else {
						v_act_vel_y = new_vel_y;
						scr_plr_setstate(id, enum_plr_state.air_up);
					}
				}
			} else {
				v_act_vel_y = new_vel_y;
				if (place_meeting(scr_act_potxpos(id, new_vel_x), y, o_wall)) || (place_meeting(x + sign(new_vel_x), y, o_wall)) {
					v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, y, o_wall);
					if (place_meeting(scr_act_potxpos(id, v_act_vel_x), y + 1, o_wall)) scr_plr_setstate(id, enum_plr_state.gnd_struggle);
					else scr_plr_setstate(id, enum_plr_state.air_dn);
				} else {
					v_act_vel_x = new_vel_x;
					if (!place_meeting(scr_act_potxpos(id, v_act_vel_x), y + 1, o_wall)) scr_plr_setstate(id, enum_plr_state.air_dn);
				}
			}
		} else {
			v_act_vel_x = new_vel_x;
			if (new_vel_y !=0 ) {
				if (place_meeting(x, scr_act_potypos(id, new_vel_y), o_wall)) {
					v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, x, o_wall);
					scr_plr_setstate(id, enum_plr_state.air_dn);
				} else {
					v_act_vel_y = new_vel_y;
					scr_plr_setstate(id, enum_plr_state.air_up);
				}
			} else {
				if (v_act_input_x == 0) scr_plr_setstate(id, enum_plr_state.gnd_idle);
				v_act_vel_x = new_vel_x;
				v_act_vel_y = new_vel_y;
			}
		}
		//attacking
		if (scr_input_check(true, enum_input.button2)) {
			if (v_plr_state == enum_plr_state.gnd_idle) || (v_plr_state == enum_plr_state.gnd_run) scr_plr_setstate(id, enum_plr_state.gnd_attack);
		}
		if (scr_input_check(true, enum_input.down)) {
			if (v_plr_state == enum_plr_state.gnd_idle || v_plr_state == enum_plr_state.gnd_run) scr_plr_setstate(id, enum_plr_state.gnd_crouch);
		}
		break;
		#endregion
		#region//gnd_struggle
		case enum_plr_state.gnd_struggle:
		v_plr_jump_committime = 0;
		var new_vel_x = clamp(v_act_vel_x + v_act_input_x * v_act_vel_runaccel, v_act_vel_x_max * -1, v_act_vel_x_max);
		var new_vel_y = clamp(v_plr_key_jump * v_act_jumppwr, v_act_vel_y_max * -1, v_act_vel_y_max);
		if (scr_input_check(true, enum_input.button1)) scr_playsfx(snd_jump);
		if (new_vel_x != 0) {
			if (new_vel_y != 0) {
				if (place_meeting(scr_act_potxpos(id, new_vel_x), y, o_wall))  || (place_meeting(x + sign(new_vel_x), y, o_wall)) {
					v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, y, o_wall);
					if (place_meeting(scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall)) {
						v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, scr_act_potxpos(id, v_act_vel_x), o_wall);
						scr_plr_setstate(id, enum_plr_state.air_dn);
					} else {
						v_act_vel_y = new_vel_y;
						scr_plr_setstate(id, enum_plr_state.air_up);
					}
				} else {
					v_act_vel_x = new_vel_x;
					if (place_meeting(scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall)) {
						v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, scr_act_potxpos(id, v_act_vel_x), o_wall);
						scr_plr_setstate(id, enum_plr_state.air_dn);
					} else {
						v_act_vel_y = new_vel_y;
						scr_plr_setstate(id, enum_plr_state.air_up);
					}
				}
			} else {
				v_act_vel_y = new_vel_y;
				if (place_meeting(scr_act_potxpos(id, new_vel_x), y, o_wall)) || (place_meeting(x + sign(new_vel_x), y, o_wall)) {
					v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, y, o_wall);
					if (!place_meeting(scr_act_potxpos(id, v_act_vel_x), y + 1, o_wall)) scr_plr_setstate(id, enum_plr_state.air_dn);
				} else {
					v_act_vel_x = new_vel_x;
					if (place_meeting(scr_act_potxpos(id, v_act_vel_x), y + 1, o_wall)) scr_plr_setstate(id, enum_plr_state.gnd_run);
					else scr_plr_setstate(id, enum_plr_state.air_dn);
				}
			}
		} else {
			v_act_vel_x = new_vel_x;
			if (new_vel_y !=0 ) {
				if (place_meeting(x, scr_act_potypos(id, new_vel_y), o_wall)) {
					v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, x, o_wall);
					scr_plr_setstate(id, enum_plr_state.air_dn);
				} else {
					v_act_vel_y = new_vel_y;
					scr_plr_setstate(id, enum_plr_state.air_up);
				}
			} else {
				if (v_act_input_x == 0) scr_plr_setstate(id, enum_plr_state.gnd_idle);
				v_act_vel_x = new_vel_x;
				v_act_vel_y = new_vel_y;
			}
		}
		break;
		#endregion
		#region//gnd_crouch
		case enum_plr_state.gnd_crouch:
		v_act_vel_x = 0;
		if (!scr_input_check(false, enum_input.down) || scr_input_check(true, enum_input.left) || scr_input_check(true, enum_input.right)) {
			if (v_act_input_x != 0) scr_plr_setstate(id, enum_plr_state.gnd_run);
			else scr_plr_setstate(id, enum_plr_state.gnd_idle);
		}
		if (scr_input_check(true, enum_input.button2)) scr_plr_setstate(id, enum_plr_state.gnd_crouchattack);
		break;
		#endregion
		#region//gnd_attack
		case enum_plr_state.gnd_attack:
		v_act_vel_x = 0;
		v_act_vel_y = 0;
		switch (v_plr_attack_stage) {
			case enum_attack_stage.startup:
			if (v_plr_attack_startup > 0) v_plr_attack_startup--;
			else {
				v_plr_attack_swing = v_plr_attack_swing_max;
				if (v_act_faceright) instance_create_layer(x + v_plr_swordhitbox_x, y + v_plr_swordhitbox_y, "Hitboxes", o_hitbox_plr_sword);
				else instance_create_layer(x - v_plr_swordhitbox_x, y + v_plr_swordhitbox_y, "Hitboxes", o_hitbox_plr_sword);
				v_plr_attack_stage = enum_attack_stage.swing;
				image_index = 1;
			}
			break;
			case enum_attack_stage.swing:
			if (v_plr_attack_swing > 0) v_plr_attack_swing--;
			else {
				if (v_act_input_x == 0) scr_plr_setstate(id, enum_plr_state.gnd_idle);
				else scr_plr_setstate(id, enum_plr_state.gnd_run);
				v_plr_attack_stage = enum_attack_stage.startup;
			}
			break;
			case enum_attack_stage.recovery:
			if (v_plr_attack_recovery > 0) v_plr_attack_recovery--;
			else {
				if (v_act_input_x == 0) scr_plr_setstate(id, enum_plr_state.gnd_idle);
				else scr_plr_setstate(id, enum_plr_state.gnd_run);
				v_plr_attack_stage = enum_attack_stage.startup;
			}
			break;
		}
		break;
		#endregion
		#region//crouchattack
		case enum_plr_state.gnd_crouchattack:
		v_act_vel_x = 0;
		v_act_vel_y = 0;
		switch (v_plr_attack_stage) {
			case enum_attack_stage.startup:
			if (v_plr_attack_startup > 0) v_plr_attack_startup--;
			else {
				v_plr_attack_swing = v_plr_attack_swing_max;
				if (v_act_faceright) instance_create_layer(x + v_plr_crouchhitbox_x, y + v_plr_crouchhitbox_y, "Hitboxes", o_hitbox_crouch_sword);
				else instance_create_layer(x - v_plr_crouchhitbox_x + 1, y + v_plr_crouchhitbox_y, "Hitboxes", o_hitbox_crouch_sword);//+1 x offset
				v_plr_attack_stage = enum_attack_stage.swing;
				image_index = 1;
			}
			break;
			case enum_attack_stage.swing:
			if (v_plr_attack_swing > 0) v_plr_attack_swing--;
			else {
				if (scr_input_check(false, enum_input.down)) scr_plr_setstate(id, enum_plr_state.gnd_crouch);
				else {
					if (v_act_input_x == 0) scr_plr_setstate(id, enum_plr_state.gnd_idle);
					else scr_plr_setstate(id, enum_plr_state.gnd_run);
				}
				v_plr_attack_stage = enum_attack_stage.startup;
			}
			break;
			//we do not appear to be using the recovery stage, all code here is ignored
			case enum_attack_stage.recovery:
			if (v_plr_attack_recovery > 0) v_plr_attack_recovery--;
			else {
				if (scr_input_check(false, enum_input.down)) scr_plr_setstate(id, enum_plr_state.gnd_crouch);
				else {
					if (v_act_input_x == 0) scr_plr_setstate(id, enum_plr_state.gnd_idle);
					else scr_plr_setstate(id, enum_plr_state.gnd_run);
				}
				v_plr_attack_stage = enum_attack_stage.startup;
			}
			break;
		}
		break;
		#endregion
		#region//air_up
		case enum_plr_state.air_up:
		var new_vel_x = v_act_vel_x;
		if (v_plr_jump_committime <= 0) new_vel_x = clamp(v_act_vel_x + v_act_input_x * v_act_vel_airxaccel, v_act_vel_x_max * -1, v_act_vel_x_max);
		if (v_act_input_x == 0) {//deccelerate if no input
			if (v_plr_jump_committime <= 0) new_vel_x += sign(v_act_vel_x) * v_act_vel_airxaccel * v_plr_air_deccel;
			if (v_act_vel_x != 0 && sign(new_vel_x) != sign(v_act_vel_x)) new_vel_x = 0;//set velocity to 0 if direction has changed
		} 
		var new_vel_y = clamp(v_act_vel_y + v_act_grv, v_act_vel_y_max * -1, v_act_vel_y_max);
		
		/*
		This new_vel_y check is what triggers the state to air_dn.
		If new_vel_y is positive it means the players velocity is going down.
		That can't happen in the air_up state, so the code afterwards is designed
		to treat new_vel_y == 0 as a trigger to set state to air_dn, or 
		possibly a gnd state in rare cases.
		*/
		if (new_vel_y >= 0) new_vel_y = 0;
		
		//check for wall jump, otherwise continue with all other state checks
		var touch_wall = false;
		var wall_x_dist = 0;
		for (ti = 1; ti <= v_plr_walljump_dist; ti++) {
			if (place_meeting(x + (sign(v_act_input_x) * ti), y, o_wall)) {
				touch_wall = true;
				wall_x_dist = ti * sign(v_act_input_x);
				ti = v_plr_walljump_dist;
			}
		}
		if (scr_input_check(true, enum_input.button1) && touch_wall && 
		(v_act_input_x != v_plr_walljump_prev || v_plr_jump_committime <= 0)) {		
			v_plr_walljump_prev = v_act_input_x;//disables immediate wall jump on same wall
			v_act_vel_x = wall_x_dist;
			v_act_vel_y = 0;
			scr_plr_setstate(id, enum_plr_state.wall_slide);
			scr_playsfx(snd_tick);
		} else {
			if (new_vel_x != 0) {
				if (new_vel_y != 0) {
					if (place_meeting(scr_act_potxpos(id, new_vel_x), y, o_wall) || place_meeting(x + sign(new_vel_x), y, o_wall)) {
						v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, y, o_wall);
						var onwall = scr_obj_atxy_is_ontopof_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall);
						var underwall = scr_obj_atxy_is_below_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall);
						if (onwall) || (underwall) {
							v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, scr_act_potxpos(id, v_act_vel_x), o_wall);
							if (onwall) scr_plr_setstate(id, enum_plr_state.gnd_struggle);
							else scr_plr_setstate(id, enum_plr_state.air_dn);
						} else v_act_vel_y = new_vel_y;
					} else {
						v_act_vel_x = new_vel_x;
						var onwall = scr_obj_atxy_is_ontopof_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall);
						var underwall = scr_obj_atxy_is_below_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall);
						if (onwall) || (underwall) {
							v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, scr_act_potxpos(id, v_act_vel_x), o_wall);
							if (onwall) scr_plr_setstate(id, enum_plr_state.gnd_run);
							else scr_plr_setstate(id, enum_plr_state.air_dn);
						} else v_act_vel_y = new_vel_y;
					}
				} else {
					v_act_vel_y = 0;
					if (place_meeting(scr_act_potxpos(id, new_vel_x), y, o_wall)) || (place_meeting(x + sign(new_vel_x), y, o_wall)) {
						v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, y, o_wall);
						var onwall = scr_obj_atxy_is_ontopof_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, v_act_vel_y), o_wall);
						var underwall = scr_obj_atxy_is_below_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, v_act_vel_y), o_wall);
						if (onwall) || (underwall) {
							if (onwall) scr_plr_setstate(id, enum_plr_state.gnd_struggle);
							else scr_plr_setstate(id, enum_plr_state.air_dn);
						} else scr_plr_setstate(id, enum_plr_state.air_dn);
					} else {
						v_act_vel_x = new_vel_x;
						var onwall = scr_obj_atxy_is_ontopof_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, v_act_vel_y), o_wall);
						var underwall = scr_obj_atxy_is_below_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, v_act_vel_y), o_wall);
						if (onwall) scr_plr_setstate(id, enum_plr_state.gnd_run);
						else scr_plr_setstate(id, enum_plr_state.air_dn);
					}
				}
			} else {
				v_act_vel_x = 0;
				if (new_vel_y !=0 ) {
					if (place_meeting(x, scr_act_potypos(id, new_vel_y), o_wall)) || (place_meeting(x, y + sign(new_vel_y), o_wall)) {
						v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, x, o_wall);
						scr_plr_setstate(id, enum_plr_state.air_dn);
					} else v_act_vel_y = new_vel_y;
				} else {
					v_act_vel_y = 0;
					scr_plr_setstate(id, enum_plr_state.air_dn); 
				}
			}
		}
		break;
		#endregion
		#region//air_dn
		case enum_plr_state.air_dn:
		var new_vel_x = v_act_vel_x;
		if (v_plr_jump_committime <= 0) new_vel_x = clamp(v_act_vel_x + v_act_input_x * v_act_vel_airxaccel, v_act_vel_x_max * -1, v_act_vel_x_max);
		if (v_act_input_x == 0) if (v_plr_jump_committime <= 0) new_vel_x += sign(v_act_vel_x) * v_act_vel_airxaccel * v_plr_air_deccel;//deccelerate if no input
		if (v_act_vel_x != 0) && (sign(new_vel_x) != sign(v_act_vel_x)) new_vel_x = 0;//set velocity to 0 if direction has changed
		var new_vel_y = clamp(v_act_vel_y + v_act_grv, v_act_vel_y_max * -1, v_act_vel_y_max);
		if (v_plr_canfastfall) && (scr_input_check(true, enum_input.down)) new_vel_y = v_plr_fastfallspd;//clamp(new_vel_y + v_act_grv, v_act_vel_y_max * -1, v_act_vel_y_max);
		if (new_vel_y < 0) new_vel_y = 0;
		//check for wall jump, otherwise continue with all other state checks
		var touch_wall = false;
		var wall_x_dist = 0;
		for (ti = 1; ti <= v_plr_walljump_dist; ti++) {
			if (place_meeting(x + (sign(v_act_input_x) * ti), y, o_wall)) {
				touch_wall = true;
				wall_x_dist = ti * sign(v_act_input_x);
				ti = v_plr_walljump_dist;
			}
		}
		if (scr_input_check(true, enum_input.button1) && touch_wall && 
		(v_act_input_x != v_plr_walljump_prev || v_plr_jump_committime <= 0)) {
			v_plr_walljump_prev = v_act_input_x;
			v_act_vel_x = wall_x_dist;
			v_act_vel_y = 0;
			scr_plr_setstate(id, enum_plr_state.wall_slide);
			scr_playsfx(snd_tick);
		} else {
			if (new_vel_x != 0) {
				if (new_vel_y != 0) {
					var potentialx = scr_act_potxpos(id, new_vel_x)
					if (place_meeting(potentialx, y, o_wall)) || (place_meeting(x + sign(new_vel_x), y, o_wall)) {
						v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, y, o_wall);
						var onwall = scr_obj_atxy_is_ontopof_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall);
						var underwall = scr_obj_atxy_is_below_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall);
						if (onwall) || (underwall) {
							v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, scr_act_potxpos(id, v_act_vel_x), o_wall);
							if (onwall) scr_plr_setstate(id, enum_plr_state.gnd_struggle);
							//else scr_plr_setstate(id, enum_plr_state.air_dn);
						} else v_act_vel_y = new_vel_y;
					} else {
						v_act_vel_x = new_vel_x;
						var onwall = scr_obj_atxy_is_ontopof_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall);
						var underwall = scr_obj_atxy_is_below_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, new_vel_y), o_wall);
						if (onwall) || (underwall) {
							v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, scr_act_potxpos(id, v_act_vel_x), o_wall);
							if (onwall) {
								if (abs(v_act_vel_x) >= abs(v_act_vel_runaccel)) scr_plr_setstate(id, enum_plr_state.gnd_run);
								else scr_plr_setstate(id, enum_plr_state.gnd_idle);
							}
						} else v_act_vel_y = new_vel_y;
					}
				} else {
					v_act_vel_y = 0;
					if (place_meeting(scr_act_potxpos(id, new_vel_x), y, o_wall)) || (place_meeting(x + sign(new_vel_x), y, o_wall)) {
						v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, y, o_wall);
						var onwall = scr_obj_atxy_is_ontopof_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, v_act_vel_y), o_wall);
						var underwall = scr_obj_atxy_is_below_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, v_act_vel_y), o_wall);
						if (onwall) || (underwall) if (onwall) scr_plr_setstate(id, enum_plr_state.gnd_struggle);
					} else {
						v_act_vel_x = new_vel_x;
						var onwall = scr_obj_atxy_is_ontopof_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, v_act_vel_y), o_wall);
						var underwall = scr_obj_atxy_is_below_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, v_act_vel_y), o_wall);
						if (onwall) scr_plr_setstate(id, enum_plr_state.gnd_run);
					}
				}
			} else {
				v_act_vel_x = 0;
				if (new_vel_y !=0 ) {
					if (place_meeting(x, scr_act_potypos(id, new_vel_y), o_wall)) || (place_meeting(x, y + sign(new_vel_y), o_wall)) {
						v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, x, o_wall);
						var onwall = scr_obj_atxy_is_ontopof_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, v_act_vel_y), o_wall);
						if (onwall) scr_plr_setstate(id, enum_plr_state.gnd_idle);
					} else v_act_vel_y = new_vel_y;
				} else {
					v_act_vel_y = 0;
					var onwall = scr_obj_atxy_is_ontopof_obj(id, scr_act_potxpos(id, v_act_vel_x), scr_act_potypos(id, v_act_vel_y), o_wall);
					if (onwall) scr_plr_setstate(id, enum_plr_state.gnd_idle);
				}
			}
		}
		break;
		#endregion
		#region//wall_slide
		case enum_plr_state.wall_slide:
		
		var wall_velx = 0;
		var wall_vely = 0;
		
		if (v_plr_walljump_time <= 0) {
			scr_playsfx(snd_jump);
			v_plr_jump_committime = v_plr_jump_committime_max;
			if (v_act_faceright) {
				wall_velx = scr_obj_approachdist_x_at_y_against_obj(id, v_act_vel_x_max *-1, y, o_wall);
				wall_vely = scr_obj_approachdist_y_at_x_against_obj(id, v_act_jumppwr, scr_act_potxpos(id, wall_velx), o_wall);
				scr_plr_setstate(id, enum_plr_state.air_up, s_plr_air_up_left);
			} else {
				wall_velx = scr_obj_approachdist_x_at_y_against_obj(id, v_act_vel_x_max, y, o_wall);
				wall_vely = scr_obj_approachdist_y_at_x_against_obj(id, v_act_jumppwr, scr_act_potxpos(id, wall_velx), o_wall);
				scr_plr_setstate(id, enum_plr_state.air_up, s_plr_air_up);
			}
			if (wall_vely > 0) && (place_meeting(x, scr_act_potypos(id, wall_vely), o_wall)) {
				wall_vely = scr_obj_approachdist_y_at_x_against_obj(id, wall_vely, x, o_wall);
				scr_plr_setstate(id, enum_plr_state.gnd_struggle);
			}
		} else v_plr_walljump_time--;
		v_act_vel_x = wall_velx;
		v_act_vel_y = wall_vely;
		break;
		#endregion
		#region//ladder_idle
		case enum_plr_state.ladder_idle:
		image_speed = 0;
		x = v_plr_ladder_on_obj.x;
		scr_plr_ladder_letgo(id);
		v_act_vel_y = 0;//may get overwritten
		if (v_plr_climbdelay > 0) v_plr_climbdelay--;
		else if (v_plr_state == enum_plr_state.ladder_idle || v_plr_state == enum_plr_state.ladder_up || v_plr_state == enum_plr_state.ladder_dn) {
			var new_vel_y = v_act_input_y * v_plr_ladder_climbsp;
			switch (scr_plr_ladder_check_approach(id, o_wall, o_ladder, new_vel_y)) {
				case enum_plr_ladder_check_move.hitwall:
				v_act_vel_y = scr_obj_approachedgeofon_obj_dist_y_at_x(id, o_ladder, new_vel_y, x);//check for edge of ladder instead of start of wall (ladder could be in wall)
				if (!place_meeting(x, scr_act_potypos(id, v_act_vel_y), o_wall) && (new_vel_y > 0)) {//the vel > 0 check is to see fi we're going down
					scr_plr_ladder_release();//If we're at the edge of a ladder, we've hit a wall, and our vel_y was positve, then we're on the ground.
					scr_plr_setstate(id, enum_plr_state.gnd_idle, s_plr_gnd_static_back);
				}
				break;
				case enum_plr_ladder_check_move.touchingnothing:
				v_act_vel_y = new_vel_y;
				scr_plr_ladder_release();
				scr_plr_setstate(id, enum_plr_state.air_dn);
				break;
				case enum_plr_ladder_check_move.nothingbutonground:
				//dscr_act_move_y(id, v_act_vel_y);
				v_act_vel_y = new_vel_y;
				scr_plr_ladder_release();
				scr_plr_setstate(id, enum_plr_state.gnd_idle, s_plr_gnd_static_back);
				break;
				case enum_plr_ladder_check_move.stillonladder:
				v_act_vel_y = new_vel_y;
				if (v_act_vel_y != 0) {
					if (v_act_vel_y < 0) scr_plr_setstate(id, enum_plr_state.ladder_up);
					else scr_plr_setstate(id, enum_plr_state.ladder_dn);
				}
				break;
			}
		}	
		break;
		#endregion
		#region//ladder_up
		case enum_plr_state.ladder_up:
		image_speed = 1;
		if (v_plr_previndex != floor(image_index)) {
			v_plr_previndex = floor(image_index);
			scr_playsfx(snd_tick);
		}
		scr_plr_ladder_letgo(id);
		var new_vel_y = v_act_input_y * v_plr_ladder_climbsp;
		if (v_plr_state == enum_plr_state.ladder_idle || v_plr_state == enum_plr_state.ladder_up || v_plr_state == enum_plr_state.ladder_dn) {
			switch (scr_plr_ladder_check_approach(id, o_wall, o_ladder, new_vel_y)) {
				case enum_plr_ladder_check_move.hitwall:
				v_act_vel_y = scr_obj_approachedgeofon_obj_dist_y_at_x(id, o_ladder, new_vel_y, x) //check for edge of ladder instead of start of wall (ladder could be in wall)
				if (!place_meeting(x, y, o_wall) && (v_act_vel_y > 0)) {//not sure why I bother to check downward movement here
					scr_plr_ladder_release();
					scr_plr_setstate(id, enum_plr_state.gnd_idle, s_plr_gnd_static_back);//this state shouldn't possible from here
				} else scr_plr_setstate(id, enum_plr_state.ladder_idle);
				break;
				case enum_plr_ladder_check_move.touchingnothing:
				v_act_vel_y = new_vel_y;
				scr_plr_ladder_release();
				scr_plr_setstate(id, enum_plr_state.air_dn);
				break;
				case enum_plr_ladder_check_move.nothingbutonground:
				v_act_vel_y = scr_obj_approachedgeofoff_obj__dist_y_at_x(id, o_ladder, new_vel_y, x);
				scr_plr_ladder_release();
				scr_plr_setstate(id, enum_plr_state.gnd_idle, s_plr_gnd_static_back);
				break;
				case enum_plr_ladder_check_move.stillonladder:
				v_act_vel_y = new_vel_y
				if (v_act_vel_y >= 0) {
					v_plr_climbdelay = v_plr_climbdirchangedelay_max;
					scr_plr_setstate(id, enum_plr_state.ladder_idle);
				}
				break;
			}
		}
		break;
		#endregion
		#region//ladder_dn
		case enum_plr_state.ladder_dn:
		image_speed = 1;
		if (v_plr_previndex != floor(image_index)) {
			v_plr_previndex = floor(image_index);
			scr_playsfx(snd_tick);
		}
		var new_vel_y = v_act_input_y * v_plr_ladder_climbsp;
		if (v_plr_state == enum_plr_state.ladder_idle || v_plr_state == enum_plr_state.ladder_up || v_plr_state == enum_plr_state.ladder_dn) {
			switch (scr_plr_ladder_check_approach(id, o_wall, o_ladder, v_act_vel_y)) {
				case enum_plr_ladder_check_move.hitwall:
				v_act_vel_y = scr_obj_approachedgeofon_obj_dist_y_at_x(id, o_ladder, new_vel_y, x);//check for edge of ladder instead of start of wall (ladder could be in wall)
				if (!place_meeting(x, scr_act_potypos(id, v_act_vel_y), o_wall)) {
					scr_plr_ladder_release();
					scr_plr_setstate(id, enum_plr_state.gnd_idle, s_plr_gnd_static_back);
				} else scr_plr_setstate(id, enum_plr_state.ladder_idle);
				break;
				case enum_plr_ladder_check_move.touchingnothing:
				v_act_vel_y = new_vel_y;
				scr_plr_ladder_release();
				scr_plr_setstate(id, enum_plr_state.air_dn);
				break;
				case enum_plr_ladder_check_move.stillonladder:
				v_act_vel_y = new_vel_y;
				if (v_act_vel_y <= 0) {
					v_plr_climbdelay = v_plr_climbdirchangedelay_max;
					scr_plr_setstate(id, enum_plr_state.ladder_idle);
				}
				break;
			}
		}
		break;
		#endregion
		#region//ladder fall
		case enum_plr_state.ladder_fall:
		var new_vel_y = clamp(v_act_vel_y + v_act_grv, v_act_vel_y_max * -1, v_act_vel_y_max);
		if (!place_meeting(x, scr_act_potypos(id, new_vel_y), o_wall)) {
			scr_plr_setstate(id, enum_plr_state.air_dn);
			break;
		}
		// misses cases where ladder passes through tight space that fits player height
		switch (scr_plr_ladder_check_approach(id, o_wall, o_ladder, new_vel_y))
		{
			case enum_plr_ladder_check_move.stillonladder:
			v_act_vel_y = new_vel_y;
			break;
			case enum_plr_ladder_check_move.touchingnothing:
			v_act_vel_y = new_vel_y;
			scr_plr_setstate(id, enum_plr_state.air_dn);
			break;
			case enum_plr_ladder_check_move.nothingbutonground:
			v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, x, o_wall);
			scr_plr_setstate(id, enum_plr_state.gnd_idle);
			break;
			case enum_plr_ladder_check_move.hitwall:
			v_act_vel_y = scr_obj_approachedgeofon_obj_dist_y_at_x(id, o_ladder, new_vel_y, x);
			if (place_meeting(x, scr_act_potypos(id, v_act_vel_y), o_wall)) scr_plr_setstate(id, enum_plr_state.ladder_idle);
			else scr_plr_setstate(id, enum_plr_state.gnd_idle);
			break;
		}
		break;
		#endregion
		#region//hurt
		case enum_plr_state.hurt:
		var new_vel_x = sign(v_plr_hitx - v_plr_emyhitx) * v_act_vel_x_max;
		var new_vel_y = 0;
		if (v_plr_hurttime == v_plr_hurttime_max) new_vel_y = v_act_hurtjump;
		else new_vel_y = clamp(v_act_vel_y + v_act_grv, v_act_vel_y_max * -1, v_act_vel_y_max);
		if (v_plr_hurttime > 0) {
			v_plr_hurttime--;
			if (place_meeting(scr_act_potxpos(id, new_vel_x), scr_act_potypos(id, new_vel_y), o_wall)) {
				v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, scr_act_potypos(id, new_vel_y), o_wall);
				v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(id, new_vel_y, scr_act_potxpos(id, v_act_vel_x), o_wall);
			} else {
				v_act_vel_x = new_vel_x;
				v_act_vel_y = new_vel_y;
			}
		} else {
			if (position_meeting(x, bbox_bottom + 1, o_wall)) {
				if (v_act_input_x != 0) scr_plr_setstate(id, enum_plr_state.gnd_run);
				else scr_plr_setstate(id, enum_plr_state.gnd_idle);
			} else scr_plr_setstate(id, enum_plr_state.air_dn);
			v_plr_invulnerabletime = v_plr_invulnerabletime_max;
		}
		break;
		#endregion
		#region//hurt_ladder
		case enum_plr_state.hurt_ladder:
		v_act_vel_x = 0;
		var new_vel_y = v_act_vel_y + v_act_grv;
		if (v_plr_hurttime > 0) v_plr_hurttime--;
		if (position_meeting(x, bbox_bottom + scr_act_potypos(id, new_vel_y) - y, o_ladder)) v_act_vel_y = new_vel_y;
		else {
			v_act_vel_y = scr_obj_approachedgeofon_obj_dist_y_at_x(id, o_ladder, new_vel_y, x);
			scr_plr_setstate(id, enum_plr_state.ladder_idle);
			v_plr_invulnerabletime = v_plr_invulnerabletime_max;
			v_plr_hurttime = 0;
		}
		break;
		#endregion
		#region//dead
		case enum_plr_state.dead:
		v_act_vel_x = 0;
		v_act_vel_y = 0;
		if (v_plr_waittoshowdeath > 0) v_plr_waittoshowdeath--;
		else sprite_index = s_plr_dead;
		if (scr_intro_checkcontinue()) {
			scr_transition(enum_transition_state.goto, room);
			global.player_health = global.player_health_max;
		}
		break;
		#endregion
		#region//door
		case enum_plr_state.door:
		if (room == global.door_newroom) {
			global.door_playerentered = global.novalue;
			x = global.door_exiting.x;
			y = global.door_exiting.y + v_plr_door_yoffset;
			sprite_index = s_plr_gnd_static;
		}
		if (global.transition_state == enum_transition_state.off) {
			scr_plr_setstate(id, enum_plr_state.gnd_idle, s_plr_gnd_static);
			global.door_newroom = global.novalue;
			global.door_exiting = global.novalue;
		}
		break;
		#endregion
		#region//elevator
		case enum_plr_state.elevator:
		//Do I even need to do stuff here? I don't think I do.
		//The elevator code handles almost eveything.
		break;
		#endregion
		#region//spawn
		case enum_plr_state.spawn:
		sprite_index = s_plr_gnd_static;sprite_index = s_plr_gnd_static;
		if (global.transition_state == enum_transition_state.off) scr_plr_setstate(id, enum_plr_state.gnd_idle, s_plr_gnd_static);
		break;
		#endregion
	}
	#endregion
	#region//determine direction
	if (v_act_vel_x > 0) v_act_faceright = true;
	if (v_act_vel_x < 0) v_act_faceright = false;
	if (v_act_faceright != v_act_faceright_prev) {//direction has changed
		if (v_plr_hassword) {
			switch(v_plr_state) {//we can skip the states that don't have a direction
				case enum_plr_state.gnd_idle:
				if (v_act_faceright) sprite_index = s_plr_gnd_idle_sword;
				else sprite_index = s_plr_gnd_idle_sword_left;
				break;
				case enum_plr_state.gnd_run:
				if (v_act_faceright) sprite_index = s_plr_gnd_run_sword;
				else sprite_index = s_plr_gnd_run_sword_left;
				break;
				case enum_plr_state.gnd_struggle:
				if (v_act_faceright) sprite_index = s_plr_gnd_struggle;
				else sprite_index = s_plr_gnd_struggle_left;
				break;
				case enum_plr_state.air_up:
				if (v_act_faceright) sprite_index = s_plr_air_up_sword;
				else sprite_index = s_plr_air_up_sword_left;
				break;
				case enum_plr_state.air_dn:
				if (v_act_faceright) sprite_index = s_plr_air_dn_sword;
				else sprite_index = s_plr_air_dn_sword_left;
				break;
			}
		} else {
			switch(v_plr_state) {//we can skip the states that don't have a direction
				case enum_plr_state.gnd_idle:
				if (v_act_faceright) sprite_index = s_plr_gnd_idle;
				else sprite_index = s_plr_gnd_idle_left;
				break;
				case enum_plr_state.gnd_run:
				if (v_act_faceright) sprite_index = s_plr_gnd_run;
				else sprite_index = s_plr_gnd_run_left;
				break;
				case enum_plr_state.gnd_struggle:
				if (v_act_faceright) sprite_index = s_plr_gnd_struggle;
				else sprite_index = s_plr_gnd_struggle_left;
				break;
				case enum_plr_state.air_up:
				if (v_act_faceright) sprite_index = s_plr_air_up;
				else sprite_index = s_plr_air_up_left;
				break;
				case enum_plr_state.air_dn:
				if (v_act_faceright) sprite_index = s_plr_air_dn;
				else sprite_index = s_plr_air_dn_left;
				break;
			}
		}
	}
	v_act_faceright_prev = v_act_faceright;
	#endregion
	#region//movement
	event_inherited();
	#endregion
	#region//log previous input (I don't think I'm actually using this?)
	v_act_input_x_prev = v_act_input_x;
	v_act_input_y_prev = v_act_input_y;
	#endregion
} else image_speed = 0;
#region//death on room boundaries
if (v_plr_state != enum_plr_state.dead) && (v_plr_state != enum_plr_state.elevator) {
	if (bbox_left < 0) || (bbox_right > room_width) scr_plr_setstate(id, enum_plr_state.dead);
	if (bbox_top < 0) || (bbox_bottom > room_height) scr_plr_setstate(id, enum_plr_state.dead);
}
#endregion