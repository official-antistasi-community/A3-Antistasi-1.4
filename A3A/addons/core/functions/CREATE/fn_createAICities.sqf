#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer and hasInterface) exitWith{};

private ["_markerX","_groups","_soldiers","_positionX","_num","_dataX","_prestigeOPFOR","_prestigeBLUFOR","_isAAF","_params","_frontierX","_array","_countX","_groupX","_dog","_grp","_sideX"];
_markerX = _this select 0;

_groups = [];
_soldiers = [];
private _dogs = [];

_positionX = getMarkerPos (_markerX);

_num = [_markerX] call A3A_fnc_sizeMarker;
private _patrolSize = _num;
_sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);
if ((markersX - controlsX) findIf {(getMarkerPos _x inArea _markerX) and (sidesX getVariable [_x,sideUnknown] != _sideX)} != -1) exitWith {};
_num = round (_num / 100);

ServerDebug_1("Spawning City Patrol in %1", _markerX);

_dataX = server getVariable _markerX;
//_prestigeOPFOR = _dataX select 3;
//_prestigeBLUFOR = _dataX select 4;
_prestigeOPFOR = _dataX select 2;
_prestigeBLUFOR = _dataX select 3;
_isAAF = true;
if (_markerX in destroyedSites) then
	{
	_isAAF = false;
	_params = [_positionX,Invaders, selectRandom (_faction get "groupSpecOpsRandom")];
	}
else
	{
	_num = round (_num * (_prestigeOPFOR + _prestigeBLUFOR)/100);
	_frontierX = [_markerX] call A3A_fnc_isFrontline;
	if (_frontierX) then
		{
		_num = _num * 2;
		_params = [_positionX, Occupants, _faction get "groupSentry"];
		}
	else
		{
		_params = [_positionX, Occupants, _faction get "groupPolice"];
		};
	};
if (_num < 1) then {_num = 1};

_countX = 0;

private _roadPositions = (_positionX nearRoads round(_patrolSize / 2));

while {(spawner getVariable _markerX != 2) and (_countX < _num)} do {
	private _spawnPosition = [];

	if (count _roadPositions >= 1) then {
		_spawnPosition = selectRandom _roadPositions;
		_roadPositions deleteAt (_roadPositions find _spawnPosition);
	} else {
		_spawnPosition = _positionX;
	};

	private _groupX = [_spawnPosition, (_params # 1), (_params # 2)] call A3A_fnc_spawnGroup;

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
	[_groupX, "Patrol_Area", 25, 150, 150, false, _positionX, true] call A3A_fnc_patrolLoop;
	_groups pushBack _groupX;
	_countX = _countX + 1;
};

["locationSpawned", [_markerX, "City", true]] call EFUNC(Events,triggerEvent);

waitUntil {sleep 1;(spawner getVariable _markerX == 2)};

{if (alive _x) then {deleteVehicle _x}} forEach _soldiers;
{deleteVehicle _x} forEach _dogs;
{ deleteGroup _x } forEach _groups;

["locationSpawned", [_markerX, "City", false]] call EFUNC(Events,triggerEvent);
