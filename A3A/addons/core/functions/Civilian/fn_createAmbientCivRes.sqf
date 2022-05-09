/*
    Author: [Hazey]
    Description:
		Create Ambient Civ's within resource or factory

    Arguments:
    	<String> City Marker where you would like the Ambient Civilians created.
		Note, the marker must be provided from citiesX

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[[_marker], "A3A_fnc_createAmbientCivRes"] call A3A_fnc_scheduler;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_markerX", ["_maxSpawnedCivilians", 4], ["_civilianPopulation", 4]];

// We only want to run on the server and not on the players
if (!isServer and hasInterface) exitWith{};

private _civilianGroups = [];
private _civilians = [];
private _positionX = getMarkerPos (_markerX);
private _locationRadius = [_markerX] call A3A_fnc_sizeMarker;

if !((_markerX in resourcesX) or (_markerX in factories)) exitWith {};

ServerDebug_2("Spawning Resource Civilians in %1 with a radius of %2", _markerX, _locationRadius);

// We don't want to add too many civ's.
if (_civilianPopulation > _maxSpawnedCivilians) then {
	_civilianPopulation = _maxSpawnedCivilians;
};

if (not(_markerX in destroyedSites)) then {
	if ((daytime > 8) and (daytime < 18)) then {
		private _groupX = createGroup civilian;
		_civilianGroups pushBack _groupX;
		
		for "_i" from 1 to _civilianPopulation do {
			private _spawnPosition = [_positionX, 10, 50, 10, 0, -1, 0] call A3A_fnc_getSafePos;
			private _civUnit = [_groupX, FactionGet(civ, "unitWorker"), _spawnPosition, [],0, "NONE"] call A3A_fnc_createUnit;
			_civUnit setVariable ["isScared", false];
			_civUnit setVariable ["markerX", _markerX, true];
			_civilians pushBack _civUnit;

			// Add event handlers to civilian units.
			[_civUnit] spawn A3A_fnc_civilianInitEH;

			sleep 0.5;
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
		};

		[_groupX] call A3A_fnc_patrolLoop;
	};
};

// Handle removal of civ's.
waitUntil {sleep 1;(spawner getVariable _markerX == 2)};
{
	if (alive _x) then {
		deleteVehicle _x;
	};
} forEach _civilians;

{
	_x setVariable ["PATCOM_Controlled", false];
	deleteGroup _x;
} forEach _civilianGroups;