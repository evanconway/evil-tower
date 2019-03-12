/// @description Actor Movement

/*
Actors are built around states. the v_act_states variable contains a list of 
states the actor can enter. Each state also contains a list of states it 
connects to. States are determined by an actor controller, the state it's
in, and whatever game world properties the states check for. Remember that
states must be connected to eachother in the code for child actors. Also
remember that the order of these connections matters.
*/

if (!global.freezeactors) {
	
	image_speed = 1;// this may get changed by the state code
	
	// the ai script determines the inputs for act_controller
	if (v_act_aiscript != undefined) script_execute(v_act_aiscript, id);

	if (v_act_state_cur != undefined) {
		
		// this is just for debugging, let's us easily see what state actor is in from debugger
		var statename = v_act_state_cur.v_state_name;
		scr_act_checkstateconnects(id);
		statename = v_act_state_cur.v_state_name;
		if (v_act_state_cur.v_state_script_run != undefined) script_execute(v_act_state_cur.v_state_script_run, id);
		// state scripts do not actually move the actor, it just sets velocites
		// movement happens here
		if (v_act_vel_x != 0) scr_act_move_x(id, v_act_vel_x);
		else scr_act_resetxinputstart(id);
		if (v_act_vel_y != 0) scr_act_move_y(id, v_act_vel_y);
		else scr_act_resetyinputstart(id);
		scr_act_checkstateconnects_postrun(id);
		statename = v_act_state_cur.v_state_name;
		// states will determine faceright (direction)	
		v_act_faceright_prev = v_act_faceright;
		
	} else if (v_act_state_default != undefined) {
		v_act_state_cur = v_act_state_default;
		script_execute(v_act_state_cur.v_state_script_change, id);
	}
} else image_speed = 0;
