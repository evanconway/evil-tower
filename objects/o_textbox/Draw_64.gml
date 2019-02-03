/// @description Draw On GUI

if (v_textbox_isgui) {
	
	// adjust box to gui location
	switch (v_textbox_guipos) {
		case enum_textbox_guipos.top_left:
			x = 0;
			y = 0;
		break;
		case enum_textbox_guipos.top_center:
			x = floor(global.resolution_width/2);
			y = 0;
		break;
		case enum_textbox_guipos.top_right:
			x = global.resolution_width - v_textbox_width_max - 1;
			y = 0;
		break;
		case enum_textbox_guipos.center_left:
			x = 0;
			y = floor(global.resolution_height/2) - floor(v_textbox_height_max/2);
		break;
		case enum_textbox_guipos.center_center:
			x = floor(global.resolution_width/2);
			y = floor(global.resolution_height/2) - floor(v_textbox_height_max/2);
		break;
		case enum_textbox_guipos.center_right:
			x = global.resolution_width - v_textbox_width_max - 1;
			y = floor(global.resolution_height/2) - floor(v_textbox_height_max/2);
		break;
		case enum_textbox_guipos.bottom_left:
			x = 0;
			y = global.resolution_height - v_textbox_height_max - 1;
		break;
		case enum_textbox_guipos.bottom_center:
			x = floor(global.resolution_width/2);
			y = global.resolution_height - v_textbox_height_max - 1;
		break;
		case enum_textbox_guipos.bottom_right:
			x = global.resolution_width - v_textbox_width_max;
			y = global.resolution_height - v_textbox_height_max - 1;
		break;
	}
	scr_textbox_draw(id);
}
