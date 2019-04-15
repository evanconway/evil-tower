/// @description Read comments for explanation

/*
If a trigger script has been assigned an existing script, this scene will check it
each step event to see if the scene has begun. If the script returns true, we 
set the scene to running.
*/
 
if (!global.freezescenes) {
 
	if (v_scene_trigger_scr != undefined && 
		script_exists(v_scene_trigger_scr) &&
		!v_scene_triggered) {
		if (script_execute(v_scene_trigger_scr, v_scene_trigger_args) && !v_scene_running) {
			v_scene_triggered = true;
			v_scene_running = true;
			global.scene_active = true;
		}
	}

	/*
	Here we check to see if we should execute the run script
	*/

	if (v_scene_run_scr != undefined && v_scene_running) script_execute(v_scene_run_scr, v_scene_run_args);
	else global.scene_active = false;

}