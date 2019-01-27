/// @description Insert description here
// You can write your code in this editor

v_pausemenu[3] = "Return To Game";
v_pausemenu[2] = "Options";
v_pausemenu[1] = "Main Menu";
v_pausemenu[0] = "Quit";
v_pausemenu_items = array_length_1d(v_pausemenu);
v_pausemenu_font = f_menu;
v_pausemenu_itemheight = font_get_size(f_menu);
v_pausemenu_cursor = 3;
v_pausemenu_spacer = 1.5;
v_pausemenu_x = 0;
v_pausemenu_y = 0;

v_pausemenu_pointerxxdivide = 2.63;

v_pausemenu_blinkalpha = 0;
v_pausemenu_blinkrate = global.menu_blinkrate;
v_pausemenu_maxalpha = global.menu_maxalpha;

v_pausemenu_control = true;
v_pausemenu_committed = global.novalue;

v_pausemenu_alpha = 0.7;
v_pausemenu_rectwidth_max = 110;
v_pausemenu_rectheight_max = 130;
v_pausemenu_rectwidth = v_pausemenu_rectwidth_max;
v_pausemenu_rectheight = v_pausemenu_rectheight_max;
v_pausemenu_rectx = 0;
v_pausemenu_recty = 0;
v_pausemenu_border = 2;