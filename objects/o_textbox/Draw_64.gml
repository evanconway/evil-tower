/// @description Draw On GUI

if (v_textbox_isgui) {
	
	// adjust box to gui location
	switch (v_textbox_guipos) {
		case enum_textbox_guipos.center_center:
			x = global.resolution_width/2;
			y = global.resolution_height/2 - floor(v_textbox_height_max/2);
		break;
		case enum_textbox_guipos.bottom_center:
			x = global.resolution_width/2;
			y = global.resolution_height - v_textbox_height_max - 1;
		break;
	}
	scr_textbox_draw(id);
}
