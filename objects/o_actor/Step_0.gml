/// @description Actor Movement

/*
Actors are built around states. the v_act_states variable contains a list of 
states the actor can enter. Each state also contains a list of states it 
connects to. Each cycle the actor will check/set the state it should be in,
run that states code, then check/set it should be in again. See the state 
object for more details.
*/

if (!global.freezeactors) {
	
	image_speed = 1;// this may get changed by the state code
	
	// inputlock essentially ingores AI decisions. 
	if (v_act_inputlocktime <= 0) {
		// the ai script determines the inputs for act_controller
		if (v_act_aiscript != undefined) script_execute(v_act_aiscript, id);
	} else v_act_inputlocktime--;

	if (v_act_state_cur != undefined) {
		var statename = v_act_state_cur.v_state_name; // this is just for debugging, let's us easily see what state actor is in from debugger
		
		scr_act_checkstateconnects(id);
		statename = v_act_state_cur.v_state_name;
		
		/*
		Here we check for and set sprite and image changes booleans. We do this after our
		state connects script because that loop calls change scripts that often change
		the sprite index of our actor. And there are run scripts that check to see 
		if the sprite has changed.
		*/
		if (floor(sprite_index) != v_act_sprite_prev) {
			v_act_sprite_change = true;
			v_act_sprite_prev = floor(sprite_index);
		} else v_act_sprite_change = false;
		if (floor(image_index) != v_act_image_prev) {
			v_act_image_change = true;
			v_act_image_prev = floor(image_index);
		} else v_act_image_change = false;
		
		if (v_act_state_cur.v_state_script_run != undefined) script_execute(v_act_state_cur.v_state_script_run, id);
		
		// state scripts do not actually move the actor, it just sets velocites
		// movement happens here
		if (v_act_vel_x != 0) scr_act_move_x(id, v_act_vel_x);
		else scr_act_resetxinputstart(id);
		if (v_act_vel_y != 0) scr_act_move_y(id, v_act_vel_y);
		else scr_act_resetyinputstart(id);
		
		// altruns
		for (var i = 0; i < ds_list_size(v_act_state_cur.v_state_altruns); i++) {
			var altrun_state = ds_list_find_value(v_act_state_cur.v_state_altruns, i);
			if (altrun_state.v_state_script_altrun != undefined) {
				script_execute(altrun_state.v_state_script_altrun, id, altrun_state);
			}
		}
		
		/* Do we even need a post run check?????
		scr_act_checkstateconnects_postrun(id);
		statename = v_act_state_cur.v_state_name;
		*/
		
		// states will determine faceright (direction)	
		v_act_faceright_prev = v_act_faceright;
		
	} else if (v_act_state_default != undefined) {
		v_act_state_cur = v_act_state_default;
		script_execute(v_act_state_cur.v_state_script_change, id);
	}
} else image_speed = 0;
