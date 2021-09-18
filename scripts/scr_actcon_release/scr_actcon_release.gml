/// @description scr_actcon_release(o_actcon, num)
/// @param actcon_id
/// @param input_enum
function scr_actcon_release() {

	var actcon = argument[0];
	var input = argument[1];

	switch (input) {
		case enum_input.left:
		actcon.v_actcon_left = false;
		break;
		case enum_input.right:
		actcon.v_actcon_right = false;
		break;
		case enum_input.up:
		actcon.v_actcon_up = false;
		break;
		case enum_input.down:
		actcon.v_actcon_down = false;
		break;
		case enum_input.button1:
		actcon.v_actcon_button1 = false;
		break;
		case enum_input.button2:
		actcon.v_actcon_button2 = false;
		break;
		case enum_input.button3:
		actcon.v_actcon_button3 = false;
		break;
	}



}
