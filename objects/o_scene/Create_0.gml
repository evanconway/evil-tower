/// @description script variables

event_inherited();

v_scene_running = false;
v_scene_triggered = false;
v_scene_counter = 0;

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

// finally, variables all scenes might need
v_scene_state = 0;

// Since the vast majority of scenes will use a dialog box
// let's just set that up here so it's easier.
v_scene_textbox = instance_create_layer(x, y, "Text", o_textbox);
v_scene_textbox.v_textbox_ispopup = true;
v_scene_textbox.v_textbox_isgui = true;
v_scene_textbox.v_textbox_hasportrait = true;
v_scene_textbox.v_textbox_guipos = enum_textbox_guipos.bottom_center;
v_scene_textbox.v_textbox_height_max = 50;
v_scene_textbox.v_textbox_width_max = 200;
v_scene_textbox.v_textbox_bodycolor = c_black;
v_scene_textbox.v_textbox_bordercolor = c_white;
v_scene_textbox.v_textbox_border_width = 3;
v_scene_textcolor = c_white;
v_scene_chirp = snd_chirp_default;
v_scene_dialogue_xoffset = 20;