/// @description Insert description here
// You can write your code in this editor

//trying fake 3d array
//page, paragraph, line

var paragraph0 = array_create(6, "");
var paragraph1 = array_create(1, "");

page0string0 = "A long time ago, there was a wizard who lived in a";
page0string1 = "remote village. The wizard was powerful and";
page0string2 = "clever, but could not resist the temptation of the";
page0string3 = "dark arts. The evil magic poisoned the wizard's";
page0string4 = "mind. Corruption spread thoughout the wizard's";
page0string5 = "soul, and the villagers became fearful.";
page0string6 = " ";
page0string7 = "The wizard was exiled from the village.";

paragraph0[0] = page0string0;
paragraph0[1] = page0string1;
paragraph0[2] = page0string2;
paragraph0[3] = page0string3;
paragraph0[4] = page0string4;
paragraph0[5] = page0string5;

paragraph1[0] = page0string7;

introtext[0, 0] = paragraph0;
introtext[0, 1] = paragraph1;

var paragraph0 = array_create(5, "");
var paragraph1 = array_create(1, "");

page1string0 = "Furious and hurt, the wizard fled deep into the";
page1string1 = "forest. There, the wizard constructed a tower that";
page1string2 = "amplified the power of the dark arts. With ";
page1string3 = "newfound strength, the wizard prepared to enact";
page1string4 = "revenge on the village.";
page1string5 = " ";
page1string6 = "A terrible curse spread across the countryside.";

paragraph0[0] = page1string0;
paragraph0[1] = page1string1;
paragraph0[2] = page1string2;
paragraph0[3] = page1string3;
paragraph0[4] = page1string4;

paragraph1[0] = page1string6;

introtext[1, 0] = paragraph0;
introtext[1, 1] = paragraph1;

var paragraph0 = array_create(4, "");
var paragraph1 = array_create(1, "");

page2string0 = "Once each year, at the first snowfall, the dark";
page2string1 = "magic marks one soul from the village. A sacrifice.";
page2string2 = "The curse twists the minds of the villagers, and";
page2string3 = "instills hate in their hearts.";
page2string4 = " ";
page2string5 = "The marked soul is exiled from the village.";

paragraph0[0] = page2string0;
paragraph0[1] = page2string1;
paragraph0[2] = page2string2;
paragraph0[3] = page2string3;

paragraph1[0] = page2string5;

introtext[2, 0] = paragraph0;
introtext[2, 1] = paragraph1;

pagenum = 0;
paragraphnum = 0;
linenum = 0;
charnum = 1;// for some fucking reason strings are not 0 based index.

printdelay = 0;

printchardelay_max = 1;
printchardelay_sent = 45;
printparadelay_max = 90;
printpagedelay_max = 90;

if (false) {//for fast debugging
	printchardelay_max = 0;
	printchardelay_sent = 0;
	printparadelay_max = 0;
	printpagedelay_max = 60;
}

stringstodraw = ds_list_create();
drawingline = 0;

lineheight = font_get_size(f_menu);
spacer = 1.5;

fade_max = 1.5;//greater than 1 adds time until next page starts drawing
fade_percent = fade_max;
fade_rate = 0.02;
fade_steps = 13;

intro_x = 6.5;//bigger is further left
intro_y = 4;//bigger number is higher

intro_pagefinished = false;
intro_showbutton = false;
intro_continue_y = 1.1;

intro_cont_text = "Continue...";
v_intro_blinkalpha = 0;
v_intro_blinkrate = global.menu_blinkrate;
v_intro_maxalpha = global.menu_maxalpha;

intro_done = false;

enum enum_intro_state {
	printing,
	waiting,
	fading
}

intro_state = enum_intro_state.printing;