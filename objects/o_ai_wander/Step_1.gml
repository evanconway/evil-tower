event_inherited();
if (v_ai_end) exit;

var actcon = v_ai_actor.v_act_actcon;

v_ai_wander_time--;

if (v_ai_wander_time <= 0) {
	scr_actcon_reset(v_ai_actor.v_act_actcon);
	v_ai_wander_choice = irandom_range(0, 2);
	v_ai_wander_time = irandom_range(v_ai_wander_time_min, v_ai_wander_time_max);
}

// check for cliffs
switch (v_ai_wander_choice) {
	case 1: // check left
	if (!position_meeting(v_ai_actor.bbox_left, v_ai_actor.bbox_bottom + 1, o_wall)) {
		v_ai_wander_choice = 2; // set to right
		scr_actcon_reset(v_ai_actor.v_act_actcon);
	}
	break;
	case 2:
	if (!position_meeting(v_ai_actor.bbox_right, v_ai_actor.bbox_bottom + 1, o_wall)) {
		v_ai_wander_choice = 1;
		scr_actcon_reset(v_ai_actor.v_act_actcon);
	}
	break;
}

switch (v_ai_wander_choice) {
	case 0: // idle
	break;
	case 1: // move left
	scr_actcon_push(actcon, enum_input.left);
	break;
	case 2: // move right
	scr_actcon_push(actcon, enum_input.right);
	break;
}
