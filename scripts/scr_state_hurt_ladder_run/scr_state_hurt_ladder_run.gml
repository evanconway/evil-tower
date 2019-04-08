/// @description scr_state_hurt_ladder_run(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;
var actcon = ID.v_act_actcon;
var botbboxoffset = ID.bbox_bottom - ID.y;

ID.v_act_vel_x = 0;

var vel_y = ID.v_act_vel_y + state.v_state_hurt_grv_y;
clamp(vel_y, 0, state.v_state_hurt_vel_y_max);

/*
The only situation that prevents downward movement in ladder_fall is the bottom edge
touching a wall without touching a ladder. So we set our new velocity, and increment
a temporary velocity up to our new velicity by 1, checking for a wall edge each time,
unless the increment of 1 would bring our temp velocity higher than new velicty, in 
which case we set the increment to the difference.
*/

var dist = 0;
var measuring = true;
while (measuring) { // remember vel_y will always be positive because we're going down
	// we increment by one UNLESS incrementing one would make dist more than velocity, in which case we make it equal
	var increment = 1;
	if (dist + increment > vel_y) increment = vel_y - dist;
	if (position_meeting(ID.x, scr_act_potypos(ID, dist + increment) + botbboxoffset, o_ladder)) { // if bottom edge on ladder
		dist += increment; // increment dist and continue loop	
	} else { // if bottom edge not on ladder check for wall
		if (position_meeting(scr_act_potxpos(ID, ID.v_act_vel_x), scr_act_potypos(ID, dist + increment) + botbboxoffset, o_wall)) {
			measuring = false; // we've hit a wall, leave dist as is and exit loop;
		} else dist += increment; // no wall increment dist and continue loop
	}
	if (dist >= vel_y) measuring = false; // don't increment dist beyond the velocity
}
vel_y = dist;

ID.v_act_vel_y = vel_y;

// ignore input in hurt script
/*
if (actcon.v_actcon_right && !actcon.v_actcon_left) {
	ID.v_act_faceright = true;
	if (ID.sprite_index != state.v_state_sprite) ID.sprite_index = state.v_state_sprite;
}
if (actcon.v_actcon_left && !actcon.v_actcon_right) {
	ID.v_act_faceright = false;
	if (ID.sprite_index != state.v_state_sprite_left) ID.sprite_index = state.v_state_sprite_left;
}
*/
