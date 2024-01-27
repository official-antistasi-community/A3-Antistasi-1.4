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
	private _numFriendlySeaports = ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports) min 6;
	_costs = round (_costs - (_costs * 0.05 * _numFriendlySeaports));
	};

_costs
