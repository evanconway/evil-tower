/// @description Insert description here

v_intro_state = 0;
v_intro_textbox = instance_create_layer(x, y, "Text", o_textbox);

v_intro_segmentlists = ds_list_create();

var segments = ds_list_create();
var color = c_white;
var font = f_menu;

var text = "A long time ago, there was a wizard who lived in a" +
"remote village. The wizard was powerful and" +
"clever, but could not resist the temptation of the" +
"dark arts. The evil magic poisoned the wizard's" +
"mind. Corruption spread thoughout the wizard's" +
"soul, and the villagers became fearful.";
scr_list_addsegment_multi(segments,text, true, 0, font, color, true);
scr_list_addsegment_blankline(segments, true);
text = "The wizard was exiled from the village.";
scr_list_addsegment_multi(segments,text, true, 0, font, color, true);
scr_list_addsegment_blankline(segments, true);
scr_list_addsegment(segments, "Continue", false, 0, font, color, true, true, enum_txt_fx_phys.none, enum_txt_fx_colr.pulse);

ds_list_add(v_intro_segmentlists, segments);
segments = ds_list_create();

text = "Furious and hurt, the wizard fled deep into the" +
"forest. There, the wizard constructed a tower that" +
"amplified the power of the dark arts. With " +
"newfound strength, the wizard prepared to enact" +
"revenge on the village.";
scr_list_addsegment_multi(segments,text, true, 0, font, color, true);
scr_list_addsegment_blankline(segments, true);
text = "A terrible curse spread across the countryside.";
scr_list_addsegment_multi(segments,text, true, 0, font, color, true);
scr_list_addsegment_blankline(segments, true);
scr_list_addsegment(segments, "Continue", false, 0, font, color, true, true, enum_txt_fx_phys.none, enum_txt_fx_colr.pulse);

ds_list_add(v_intro_segmentlists, segments);
segments = ds_list_create();

text = "Once each year, at the first snowfall, the dark" +
"magic marks one soul from the village. A sacrifice." +
"The curse twists the minds of the villagers, and" +
"instills hate in their hearts.";
scr_list_addsegment_multi(segments,text, true, 0, font, color, true);
scr_list_addsegment_blankline(segments, true);
text = "The marked soul is exiled from the village.";
scr_list_addsegment_multi(segments,text, true, 0, font, color, true);
scr_list_addsegment_blankline(segments, true);
scr_list_addsegment(segments, "Continue", false, 0, font, color, true, true, enum_txt_fx_phys.none, enum_txt_fx_colr.pulse);

ds_list_add(v_intro_segmentlists, segments);
segments = ds_list_create();
ds_list_destroy(segments);