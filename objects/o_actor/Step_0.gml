/// @description Actor Movement

/*
Actors are built around states. the v_act_states variable contains a list of 
states the actor can enter. Each state also contains a list of states it 
connects to. States are determined by an actor controller, the state it's
in, and whatever game world properties the states check for. Remember that
states must be connected to eachother in the code for child actors. Also
remember that the order of these connections can make a big difference.
*/

if (!global.freezeactors) {
	
	image_speed = 1;// this may get changed by the state code
	
	// the ai script determines the inputs for act_controller
	if (v_act_aiscript != undefined) script_execute(v_act_aiscript, id);

	if (v_act_state_cur != undefined) {
		// this loops checks current state connections and changes state if conditions are true
		scr_act_checkstatechanges(id);

		if (v_act_state_cur.v_state_script_run != undefined) script_execute(v_act_state_cur.v_state_script_run, id);
		
		scr_act_checkstatechanges(id);
		
		/*
		I think we will need a second state check here. Picture this scenario:
		Player is in idle state standing at the edge of a cliff. They input right,
		which puts them in the run state. The run state moves them off the cliff.
		That means the step ends with the player in the run state in mid air. In
		that specific case, we need a second check after executing the run code 
		to see if they are in the air_dn state. Or whatever.
		*/

		// states will determine faceright (direction)	
		v_act_faceright_prev = v_act_faceright;
		
	} else if (v_act_state_default != undefined) {
		v_act_state_cur = v_act_state_default;
		script_execute(v_act_state_cur.v_state_script_change, id);
	}

	// state scripts do not actually move the actor, it just determines velocites
	// movement happens here
	if (v_act_vel_x != 0) scr_act_move_x(id, v_act_vel_x);
	else scr_act_resetxinputstart(id);
	if (v_act_vel_y != 0) scr_act_move_y(id, v_act_vel_y);
	else scr_act_resetyinputstart(id);
} else image_speed = 0;
