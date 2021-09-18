/// @description scr_transition_fade(targetroom)
/// @param targetroom
function scr_transition_fade() {

	/*
	We're using create depth here because not all rooms have 
	the same layers in string format. But all rooms have a 
	number for layers.
	*/
	if (!instance_exists(o_transition)) {
		with (instance_create_depth(x, y, global.transition_layer, o_transition_fade))
		{
			v_transition_targetroom = argument[0];
		}
	}



}
