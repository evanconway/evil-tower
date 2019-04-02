/// @description Setup 

global.novalue = undefined;

global.actors_visible = true;
global.static_visible = true;

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

//lvl
global.lvl_completed = false;
global.lvlintro_active = false;
global.lvlfinished = false;

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
