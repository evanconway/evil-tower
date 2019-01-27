/// @description Insert description here

if (global.screenmenuactive) {
	v_screenmenu_rectwidth = v_screenmenu_rectwidth_max * global.menu_scale_x;
	v_screenmenu_rectheight = v_screenmenu_rectheight_max * global.menu_scale_y;
	v_screenmenu_rectx = global.gui_width/2 - v_screenmenu_rectwidth/2;
	v_screenmenu_recty = global.gui_height/2.5 - v_screenmenu_rectheight/2;
	
	//menu panel
	
	var x2 = v_screenmenu_rectx + v_screenmenu_rectwidth;
	var y2 = v_screenmenu_recty + v_screenmenu_rectheight;
	var borderx = v_screenmenu_border * global.menu_scale_x;
	var bordery = v_screenmenu_border * global.menu_scale_y;
	
	draw_set_alpha(1);
	draw_set_color(c_green);
	draw_rectangle(v_screenmenu_rectx, v_screenmenu_recty, x2, y2, false);
	
	draw_set_color(c_black);
	draw_rectangle(v_screenmenu_rectx + borderx, v_screenmenu_recty + bordery, x2 - borderx, y2 - bordery, false);

	//menu text
	draw_set_font(f_menu);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if (v_screenmenu_control) {
		v_screenmenu_blinkalpha += v_screenmenu_blinkrate;
		if (v_screenmenu_blinkalpha > v_screenmenu_maxalpha) {
			v_screenmenu_blinkalpha = v_screenmenu_maxalpha;
			v_screenmenu_blinkrate = v_screenmenu_blinkrate * -1;
		}
		if (v_screenmenu_blinkalpha < 0) {
			v_screenmenu_blinkalpha = 0;
			v_screenmenu_blinkrate = v_screenmenu_blinkrate * -1;
		}	
	}
	for (i = 0; i < v_screenmenu_items; i++) {//remember that this is drawing bottom up
		var txt = v_screenmenu[i];
		var cursor = "";
		var color = c_dkgray;
		if (v_screenmenu_cursor == i) {
			cursor = string_insert(">", cursor, 0);
			color = c_white;
		}
		var xx = global.gui_width/v_screenmenu_x;
		var yy = global.gui_height/v_screenmenu_y - v_screenmenu_itemheight * i * v_screenmenu_spacer * global.menu_scale_y;
		draw_set_color(color);
		draw_set_alpha(1);
		draw_text_transformed(global.gui_width/v_screenmenu_pointerxxdivide, yy, cursor, global.menu_scale_x, global.menu_scale_y, 0);
		draw_text_transformed(xx, yy, txt, global.menu_scale_x, global.menu_scale_y, 0);
		
		//make chosen option blink tastfully
		if (v_screenmenu_cursor == i){
			draw_set_color(c_black);
			draw_set_alpha(v_screenmenu_blinkalpha);
			draw_text_transformed(xx, yy, txt, global.menu_scale_x, global.menu_scale_y, 0);
		}
	}
}
