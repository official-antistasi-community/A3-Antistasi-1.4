/*
Maintainer: Caleb Serafin
    Converts seconds to mixed time measurement. Not accurate with more than 7 decimal digits.

Arguments:
    <SCALAR> Total seconds

Return Value:
  <ARRAY<
    <BOOL> Negative, false for positive, true for negative.
    <SCALAR> Days
    <SCALAR> Hours
    <SCALAR> Minutes
    <SCALAR> Seconds
    <SCALAR> Milliseconds
    <SCALAR> Microseconds
  >>

Scope: Any
Environment: Any
Public: Yes

Example:
    [3463463] call A3A_fnc_secondsToTimeSpan;  // [false,40,2,4,23,0,0,0]
    [[3463463] call A3A_fnc_secondsToTimeSpan] call A3A_fnc_timeSpan_format;  // ~"40 Days 2 Hours 4 Minutes 23 Seconds"

    ([[serverTime] call A3A_fnc_secondsToTimeSpan] call A3A_fnc_timeSpan_format) + " since mission started.";  // ~ "9 Hours 30 Minutes 9 Seconds 812 Milliseconds 499 Microseconds 961 Nanoseconds since mission started."
*/
params [
    ["_secondsIn",0,[ 0 ]]
];

private _negative = _secondsIn < 0;
_secondsIn = abs _secondsIn;

private _days = floor (_secondsIn / 86400);
_secondsIn = _secondsIn mod 86400;
private _hours = floor (_secondsIn / 3600);
_secondsIn = _secondsIn mod 3600;
private _minutes = floor (_secondsIn / 60);
_secondsIn = _secondsIn mod 60;

private _seconds = floor (_secondsIn);
_secondsIn = _secondsIn mod 1;

private _milliseconds = floor (_secondsIn / 1e-3);
_secondsIn = _secondsIn mod  1e-3;
private _microseconds = floor (_secondsIn / 1e-6);
_secondsIn = _secondsIn mod  1e-6;
private _nanoseconds = floor (_secondsIn / 1e-9);

[_negative,_days,_hours,_minutes,_seconds,_milliseconds,_microseconds,_nanoseconds];
