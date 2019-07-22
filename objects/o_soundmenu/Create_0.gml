/// @description

global.soundmenuactive = false;
depth -= 2;

global.sfx_volume = 0.5;
global.music_volume = 0;

v_soundmenu[2] = "Music Volume ";
v_soundmenu[1] = "Effects Volume ";
v_soundmenu[0] = "Back";
v_soundmenu_items = array_length_1d(v_soundmenu);
v_soundmenu_itemheight = font_get_size(f_menu);
v_soundmenu_cursor = 2;
v_soundmenu_spacer = 1.5;
v_soundmenu_x = 2.6;
v_soundmenu_y = 2.3;

v_soundmenu_valuex = 1.6;

v_soundmenu_pointerxxdivide = 3;

v_soundmenu_blinkalpha = 0;
v_soundmenu_blinkrate = global.menu_blinkrate;
v_soundmenu_maxalpha = global.menu_maxalpha;

v_soundmenu_control = true;
v_soundmenu_committed = global.novalue;

v_soundmenu_rectwidth_max = 170;
v_soundmenu_rectheight_max = 60;
v_soundmenu_rectwidth = v_soundmenu_rectwidth_max;
v_soundmenu_rectheight = v_soundmenu_rectheight_max;
v_soundmenu_rectx = 0;
v_soundmenu_recty = 0;
v_soundmenu_border = 2;
