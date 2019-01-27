/// @description scr_transition(state, targetroom)
/// @arg state sets transition state, use, next, goto, or restart
/// @arg room to transition to

with (o_transition)
{
	global.transition_state = argument[0];
	if (argument_count > 1) v_transition_target = argument[1];
}