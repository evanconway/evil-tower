/// @description scr_transition_spawn()

// set variables needed for spawn
global.player_health = global.player_health_max;

// execute transition script
script_execute(global.spawn_transitionscript, global.spawn_room, global.spawn_obj);
