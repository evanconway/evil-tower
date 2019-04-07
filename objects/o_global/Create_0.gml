/// @description Setup 

global.player = o_player;

global.novalue = undefined;

global.firstroom = room_zombie;

global.currentroom = room;
global.prevroom = global.novalue;

global.actors_visible = true;
global.static_visible = true;

global.bboxs_visible = false;
global.draw_hud = true;
global.debug_keys_active = true;

global.enemies_slain = ds_list_create();

// spawn
global.spawn_transitionscript = undefined;
global.spawn_room = undefined;
global.spawn_obj = undefined;

//player
global.player_health_max = 3;
global.player_health = global.player_health_max;

//menus
global.menu_blinkrate = 0.02;
global.menu_maxalpha = 0.6;

global.sound_boundary_x = 200;
global.sound_boundary_y = 100;

global.freezeactors = false;
global.freezeplayer = false;
