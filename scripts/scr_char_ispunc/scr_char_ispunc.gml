/// @description scr_char_ispunc(char)

/// @param char

/*
Returns true if char is a single puncuation character
*/

var result = false;

if (string_length(argument[0]) == 1) {
	var test_letter = argument[0];
	if (test_letter == "." ||
	test_letter == "!" ||
	test_letter == "?" ||
	test_letter == "," ||
	test_letter == ";" ||
	test_letter == "-" ||
	test_letter == ":") {
		result = true;
	}
}

return result;