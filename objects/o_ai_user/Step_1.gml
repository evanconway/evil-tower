event_inherited();
if (v_ai_end) exit;
var act_controller = v_ai_actor.v_act_controller;

act_controller.v_actcon_up = scr_input_check(false, enum_input.up);
act_controller.v_actcon_down = scr_input_check(false, enum_input.down);
act_controller.v_actcon_left = scr_input_check(false, enum_input.left);
act_controller.v_actcon_right = scr_input_check(false, enum_input.right);
act_controller.v_actcon_button1 = scr_input_check(false, enum_input.button1);
act_controller.v_actcon_button2 = scr_input_check(false, enum_input.button2);
act_controller.v_actcon_button3 = scr_input_check(false, enum_input.button3);

act_controller.v_actcon_pressed_up = scr_input_check(true, enum_input.up);
act_controller.v_actcon_pressed_down = scr_input_check(true, enum_input.down);
act_controller.v_actcon_pressed_left = scr_input_check(true, enum_input.left);
act_controller.v_actcon_pressed_right = scr_input_check(true, enum_input.right);
act_controller.v_actcon_pressed_button1 = scr_input_check(true, enum_input.button1);
act_controller.v_actcon_pressed_button2 = scr_input_check(true, enum_input.button2);
act_controller.v_actcon_pressed_button3 = scr_input_check(true, enum_input.button3);
