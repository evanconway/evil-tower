/// @description Read For Details

/*
That basic actor loop is: set correct state, run state code, set correct state again. To do that we have 
3 scripts for checking/setting the state before the run script, and 3 scripts for checking/setting after
run script has executed. All scripts use only 1 argument, the ID of the o_actor currently updating. Here 
are some detailed descriptions of the scripts:

connect
	Returns true/false. Determines if actor is eligible to enter this state. This is done by checking the
	actor position in the world relative to other objects, current input for actor_controller, and the
	current velocities of the actor.In the pre-run check loop, the first state_script_connect to return 
	true is the state the actor is set to.
change
	No return. Changes anything and everything needed to prepare the actor for script_run. Usually all 
	that's needed is a change of sprite, but we can do whatever we need/want.
continue
	Returns true/false. Serves the same function as the connect script, except the actor does not enter
	a different state if this returns true, it stays in the same state. The change script is NOT executed
	if this returns true.
run
	Do whatever we need for the state. This usually involves changing/setting velocity values and creating
	hitboxes for attacks.
connect_postrun
	Returns true/false. Same function as the pre-run connect. However as a design choice, we never check
	controller input here. This is because it's not possible for the controller input to have changed
	between the pre-run connect and the connect_postrun. All that really matter is actor position 
	relative to other objects, and actor velocities.
change_postrun
	No return. Same function as pre-run change. As a design choice we do not change actor velocities here.
	The only code that can change actor velocity is pre-run change and the run script. 99% of the time 
	this will likely only be to change sprite.
continue_postrun
	Returns true/false. Once again, same as pre-run continue, and like connect_postrun we do not check for
	button input.
altrun
	Some states need the actor to run code for it even when the actor is not in that state. States can be
	added to a states altruns list, and during the states step event, the altrun scripts of the states
	in that list will be run.
*/

v_state_connections = ds_list_create(); // this list is filled with o_state objects
v_state_script_connect = undefined; // determines if actor can enter this state
v_state_script_continue = undefined; // determines if other connects are checked
v_state_script_change = scr_state_changesprite; // executed when changing to this state
v_state_script_run = undefined;
v_state_script_connect_postrun = undefined; // determines if actor can enter this state after movement and other state code has executed
v_state_script_continue_postrun = scr_state_returntrue; // determines if other connects are check after run script
v_state_script_change_postrun = scr_state_changesprite; // executed when changing state after run
v_state_script_altrun = undefined; // any code the state needs run while actor is not in this state.
v_state_altruns = ds_list_create(); // list of states whos altrun scripts will be run while in this state
v_state_sprite = undefined;
v_state_sprite_left = undefined;
v_state_draw_behind = undefined; // behind and front are in reference to the actor
v_state_draw_front = undefined;
v_state_name = undefined;
v_state_count_max = 10; // only used in some states
v_state_count_min = 0;
v_state_count = v_state_count_max;
