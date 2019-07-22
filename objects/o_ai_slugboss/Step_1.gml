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
	// see above
	if (v_ai_wander_choice <= 1) v_ai_wander_time = irandom_range(v_ai_wander_time_min, v_ai_wander_time_max);
	else v_ai_wander_time = 1; // time will not be decremented
}

// check for cliffs and walls
switch (v_ai_wander_choice) {
	case 0: // check left
	if (!position_meeting(v_ai_actor.bbox_left, v_ai_actor.bbox_bottom + 1, o_wall)
	|| position_meeting(v_ai_actor.bbox_left - 1, v_ai_actor.y, o_wall)) {
		v_ai_wander_choice = 1; // set to right
		scr_actcon_reset(v_ai_actor.v_act_actcon);
	}
	break;
	case 1: // check right
	if (!position_meeting(v_ai_actor.bbox_right, v_ai_actor.bbox_bottom + 1, o_wall)
	|| position_meeting(v_ai_actor.bbox_right + 1, v_ai_actor.y, o_wall)) {
		v_ai_wander_choice = 0;
		scr_actcon_reset(v_ai_actor.v_act_actcon);
	}
	break;
}

switch (v_ai_wander_choice) {
	case 0: // move left
	if (v_ai_wander_time > 59) scr_actcon_push(actcon, enum_input.left);
	else scr_actcon_reset(actcon);
	//if (position_meeting(v_ai_actor.bbox_left - 1, v_ai_actor.y, o_wall)) v_ai_wander_choice = 1;
	break;
	case 1: // move right
	if (v_ai_wander_time > 59) scr_actcon_push(actcon, enum_input.right);
	else scr_actcon_reset(actcon);
	//if (position_meeting(v_ai_actor.bbox_right + 1, v_ai_actor.y, o_wall)) v_ai_wander_choice = 0;
	break;
	case 2: // jump
	/*
	The first frame we go through this action, the slug boss needs to press jump,
	but then also needs to let go on the very next frame. The slug boss also 
	needs to jump in the direction of the player, so it'll need to press a 
	direction too. Finally, once the slug is over the player, it needs to press
	jump again to trigger the slam ability.
	*/
	switch (v_ai_slamstate) {
		case 0: // jump up
		scr_actcon_push(actcon, enum_input.button1);
		if (v_ai_actor.x < o_player.x) v_ai_slamright = true;
		else v_ai_slamright = false;
		v_ai_slamstate++;
		break;
		case 1:
		// 1 frame of rising
		scr_actcon_reset(actcon);
		if (v_ai_slamright) scr_actcon_push(actcon, enum_input.right);
		else scr_actcon_push(actcon, enum_input.left);
		v_ai_slamstate++;
		break;
		case 2: // check for player
		if (v_ai_slamright) scr_actcon_push(actcon, enum_input.right);
		else scr_actcon_push(actcon, enum_input.left);
		if (abs(v_ai_actor.x - o_player.x) < v_ai_slamdist) {
			scr_actcon_push(actcon, enum_input.button1);
			v_ai_slamstate++;
			v_ai_wander_time = 60; // see next state
		} else {
			var landed = false;
			with (v_ai_actor) { // check if slugboss has landed
				if (place_meeting(x, y + 1, o_wall)) landed = true;
			}
			if (landed) {
				v_ai_slamstate++;
				v_ai_wander_time = 60;
			}
		}
		break;
		case 3:
		v_ai_wander_time--;
		/*
		By counting down manually within this slam action choice, we ensure the
		slugboss waits enough frames for the slam animation to finish before 
		choosing a new action.
		*/
		if (v_ai_wander_time <= 0) v_ai_slamstate = 0; // reset when done.
		break;
	}
	
	break;
	case 3: // attack
	switch (v_ai_attackstate) {
		case 0:
		scr_actcon_push(actcon, enum_input.button2); // is button 2 attack?
		v_ai_attackstate++;
		v_ai_wander_time = 30;
		break;
		case 1:
		v_ai_wander_time--; // same deal here as slam state
		if (v_ai_wander_time <= 0) v_ai_attackstate = 0;
		break;
	}
	break;
}
