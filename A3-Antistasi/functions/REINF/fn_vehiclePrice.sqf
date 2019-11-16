private ["_typeX","_costs"];

_typeX = _this select 0;

_costs = server getVariable _typeX;

if (isNil "_costs") then
	{
	diag_log format ["%1: [Antistasi] | ERROR | vehiclePrice.sqf | Invalid vehicle price :%2.",servertime,_typeX];
	_costs = 0;
	}
else
	{
	_costs = round (_costs - (_costs * (0.1 * ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports))));
	};

_costs