/// @description Insert description here

v_camera = view_camera[0];
v_camera_width = 0;//global.resolution_width;
v_camera_height = 0;//global.resolution_height;
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