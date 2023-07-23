/*
    Author: [Hazey]
    Description:
        Civilian Event Handler Actions.

    Arguments:
        <Object> Unit this action is called on.
        <Magic Variables> The Event Handler type of the addEventHandler.
        <Magic Variables> The Event Handler position of the index

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        _unit addEventHandler["FiredNear", {
            params ["_unit"];
            [_unit, _thisEvent, _thisEventHandler] call A3A_fnc_civilianFiredNearEH;
        }];

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_unit", "_type", "_index"];

_unit removeEventHandler [_type, _index];
private _anim = "ApanPercMstpSnonWnonDnon_ApanPknlMstpSnonWnonDnon";
[_unit, _anim] remoteExec ["switchMove"];

// We let the waypoint stuff happen in scheduled space.
[_unit] spawn {
    params ["_unit"];
    private _positionX = [getPosATL _unit, 100, 200, 0, 0, -1, 0] call A3A_fnc_getSafePos;
    _unit doMove _positionX;
    _unit forceWalk false;
    _unit setSpeedMode "FULL";

    // moveTo didn't work correctly, so we can't use moveToCompleted and a waitUntil here.
    // We settle for a 60 second sleep timer.
    sleep 60;

    [_unit, ""] remoteExec ["switchMove"];
    _unit setSpeedMode "LIMITED";
    _unit forceWalk true;
    _unit addEventHandler["FiredNear", {
        params ["_unit"];
        [_unit, _thisEvent, _thisEventHandler] call A3A_fnc_civilianFiredNearEH;
    }];
};

// Set random chance to play scream/panic sound.
if (random 1 > 0.3) then {
    // Get a list of tracks from the Civilian Fear tracks hashmap
    private _tracks = A3A_Civilian_Amb_Tracks get "Fear";
    if (count _tracks > 0) then {
        private _panicNoise = selectRandom _tracks;
        [_unit, _panicNoise # 0] remoteExec ["say3D"];
    } else {
        Error("No Tracks found to make the unit scream");
    };
};