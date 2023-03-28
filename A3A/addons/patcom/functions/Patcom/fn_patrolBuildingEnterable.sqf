/*
    Author: [Hazey]
    Description:
		Checks if building is enterable and validates it with a blacklist

    Arguments:
        <Object> House/Object you want to check if its enterable

    Return Value:
    	<Bool> Returns True or False if house is enterable

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_x] call A3A_fnc_patrolBuildingEnterable

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_house"];

private _enterable = !((_house buildingPos 0) isEqualTo [0,0,0]);

// Check if the house is blacklisted
if (_enterable && !((count PATCOM_Building_Blacklist) == 0)) then {
    if ((typeOf _house) in PATCOM_Building_Blacklist) then {
        _enterable = false;
    };
};

_enterable