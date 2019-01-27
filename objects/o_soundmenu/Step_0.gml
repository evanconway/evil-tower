/// @description Insert description here

if (global.soundmenuactive) {	
	var soundchangeamount = 0.1;
	if (v_soundmenu_control) {
		if (scr_input_ui_check(enum_input.up)) {
			scr_playsfx(snd_UI1);
			v_soundmenu_cursor++;
			if (v_soundmenu_cursor >= v_soundmenu_items) v_soundmenu_cursor = 0;
		}
		if (scr_input_ui_check(enum_input.down)) {
			scr_playsfx(snd_UI1);
			v_soundmenu_cursor--;
			if (v_soundmenu_cursor < 0) v_soundmenu_cursor = v_soundmenu_items - 1;
		}
		
		//left and right for sound, unique to this menu
		if (scr_input_ui_check(enum_input.left)) && 
		((v_soundmenu_cursor == 1) || 
		(v_soundmenu_cursor == 2)) {
			v_soundmenu_committed = v_soundmenu_cursor;
			v_soundmenu_control = false;
			soundchangeamount = -0.1;
		}
		if (scr_input_ui_check(enum_input.right)) && 
		((v_soundmenu_cursor == 1) || 
		(v_soundmenu_cursor == 2)) {
			v_soundmenu_committed = v_soundmenu_cursor;
			v_soundmenu_control = false;
			soundchangeamount = 0.1;
		}
		if (scr_input_ui_check(enum_input.select)) {
			//playing sound later so sfx changes matter
			v_soundmenu_committed = v_soundmenu_cursor;
			v_soundmenu_control = false;
		}
		if (scr_input_ui_check(enum_input.cancel)) {
			scr_playsfx(snd_UIBack);
			global.soundmenuactive = false;
			v_soundmenu_committed = global.novalue;
			v_soundmenu_cursor = 2;
		}
	}
	if (v_soundmenu_committed != global.novalue) {
		switch (v_soundmenu_committed) {
			case 0://back
			global.soundmenuactive = false;
			v_soundmenu_committed = global.novalue;
			v_soundmenu_cursor = 2;
			break;
			case 1://Effects 
			v_soundmenu_committed = global.novalue;
			v_soundmenu_control = true;
			global.sfx_volume += soundchangeamount;
			if (global.sfx_volume > 1) global.sfx_volume = 0;
			if (global.sfx_volume < 0) global.sfx_volume = 1;
			break;
			case 2://Music 
			v_soundmenu_committed = global.novalue;
			v_soundmenu_control = true;
			global.music_volume += soundchangeamount;
			if (global.music_volume > 1) global.music_volume = 0;
			if (global.music_volume < 0) global.music_volume = 1;
			audio_sound_gain(o_music.v_music_currenttrack, global.music_volume, 0);
			break;
		}
		scr_playsfx(snd_select);
	}
}