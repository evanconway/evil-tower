event_inherited();
if (v_ai_end) exit;

var actcon = v_ai_actor.v_act_actcon;

if (v_ai_slug_counter >= 0) v_ai_slug_counter--;
if (v_ai_slug_counter < 0) {
	scr_actcon_reset(actcon);
	// unlike the regular slug, the boss always aims at the player
	if (v_ai_actor.x < o_player.x) v_ai_slug_faceright = true;
	if (v_ai_actor.x > o_player.x) v_ai_slug_faceright = false;
	
	/*
	This is kinda messy.... we have all this code for walking left and
	right, but we decided not to let the slug walk left and right because
	it wasn't fun. So, the random state choice never picks one. Also, to 
	get the slug to ram more frequently (because it's fun), we're 
	using more than one number to allow for rams. 
	*/
	
	
	v_ai_slug_state = irandom_range(1, 3);
	// assign counter times for state choice
	// 0 = walk
	if (v_ai_slug_state == 0) {
		v_ai_slug_counter = irandom_range(v_ai_slug_counter_min, v_ai_slug_counter_max);
		// we randomize direction facing for walking the bossslug
		if (irandom_range(0, 1) == 1) v_ai_slug_faceright = true;
		else v_ai_slug_faceright = false;
	}
	// 1 = barf
	if (v_ai_slug_state == 1) {
		v_ai_slug_counter = v_ai_slug_barftime;
		v_ai_slug_numofbarfs = irandom_range(v_ai_slug_numofbarfs_min, v_ai_slug_numofbarfs_max);
	}
	if (v_ai_slug_state == 2) {
		v_ai_slamstate = 0;
		v_ai_slug_counter = v_ai_slamcounter;
	}
	if (v_ai_slug_state >= 3) {
		v_ai_slug_state = 3;
		v_ai_slug_counter = 60;
		v_ai_ramstage = 0;
	}
}

/*
To get the slug to pause between actions, we're only updating the slug if the counter
is above the pause value.
*/

if (v_ai_slug_counter <= v_ai_slug_counter_pause) {
	v_ai_slug_state = -1; // can't take action on undefined state;
	scr_actcon_reset(actcon);
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
		scr_actcon_reset(actcon);
		v_ai_slug_faceright = !v_ai_slug_faceright;
	}
	if (v_ai_slug_faceright) scr_actcon_push(actcon, enum_input.right);
	else scr_actcon_push(actcon, enum_input.left);
	break;
	case 1: // barfing
	if (v_ai_slug_counter == v_ai_slug_barftime) {
		if (v_ai_slug_faceright) scr_actcon_push(actcon, enum_input.right);
		else scr_actcon_push(actcon, enum_input.left);
	}  
	if (v_ai_slug_counter == v_ai_slug_barftime - 1) {
		scr_actcon_reset(actcon);
		scr_actcon_push(actcon, enum_input.button2);
	}
	if (v_ai_slug_counter <= v_ai_slug_barftime - 2 )scr_actcon_reset(actcon);
	
	if (v_ai_slug_numofbarfs > 1 && v_ai_slug_counter == v_ai_slug_counter_pause + 1) {
		v_ai_slug_counter = v_ai_slug_barftime + 1; // needed because counter will decrement
		v_ai_slug_numofbarfs--;
	}
	break;
	case 2: // jump slam
	/*
	The first couple frames we go through this action, the slug boss needs to press jump,
	but then also needs to let go on the very next frame. The slug boss also 
	needs to jump in the direction of the player, so it'll need to press a 
	direction too. Finally, once the slug is over the player, it needs to press
	jump again to trigger the slam ability.
	*/
	switch (v_ai_slamstate) {
		case 0: // jump up
		if (v_ai_slug_counter == v_ai_slamcounter) {
			if (v_ai_slug_faceright) scr_actcon_push(actcon, enum_input.right);
			else scr_actcon_push(actcon, enum_input.left);
		}
		if (v_ai_slug_counter == v_ai_slamcounter - 1) {
			scr_actcon_push(actcon, enum_input.button1);
			v_ai_slamstate++;
		}
		break;
		case 1:
		// 1 frame of rising
		scr_actcon_release(actcon, enum_input.button1); // release jump so we can push it again later
		v_ai_slamstate++;
		break;
		case 2: // check for player
		if (abs(v_ai_actor.x - o_player.x) < v_ai_slamdist) {
			scr_actcon_push(actcon, enum_input.button1);
			v_ai_slamstate++;
			v_ai_slug_counter = v_ai_slug_counter_pause; // see next state
		} else {
			var landed = false;
			with (v_ai_actor) { // check if slugboss has landed
				if (place_meeting(x, y + 1, o_wall)) landed = true;
			}
			if (landed) {
				v_ai_slamstate++;
				v_ai_slug_counter = 0;
			}
		}
		break;
		case 3:
		v_ai_slug_counter--;
		/*
		By counting down manually within this slam action choice, we ensure the
		slugboss waits enough frames for the slam animation to finish before 
		choosing a new action.
		*/
		break;
	}
	break;
	case 3: // ram
	switch (v_ai_ramstage) {
		case 0:
		/*
		if (v_ai_actor.v_act_state_cur != v_ai_actor.v_emy_slugboss_state_slam) {
			v_ai_slug_counter = 0;
			exit;
		}
		*/
		if (v_ai_slug_faceright) scr_actcon_push(actcon, enum_input.right)
		else scr_actcon_push(actcon, enum_input.left);
		scr_actcon_push(actcon, enum_input.button2);
		var touchWall = false;
		var faceRight = v_ai_slug_faceright;
		with (v_ai_actor) {
			if (faceRight && place_meeting(x + 1, y, o_wall)) touchWall = true;
			if (!faceRight && place_meeting(x - 1, y, o_wall)) touchWall = true;
		}
		if (touchWall) {
			v_ai_ramstage++;
			//scr_actcon_reset(actcon);
			v_ai_slug_counter = v_ai_actor.v_emy_slugboss_state_ram.v_state_ram_rest;
		}
		break;
		case 1:
		
		break;
	}
}
