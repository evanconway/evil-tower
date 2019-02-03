/// @description Insert description here
// This object needs to be above the pause menu for some reason?

v_screenmenu_string = "";
if (window_get_fullscreen()) v_screenmenu_string = "Full Screen";
else v_screenmenu_string = "Windowed";

v_screenmenu[1] = v_screenmenu_string;
v_screenmenu[0] = "Back";
v_screenmenu_items = array_length_1d(v_screenmenu);
v_screenmenu_font = f_menu;
v_screenmenu_itemheight = font_get_size(f_menu);
v_screenmenu_cursor = 1;
v_screenmenu_spacer = 1.5;
v_screenmenu_x = 2;
v_screenmenu_y = 2.6;

v_screenmenu_valuex = 1.6;

v_screenmenu_pointerxxdivide = 2.5;

v_screenmenu_blinkalpha = 0;
v_screenmenu_blinkrate = global.menu_blinkrate;
v_screenmenu_maxalpha = global.menu_maxalpha;

v_screenmenu_control = true;
v_screenmenu_committed = global.novalue;

v_screenmenu_rectwidth_max = 170;
v_screenmenu_rectheight_max = 60;
v_screenmenu_rectwidth = v_screenmenu_rectwidth_max;
v_screenmenu_rectheight = v_screenmenu_rectheight_max;
v_screenmenu_rectx = 0;
v_screenmenu_recty = 0;
v_screenmenu_border = 2;

v_screenmenu_yoffset = 10;

v_screenmenu_windowchanged = false;
