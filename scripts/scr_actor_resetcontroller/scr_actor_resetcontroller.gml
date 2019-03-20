/// @description scr_actor_resetcontroller(o_actor)

/// @param actor_id

var ID = argument[0];
var actcon = ID.v_act_controller;

actcon.v_actcon_up = false;
actcon.v_actcon_down = false;
actcon.v_actcon_left = false;
actcon.v_actcon_right = false;
actcon.v_actcon_button1 = false;
actcon.v_actcon_button2 = false;
actcon.v_actcon_button3 = false;

actcon.v_actcon_pressed_up = false;
actcon.v_actcon_pressed_down = false;
actcon.v_actcon_pressed_left = false;
actcon.v_actcon_pressed_right = false;
actcon.v_actcon_pressed_button1 = false;
actcon.v_actcon_pressed_button2 = false;
actcon.v_actcon_pressed_button3 = false;
