/// @description Insert description here

// these global variables were moved from o_global. May not be needed at all.
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


v_camera = view_camera[0];
v_camera_width = 0;
v_camera_height = 0;
camera_set_view_size(v_camera, v_camera_width, v_camera_height);
//view_set_wport(0, v_camera_width);
//view_set_hport(0, v_camera_height);
v_camera_follow = o_player;
v_camera_view_width_half = camera_get_view_width(v_camera) * 0.5;
v_camera_view_height_half = camera_get_view_height(v_camera) * 0.5;
v_camera_to_x = xstart;
v_camera_to_y = ystart;

enum enum_camera {
	smooth,
	plain,
	rigid
}

v_camera_type = enum_camera.plain;
v_camera_boundary_x = 40;
v_camera_boundary_y = 22;