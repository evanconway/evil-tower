/// @description scr_obj_hurt_act(o_obj, o_actor, number)
/// @param obj_hitting
/// @param actor_hurting
/// @param health_lost

/*
Actors can only be hurt if they have a hurt state. Health is stored in the state,
not the actor. 
*/

var ID = argument[0];
var hitID = argument[1];
var damage = argument[2];

if (hitID.v_act_state_hurt != undefined) {
	// first check if the hit actor already has the offending object in its hitboxes list
	var hitboxfound = false;
	for (var i = 0; i < ds_list_size(hitID.v_act_hitboxes_struck); i++) {
		if (ID == ds_list_find_value(hitID.v_act_hitboxes_struck, i)) {
			hitboxfound = true;
			i = ds_list_size(hitID.v_act_hitboxes_struck);
		}
	}
	
	// if the offending object is not in the list, then this is a true hit.
	if (!hitboxfound) {
		var hurt = hitID.v_act_state_hurt;
		hitID.v_act_state_cur = hurt;
		scr_state_changesprite(hitID);
		hurt.v_state_hurt_vel_y = hurt.v_state_hurt_knock_y;
		// for x vel, we want the actor to move away from the offending actor
		if (hitID.x > ID.x) hitID.v_act_vel_x = hurt.v_state_hurt_knock_x;
		if (hitID.x < ID.x) hitID.v_act_vel_x = hurt.v_state_hurt_knock_x * -1;
		if (hitID.x == ID.x) hitID.v_act_vel_x = 0;
		/*
		Something to note is that it's ok if we just blindly assign velocities to
		the actor because we are in the end step. The script_run for the hurt actor
		will not run until the step event of the next frame. And it's only after that
		script is run that the actor is actually moved. So we can check for walls and
		whatever in the run script of the state. 
		*/
		
		scr_actor_resetcontroller(hitID);
		hurt.v_state_count = hurt.v_state_count_max;
		hitID.v_act_inputlocktime = hurt.v_state_count_max;
		
		hurt.v_state_hurt_health -= damage;
	}
}
