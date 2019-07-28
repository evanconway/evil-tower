/// @description Insert description here

v_intro_state = 0;
v_intro_textbox = instance_create_layer(x, y, "Text", o_textbox);
v_intro_textbox.v_textbox_isgui = true;
v_intro_textbox.v_textbox_ispopup = false;
v_intro_textbox.v_textbox_guipos = enum_textbox_guipos.center_center;
v_intro_textbox.v_textbox_width_max = 300;
v_intro_textbox.v_textbox_bordercolor = undefined;
v_intro_textbox.v_textbox_bodycolor = undefined;
v_intro_segmentlists = ds_list_create();
v_intro_segment_index = 0;
v_intro_continue = instance_create_layer(x, y, "Text", o_textbox);
v_intro_continue.v_textbox_height_max = 30;// increase this number to raise the height of "continue"
v_intro_continue.v_textbox_isgui = true;
v_intro_continue.v_textbox_ispopup = false;
v_intro_continue.v_textbox_guipos = enum_textbox_guipos.bottom_center;
v_intro_continue.v_textbox_bordercolor = undefined;
v_intro_continue.v_textbox_bodycolor = undefined;

v_intro_alpha = 0;
v_intro_alpha_rate = 0.05;
v_intro_alpha_timer = 0;
v_intro_alpha_timer_max = 3;
v_intro_alpha_max = 1.4;// janky, but it works to just raise the alpha above one to increase wait time between text

var segments = ds_list_create();
var color = c_white;
var font = f_menu;

scr_list_addsegment(segments, "Continue", false, undefined, font, color, true, true, enum_txt_fx_phys.hover, enum_txt_fx_colr.pulse);
scr_textbox_setsegments(v_intro_continue, segments);
segments = ds_list_create();

var text = "A long time ago, there was a wizard who lived in a remote village. The wizard was powerful and " +
"clever, but could not resist the temptation of the dark arts. The evil magic poisoned the wizard's " +
"mind. Corruption spread thoughout the wizard's soul, and the villagers became fearful.";
scr_list_addsegment_multi(segments,text, true, undefined, font, color, true);
scr_list_addsegment_blankline(segments, true);
text = "The wizard was exiled from the village.";
scr_list_addsegment_multi(segments,text, true, undefined, font, color, true);

ds_list_add(v_intro_segmentlists, segments);
segments = ds_list_create();

text = "Furious and hurt, the wizard fled deep into the forest. There, the wizard constructed a tower that " +
"amplified the power of the dark arts. With newfound strength, the wizard prepared to enact " +
"revenge on the village.";
scr_list_addsegment_multi(segments,text, true, undefined, font, color, true);
scr_list_addsegment_blankline(segments, true);
text = "A terrible curse spread across the countryside.";
scr_list_addsegment_multi(segments,text, true, undefined, font, color, true);

ds_list_add(v_intro_segmentlists, segments);
segments = ds_list_create();

text = "Viscious creatures filled the country side. And now, someone must climb the evil tower " +
"and slay the boss that lurks at the top";
scr_list_addsegment_multi(segments,text, true, undefined, font, color, true);
scr_list_addsegment_blankline(segments, true);
text = "This is your task...";
scr_list_addsegment_multi(segments,text, true, undefined, font, color, true);

ds_list_add(v_intro_segmentlists, segments);
segments = ds_list_create();
ds_list_destroy(segments);
