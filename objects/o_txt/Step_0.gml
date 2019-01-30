/// @description Calculate fx

switch (v_txt_fx_phys) {
	case 0:
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