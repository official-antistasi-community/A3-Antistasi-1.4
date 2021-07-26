/*
Maintainer: Caleb Serafin
    Uses zeros to pad input string to 3 characters.
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
    str 3 call A3A_fnc_pad_3Digits;  // "002"
*/
// A3A_fnc_pad_3Digits = {
switch (count _this) do {
    case 1: {"00"+_this};
    case 2: {"0"+_this};
    default {_this};
};
// };
