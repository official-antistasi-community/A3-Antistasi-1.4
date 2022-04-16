/*
    Author: [Unknown] / [Hazey]
    Description:
		Create city patrols based on Invader or Occupant forces

    Arguments:
    	<String> Marker where you want the patrol to spawn.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[[_marker], "A3A_fnc_createAICities"] call A3A_fnc_scheduler;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_markerX"];

// Exit if command is not ran on server || Exit if ran on player with Interface
if (!isServer and hasInterface) exitWith{};

private _groups = [];
private _soldiers = [];
private _dogs = [];
private _positionX = getMarkerPos (_markerX);
private _num = [_markerX] call A3A_fnc_sizeMarker;
private _patrolSize = [_markerX] call A3A_fnc_sizeMarker;
private _sideX = sidesX getVariable [_markerX, sideUnknown];
private _faction = Faction(_sideX);

if ((markersX - controlsX) findIf {(getMarkerPos _x inArea _markerX) and (sidesX getVariable [_x, sideUnknown] != _sideX)} != -1) exitWith {};

_num = round (_num / 100);

ServerDebug_1("Spawning City Patrol in %1", _markerX);

private _dataX = server getVariable _markerX;
private _prestigeOPFOR = (_dataX#2);
private _prestigeBLUFOR = (_dataX#3);
private _isAAF = true;
private _factionType = [];
private _factionSide = "";

///////////////////
// Side Controlling City
///////////////////
if (_markerX in destroyedSites) then {
	_factionType = _faction get "groupSpecOps";
	_factionSide = Invaders;
	_isAAF = false;
} else {
	private _frontierX = [_markerX] call A3A_fnc_isFrontline;
	_num = round (_num * (_prestigeOPFOR + _prestigeBLUFOR)/100);

	if (_frontierX) then {
		_num = _num * 2;
		_factionType = _faction get "groupSentry";
		_factionSide = Occupants;
	} else {
		_factionType = _faction get "groupPolice";
		_factionSide = Occupants;
	};
};

if (_num < 1) then {_num = 1};

///////////////////
// Patrols
///////////////////
private _countX = 0;
private _radius = [_markerX] call A3A_fnc_sizeMarker;
_radius = round (_radius / 2);
while {(spawner getVariable _markerX != 2) and (_countX < _num)} do {
	// private _spawnPosition = [_positionX, 10, _radius, 0, 0, -1, 0] call A3A_fnc_getSafeSpawnPos;
	// We Opt to use this method over the above. This will provide road positions for spawning rather than a random position.
	// We want to keep these units within the city for the most part.
	private _spawnPosition = [];

	while {(count _spawnPosition <= 2)} do {
		//_spawnPosition = [[[_positionX, _radius]], ["water"], { isOnRoad _this }] call BIS_fnc_randomPos;
		_spawnPosition = [[[_positionX, _radius]], ["water"]] call BIS_fnc_randomPos;
		//_spawnPosition = [_positionX, 50 + (random 50), 200, 20, 10, 0, -1, 0] call A3A_fnc_getSafeSpawnPos;
		sleep 0.50;
	};
	private _groupX = [_spawnPosition, _factionSide, _factionType] call A3A_fnc_spawnGroup;

	// Forced non-spawner for performance and consistency with other garrison patrols
	{
		[_x, "", false] call A3A_fnc_NATOinit; 
		_soldiers pushBack _x;
	} forEach units _groupX;

	sleep 1;

	// Only spawn dog units with Occupant forces.
	if (_isAAF) then {
		if (random 10 < 2.5) then {
			private _dog = [_groupX, "Fin_random_F", _spawnPosition, [], 0, "FORM"] call A3A_fnc_createUnit;
			_dogs pushBack _dog;
			[_dog] spawn A3A_fnc_guardDog;
		};
	};

	// GIVE UNIT PATCOM CONTROL
	[_groupX, "Patrol_Area", 25, _patrolSize, -1, true, _positionX, true] call A3A_fnc_patrolSetParams;
	_groupX setVariable ["PATCOM_Controlled", false];
	A3A_Patrol_Controlled_AI pushBack _groupX;

	_groups pushBack _groupX;
	_countX = _countX + 1;
};

///////////////////
// Handle Removal
///////////////////
waitUntil {sleep 5;(spawner getVariable _markerX == 2)};
{if (alive _x) then {deleteVehicle _x}} forEach _soldiers;
{deleteVehicle _x} forEach _dogs;

{
	A3A_Patrol_Controlled_AI = A3A_Patrol_Controlled_AI - [_x];
	_x setVariable ["PATCOM_Controlled", ""];
	deleteGroup _x;
} forEach _groups;
