/// @description scr_list_addsegment_multi(list, text, typed, chirp, font, color, startnewline, centered, fx_phys, fx_colr)

/// @param list
/// @param text
/// @param typed
/// @param chirp
/// @param font
/// @param color
/// @param startnewline
/// @param centered
/// @param fx_phys
/// @param fx_colr

var addword_multi_char;
var word = "";
var first_segment_added = false;
/*
We have a huge ass variable name for "i" here because game maker has stupid ass scoping for variables.
This script gets called inside of a for loop, and if that outer for loop uses "i", then making another "i"
in here overwrites the outer "i". Fuck.
*/
for (var addsegment_multi_i = 1; addsegment_multi_i <= string_length(argument[1]); addsegment_multi_i++)
{
	/*
	Don't let the giant variable names confuse you. We're just iterating through the string "text" (argument[1])
	and adding each character to a variable (word)
	*/
	addword_multi_char = string_char_at(argument[1], addsegment_multi_i);
	word += addword_multi_char;
	if (addword_multi_char == " " || addsegment_multi_i >= string_length(argument[1])) 
	{
		if (argument_count == 2) scr_list_addsegment(argument[0], word);
		if (argument_count == 3) scr_list_addsegment(argument[0], word, argument[2]);
		if (argument_count == 4) scr_list_addsegment(argument[0], word, argument[2], argument[3]);
		if (argument_count == 5) scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4]);
		if (argument_count == 6) scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4], argument[5]);
		if (argument_count == 7) {
			if (!first_segment_added) {
				scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4], argument[5], argument[6]);
				first_segment_added = true;
			} else scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4], argument[5]);
		}
		if (argument_count == 8) scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
		if (argument_count == 9) scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
		if (argument_count == 10) scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9]);
		word = "";
	}
}