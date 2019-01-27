/// @description scr_list_addsegment_multi(list, text, color)

/// @param list
/// @param text
/// @param color

var addword_multi_char;
var addword_multi_word = "";

/*
We have a huge ass variable name for "i" here because game maker has stupid ass scoping for variables.
This script gets called inside of a for loop, and if that outer for loop uses "i", then making another "i"
in here overwrites the outer "i". Fuck.
*/

for (var addsegment_multi_i = 1; addsegment_multi_i <= string_length(argument[1]); addsegment_multi_i++)
{
	/*
	Don't let the giant variable names confuse you. We're just iterating through the string "text" (argument[1])
	and adding each character to a variable (addword_multi_word)
	*/
	addword_multi_char = string_char_at(argument[1], addsegment_multi_i);
	addword_multi_word += addword_multi_char;
	if (addword_multi_char == " " || addsegment_multi_i >= string_length(argument[1])) 
	{
		var addword_multi_txt = instance_create_layer(0, 0, "Text", o_txt);
		scr_txt_set_text(addword_multi_txt, addword_multi_word);
		scr_txt_set_colr(addword_multi_txt, argument[2]);
		var addword_multi_segment = instance_create_layer(0, 0, "Text", o_segment);
		scr_segment_addtxt(addword_multi_segment, addword_multi_txt);
		ds_list_add(argument[0], addword_multi_segment);
		addword_multi_word = "";
	}
}