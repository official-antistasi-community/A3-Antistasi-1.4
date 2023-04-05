/*
    Author: [Hazey]
    Description:


    Arguments:


    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 


    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_markerX", ["_maxResourceCivilians", 4]];

if (_markerX in destroyedSites) exitWith {
	Debug("_markerX in destroyedSites and civilian workers and have not spawned.");
};
if ((daytime > 8) and (daytime < 18)) exitWith {
	Debug("Civilian Workers are outside of working hours and have not spawned.")
};

private _civs = [];
private _groupX = createGroup civilian;

for "_i" from 1 to _maxResourceCivilians do {
	private _spawnPosition = [_positionX, 10, 50, 10, 0, -1, 0] call A3A_fnc_getSafePos;
	private _civUnit = [_groupX, FactionGet(civ, "unitWorker"), _spawnPosition, [],0, "NONE"] call A3A_fnc_createUnit;
	_civUnit setVariable ["markerX", _markerX, true];
	_civs pushBack _civUnit;

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
private _spawnedCivilians = [_groupX, _civs];
_spawnedCivilians
