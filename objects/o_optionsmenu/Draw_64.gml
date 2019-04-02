/// @description Insert description here

if (global.optionsactive) {
	v_optionsmenu_rectwidth = v_optionsmenu_rectwidth_max;
	v_optionsmenu_rectheight = v_optionsmenu_rectheight_max;
	v_optionsmenu_rectx = global.resolution_width/2 - v_optionsmenu_rectwidth/2;
	v_optionsmenu_recty = global.resolution_height/2.4 - v_optionsmenu_rectheight/2;
	
	//menu panel
	var x2 = v_optionsmenu_rectx + v_optionsmenu_rectwidth;
	var y2 = v_optionsmenu_recty + v_optionsmenu_rectheight;
	var borderx = v_optionsmenu_border
	var bordery = v_optionsmenu_border;
	
	draw_set_alpha(1);
	draw_set_color(c_blue);
	draw_rectangle(v_optionsmenu_rectx, v_optionsmenu_recty, x2, y2, false);
	
	draw_set_color(c_black);
	draw_rectangle(v_optionsmenu_rectx + borderx, v_optionsmenu_recty + bordery, x2 - borderx, y2 - bordery, false);

	//menu text
	draw_set_font(f_menu);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if (v_optionsmenu_control) {
		v_optionsmenu_blinkalpha += v_optionsmenu_blinkrate;
		if (v_optionsmenu_blinkalpha > v_optionsmenu_maxalpha) {
			v_optionsmenu_blinkalpha = v_optionsmenu_maxalpha;
			v_optionsmenu_blinkrate = v_optionsmenu_blinkrate * -1;
		}
		if (v_optionsmenu_blinkalpha < 0) {
			v_optionsmenu_blinkalpha = 0;
			v_optionsmenu_blinkrate = v_optionsmenu_blinkrate * -1;
		}	
	}
	for (i = 0; i < v_optionsmenu_items; i++) {//remember that this is drawing bottom up
		var txt = v_optionsmenu[i];
		var cursor = "";
		var color = c_dkgray;
		if (v_optionsmenu_cursor == i) {
			cursor = string_insert(">", cursor, 0);
			color = c_white;
		}
		var xx = global.resolution_width/v_optionsmenu_x;
		var yy = global.resolution_height/v_optionsmenu_y - v_optionsmenu_itemheight * i * v_optionsmenu_spacer * 1;
		draw_set_color(color);
		draw_set_alpha(1);
		draw_text_transformed(global.resolution_width/v_optionsmenu_pointerxxdivide, yy, cursor, 1, 1, 0);
		draw_text_transformed(xx, yy, txt, 1, 1, 0);
		
		//make chosen option blink tastfully
		if (v_optionsmenu_cursor == i) {
			draw_set_color(c_black);
			draw_set_alpha(v_optionsmenu_blinkalpha);
			draw_text_transformed(xx, yy, txt, 1, 1, 0);
		}
	}
}
