/****************************************************************
File: UPSMON_deleteDead.sqf
Author: KRONZKY

Description:

Parameter(s):

Returns:

****************************************************************/
private["_u","_s"];

_u=_this select 0; 
_s= _this select 1; 
_u removeAllEventHandlers "killed"; 
sleep _s; 
deletevehicle _u