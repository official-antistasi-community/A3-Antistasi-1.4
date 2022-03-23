params ["_building"];

// We add the music source to a RoadCone rather than the building itself.
// This is so we can delete the source later in a easier fashion.
private _musicSource = "RoadCone_L_F" createVehicle position _building;

// Attach Cone to building.
_musicSource attachTo [_building, [1,1,1]];

// Hide the cone, we don't want to see it!
hideObjectGlobal _musicSource;

[_building, _musicSource] spawn {
    params ["_building", "_musicSource"];

    private _tracksPlayed = 1;
	private _tracks = [["A3A_Audio_Civ_Song1", 180], ["A3A_Audio_Civ_Song2", 188]];

    private _totalTracks = count _tracks;

    while { (alive _musicSource) } do {
        while { _tracksPlayed < _totalTracks } do {
			private _track = selectRandom _tracks;

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