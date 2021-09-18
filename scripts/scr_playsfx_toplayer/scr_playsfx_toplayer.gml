/// @description scr_playsfx_toplayer(number, number, sound, loop)
/// @param source_x
/// @param source_y
/// @param sound
/// @param loop
function scr_playsfx_toplayer() {

	var _x = argument[0];
	var _y = argument[1];

	if (_x < o_camera.x - camera_get_view_width(o_camera.v_camera) * 0.5) exit;
	if (_x > o_camera.x + camera_get_view_width(o_camera.v_camera) * 0.5) exit;
	if (_y < o_camera.y - camera_get_view_height(o_camera.v_camera) * 0.5) exit;
	if (_y > o_camera.y + camera_get_view_height(o_camera.v_camera) * 0.5) exit;

	if (argument_count < 4) scr_playsfx(argument[2]);
	else scr_playsfx(argument[2], argument[3]);


}
