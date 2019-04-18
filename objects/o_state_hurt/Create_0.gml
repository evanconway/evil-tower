event_inherited()

/*
There is no change script for the hurt state. Actors are set to this state
by hitboxes. The "change" script is essentially the step event of the hitbox.
*/

v_state_name = "Hurt";
v_state_script_continue = scr_state_hurt_continue;
v_state_script_run = scr_state_hurt_run;

v_state_count_max = 15; // 
v_state_count = 0;

v_state_hurt_health = 3;

v_state_hurt_fx = undefined;
v_state_hurt_snd = undefined;
v_state_hurt_fx_yoffset = 0; // helps center hit effects, set in state creation

v_state_hurt_dead_scene = undefined;
v_state_hurt_dead_fx = undefined;
v_state_hurt_dead_snd = snd_afterburn;
v_state_hurt_dead_sprite = undefined;


v_state_hurt_grv_y = 0.15;
v_state_hurt_vel_x = 0;
v_state_hurt_vel_x_max = 3.0;
v_state_hurt_vel_y = 0;
v_state_hurt_vel_y_max = 3.0;

// run different code if actor was on ladder
v_state_hurt_ladder = false;

enum enum_hurt_stage {
	stun,
	move
}

v_state_hurt_stage = enum_hurt_stage.stun;
