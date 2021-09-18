/// @description scr_transition_spawn()
function scr_transition_spawn() {

	ds_list_clear(global.enemies_slain);

	/// @description scr_transition_elevator()
	if (!instance_exists(o_transition)) {
		with (instance_create_depth(x, y, global.transition_layer, o_transition_spawn))
		{
			v_transition_targetroom = global.spawn_room;
		}
	}


}
