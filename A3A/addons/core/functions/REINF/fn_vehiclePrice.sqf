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
		if (count seaports > 3) then {
			private _numFriendlySeaports = ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports) min 6;
			_costs = round (_costs - (_costs * 0.05 * _numFriendlySeaports));
		} else {
			_discount = switch (true) do {
                case (tierWar in [1,2]): { 0 };
                case (tierWar in [3,4]): { 0 };
				case (tierWar in [5,6]): { 1 };
				case (tierWar in [7,8]): { 2 };
				case (tierWar in [9,10]): { 3 };
				default { 0 };
			};
			_costs = round (_costs - (_costs * 0.1 * _discount));
		};	
	};

_costs
