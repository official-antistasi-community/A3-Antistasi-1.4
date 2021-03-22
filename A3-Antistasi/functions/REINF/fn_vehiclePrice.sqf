#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private ["_typeX","_costs"];

_typeX = _this select 0;

_costs = server getVariable _typeX;

if (isNil "_costs") then
	{
        Error_1("Invalid vehicle price :%1.", _typeX);
	_costs = 0;
	}
else
	{
	_costs = round (_costs - (_costs * (0.1 * ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports))));
	};

_costs
