/// @description scr_state_ladder_down_run(o_actor)

/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

// match x position to ladder
if (instance_place(ID.x, ID.y, o_ladder)) {
	var ladder_x = instance_place(ID.x, ID.y, o_ladder).x;
	ID.v_act_vel_x = ladder_x - ID.x;
}
// need to do different check during stepdown
if (state.v_state_ladder_down_stepdown && instance_place(ID.x, scr_act_potypos(ID, 1), o_ladder)) {
	var ladder_x = instance_place(ID.x, scr_act_potypos(ID, 1), o_ladder).x;
	ID.v_act_vel_x = ladder_x - ID.x;
}

var actcon = ID.v_act_actcon;
var botbboxoffset = ID.bbox_bottom - ID.y;
var vel_y = 0;
if (state.v_state_ladder_down_stepdown) {
	vel_y = 1;
	state.v_state_ladder_down_stepdown = false; // reset this var after we're done referencing it
}
if (actcon.v_actcon_down && !actcon.v_actcon_up && place_meeting(ID.x, ID.y, o_ladder)) {
	ID.image_speed = 1;
	vel_y = state.v_state_ladder_climbspd;
	/*
	Ladder movement is bizarre because ladders can move actors through o_wall. In order to ensure the actor cannot
	move into a wall, we have to check the edge of the actor bbox against o_wall, but only when that edge is off
	of the ladder. This is the first check we will do.
	*/
	var dist = 0;
	var measuring = true;
	while (measuring) { // remember vel_y will always be positive because we're going down
		// we increment by one UNLESS incrementing one would make dist more than velocity, in which case we make it equal
		var increment = 1;
		if (dist + increment > vel_y) increment = vel_y - dist;
		if (position_meeting(scr_act_potxpos(ID, ID.v_act_vel_x), scr_act_potypos(ID, dist + increment) + botbboxoffset, o_ladder)) { // if bottom edge on ladder
			dist += increment; // increment dist and continue loop	
		} else { // if bottom edge not on ladder check for wall
			if (position_meeting(scr_act_potxpos(ID, ID.v_act_vel_x), scr_act_potypos(ID, dist + increment) + botbboxoffset, o_wall)) {
				measuring = false; // we've hit a wall, leave dist as is and exit loop;
			} else dist += increment; // no wall increment dist and continue loop
		}
		if (dist >= vel_y) measuring = false; // don't increment dist beyond the velocity
	}
	vel_y = dist;
	/*
	Now that we've checked for running into walls on the ladder, we check to see if the actor is even still on the ladder.
	We make sure the actor is never placed too far beyond a ladder after moving. This is so the actor can transition to 
	other states smoothly.
	*/
	dist = 0;
	while (dist < vel_y) {
		var increment = 1; // increment same as above
		if (dist + increment > vel_y) increment = vel_y - dist;
		/*
		since we've already checked the distance to ensure we're not running into a wall, we only need to check if we're still on
		a ladder. And since we're always checking one pixel at a time, we can always increment in the loop.
		*/
		dist += increment;
		// then break the loop if our new dist puts actor off the ladder
		if (!place_meeting(scr_act_potxpos(ID, ID.v_act_vel_x), scr_act_potypos(ID, dist), o_ladder)) vel_y = dist; // this breaks loop
	}
} else image_speed = 0;

ID.v_act_vel_y = vel_y;

if (ID.v_act_image_change || ID.v_act_sprite_change) {
	scr_playsfx(snd_tick);
}
