/// @description Insert description here
/*
All instances of menu_scale have been replaced with "1".
*/

if (global.controlsactive) {
	v_controlsmenu_rectwidth = v_controlsmenu_rectwidth_max;
	v_controlsmenu_rectheight = v_controlsmenu_rectheight_max;
	v_controlsmenu_rectx = global.resolution_width/2 - v_controlsmenu_rectwidth/2;
	v_controlsmenu_recty = global.resolution_height/2.5 - v_controlsmenu_rectheight/2;
	
	//menu panel
	//var yoffset = v_controlsmenu_yoffset * 1 * -1;
	
	var x2 = v_controlsmenu_rectx + v_controlsmenu_rectwidth;
	var y2 = v_controlsmenu_recty + v_controlsmenu_rectheight;
	var borderx = v_controlsmenu_border * 1;
	var bordery = v_controlsmenu_border * 1;
	
	draw_set_alpha(1);
	draw_set_color(c_green);
	draw_rectangle(v_controlsmenu_rectx, v_controlsmenu_recty, x2, y2, false);
	
	draw_set_color(c_black);
	draw_rectangle(v_controlsmenu_rectx + borderx, v_controlsmenu_recty + bordery, x2 - borderx, y2 - bordery, false);

	//menu text
	draw_set_font(f_menu);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	if (v_controlsmenu_control) {
		v_controlsmenu_blinkalpha += v_controlsmenu_blinkrate;
		if (v_controlsmenu_blinkalpha > v_controlsmenu_maxalpha) {
			v_controlsmenu_blinkalpha = v_controlsmenu_maxalpha;
			v_controlsmenu_blinkrate = v_controlsmenu_blinkrate * -1;
		}
		if (v_controlsmenu_blinkalpha < 0) {
			v_controlsmenu_blinkalpha = 0;
			v_controlsmenu_blinkrate = v_controlsmenu_blinkrate * -1;
		}	
	}
	for (i = 0; i < v_controlsmenu_items; i++) {//remember that this is drawing bottom up
		var txt = v_controlsmenu[i];
		var cursor = "";
		var color = c_dkgray;
		if (v_controlsmenu_cursor == i) {
			cursor = string_insert(">", cursor, 0);
			color = c_white;
		}
		v_controlsmenu_x = global.resolution_width/3.2;
		v_controlsmenu_y = global.resolution_height/1.8;
		var xx = v_controlsmenu_x;
		var yy = v_controlsmenu_y - v_controlsmenu_itemheight * i * v_controlsmenu_spacer;
		draw_set_color(color);
		draw_set_alpha(1);
		draw_text_transformed(global.resolution_width/v_controlsmenu_pointerxxdivide, yy, cursor, 1, 1, 0);
		draw_text_transformed(xx, yy, txt, 1, 1, 0);
		
		var inputsx = 2;
		
		if (i == 8) {//controls for
			if (v_controlsmenu_showforkeyboard) draw_text_transformed(global.resolution_width/inputsx, yy, "Keyboard", 1, 1, 0);
			else draw_text_transformed(global.resolution_width/inputsx, yy, "Controller", 1, 1, 0);
		}
		if (i == 7) {//"Button 1";
			if (v_controlkeychanging == enum_input.button1) draw_set_color(c_yellow);
			else draw_set_color(color);
			if (v_controlsmenu_showforkeyboard) draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_keycheck(global.input_keyboard_button1), 1, 1, 0);
			else draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_controllercheck(global.input_controller_button1), 1, 1, 0);
		}
		if (i == 6) {//"Button 2";
			if (v_controlkeychanging == enum_input.button2) draw_set_color(c_yellow);
			else draw_set_color(color);
			if (v_controlsmenu_showforkeyboard) draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_keycheck(global.input_keyboard_button2), 1, 1, 0);
			else draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_controllercheck(global.input_controller_button2), 1, 1, 0);
		}
		if (i == 5) {//"Button 3";
			if (v_controlkeychanging == enum_input.button3) draw_set_color(c_yellow);
			else draw_set_color(color);
			if (v_controlsmenu_showforkeyboard) draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_keycheck(global.input_keyboard_button3), 1, 1, 0);
			else draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_controllercheck(global.input_controller_button3), 1, 1, 0);
		}
		if (i == 4) {//"Up";
			if (v_controlkeychanging == enum_input.up) draw_set_color(c_yellow);
			else draw_set_color(color);
			if (v_controlsmenu_showforkeyboard) draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_keycheck(global.input_keyboard_up), 1, 1, 0);
			else draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_controllercheck(global.input_controller_up), 1, 1, 0);
		}
		if (i == 3) {//"Down";
			if (v_controlkeychanging == enum_input.down) draw_set_color(c_yellow);
			else draw_set_color(color);
			if (v_controlsmenu_showforkeyboard) draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_keycheck(global.input_keyboard_down), 1, 1, 0);
			else draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_controllercheck(global.input_controller_down), 1, 1, 0);
		}
		if (i == 2) {//"Left";
			if (v_controlkeychanging == enum_input.left) draw_set_color(c_yellow);
			else draw_set_color(color);
			if (v_controlsmenu_showforkeyboard) draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_keycheck(global.input_keyboard_left), 1, 1, 0);
			else draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_controllercheck(global.input_controller_left), 1, 1, 0);
		}
		if (i == 1) {//"Right";
			if (v_controlkeychanging == enum_input.right) draw_set_color(c_yellow);
			else draw_set_color(color);
			if (v_controlsmenu_showforkeyboard) draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_keycheck(global.input_keyboard_right), 1, 1, 0);
			else draw_text_transformed(global.resolution_width/inputsx, yy, scr_string_controllercheck(global.input_controller_right), 1, 1, 0);
		}
		//make chosen option blink tastfully
		if (v_controlsmenu_cursor == i) {
			draw_set_color(c_black);
			draw_set_alpha(v_controlsmenu_blinkalpha);
			draw_text_transformed(xx, yy, txt, 1, 1, 0);
		}
	}
}
