/// @description Setup 

global.player = o_player;
/*
Parts of code need to use specific sprites, but if we want to easily change the player object, we need
a way to more easily change those. For now our quick and dirty solution is to just make global vars
here that we can change as we need.
*/
global.player_sprite_front = s_plr_gnd_static;
global.player_sprite_back = s_plr_gnd_static_back;

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

// spawn/transitions
global.transition_layer = 199;
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
global.freezeactors_time = 0; // time in frames instead of boolean
global.freezeplayer = false;
global.freezescenes = false;
