/*
Maintainer: Caleb Serafin
    Creates a formatted hexadecimal string of a provided ShortID.
Argument: <ShortID> Generated ShortID.
Return Value: <STRING> Hexadecimal string in format 012345-6789ab.

Environment: Any
Public: Yes
Dependency: <CODE> fn_uintToHex needs to initialise before running this code.

Example:
    [1280,1] call A3A_fnc_shortID_format;  // "000500-000001"
    [16777215,16777215] call A3A_fnc_shortID_format;  // "ffffff-ffffff"
    call A3A_fnc_shortID_create call A3A_fnc_shortID_format;  // "000500-000002"
*/
params ["_mostSignificant","_leastSignificant"];
(_mostSignificant call A3A_fnc_uint24ToHex) + "-" + (_leastSignificant call A3A_fnc_uint24ToHex);
