/// @description scr_actor_getuserinput(o_actcon)
/// @param actcon
function scr_actcon_getuserinput() {

	var actcon = argument[0];
 
	actcon.v_actcon_up = scr_input_check(false, enum_input.up);
	actcon.v_actcon_down = scr_input_check(false, enum_input.down);
	actcon.v_actcon_left = scr_input_check(false, enum_input.left);
	actcon.v_actcon_right = scr_input_check(false, enum_input.right);
	actcon.v_actcon_button1 = scr_input_check(false, enum_input.button1);
	actcon.v_actcon_button2 = scr_input_check(false, enum_input.button2);
	actcon.v_actcon_button3 = scr_input_check(false, enum_input.button3);

	actcon.v_actcon_pressed_up = scr_input_check(true, enum_input.up);
	actcon.v_actcon_pressed_down = scr_input_check(true, enum_input.down);
	actcon.v_actcon_pressed_left = scr_input_check(true, enum_input.left);
	actcon.v_actcon_pressed_right = scr_input_check(true, enum_input.right);
	actcon.v_actcon_pressed_button1 = scr_input_check(true, enum_input.button1);
	actcon.v_actcon_pressed_button2 = scr_input_check(true, enum_input.button2);
	actcon.v_actcon_pressed_button3 = scr_input_check(true, enum_input.button3);



}
