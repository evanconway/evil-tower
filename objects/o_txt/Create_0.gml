/// @description 

v_txt_text = "";
v_txt_width = 0;// auto generated
v_txt_height = 0;// auto generated
v_txt_alpha = 1;
v_txt_font = f_dialog;
v_txt_color = c_white;
v_txt_chirp = undefined;

enum enum_txt_fx_phys {
	none,
	shake,
	hover,
	wobble,
	zoominout
}
v_txt_fx_phys = enum_txt_fx_phys.none;
v_txt_hoverspd = 0.05;
v_txt_hoverdist = 2;
v_txt_hoverdir = 1;// is only ever 1 or -1
v_txt_x_ofst = 0;
v_txt_y_ofst = 0;

enum enum_txt_fx_colr {
	none,
	pulse,
	rainbow,
	rnbowfade,
	rnbowflicker
}
v_txt_fx_colr = enum_txt_fx_colr.none;

v_txt_pulse_changerate = 0.015;
v_txt_pulse_dir = -1;// is only ever 1 or -1
v_txt_pulse_min = 0.4;
