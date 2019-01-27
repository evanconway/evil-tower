/// @description Scripts assigned

/*
The popup on collision scene is the simplest, and probably most common scene we'll
have. It puts an invisible collision box in the game world, and if the player
runs into it, the game functionaly pauses, and a popup of text is displayed to the
user. The user has to hit a button to continue the game.
*/

event_inherited();
v_scene_trigger_scr = scr_scene_popup_collide_trigger;
v_scene_run_scr = scr_scene_popup_collide_run;

v_scene_pc_textbox = instance_create_layer(x, y, "Text", o_textbox);
v_scene_pc_textbox.v_textbox_ispopup = true;

scr_scene_popup_collide_settext(id, "This is a popup!");

ds_list_add(v_scene_run_args, v_scene_pc_textbox);