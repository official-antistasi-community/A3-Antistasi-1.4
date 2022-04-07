/*
    Author: [Hazey]
    Description:
		Returns an array of enterable buildings

    Arguments:
        <Array> Position you want to check for enterable houses
        <Number> How far you want to check for enterable houses

    Return Value:
    	<Array> List of enterable houses.

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        _buildings = [_position, _radius] call A3A_fnc_patrolEnterableBuildings;

    License: MIT License
*/

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