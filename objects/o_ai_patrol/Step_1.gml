event_inherited();
if (v_ai_end) exit;

var actcon = v_ai_actor.v_act_actcon;
var wallhit = false;

// check for cliffs and walls
switch (v_ai_patrol_choice) {
	case 0: // check left
	if (!position_meeting(v_ai_actor.bbox_left, v_ai_actor.bbox_bottom + 1, o_wall)) {
		v_ai_patrol_choice = 1; // set to right
		scr_actcon_reset(actcon);
	}
	with (v_ai_actor) if (place_meeting(x - 1, y, o_wall)) wallhit = true;
	if (wallhit) {
		v_ai_patrol_choice = 1;
		scr_actcon_reset(actcon);
	}
	
	break;
	case 1:
	if (!position_meeting(v_ai_actor.bbox_right, v_ai_actor.bbox_bottom + 1, o_wall)) {
		v_ai_patrol_choice = 0;
		scr_actcon_reset(v_ai_actor.v_act_actcon);
	}
	with (v_ai_actor) if (place_meeting(x + 1, y, o_wall)) wallhit = true;
	if (wallhit) {
		v_ai_patrol_choice = 0;
		scr_actcon_reset(actcon);
	}
	break;
}

switch (v_ai_patrol_choice) {
	case 0: // move left
	scr_actcon_push(actcon, enum_input.left);
	break;
	case 1: // move right
	scr_actcon_push(actcon, enum_input.right);
	break;
}
