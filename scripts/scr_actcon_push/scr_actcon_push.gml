/// @description scr_actcon_push(o_actcon, num)
/// @param actcon_id
/// @param input_enum
function scr_actcon_push() {

	var actcon = argument[0];
	var input = argument[1];

	switch (input) {
		case enum_input.left:
		if (!actcon.v_actcon_left) actcon.v_actcon_pressed_left = true;
		else actcon.v_actcon_pressed_left = false;
		actcon.v_actcon_left = true;
		break;
		case enum_input.right:
		if (!actcon.v_actcon_right) actcon.v_actcon_pressed_right = true;
		else actcon.v_actcon_pressed_right = false;
		actcon.v_actcon_right = true;
		break;
		case enum_input.up:
		if (!actcon.v_actcon_up) actcon.v_actcon_pressed_up = true;
		else actcon.v_actcon_pressed_up = false;
		actcon.v_actcon_up = true;
		break;
		case enum_input.down:
		if (!actcon.v_actcon_down) actcon.v_actcon_pressed_down = true;
		else actcon.v_actcon_pressed_down = false;
		actcon.v_actcon_down = true;
		break;
		case enum_input.button1:
		if (!actcon.v_actcon_button1) actcon.v_actcon_pressed_button1 = true;
		else actcon.v_actcon_pressed_button1 = false;
		actcon.v_actcon_button1 = true;
		break;
		case enum_input.button2:
		if (!actcon.v_actcon_button2) actcon.v_actcon_pressed_button2 = true;
		else actcon.v_actcon_pressed_button2 = false;
		actcon.v_actcon_button2 = true;
		break;
		case enum_input.button3:
		if (!actcon.v_actcon_button3) actcon.v_actcon_pressed_button3 = true;
		else actcon.v_actcon_pressed_button3 = false;
		actcon.v_actcon_button3 = true;
		break;
	}



}
