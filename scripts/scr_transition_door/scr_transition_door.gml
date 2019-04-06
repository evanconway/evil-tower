/// @description scr_transition_door(o_door)
/// @param door_entering

/*
As long as we're careful, we don't need the data for the exit door, as the enter door contains 
its ID. We just have to make sure the o_transition_door object doesn't reference doors
that don't exist in the room.
*/

var door1 = argument[0];

if (!instance_exists(o_transition)) {
	with (instance_create_depth(x, y, 90, o_transition_door))
	{
		v_transition_targetroom = door1.v_door_target_room;
		v_transition_door1 = door1;
		v_transition_door2 = door1.v_door_target_door;
	}
}