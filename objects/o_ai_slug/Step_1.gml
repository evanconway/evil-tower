event_inherited();
if (v_ai_end) exit;

if (v_ai_slug_counter >= 0) v_ai_slug_counter--;

if (v_ai_slug_counter < 0) {
	
	scr_actcon_reset(v_ai_actor.v_act_actcon);
	
	// for every action we're going to randomize facing left or right
	if (irandom_range(0, 1) == 1) v_ai_slug_faceright = true;
	else v_ai_slug_faceright = false;
	
	v_ai_slug_state = irandom_range(0, 1);
	// assign counter times for state choice
	// 0 = walk
	if (v_ai_slug_state == 0) v_ai_slug_counter = irandom_range(v_ai_slug_counter_min, v_ai_slug_counter_max);
	// 1 = barf
	if (v_ai_slug_state == 1) {
		v_ai_slug_counter = v_ai_slug_barftime;
		if (o_player.x < v_ai_actor.x) v_ai_slug_faceright = false;
		else v_ai_slug_faceright = true;
		v_ai_slug_numofbarfs = irandom_range(v_ai_slug_numofbarfs_min, v_ai_slug_numofbarfs_max);
	}
}

/*
To get the slug to pause between actions, we're only updating the slug if the counter
is above the pause value.
*/

if (v_ai_slug_counter <= v_ai_slug_counter_pause) {
	v_ai_slug_state = -1; // can't take action on undefined state;
	scr_actcon_reset(v_ai_actor.v_act_actcon);
}

switch (v_ai_slug_state) {
	case 0: // walking
	// check for walls and ledges, and change direction 
	
	//walls
	var touchWall = false;
	if (v_ai_slug_faceright) {
		with (v_ai_actor) {
			if (place_meeting(x+1, y, o_wall)) touchWall = true;
		}
	} else {
		with (v_ai_actor) {
			if (place_meeting(x-1, y, o_wall)) touchWall = true;
		}
	}
	
	//ledges
	var overLedge = false;
	if (v_ai_slug_faceright) {
		with (v_ai_actor) {
			if (!position_meeting(bbox_right, bbox_bottom+1, o_wall)) overLedge = true;
		}
	} else {
		with (v_ai_actor) {
			if (!position_meeting(bbox_left, bbox_bottom+1, o_wall)) overLedge = true;
		}
	}
	
	if (touchWall || overLedge) {
		scr_actcon_reset(v_ai_actor.v_act_actcon);
		v_ai_slug_faceright = !v_ai_slug_faceright;
	}
	
	if (v_ai_slug_faceright) scr_actcon_push(v_ai_actor.v_act_actcon, enum_input.right);
	else scr_actcon_push(v_ai_actor.v_act_actcon, enum_input.left);
	break;
	case 1: // barfing
	if (v_ai_slug_counter == v_ai_slug_barftime) {
		if (v_ai_slug_faceright) scr_actcon_push(v_ai_actor.v_act_actcon, enum_input.right);
		else scr_actcon_push(v_ai_actor.v_act_actcon, enum_input.left);
	}  
	if (v_ai_slug_counter == v_ai_slug_barftime - 1) scr_actcon_push(v_ai_actor.v_act_actcon, enum_input.button2);
	if (v_ai_slug_counter <= v_ai_slug_barftime - 2 )scr_actcon_reset(v_ai_actor.v_act_actcon);
	
	if (v_ai_slug_numofbarfs > 1 && v_ai_slug_counter == v_ai_slug_counter_pause + 1) {
		v_ai_slug_counter = v_ai_slug_barftime + 1; // needed because counter will decrement
		v_ai_slug_numofbarfs--;
	}
	break;
}