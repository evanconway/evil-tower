/// @description 

/*
There are a lot of checks here, they are:
the player object exists
the player object is touching the door
the player object is on the ground (level with the door)
the user has pressed up
there is not a transition already in progress
*/

if (instance_exists(global.player) && place_meeting(x, y, global.player) && !global.freezeactors) {
	var plr = instance_place(x, y, global.player);
	if (plr.y == y && 
	scr_input_check(true, enum_input.up) && 
	//plr.v_act_state_cur == plr.v_act_state_default &&
	!instance_exists(o_transition)) {
		// if we reached this spot, all of those conditions have been met, move through the door
		scr_transition_door(id);
	}
}
