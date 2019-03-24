/// @description Setup 

global.novalue = undefined;

global.resolution_width = 384; //1920 divided by 5
global.resolution_height = 216; //1080 divided by 5

global.view_room = false;

/* After a Game Maker Studio update, display_get_gui_width() and
display_get_gui_height() began returning different values than before.
I replaced all instances of those functions with these variables. 
If the menus disappear again this is the first thing to look at
*/
global.gui_width = global.resolution_width;//display_get_gui_width();
global.gui_height = global.resolution_height;//display_get_gui_height();

enum enum_window_size {
	one_x = 1,
	two_x = 2,
	three_x = 3
}
global.windowsize = enum_window_size.three_x;//multiplier for resolution.

global.actors_visible = true;
global.player_data = false;
global.static_visible = true;

global.sfx_volume = 0.7;
global.music_volume = 0;
global.bboxs_visible = false;
global.draw_hud = true;
global.debug_keys_active = true;

//player
global.player_health_max = 3;
global.player_health = global.player_health_max;
global.player_sword_dmg = 1;

global.currentroom = room;
global.prevroom = global.novalue;

global.firstroom = test_scenechar;

// scenes
global.scene_active = false;

global.transition_state = 0;

//menus
global.menu_blinkrate = 0.02;
global.menu_maxalpha = 0.6;

global.canpause = false;
global.pauseactive = false;
global.optionsactive = false;
global.controlsactive = false;
global.soundmenuactive = false;
global.screenmenuactive = false;

//lvl
global.lvl_completed = false;

global.lvlintro_active = false;
global.lvlfinished = false;

global.menu_scale_x = global.gui_width / global.resolution_width;
global.menu_scale_y = global.gui_width / global.resolution_height;

//input
global.input_keyboard_left = ord("A");
global.input_keyboard_right = ord("D");
global.input_keyboard_up = ord("W");
global.input_keyboard_down = ord("S");
global.input_keyboard_button1 = ord("K");
global.input_keyboard_button2 = ord("J");
global.input_keyboard_button3 = ord("L");
global.input_keyboard_start = vk_escape;
global.input_keyboard_select = vk_enter;
global.input_keyboard_cancel =  vk_escape;
global.input_debugging = false;

enum enum_axis {
	trigger_left = -10,
	trigger_right = -9,
	left_left = -8,
	left_right = -7,
	left_up = -6,
	left_down = -5,
	right_left = -4,
	right_right = -3,
	right_up = -2,
	right_down = -1
}

enum enum_attack_stage {
	startup,
	swing,
	recovery
}

global.trigger_left_prev = 0;
global.trigger_right_prev = 0;
global.axis_left_h_prev = 0;
global.axis_left_v_prev = 0;
global.axis_right_h_prev = 0;
global.axis_right_v_prev = 0;

global.axis_deadzone = 0.6;

global.input_controller_up = enum_axis.left_up;//axis inputs must be assigned with our enumerator, not gml 
global.input_controller_down = enum_axis.left_down;
global.input_controller_left = enum_axis.left_left;
global.input_controller_right = enum_axis.left_right;
global.input_controller_button1 = gp_face1;
global.input_controller_button2 = gp_face2;
global.input_controller_button3 = gp_face3;
global.input_controller_start = gp_start;
global.input_controller_select = gp_face1;
global.input_controller_cancel =  gp_face2;

enum enum_input {
	left,
	right,
	up,
	down,
	button1,
	button2,
	button3,
	start,
	select,
	cancel
}

global.input_x = 0;
global.input_y = 0;

global.sound_boundary_x = 200;
global.sound_boundary_y = 100;

global.freezeactors = false;
global.freezeplayer = false;

//doors
global.door_playerentered = global.novalue;
global.door_newroom = global.novalue;
global.door_exiting = global.novalue;

//elevators
global.elevator_active = false;

enum enum_elevator_type {
	lvl_start,
	lvl_end,
	move
}

enum enum_elevator_state {
	entering,
	moving,
	leaving
}

global.usecontroller = false;
global.controllerport = 0;

