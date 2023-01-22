/****************************************************************
File: UPSMON_fnc_StrLen.sqf
Author: KRONZKY

Description:

Parameter(s):

Returns:

****************************************************************/
private["_in","_arr","_len"];

_in=_this select 0;
_arr=[_in] call UPSMON_fnc_StrToArray;
_len=count (_arr);
_len