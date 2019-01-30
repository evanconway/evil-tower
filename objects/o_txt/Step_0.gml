/// @description Calculate fx

switch (v_txt_fx_phys) {
	case enum_txt_fx_phys.hover:
		v_txt_y_ofst += v_txt_hoverspd * v_txt_hoverdir;
		if (v_txt_y_ofst < 0) {
			v_txt_hoverdir = 1;
			v_txt_y_ofst = 0;
		}
		if (v_txt_y_ofst > v_txt_hoverdist) {
			v_txt_hoverdir = -1;
			v_txt_y_ofst = v_txt_hoverdist;
		}
	break;
}

switch (v_txt_fx_colr) {
	case enum_txt_fx_colr.pulse:
		v_txt_alpha += v_txt_pulse_changerate * v_txt_pulse_dir;
		if (v_txt_alpha > 1) {
			v_txt_alpha = 1;
			v_txt_pulse_dir = -1;
		}
		if (v_txt_alpha < v_txt_pulse_min) {
			v_txt_alpha = v_txt_pulse_min;
			v_txt_pulse_dir = 1;
		}
	break;
}