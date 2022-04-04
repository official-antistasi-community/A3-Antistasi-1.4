#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_position", "_radius"];
private _enterable = [];

{
    if ([_x] call A3A_fnc_patrolBuildingEnterable) then {
    	_enterable pushback _x;
    };
} forEach (nearestObjects [_position, ["House","Building"], _radius]);

_enterable;