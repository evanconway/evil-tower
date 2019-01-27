/// @description Insert description here

if (global.soundmenuactive) {
	v_soundmenu_rectwidth = v_soundmenu_rectwidth_max * global.menu_scale_x;
	v_soundmenu_rectheight = v_soundmenu_rectheight_max * global.menu_scale_y;
	v_soundmenu_rectx = global.gui_width/2 - v_soundmenu_rectwidth/2;
	v_soundmenu_recty = global.gui_height/2.5 - v_soundmenu_rectheight/2;
	
	//menu panel
	
	var x2 = v_soundmenu_rectx + v_soundmenu_rectwidth;
	var y2 = v_soundmenu_recty + v_soundmenu_rectheight;
	var borderx = v_soundmenu_border * global.menu_scale_x;
	var bordery = v_soundmenu_border * global.menu_scale_y;
	
	draw_set_alpha(1);
	draw_set_color(c_green);
	draw_rectangle(v_soundmenu_rectx, v_soundmenu_recty, x2, y2, false);
	
	draw_set_color(c_black);
	draw_rectangle(v_soundmenu_rectx + borderx, v_soundmenu_recty + bordery, x2 - borderx, y2 - bordery, false);

	//menu text
	draw_set_font(f_menu);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	if (v_soundmenu_control) {
		v_soundmenu_blinkalpha += v_soundmenu_blinkrate;
		if (v_soundmenu_blinkalpha > v_soundmenu_maxalpha) {
			v_soundmenu_blinkalpha = v_soundmenu_maxalpha;
			v_soundmenu_blinkrate = v_soundmenu_blinkrate * -1;
		}
		if (v_soundmenu_blinkalpha < 0) {
			v_soundmenu_blinkalpha = 0;
			v_soundmenu_blinkrate = v_soundmenu_blinkrate * -1;
		}	
	}
	for (i = 0; i < v_soundmenu_items; i++) {//remember that this is drawing bottom up
		var txt = v_soundmenu[i];
		var cursor = "";
		var color = c_dkgray;
		if (v_soundmenu_cursor == i) {
			cursor = string_insert(">", cursor, 0);
			color = c_white;
		}
		var xx = global.gui_width/v_soundmenu_x;
		var yy = global.gui_height/v_soundmenu_y - v_soundmenu_itemheight * i * v_soundmenu_spacer * global.menu_scale_y;
		draw_set_color(color);
		draw_set_alpha(1);
		draw_text_transformed(global.gui_width/v_soundmenu_pointerxxdivide, yy, cursor, global.menu_scale_x, global.menu_scale_y, 0);
		draw_text_transformed(xx, yy, txt, global.menu_scale_x, global.menu_scale_y, 0);
		
		//effects
		if (i == 1) draw_text_transformed(global.gui_width/v_soundmenu_valuex, yy, string_format(global.sfx_volume * 10, 1, 0), global.menu_scale_x, global.menu_scale_y, 0);
		//music
		if (i == 2) draw_text_transformed(global.gui_width/v_soundmenu_valuex, yy, string_format(global.music_volume * 10, 1, 0), global.menu_scale_x, global.menu_scale_y, 0);
		
		//make chosen option blink tastfully
		if (v_soundmenu_cursor == i) {
			draw_set_color(c_black);
			draw_set_alpha(v_soundmenu_blinkalpha);
			draw_text_transformed(xx, yy, txt, global.menu_scale_x, global.menu_scale_y, 0);
		}
	}
}
