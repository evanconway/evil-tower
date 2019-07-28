/// @description Gui Var Menu Setup
v_menu_title[1] = "An Evil";
v_menu_title[0] = "Tower";

v_menu[2] = "Start";
//v_menu[2] = "Continue";
v_menu[1] = "Options";
v_menu[0] = "Quit";
v_menu_items = array_length_1d(v_menu);
v_menu_speed = 25;//lower is faster
v_menu_font = f_menu;
v_menu_itemheight = font_get_size(f_menu);
v_menu_cursor = 2;
v_menu_spacer = 1.5;

v_menu_pointerxxdivide = 2.5;

v_menu_textshadow = false;
v_menu_blinkalpha = 0;
v_menu_blinkrate = global.menu_blinkrate;
v_menu_maxalpha = global.menu_maxalpha;

global.v_menu_control = true; //this is global just so we can lock menu during transitions
v_menu_committed = global.novalue;

v_menu_gui_width = 0;
v_menu_gui_height = 0;
v_menu_gui_margin_mult = 0.05;
v_menu_gui_margin = 0;
v_menu_x = v_menu_gui_width * 0.5;
v_menu_y_start = v_menu_gui_height + v_menu_gui_margin * v_menu_spacer * v_menu_items;
v_menu_y = v_menu_y_start;
v_menu_y_target = v_menu_gui_height - v_menu_gui_margin;

v_menu_scale_x = v_menu_gui_width / global.resolution_width;
v_menu_scale_y = v_menu_gui_height / global.resolution_height;