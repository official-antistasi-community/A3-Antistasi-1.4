/*
Maintainer: Caleb Serafin
    Converts systemTime or systemTimeUTC array into General date/time pattern (long time, descending order, without AM/PM).
    EG: [2009,15,6,13,45,30,420] -> "2009-15-06 13:45:30"
    https://docs.microsoft.com/en-us/dotnet/standard/base-types/standard-date-and-time-format-strings#table-of-format-specifiers

Arguments:
    <SCALAR> Year
    <SCALAR> Month
    <SCALAR> Day
    <SCALAR> Hour
    <SCALAR> Minute
    <SCALAR> Second
    <SCALAR> Millisecond, unused and discarded (default: 0)

Return Value:
    <STRING> Formatted systemTime

Scope: Any, Global Arguments
Environment:Any
Public: Yes

Example:
    [2009,15,6,13,45,30,420] call A3A_fnc_systemTime_format_G;  // "2009-15-06 13:45:30"
    systemTimeUTC call A3A_fnc_systemTime_format_G;
*/
params [
    "_year",
    "_month",
    "_day",
    "_hour",
    "_minute",
    "_second",
    ["_millisecond",0] // Discarded
];

_fnc_pad_2Digits = {    // Assume 1 or 2 digits supplied
    if (count _this == 1) then {
        "0"+_this;
    } else {
        _this;
    };
};

(str _year) + "-" + ((str _month) call _fnc_pad_2Digits) + "-" + ((str _day) call _fnc_pad_2Digits) + " " + ((str _hour) call _fnc_pad_2Digits) + ":" + ((str _minute) call _fnc_pad_2Digits) + ":" + ((str _second) call _fnc_pad_2Digits);
