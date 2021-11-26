/*
Maintainer: Caleb Serafin
    Uses zeros to pad input string to 2 characters.
    Assumes that at least 1 character is provided.
    Designed to be fast.

Single Argument:
    <STRING> Characters to pad.

Return Value:
    <STRING> Padded characters.

Scope: Any
Environment: Any
Public: Yes

Example:
    str 2 call A3A_fnc_pad_2Digits;  // "02"
*/
// A3A_fnc_pad_2Digits = {
if (count _this == 1) then {
    "0"+_this;
} else {
    _this;
};
// };
