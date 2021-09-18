/// @description scr_transition_elevator()
function scr_transition_elevator() {

	if (!instance_exists(o_transition)) {
		with (instance_create_depth(x, y, global.transition_layer, o_transition_elevator))
		{
			v_transition_targetroom = global.spawn_room;
			v_transition_elevator = global.spawn_obj;
		}
	}



}
