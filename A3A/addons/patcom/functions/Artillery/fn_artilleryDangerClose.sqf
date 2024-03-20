/*
    Author: [Hazey]
    Description:
        Run's detection for if enemy units are too close to callers. Firemission Danger Close!

    Arguments:
        <Array> Target position where artillery is meant to strike around.
        <Number> Radius in which we should check for friendly AI.
        <Side> Side of the caller of firemission.

    Return Value:
        <Bool> Is too close (True) else returns (False)

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_targetPos, 150, _side] call A3A_fnc_artilleryDangerClose;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_targetPos", "_radius", "_side"];
private _result = false;

{
    if (alive (leader _x)) then {
        if (((leader _x) distance2D _targetPos) < _radius) exitwith {
            _result = true;
            _result
        };
    };
} foreach ((groups _side) + (groups civilian));

_result