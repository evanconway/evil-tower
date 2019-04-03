/// @description Delete Hitboxes

/*
I'm pretty sure that by having this in the begin step, it is possible for the actor
to have one frame where they are not in the hurt state, but are invulnerable to 
hitboxes. That's probably fine though.
*/

if (v_act_state_cur == v_act_state_hurt) {
	for (var i = 0; i < ds_list_size(v_act_hitboxes_struck); i++) {
		if (!instance_exists(ds_list_find_value(v_act_hitboxes_struck, i))) {
			ds_list_delete(v_act_hitboxes_struck, i);
		}
	}
} else ds_list_clear(v_act_hitboxes_struck)
