/*
    Author: [Hazey]
    Description:
        Add available artillery to active battery list.

    Arguments:
        <Group> Group whom you want to make an active artillery battery.
        <Number> Default variance in shot spread. (How accurate the unit is)

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_group, _variance] call A3A_fnc_artilleryAdd;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_group"];

_group setVariable ["PATCOM_ArtilleryBattery", true, true];
_group setVariable ["PATCOM_ArtilleryBusy", false, true];