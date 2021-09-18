/// @description Insert description here

// draw my name!

draw_set_font(f_dialog);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(c_dkgray);
draw_text(0, global.resolution_height, "By: Evan Conway");

v_menu_gui_width = global.resolution_width;
v_menu_gui_height = global.resolution_height;
v_menu_gui_margin = global.resolution_height * v_menu_gui_margin_mult;
v_menu_x = v_menu_gui_width * 0.5;
v_menu_y_start = v_menu_gui_height + v_menu_gui_margin * v_menu_spacer * v_menu_items;
v_menu_y_target = v_menu_gui_height - v_menu_gui_margin;

draw_set_font(f_title);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

var title_start = 90;
var title_gap = 31;
var outline_n = 1;

for (i = 0; i < 2; i++)
{
	//creates black outline, janky but whatever
	draw_set_color(c_black);
	draw_text(global.resolution_width/2-outline_n, title_start - i*title_gap, v_menu_title[i]);
	draw_text(global.resolution_width/2-outline_n, title_start - i*title_gap-outline_n, v_menu_title[i]);
	draw_text(global.resolution_width/2, title_start - i*title_gap-outline_n, v_menu_title[i]);
	draw_text(global.resolution_width/2+outline_n, title_start - i*title_gap-outline_n, v_menu_title[i]);
	draw_text(global.resolution_width/2+outline_n, title_start - i*title_gap, v_menu_title[i]);
	draw_text(global.resolution_width/2+outline_n, title_start - i*title_gap+outline_n, v_menu_title[i]);
	draw_text(global.resolution_width/2, title_start - i*title_gap+outline_n, v_menu_title[i]);
	draw_text(global.resolution_width/2-outline_n, title_start - i*title_gap+outline_n, v_menu_title[i]);
	draw_set_color(c_aqua);
	draw_text(global.resolution_width/2, title_start - i*title_gap, v_menu_title[i]);
}

draw_set_font(f_menu);

if (global.v_menu_control)
{
	v_menu_blinkalpha += v_menu_blinkrate;
	if (v_menu_blinkalpha > v_menu_maxalpha)
	{
		v_menu_blinkalpha = v_menu_maxalpha;
		v_menu_blinkrate = v_menu_blinkrate * -1;
	}
	if (v_menu_blinkalpha < 0)
	{
		v_menu_blinkalpha = 0;
		v_menu_blinkrate = v_menu_blinkrate * -1;
	}	
}

for (i = 0; i < v_menu_items; i++)//remember that this is drawing bottom up
{
	var txt = v_menu[i];
	var cursor = "";
	var color = c_dkgray; // should be c_dkgray
	//var color = c_black; // for screen cap
	if (v_menu_cursor == i)
	{
		cursor = string_insert(">", cursor, 0);
		color = c_white;
		//color = c_black; // for screen cap
	}
	var xx = v_menu_x;
	var yy = v_menu_y - v_menu_itemheight * i * v_menu_spacer;
	#region//shadow
	if (v_menu_textshadow)//don't delete... might be able to use for blink when option selected
	{
		draw_set_color(c_navy);
		var offset = 1;
		draw_text_transformed(xx + offset, yy, txt, 1, 1, 0);
		draw_text_transformed(xx, yy + offset, txt, 1, 1, 0);
		draw_text_transformed(xx - offset, yy, txt, 1, 1, 0);
		draw_text_transformed(xx, yy - offset, txt, 1, 1, 0);
	}
	#endregion
	draw_set_color(color);
	draw_set_alpha(1);
	draw_text(v_menu_gui_width/v_menu_pointerxxdivide, yy, cursor);
	draw_text(xx, yy, txt);
	
	//maker chosen option blink tastfully
	if (v_menu_cursor == i)
	{
		draw_set_color(c_black);
		draw_set_alpha(v_menu_blinkalpha);
		draw_text(xx, yy, txt);
	}
}
