/// @description Insert description here
if (room != global.currentroom) {
	global.prevroom = global.currentroom;
	global.currentroom = room;
	
	audio_stop_sound(snd_elevator_mv);
}

// figure out what controller to use
for (i = 0; i < gamepad_get_device_count(); i++) {
	for (var btn = 0; btn < gamepad_button_count(i); btn++) {
		if (gamepad_button_check(i, btn)) {
			global.controllerport = i;
			i = gamepad_get_device_count();
		}
	}
	for (var axs = 0; axs < gamepad_axis_count(i); axs++) {
		if (gamepad_axis_value(i, axs) >= global.axis_deadzone) {
			global.controllerport = i;
			i = gamepad_get_device_count();
		}
	}
}

if (keyboard_check(vk_anykey)) {
	global.usecontroller = false;
} else global.usecontroller = true; // this is kinda janky? Does it matter?

global.input_x = 0;
global.input_y = 0;

#region // doors (moving player between them)
if (room == global.door_newroom) {
	scr_plr_setstate(o_player, enum_plr_state.door);
}
#endregion

if (room > 3) && (global.transition_state == enum_transition_state.off) {
	global.canpause = true;
} else {
	global.canpause = false;
}

if (!instance_exists(o_elevator)) global.elevator_active = false;

if (global.pauseactive ||
	global.elevator_active ||
	global.transition_state != enum_transition_state.off) {
	global.freezeactors = true;
} else global.freezeactors = false;