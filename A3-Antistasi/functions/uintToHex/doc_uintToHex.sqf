/*
Maintainer: Caleb Serafin
    Formats a scalar as the specified length hexadecimal string.
    These lengths are divided into multiple functions for 4, 8, 12, 16, 20, 24 bits.

Argument: <SCALAR> A numberic value to format as a hexadecimal string. Input must be integral.
Return Value: <STRING> 1,2,3,4,5,6 wide hexadecimal string.
Public: Yes
*/

// Example:
floor random 0xffffff call A3A_fnc_uint24ToHex;
16777215 call A3A_fnc_uint24ToHex;
// Tests:
[
    0xa         call A3A_fnc_uint4ToHex isEqualTo "a",
    0x7b        call A3A_fnc_uint8ToHex isEqualTo "7b",
    0xaaf       call A3A_fnc_uint12ToHex isEqualTo "aaf",
    0xabcd      call A3A_fnc_uint16ToHex isEqualTo "abcd",
    0xabcde     call A3A_fnc_uint20ToHex isEqualTo "abcde",
    0xffffff    call A3A_fnc_uint24ToHex isEqualTo "ffffff"
];
