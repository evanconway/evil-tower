/// @description scr_camera_shake(number, number)
/// @param x_start_offset
/// @param y_start_offset
function scr_camera_shake() {

	/*
	Camera shake is designed to flip and decrement x and y camera offsets each step.
	The starting offsets are also the shake time. So if the arguments passed in were
	(5, 0) the camera would start with an x offset of 5, and a y offset of 0. After
	shake_framesperstep has passed, both values will be flipped and decremented to
	0. 
	*/

	// round offset values since our camera code doesn't work with non-integers
	o_camera.v_camera_shake_offset_x = argument[0] div 1;
	o_camera.v_camera_shake_offset_y = argument[1] div 1;

	o_camera.v_camera_shake_step1 = o_camera.v_camera_shake_framesperstep;
	o_camera.v_camera_shake_step2 = 0;


}
