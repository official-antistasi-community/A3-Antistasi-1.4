#include "..\..\script_component.hpp"
params ["_building"];

// We add the music source to a RoadCone rather than the building itself.
// This is so we can delete the source later in a easier fashion.
private _musicSource = "RoadCone_L_F" createVehicle position _building;
private _tracks = [];
private _locationType = "default";

// Attach Cone to building.
_musicSource attachTo [_building, [1,1,1]];

private _worldName = worldName;
switch (_worldName) do {
	case "Altis": {
		_locationType = "Mediterranean";
	};
	default {
		_locationType = "default";
	};
};

// Hide the cone, we don't want to see it!
hideObjectGlobal _musicSource;

[_building, _musicSource, _locationType] spawn {
    params ["_building", "_musicSource", "_locationType"];

    private _tracksPlayed = 1;
	_tracks = [_locationType] call A3A_fnc_getSoundTracks;

	if (count _tracks == 0) exitWith {
		Error("No Tracks found to create a music source");
	};

    private _totalTracks = count _tracks;

    while { (alive _musicSource) } do {
        while { _tracksPlayed < _totalTracks } do {
			private _track = selectRandom (_tracks);
			private _trackDuration = (_track#1);

			if(isMultiplayer) then {
				[_building, _musicSource, (_track#0)] remoteExec ["A3A_fnc_clientCreateMusicSource"];
			}else{
				_musicSource say3d (_track#0);
			};

			sleep _trackDuration;

			_tracksPlayed = _tracksPlayed + 1;

			if not (alive _musicSource) exitWith {};
        };
        sleep (random 10);
    };
};

_musicSource