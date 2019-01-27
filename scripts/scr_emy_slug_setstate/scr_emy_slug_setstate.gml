/// @description scr_emy_slug_setstate()

v_slug_state = irandom_range(0, 2);
if (v_slug_state == enum_slug_state.attack) v_slug_statetime = v_slug_attack_startup;
else v_slug_statetime = irandom_range(v_slug_time_min, v_slug_time_max);
v_act_faceright = irandom_range(0, 1);

switch(v_slug_state)
{
	case enum_slug_state.idle:
	if (v_act_faceright) sprite_index = s_emy_slug_gnd_idle;
	else sprite_index = s_emy_slug_gnd_idle_left;
	image_speed = 1;
	break;
	case enum_slug_state.moving:
	if (v_act_faceright) sprite_index = s_emy_slug_gnd_idle;
	else sprite_index = s_emy_slug_gnd_idle_left;
	image_speed = 1;
	break;
	case enum_slug_state.attack:
	if (v_act_faceright) sprite_index = s_emy_slug_gnd_attack;
	else sprite_index = s_emy_slug_gnd_attack_left;
	image_speed = 1;
	/* this code is for the attack
	if (v_act_faceright) {
		with (instance_create_layer(x + 7, y - 4, "Projectiles", o_slug_barf))
		{
			v_act_faceright = other.v_act_faceright;
		}
	}
	else 
	{
		with (instance_create_layer(x - 7, y - 4, "Projectiles", o_slug_barf))
		{
			v_act_faceright = other.v_act_faceright;
		}	
	}
	scr_playsfx(snd_barf);
	*/
	break;
}