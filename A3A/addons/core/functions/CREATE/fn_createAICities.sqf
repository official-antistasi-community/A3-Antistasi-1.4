#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
//NOTA: TAMBIÉN LO USO PARA FIA
if (!isServer and hasInterface) exitWith{};

private ["_markerX","_groups","_soldiers","_positionX","_num","_dataX","_prestigeOPFOR","_prestigeBLUFOR","_esAAF","_params","_frontierX","_array","_countX","_groupX","_dog","_grp","_sideX"];
_markerX = _this select 0;

_groups = [];
_soldiers = [];
private _dogs = [];

_positionX = getMarkerPos (_markerX);

_num = [_markerX] call A3A_fnc_sizeMarker;
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
_esAAF = true;
if (_markerX in destroyedSites) then
	{
	_esAAF = false;
	_params = [_positionX,Invaders,_faction get "groupSpecOps"];
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
while {(spawner getVariable _markerX != 2) and (_countX < _num)} do
	{
	_groupX = _params call A3A_fnc_spawnGroup;
	// Forced non-spawner for performance and consistency with other garrison patrols
	{[_x,"",false] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
	sleep 1;
	if (_esAAF) then
		{
		if (random 10 < 2.5) then
			{
			_dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
			_dogs pushBack _dog;
			[_dog] spawn A3A_fnc_guardDog;
			};
		};

	//_nul = [leader _groupX, _markerX, "SAFE", "RANDOM", "SPAWNED","NOVEH2", "NOFOLLOW"] execVM QPATHTOFOLDER(scripts\UPSMON.sqf);
	//todo Hazey to replace this function

	[_groupX, getMarkerPos _markerX, 300, 5, "MOVE", "SAFE", "BLUE", "NORMAL", "NO CHANGE", "this call A3A_fnc_searchNearbyBuilding", [0, 2, 16]] call A3A_fnc_createPatrol;

	_groups pushBack _groupX;
	_countX = _countX + 1;
	};

waitUntil {sleep 1;(spawner getVariable _markerX == 2)};

{if (alive _x) then {deleteVehicle _x}} forEach _soldiers;
{deleteVehicle _x} forEach _dogs;
{deleteGroup _x} forEach _groups;
