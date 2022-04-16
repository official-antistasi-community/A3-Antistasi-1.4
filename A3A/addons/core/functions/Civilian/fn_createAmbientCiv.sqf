/*
    Author: [Hazey]
    Description:
		Create Ambient Civ's within city

    Arguments:
    	<String> City Marker where you would like the Ambient Civilians created.
		Note, the marker must be provided from citiesX

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[[_marker], "A3A_fnc_createAmbientCiv"] call A3A_fnc_scheduler;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_markerX", "_type", ["_maxSpawnedCivilians", 6]];

// We only want to run on the server and not on the players
if (!isServer and hasInterface) exitWith{};

private _civilianGroups = [];
private _soundSources = [];
private _lightSources = [];
private _civilians = [];
private _buildings = [];
private _civilianPopulation = 0;
private _positionX = getMarkerPos (_markerX);
private _locationRadius = [_markerX] call A3A_fnc_sizeMarker;
private _dayState = [] call A3A_fnc_getDayState;

if (_type == "Resource") then {
	ServerDebug_2("Spawning Resource Civilians in %1 with a radius of %2", _markerX, _locationRadius);

	_civilianPopulation = random _maxSpawnedCivilians;
};

if (_type == "City") then {
	_buildings = nearestObjects [_positionX, ["House"], _locationRadius];

	ServerDebug_2("Spawning City Civilians in %1 with a radius of %2", _markerX, _locationRadius);

	private _city = if (_positionX isEqualType "") then {_positionX} else {[citiesX, _positionX] call BIS_fnc_nearestPosition};
	private _cityData = server getVariable _city;

	_civilianPopulation = round ((sqrt (_cityData#0)) / 2);

	// We don't want to add too many civ's.
	if (_civilianPopulation > _maxSpawnedCivilians) then {
		_civilianPopulation = _maxSpawnedCivilians;
	};
};

for "_i" from 1 to _civilianPopulation do {

	if (_type == "Resource") then {
		if (not(_markerX in destroyedSites)) then {
			if ((daytime > 8) and (daytime < 18)) then {
				private _groupX = createGroup civilian;
				private _spawnPosition = [_positionX, 10, 50, 10, 0, -1, 0] call A3A_fnc_getSafeSpawnPos;
				private _civUnit = [_groupX, FactionGet(civ, "unitWorker"), _spawnPosition, [],0, "NONE"] call A3A_fnc_createUnit;
				_civUnit setVariable ["isScared", false];

				_civilianGroups pushBack _groupX;
				_civilians pushBack _civUnit;

				// Add event handlers to civilian units.
				[_civUnit] spawn A3A_fnc_civilianInitEH;

				_civUnit addEventHandler ["Killed",
					{
						if (({alive _x} count (units group (_this select 0))) == 0) then {
							private _markerX = (_this select 0) getVariable "markerX";
							private _nameX = [_markerX] call A3A_fnc_localizar;
							destroyedSites pushBackUnique _markerX;
							publicVariable "destroyedSites";
							["TaskFailed", ["", format ["%1 Destroyed", _nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer, civilian]];
						};
					}
				];

				_civUnit setVariable ["PATCOM_Controlled", false];
				A3A_Patrol_Controlled_AI pushBack _groupX;
			};
		};
	};

	if (_type == "City") then {
		private _posHouse = [];

		while {true} do {
			private _building = selectRandom _buildings;
			private _housePositions = [_building] call BIS_fnc_buildingPositions;

			if !(_housePositions isEqualTo []) exitWith {_posHouse = selectRandom _housePositions};
		};

		private _groupX = createGroup civilian;
		private _civUnit = [_groupX, FactionGet(civ, "unitMan"), _posHouse, [],0, "NONE"] call A3A_fnc_createUnit;
		_civUnit setPosATL _posHouse;
		_civUnit setVariable ["isScared", false];

		_civilianGroups pushBack _groupX;
		_civilians pushBack _civUnit;

		[_civUnit] spawn A3A_fnc_civilianInitEH;

		// Actions to do during the evening hours of spawn.
		if (_dayState == "EVENING" || {_dayState == "NIGHT"}) then {
			private _building = _posHouse nearestObject "House";
			_light = [_building] call A3A_fnc_createRoomLight;
			_lightSources pushBack _light;
		};

		// Actions to do during the morning hours of spawn.
		if (_dayState == "MORNING") then {
			if (4 > random 10) then {
				private _building = _posHouse nearestObject "House";
				private _soundSource = [_building] call A3A_fnc_createMusicSource;
				_soundSources pushBack _soundSource;
			};
			_light = [_building] call A3A_fnc_createRoomLight;
			_lightSources pushBack _light;
		};

		// Actions to do during the day hours of spawn
		if (_dayState == "DAY") then {
			if (7 > random 10) then {
				private _building = _posHouse nearestObject "House";
				private _soundSource = [_building] call A3A_fnc_createMusicSource;
				_soundSources pushBack _soundSource;
			};

			_civUnit setVariable ["PATCOM_Controlled", false];
			A3A_Patrol_Controlled_AI pushBack _groupX;
		};
	};
};

// Handle removal of civ's.
waitUntil {sleep 10;(spawner getVariable _markerX == 2)};
{if (alive _x) then {deleteVehicle _x};} forEach _civilians;
{
	A3A_Patrol_Controlled_AI = A3A_Patrol_Controlled_AI - [_x];
	_x setVariable ["PATCOM_Controlled", ""];
	deleteGroup _x;
} forEach _civilianGroups;

if (_type == "City") then {
	{deleteVehicle _x} forEach _soundSources;
	{deleteVehicle _x} forEach _lightSources;
};