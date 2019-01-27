/// @description script variables

event_inherited();

v_scene_running = false;
v_scene_triggered = false;

/*
Ihese variables are scripts that the step event will call. These variables will be
assigned values in the event creation code in the room editor when we add the scene.
The scripts assigned will be unique to each scene. 
*/

v_scene_trigger_scr = undefined; // the code that determines when this scene starts
v_scene_run_scr = undefined; // the unique code this scene will execute

/*
Similarly, each script may need its own arguments to work with. Here we create 
lists that we can also pass to the scripts. This allows us to have a flexible 
system where each script can have any number of arguments. By default we add the
ID of the scene to both lists of arguments.
*/

v_scene_trigger_args = ds_list_create();
ds_list_add(v_scene_trigger_args, id);
v_scene_run_args = ds_list_create();
ds_list_add(v_scene_run_args, id);