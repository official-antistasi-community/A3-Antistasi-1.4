/****************************************************************
File: UPSMON_randomPos.sqf
Author: KRONZKY

Description:

Parameter(s):

Returns:

****************************************************************/
private["_a","_b","_from","_to","_return"]; 

_from = _this select 0; 
_to = _this select 1; 
_return = 0; 
	
_a = ((_to select 0) - (_from select 0)); 
_b = ((_to select 1) - (_from select 1)); 
if (_a != 0 || _b != 0) then {_return = _a atan2 _b}; 
if ( _return < 0 ) then { _return = _return + 360 }; 
	
_return