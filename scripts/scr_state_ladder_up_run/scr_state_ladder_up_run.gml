/// @description scr_state_ladder_up_run(o_actor)

/// @param actor_id

var ID = argument[0];

// match x position to ladder
if (instance_place(ID.x, ID.y, o_ladder)) {
	var ladder_x = instance_place(ID.x, ID.y, o_ladder).x;
	ID.v_act_vel_x = ladder_x - ID.x;
}

var state = ID.v_act_state_cur;
var actcon = ID.v_act_controller;
var topbboxoffset = ID.bbox_top - ID.y;
var vel_y = 0;
if (actcon.v_actcon_up && !actcon.v_actcon_down && place_meeting(ID.x, ID.y, o_ladder)) {
	ID.image_speed = 1;
	vel_y = state.v_state_ladder_climbspd * -1;
	/*
	Ladder movement is bizarre because ladders can move actors through o_wall. In order to ensure the actor cannot
	move into a wall, we have to check the edge of the actor bbox against o_wall, but only when that edge is off
	of the ladder. This is the first check we will do.
	*/
	var dist = 0;
	var measuring = true;
	while (measuring) { // remember vel_y will always be negative because we're going up
		// we decrement by one UNLESS decrementing one would make dist less than velocity, in which case we make it equal
		var decrement = 1;
		if (dist - decrement < vel_y) decrement = dist - vel_y;
		if (position_meeting(scr_act_potxpos(ID, ID.v_act_vel_x), scr_act_potypos(ID, dist - decrement) + topbboxoffset, o_ladder)) { // if top edge on ladder
			dist -= decrement; // decrement dist and continue loop	
		} else { // if top edge not on ladder check for wall
			if (position_meeting(scr_act_potxpos(ID, ID.v_act_vel_x), scr_act_potypos(ID, dist - decrement) + topbboxoffset, o_wall)) {
				measuring = false; // we've hit a wall, leave dist as is and exit loop;
			} else dist -= decrement; // no wall decrement dist and continue loopwwww
		}
		if (dist <= vel_y) measuring = false; // don't decrement dist beyond the velocity
	}
	vel_y = dist;
	/*
	Now that we've checked for running into walls on the ladder, we check to see if the actor is even still on the ladder.
	We make sure the actor is never placed too far beyond a ladder after moving. This is so the actor can transition to 
	other states smoothly.
	*/
	dist = 0;
	while (dist > vel_y) {
		var decrement = 1; // decrement same as above
		if (dist - decrement < vel_y) decrement = dist - vel_y;
		/*
		since we've already checked the distance to ensure we're not running into a wall, we only need to check if we're still on
		a ladder. And since we're always checking one pixel at a time, we can always decrement in the loop.
		*/
		dist -= decrement;
		// then break the loop if our new dist puts actor off the ladder
		if (!place_meeting(scr_act_potxpos(ID, ID.v_act_vel_x), scr_act_potypos(ID, dist), o_ladder)) vel_y = dist; // this breaks loop
	}
} else image_speed = 0;

ID.v_act_vel_y = vel_y;

if (ID.v_act_image_change || ID.v_act_sprite_change) {
	scr_playsfx(snd_tick);
}
