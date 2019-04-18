/// @description

global.controlsactive = false;
depth -= 2;

v_controlsmenu[8] = "Controls For: ";
v_controlsmenu[7] = "Jump";
v_controlsmenu[6] = "Attack";
v_controlsmenu[5] = "Defend";
v_controlsmenu[4] = "Up";
v_controlsmenu[3] = "Down";
v_controlsmenu[2] = "Left";
v_controlsmenu[1] = "Right";
v_controlsmenu[0] = "Back";
v_controlsmenu_items = array_length_1d(v_controlsmenu);
v_controlsmenu_itemheight = font_get_size(f_menu);
v_controlsmenu_cursor = 8;
v_controlsmenu_spacer = 1.5;
v_controlsmenu_x = global.resolution_width/2;
v_controlsmenu_y = global.resolution_height/2;

v_controlsmenu_showforkeyboard = true;

v_controlsmenu_pointerxxdivide = 3.45;

v_controlkeychanging = global.novalue;

v_controlsmenu_blinkalpha = 0;
v_controlsmenu_blinkrate = global.menu_blinkrate;
v_controlsmenu_maxalpha = global.menu_maxalpha;

v_controlsmenu_control = true;
v_controlsmenu_committed = global.novalue;

v_controlsmenu_change = false;

v_controlsmenu_rectwidth_max = 170;
v_controlsmenu_rectheight_max = 150;
v_controlsmenu_rectwidth = v_controlsmenu_rectwidth_max;
v_controlsmenu_rectheight = v_controlsmenu_rectheight_max;
v_controlsmenu_rectx = 0;
v_controlsmenu_recty = 0;
v_controlsmenu_border = 2;

v_controlsmenu_yoffset = 10;