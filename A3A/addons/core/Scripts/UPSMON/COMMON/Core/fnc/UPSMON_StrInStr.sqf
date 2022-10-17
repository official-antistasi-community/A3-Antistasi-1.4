/****************************************************************
File: UPSMON_StrInStr.sqf
Author: KRONZKY

Description:

Parameter(s):

Returns:

****************************************************************/
private["_out"];

_in=_this select 0;
_out=if (([_this select 0,_this select 1] call UPSMON_StrIndex)==-1) then {false} else {true};
_out