/// @description Draw On GUI

if (v_textbox_isgui) {
	
	// adjust box to gui location
	switch (v_textbox_guipos) {
		case enum_textbox_guipos.center_center:
			x = global.resolution_width/2;
			//magic numbers here. I should be able to divide height by 2, don't know why that doesn't look right.
			y = global.resolution_height/2 - v_textbox_height_max/4;
		break;
		case enum_textbox_guipos.custom:
		break;
	}
	
	scr_textbox_draw(id);
}
