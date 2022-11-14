/****************************************************************
File: UPSMON_getArg.sqf
Author: KRONZKY

Description:

Parameter(s):

Returns:

****************************************************************/
private["_cmd","_arg","_list","_a","_v"]; 

_cmd=_this select 0; 
_arg=_this select 1; 
_list=_this select 2; 
_a=-1; 
{_a=_a+1; _v=format["%1",_list select _a]; 
if (_v==_cmd) then {_arg=(_list select _a+1)}} foreach _list; 
	
_arg