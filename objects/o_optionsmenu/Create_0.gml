/// @description Insert description here
// This object needs to be above the pause menu for some reason?

v_optionsmenu[3] = "Controls";
v_optionsmenu[2] = "Screen";
v_optionsmenu[1] = "Sound";
v_optionsmenu[0] = "Back";
v_optionsmenu_items = array_length_1d(v_optionsmenu);
v_optionsmenu_font = f_menu;
v_optionsmenu_itemheight = font_get_size(f_menu);
v_optionsmenu_cursor = 3;
v_optionsmenu_spacer = 1.5;
v_optionsmenu_x = 2;
v_optionsmenu_y = 2.2;

v_optionsmenu_screenx = 1.6;

v_optionsmenu_pointerxxdivide = 2.5;

v_optionsmenu_blinkalpha = 0;
v_optionsmenu_blinkrate = global.menu_blinkrate;
v_optionsmenu_maxalpha = global.menu_maxalpha;

v_optionsmenu_control = true;
v_optionsmenu_committed = global.novalue;

v_optionsmenu_rectwidth_max = 180;
v_optionsmenu_rectheight_max = 80;
v_optionsmenu_rectwidth = v_optionsmenu_rectwidth_max;
v_optionsmenu_rectheight = v_optionsmenu_rectheight_max;
v_optionsmenu_rectx = 0;
v_optionsmenu_recty = 0;
v_optionsmenu_border = 2;