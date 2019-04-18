/// @description Insert description here

// these global variables were moved from o_global. May not be needed at all.
global.resolution_width = 384; //1920 divided by 5
global.resolution_height = 216; //1080 divided by 5

v_camera_viewroom = false;

enum enum_window_size {
	one_x = 1,
	two_x = 2,
	three_x = 3
}
global.windowsize = enum_window_size.three_x;//multiplier for resolution.
window_set_size(global.resolution_width * global.windowsize, global.resolution_height * global.windowsize);
surface_resize(application_surface,global.resolution_width * global.windowsize, global.resolution_height * global.windowsize);
display_set_gui_size(global.resolution_width, global.resolution_height);

v_camera = view_camera[0];
v_camera_width = 0;
v_camera_height = 0;
//v_camera_view_width_half = 0;
//v_camera_view_height_half = 0;
v_camera_to_x = xstart;
v_camera_to_y = ystart;
v_camera_follow = global.player;

enum enum_camera {
	smooth,
	plain,
	rigid
}

v_camera_type = enum_camera.plain;

// boundaries determine how far from camera center follow can be.
v_camera_boundary_x = 40;
v_camera_boundary_y = 22;

v_camera_shake_framesperstep = 5; // num of frames camera will hold the shake offset value
v_camera_shake_step1 = 0; // flip offsets on 0
v_camera_shake_step2 = 0; // flip and decrement offsets on 0
/* 
Offset values double as "time" variable. The camera will continue to flip and decrement
offsets until they are both 0, resetting v_camera_shake_step each time. 
*/
v_camera_shake_offset_x = 0; // how much the camera is offset by in shake 
v_camera_shake_offset_y = 0;
