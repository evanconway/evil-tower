/// @description scr_transition_elevator(o_elevator)
/// @param exit_elevator

if (!instance_exists(o_transition)) {
	with (instance_create_depth(x, y, 90, o_transition_elevator))
	{
		v_transition_targetroom = global.spawn_room;
		v_transition_elevator = global.spawn_obj;
	}
}
