/****************************************************************
File: UPSMON_createmarker.sqf
Author: Azroul13

Description:

Parameter(s):

Returns:

****************************************************************/
private["_pos","_sign","_type"];

_pos = _this select 0;
_type = _this select 1;

_sign = _type createvehicle [0,0,0];
_sign setpos _pos;	
