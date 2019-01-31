/// @description scr_char_isletter(char)

/// @param char

/*
"Char" should be a single character string. Returns true if that character is a letter.
Returns false if it is anything else (including a multi-character string).
*/

var result = false;

if (string_length(argument[0]) == 1) {
	var test_letter = argument[0];
	if (test_letter == "a" ||
	test_letter == "b" ||
	test_letter == "c" ||
	test_letter == "d" ||
	test_letter == "e" ||
	test_letter == "f" ||
	test_letter == "g" ||
	test_letter == "h" ||
	test_letter == "i" ||
	test_letter == "j" ||
	test_letter == "k" ||
	test_letter == "l" ||
	test_letter == "m" ||
	test_letter == "n" ||
	test_letter == "o" ||
	test_letter == "p" ||
	test_letter == "q" ||
	test_letter == "r" ||
	test_letter == "s" ||
	test_letter == "t" ||
	test_letter == "u" ||
	test_letter == "v" ||
	test_letter == "w" ||
	test_letter == "x" ||
	test_letter == "y" ||
	test_letter == "z" ||
	test_letter == "A" ||
	test_letter == "B" ||
	test_letter == "C" ||
	test_letter == "D" ||
	test_letter == "E" ||
	test_letter == "F" ||
	test_letter == "G" ||
	test_letter == "H" ||
	test_letter == "I" ||
	test_letter == "J" ||
	test_letter == "K" ||
	test_letter == "L" ||
	test_letter == "M" ||
	test_letter == "N" ||
	test_letter == "O" ||
	test_letter == "P" ||
	test_letter == "Q" ||
	test_letter == "R" ||
	test_letter == "S" ||
	test_letter == "T" ||
	test_letter == "U" ||
	test_letter == "V" ||
	test_letter == "W" ||
	test_letter == "X" ||
	test_letter == "Y" ||
	test_letter == "Z") {
		result = true;
	}
}

return result;