#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_typeX"];

private _costs = server getVariable _typeX;

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
