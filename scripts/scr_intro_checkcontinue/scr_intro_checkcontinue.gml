/// @description scr_intro_checkcontinue()

if (scr_input_check(true, enum_input.select)) ||
		(scr_input_check(true, enum_input.button1)) ||
		(scr_input_check(true, enum_input.start)) ||
		(keyboard_check_pressed(vk_space))
		return true;
		else return false;