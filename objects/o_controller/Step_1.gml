/// @description Determine keyboard or controller

// figure out what controller to use
if (!global.usecontroller) {
	for (i = 0; i < gamepad_get_device_count(); i++) {
		for (var btn = 0; btn < gamepad_button_count(i); btn++) {
			if (gamepad_button_check(i, btn)) {
				global.controllerport = i;
				i = gamepad_get_device_count();
				global.usecontroller = true;
			}
		}
		for (var axs = 0; axs < gamepad_axis_count(i); axs++) {
			if (gamepad_axis_value(i, axs) >= global.axis_deadzone) {
				global.controllerport = i;
				i = gamepad_get_device_count();
				global.usecontroller = true;
			}
		}
	}
} else {
	if (keyboard_check(vk_anykey)) {
		global.usecontroller = false;
	}
}
