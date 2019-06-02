event_inherited();
if (v_ai_end) exit;

var actcon = v_ai_actor.v_act_actcon;

/*
The only actions that need a certain a mount of time are moving left
and right. Attacking will always take the amount of time the attack
takes, as will jumping up and slamming. Jumping and slamming will
manually set the time to 0 so that a new choice will be made. 
It would look clearer in the code to have a boolean "make_choice", 
but eh... we started this way so we'll finish this way.
*/
if (v_ai_wander_choice <= 1) v_ai_wander_time--;
if (v_ai_wander_time <= 0) {
	scr_actcon_reset(v_ai_actor.v_act_actcon);
	v_ai_wander_choice = irandom_range(0, 3);
	if (v_ai_wander_choice > 1) v_ai_wander_time = irandom_range(v_ai_wander_time_min, v_ai_wander_time_max);
	else v_ai_wander_choice = 1; // time will not be decremented
}

// check for cliffs
switch (v_ai_wander_choice) {
	case 0: // check left
	if (!position_meeting(v_ai_actor.bbox_left, v_ai_actor.bbox_bottom + 1, o_wall)) {
		v_ai_wander_choice = 2; // set to right
		scr_actcon_reset(v_ai_actor.v_act_actcon);
	}
	break;
	case 1:
	if (!position_meeting(v_ai_actor.bbox_right, v_ai_actor.bbox_bottom + 1, o_wall)) {
		v_ai_wander_choice = 1;
		scr_actcon_reset(v_ai_actor.v_act_actcon);
	}
	break;
}

switch (v_ai_wander_choice) {
	case 0: // move left
	scr_actcon_push(actcon, enum_input.left);
	break;
	case 1: // move right
	scr_actcon_push(actcon, enum_input.right);
	break;
	case 2: // jump
	/*
	The first frame we go through this action, the slug boss needs to press jump,
	but then also needs to let go on the very next frame. The slug boss also 
	needs to jump in the direction of the player, so it'll need to press a 
	direction too. Finally, once the slug is over the player, it needs to press
	jump again to trigger the slam ability.
	*/
	if (!v_ai_leftground) scr_actcon_push(actcon, enum_input.button1);
	
	break;
	case 3: // attack
	scr_actcon_push(actcon, enum_input.button2); // is button 2 attack?
	break;
}
