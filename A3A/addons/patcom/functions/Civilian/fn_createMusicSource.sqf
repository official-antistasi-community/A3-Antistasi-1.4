/*
    Author: [Hazey]
    Description:
        Create a civilian sound source at a provided building.

    Arguments:
        <Object> Building you want to attach it to.

    Return Value:
        <Object> Sound Source

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        _musicSource = [_building] call A3A_fnc_createMusicSource;

    License: MIT License
*/

#include "..\..\script_component.hpp"
params ["_building"];

// We add the music source to a RoadCone rather than the building itself.
// This is so we can delete the source later in a easier fashion.
private _musicSource = "RoadCone_L_F" createVehicle position _building;

// Attach Cone to building.
_musicSource attachTo [_building, [1,1,1]];

// Hide the cone, we don't want to see it!
[_musicSource, true] remoteExec ["hideObjectGlobal", 2];

[_building, _musicSource] spawn {
    params ["_building", "_musicSource", "_locationType"];
    private _tracksPlayed = 1;
    private _tracks = A3A_Civilian_Amb_Tracks get "Ambience";

    if (count _tracks == 0) exitWith {
        Error("No Tracks found to create a music source");
    };

    private _totalTracks = count _tracks;

    while { (alive _musicSource) } do {
        while { _tracksPlayed < _totalTracks } do {
            private _track = selectRandom (_tracks);
            private _trackDuration = _track # 1;

            [_musicSource, _track # 0] remoteExec ["say3D", [0, _musicSource], true];

            sleep _trackDuration;

            _tracksPlayed = _tracksPlayed + 1;

            if not (alive _musicSource) exitWith {};
        };
        sleep (random 10);
    };
};

_musicSource