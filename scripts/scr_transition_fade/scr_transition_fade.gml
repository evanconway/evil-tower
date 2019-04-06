/// @description scr_transition(targetroom)
/// @param targetroom

/*
We're using create depth here because not all rooms have 
the same layers in string format. But all rooms have a 
number for layers.
*/
if (!instance_exists(o_transition)) {
	with (instance_create_depth(x, y, 90, o_transition_fade))
	{
		v_transition_targetroom = argument[0];
	}
}
