/// @description scr_plr_setstate(o_player, enum_plr_state, sprite)
/// @param o_player
/// @param enum_plr_state
/// @param sprite

switch (argument[1])
{
	#region gnd_idle
	case enum_plr_state.gnd_idle:
	image_index = 0;
	argument[0].v_plr_state = enum_plr_state.gnd_idle;
	if (argument_count > 2)
	{
		argument[0].sprite_index = argument[2];
	} else
	{
		if (argument[0].v_plr_hassword)
		{
			if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_gnd_idle_sword;
			else argument[0].sprite_index = s_plr_gnd_idle_sword_left;
		} else
		{
			if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_gnd_idle;
			else argument[0].sprite_index = s_plr_gnd_idle_left;
		}
	}
	break;
	#endregion
	#region gnd_run
	case enum_plr_state.gnd_run:
	if (argument[0].v_plr_hassword)
	{
		if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_gnd_run_sword;
		else argument[0].sprite_index = s_plr_gnd_run_sword_left;
	} else
	{
		if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_gnd_run;
		else argument[0].sprite_index = s_plr_gnd_run_left;
	}
	
	//this little bit of code helps the run animation look more natural when landing into a run
	if (v_plr_state = enum_plr_state.air_dn) image_index = 2;
	else image_index = 0;
	argument[0].v_plr_state = enum_plr_state.gnd_run;
	break;
	#endregion
	#region gnd_crouch
	case enum_plr_state.gnd_crouch:
	argument[0].v_act_vel_x = 0;
	argument[0].v_plr_state = enum_plr_state.gnd_crouch;
	if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_gnd_crouch_sword;
	else argument[0].sprite_index = s_plr_gnd_crouch_sword_left;
	break;
	#endregion
	#region gnd_struggle
	case enum_plr_state.gnd_struggle:
	argument[0].v_plr_state = enum_plr_state.gnd_struggle;
	if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_gnd_struggle;
	else argument[0].sprite_index = s_plr_gnd_struggle_left;
	break;
	#endregion
	#region gnd_attack
	case enum_plr_state.gnd_attack:
	if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_gnd_attack_sword;
	else argument[0].sprite_index = s_plr_gnd_attack_sword_left;
	argument[0].image_index = 0;
	argument[0].v_plr_attack_startup = v_plr_attack_startup_max;
	argument[0].v_plr_state = enum_plr_state.gnd_attack;
	break;
	#endregion
	#region gnd_crouchattack
	case enum_plr_state.gnd_crouchattack:
	if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_gnd_attack_crouch;
	else argument[0].sprite_index = s_plr_gnd_attack_crouch_left;
	argument[0].image_index = 0;
	argument[0].v_plr_attack_startup = v_plr_attack_startup_max;
	argument[0].v_plr_state = enum_plr_state.gnd_crouchattack;
	break;
	#endregion
	#region air_up
	case enum_plr_state.air_up:
	argument[0].v_plr_state = enum_plr_state.air_up;
	if (argument[0].v_plr_hassword)
	{
		if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_air_up_sword;
		else argument[0].sprite_index = s_plr_air_up_sword_left;
	} else
	{
		if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_air_up;
		else argument[0].sprite_index = s_plr_air_up_left;
	}
	break;
	#endregion
	#region air_dn
	case enum_plr_state.air_dn:
	argument[0].v_plr_state = enum_plr_state.air_dn;
	if (argument[0].v_plr_hassword)
	{
		if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_air_dn_sword;
		else argument[0].sprite_index = s_plr_air_dn_sword_left;
	} else{
		if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_air_dn;
		else argument[0].sprite_index = s_plr_air_dn_left;
	}
	break;
	#endregion
	#region wall_slide
	case enum_plr_state.wall_slide:
	argument[0].v_plr_state = enum_plr_state.wall_slide;
	argument[0].v_plr_walljump_time = argument[0].v_plr_walljump_time_max;
	if (argument[0].v_plr_hassword)
	{
		if (argument[0].v_act_input_x > 0) argument[0].sprite_index = s_plr_walljump_left_sword;
		else argument[0].sprite_index = s_plr_walljump_sword;
	} else {
		if (argument[0].v_act_input_x > 0) argument[0].sprite_index = s_plr_walljump_left;
		else argument[0].sprite_index = s_plr_walljump;
	}
	break;
	#endregion
	#region ladder_idle
	case enum_plr_state.ladder_idle:
	argument[0].v_plr_state = enum_plr_state.ladder_idle;
	argument[0].sprite_index = s_plr_ladder_climbing;
	argument[0].image_index = floor(argument[0].image_index);
	break;
	#endregion
	#region ladder_up
	case enum_plr_state.ladder_up:
	argument[0].v_plr_state = enum_plr_state.ladder_up;
	argument[0].sprite_index = s_plr_ladder_climbing;
	scr_obj_sprite_nextimage(id);
	break;
	#endregion
	#region ladder_dn
	case enum_plr_state.ladder_dn:
	argument[0].v_plr_state = enum_plr_state.ladder_dn;
	sprite_index = s_plr_ladder_climbing;
	scr_obj_sprite_nextimage(id);
	break;
	#endregion
	#region ladder_fall
	case enum_plr_state.ladder_fall:
	argument[0].v_plr_state = enum_plr_state.ladder_fall;
	if (argument[0].v_act_faceright) argument[0].sprite_index = s_plr_air_dn;
	else argument[0].sprite_index = s_plr_air_dn_left;
	break;
	#endregion
	#region hurt
	case enum_plr_state.hurt:
	argument[0].v_plr_state = enum_plr_state.hurt;
	argument[0].v_plr_hurttime = argument[0].v_plr_hurttime_max;
	//argument[0].v_plr_invulnerabletime = argument[0].v_plr_invulnerabletime_max;
	if (argument[0].v_plr_ladder_on_obj != false) && (place_meeting(x, y, o_wall)) argument[0].v_plr_state = enum_plr_state.hurt_ladder;
	else scr_plr_ladder_release();
	argument[0].sprite_index = s_plr_hurt;
	break;
	#endregion
	#region dead
	case enum_plr_state.dead:
	scr_playsfx(snd_dead);
	global.player_health = 0;
	global.freezeactors = true;
	//projectile layer is only layer higher than player for athestic reasons
	//we need to hide it because the black box drawn behind the player will not cover it. 
	layer_set_visible("Projectiles", false);
	argument[0].v_plr_state = enum_plr_state.dead;
	argument[0].sprite_index = s_plr_hurt;
	break;
	#endregion
	#region door
	case enum_plr_state.door:
	argument[0].v_plr_state = enum_plr_state.door;
	argument[0].sprite_index = s_plr_gnd_static_back;
	break;
	#endregion
	#region elevator
	case enum_plr_state.elevator:
	argument[0].v_plr_state = enum_plr_state.elevator;
	break;
	#endregion
}