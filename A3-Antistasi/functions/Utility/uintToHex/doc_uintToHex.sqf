/*
Maintainer: Caleb Serafin
    Formats a scalar as the specified length hexadecimal string.
    These lengths are divided into multiple functions for 4, 8, 12, 16, 20, 24 bits.

Argument: <SCALAR> A numberic value to format as a hexadecimal string. Input must be integral.
Return Value: <STRING> 1,2,3,4,5,6 wide hexadecimal string.
Public: Yes
Dependency:
    fn_uintToHexGenTables must initialise:
    <ARRAY<STRING>> A3A_base16LookupTable
    <ARRAY<STRING>> A3A_base16e2LookupTable
*/

// Example:
floor random 0x1000000 call A3A_fnc_uint24ToHex;
16777215 call A3A_fnc_uint24ToHex;
// Tests:
[
    0x0         call A3A_fnc_uint4ToHex isEqualTo "0",
    0xb4        call A3A_fnc_uint8ToHex isEqualTo "b4",
    0xaaf       call A3A_fnc_uint12ToHex isEqualTo "aaf",
    0xdead      call A3A_fnc_uint16ToHex isEqualTo "dead",
    0xca1eb     call A3A_fnc_uint20ToHex isEqualTo "ca1eb",
    0xffffff    call A3A_fnc_uint24ToHex isEqualTo "ffffff"
];
