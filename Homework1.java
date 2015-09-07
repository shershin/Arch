/**
 * CMPT 422 Fall 2015 Homework 1
 *
 * @author Dave Poplawski
 * @author Anthony Giorgio
 */
public class Homework1 {

public static void main(){
	String binary = '101001';
		Homework1.unsigned(binary);
		Homework1.signmag(binary);
		Homework1.twoscomp(binary);
		Homework1.string(binary);
}
	/**
	 * Convert a binary string representing an unsigned binary number to the
	 * equivalent base-10 string. For example, the string "101001" should be
	 * converted to "41".
	 *
	 * @param binary
	 *            The string to convert (between 2 and 40 binary digits).
	 *
	 * @return The equivalent base-10 number, as a string.
	 */

	public static String unsigned(String binary) {

		return "";
	}

	/**
	 * Convert a binary string representing an sign-magnitude binary number to
	 * the equivalent base-10 string. For example, the string "101001" should be
	 * converted to "-9", and the string "001001" should be converted to "+9".
	 *
	 * @param binary
	 *            The string to convert (between 2 and 40 binary digits).
	 *
	 * @return The equivalent base-10 number, as a string.
	 */
	public static String signmag(String binary) {
		return "";
	}

	/**
	 * Convert a binary string representing an 2's complement binary number to
	 * the equivalent base-10 string. For example, the string "101001" should be
	 * converted to "-23".
	 *
	 * @param binary
	 *            The string to convert (between 2 and 40 binary digits).
	 *
	 * @return The equivalent base-10 number, as a string.
	 */
	public static String twoscomp(String binary) {
		return "";
	}

	/**
	 * Convert a binary string representing sequence of 8-bit ASCII characters
	 * to the equivalent string. For example, the string "0100000100101011"
	 * should be converted to "A+".
	 *
	 * @param binary
	 *            The string to convert, which is a multiple of 8 bits, between
	 *            8 and 40 bits.
	 *
	 * @return The equivalent ASCII string.
	 */
	public static String string(String binary) {
		return "";
	}

	static final char[] ASCII_TABLE = {
	/** Glyph, Dec **/
	' ', /** 000 **/
	' ', /** 001 **/
	' ', /** 002 **/
	' ', /** 003 **/
	' ', /** 004 **/
	' ', /** 005 **/
	' ', /** 006 **/
	' ', /** 007 **/
	' ', /** 008 **/
	' ', /** 009 **/
	' ', /** 010 **/
	' ', /** 011 **/
	' ', /** 012 **/
	' ', /** 013 **/
	' ', /** 014 **/
	' ', /** 015 **/
	' ', /** 016 **/
	' ', /** 017 **/
	' ', /** 018 **/
	' ', /** 019 **/
	' ', /** 020 **/
	' ', /** 021 **/
	' ', /** 022 **/
	' ', /** 023 **/
	' ', /** 024 **/
	' ', /** 025 **/
	' ', /** 026 **/
	' ', /** 027 **/
	' ', /** 028 **/
	' ', /** 029 **/
	' ', /** 030 **/
	' ', /** 031 **/
	' ', /** 032 **/
	'!', /** 033 **/
	'"', /** 034 **/
	'#', /** 035 **/
	'$', /** 036 **/
	'%', /** 037 **/
	'&', /** 038 **/
	'\'', /** 039 (single quote) **/
	'(', /** 040 **/
	')', /** 041 **/
	'*', /** 042 **/
	'+', /** 043 **/
	',', /** 044 **/
	'-', /** 045 **/
	'.', /** 046 **/
	'/', /** 047 **/
	'0', /** 048 **/
	'1', /** 049 **/
	'2', /** 050 **/
	'3', /** 051 **/
	'4', /** 052 **/
	'5', /** 053 **/
	'6', /** 054 **/
	'7', /** 055 **/
	'8', /** 056 **/
	'9', /** 057 **/
	':', /** 058 **/
	';', /** 059 **/
	'<', /** 060 **/
	'=', /** 061 **/
	'>', /** 062 **/
	'?', /** 063 **/
	'@', /** 064 **/
	'A', /** 065 **/
	'B', /** 066 **/
	'C', /** 067 **/
	'D', /** 068 **/
	'E', /** 069 **/
	'F', /** 070 **/
	'G', /** 071 **/
	'H', /** 072 **/
	'I', /** 073 **/
	'J', /** 074 **/
	'K', /** 075 **/
	'L', /** 076 **/
	'M', /** 077 **/
	'N', /** 078 **/
	'O', /** 079 **/
	'P', /** 080 **/
	'Q', /** 081 **/
	'R', /** 082 **/
	'S', /** 083 **/
	'T', /** 084 **/
	'U', /** 085 **/
	'V', /** 086 **/
	'W', /** 087 **/
	'X', /** 088 **/
	'Y', /** 089 **/
	'Z', /** 090 **/
	'[', /** 091 **/
	'\\', /** 092 (backslash) **/
	']', /** 093 **/
	'^', /** 094 **/
	'_', /** 095 **/
	'`', /** 096 **/
	'a', /** 097 **/
	'b', /** 098 **/
	'c', /** 099 **/
	'd', /** 100 **/
	'e', /** 101 **/
	'f', /** 102 **/
	'g', /** 103 **/
	'h', /** 104 **/
	'i', /** 105 **/
	'j', /** 106 **/
	'k', /** 107 **/
	'l', /** 108 **/
	'm', /** 109 **/
	'n', /** 110 **/
	'o', /** 111 **/
	'p', /** 112 **/
	'q', /** 113 **/
	'r', /** 114 **/
	's', /** 115 **/
	't', /** 116 **/
	'u', /** 117 **/
	'v', /** 118 **/
	'w', /** 119 **/
	'x', /** 120 **/
	'y', /** 121 **/
	'z', /** 122 **/
	'{', /** 123 **/
	'|', /** 124 **/
	'}', /** 125 **/
	'~' /** 126 **/
	};

}
