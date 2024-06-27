/*
 * File: fn_timeSpanTo_A3A_timeSpan.sqf
 * Function: 
 * Author: <killerswin2>
 * Function description
 * converts the arma 3 timespans to antistai timespans
 * Arguments:
 * 0: timespan <ARRAY>
 * 1: timespan <BOOL>
 *
 * Return Value:
 * 0: timespan in antistasi format
 *
 * Example:
 * [systemTimeUTC, _locktime] call A3A_fnc_timeSpanTo_A3A_timeSpan
 *
 * Public: No
 */

params ["_timeSpan0", "_timeSpan1"];

_timeSpan0 params ["_ts0year", "_ts0month", "_ts0day", "_ts0hour", "_ts0minute", "_ts0second", "_ts0millisecond"];
_timeSpan1 params ["_ts1year", "_ts1month", "_ts1day", "_ts1hour", "_ts1minute", "_ts1second", "_ts1millisecond"];



private _array = [
    false,_ts0day - _ts1day, _ts0hour - _ts1hour,
    _ts0minute - _ts1minute, _ts0second - _ts1second,
    _ts0millisecond - _ts1millisecond, 0, 0
];

_array apply {if(_x isEqualType 0 && _x < 0) then {0} else {_x};};