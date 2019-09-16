/****************************************************************
File: UPSMON_GetParams.sqf
Author: Azroul13

Description:
	Convert argument list to uppercase
Parameter(s):
	<--- Parameters
Returns:
	---> Parameters
****************************************************************/

private["_Params","_UCthis","_i","_e"];

_Params = _this select 0;
_UCthis = [];

for [{_i=0},{_i<count _Params},{_i=_i+1}] do 
{
	_e=_Params select _i;
	if (_e isEqualType "STRING") then {_e=toUpper(_e)};
	_UCthis set [_i,_e]
};

_UCthis