/// @description Actor Movement

/*
Actors are built around states. the v_act_states variable contains a list of 
states the actor can enter. Each state also contains a list of states it 
connects to. Each cycle the actor will check/set the state it should be in,
run that states code, then check/set it should be in again. See the state 
object for more details.
*/

if (!global.freezeactors && v_act_freezetime <= 0 && global.freezeactors_time <= 0) {
	
	/*
	An actors input is determined by its ai object. Look at the object 
	assigned to v_act_ai to determine what inputs an actor is choosing.
	The step event and state code for actors only respond to the actcon
	settings determined by the v_act_ai object.
	*/
	
	/*
	inputlock essentially ingores AI decisions. The actor step
	only checks and decrements it. Look at AI objects to see
	how this is used.
	*/
	if (v_act_inputlocktime > 0) v_act_inputlocktime--;

	if (v_act_state_cur != undefined) {
			
		image_speed = 1;// this may get changed by the state code
			
		scr_act_checkstateconnects(id);
		
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
		
		if (!instance_exists(id)) exit; // states will destroy actor
		
		// state scripts do not actually move the actor, it just sets velocites
		// movement happens here
		if (v_act_vel_x != 0) scr_act_move_x(id, clamp(v_act_vel_x, v_act_vel_x_max * -1, v_act_vel_x_max));
		else scr_act_resetxinputstart(id);
		if (v_act_vel_y != 0) scr_act_move_y(id, clamp(v_act_vel_y, v_act_vel_y_max * -1, v_act_vel_y_max));
		else scr_act_resetyinputstart(id);
		
		// move actor hitboxes with actor
		if (v_act_hitbox != undefined) {
			v_act_hitbox.x = x;
			v_act_hitbox.y = y;
		}
		
		// altruns
		for (var i = 0; i < ds_list_size(v_act_state_cur.v_state_altruns); i++) {
			var altrun_state = ds_list_find_value(v_act_state_cur.v_state_altruns, i);
			if (altrun_state.v_state_script_altrun != undefined) {
				script_execute(altrun_state.v_state_script_altrun, id, altrun_state);
			}
		}
		
		// states will determine faceright (direction)	
		v_act_faceright_prev = v_act_faceright;

	} else if (v_act_state_default != undefined) {
		v_act_state_cur = v_act_state_default;
		script_execute(v_act_state_cur.v_state_script_change, id);
	}
	
	// destroy out of room boundaries
	if (x <= 0 || y <= 0 || x >= room_width || y >= room_height) {
		scr_act_kill(id);
	}
} else {
	image_speed = 0;
	v_act_freezetime--;
	if (v_act_freezetime < 0) v_act_freezetime = 0;
}
