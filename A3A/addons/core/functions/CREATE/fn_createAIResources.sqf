/*
    Author: [Unknown] / [Hazey]

    Description:
		

    Arguments:
    	

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[[_marker], "A3A_fnc_createAIResources"] call A3A_fnc_scheduler;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

if(spawner getVariable _markerX == 2) exitWith {};

Debug_1("Spawning Resource Point %1", _markerX);

private _positionX = getMarkerPos _markerX;
private _size = [_markerX] call A3A_fnc_sizeMarker;
private _civs = [];
private _soldiers = [];
private _dogs = [];
private _groups = [];
private _vehiclesX = [];
private _frontierX = [_markerX] call A3A_fnc_isFrontline;
private _sideX = Invaders;
private _isFIA = false;

if (sidesX getVariable [_markerX, sideUnknown] == Occupants) then {
	_sideX = Occupants;
	if ((random 10 <= (tierWar + difficultyCoef)) and !(_frontierX)) then {
		_isFIA = true;
	};
};

private _faction = Faction(_sideX);

if (_frontierX) then {
	private _roads = _positionX nearRoads _size;
	if (count _roads != 0) then {
		private _dist = 0;
		private _road = objNull;

		{
			if ((position _x) distance _positionX > _dist) then {
				_road = _x;
				_dist = position _x distance _positionX;
			}
		} forEach _roads;

		private _roadscon = roadsConnectedto _road;
		private _roadcon = objNull;

		{
			if ((position _x) distance _positionX > _dist) then {
				_roadcon = _x;
			}
		} forEach _roadscon;

		private _dirveh = [_roadcon, _road] call BIS_fnc_DirTo;
		private _groupX = createGroup _sideX;
		_groups pushBack _groupX;

		private _pos = [getPos _road, 7, _dirveh + 270] call BIS_Fnc_relPos;
		private _bunker = "Land_BagBunker_01_small_green_F" createVehicle _pos;
		_vehiclesX pushBack _bunker;
		_bunker setDir _dirveh;
		_pos = getPosATL _bunker;

		private _typeVehX = selectRandom (_faction get "staticAT");
		private _veh = _typeVehX createVehicle _positionX;
		_vehiclesX pushBack _veh;
		_veh setPos _pos;
		_veh setDir _dirVeh + 180;

		private _typeUnit = _faction get "unitStaticCrew";
		private _unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
		[_unit,_markerX] call A3A_fnc_NATOinit;
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		_unit moveInGunner _veh;
		_soldiers pushBack _unit;
	};
};

private _mrk = createMarkerLocal [format ["%1patrolarea", random 100], _positionX];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [(distanceSPWN/2),(distanceSPWN/2)];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";

private _ang = markerDir _markerX;
_mrk setMarkerDirLocal _ang;

if (!debug) then {_mrk setMarkerAlphaLocal 0};

private _garrison = garrison getVariable [_markerX,[]];
_garrison = _garrison call A3A_fnc_garrisonReorg;
private _radiusX = count _garrison;
private _patrol = true;

if (_radiusX < ([_markerX] call A3A_fnc_garrisonSize)) then {
	_patrol = false;
} else {
	//No patrol if patrol area overlaps with an enemy site
	_patrol = ((markersX findIf {(getMarkerPos _x inArea _mrk) && {sidesX getVariable [_x, sideUnknown] != _sideX}}) == -1);
};

if (_patrol) then {
	private _countX = 0;

	while {_countX < 4} do {
    	private _arrayGroups = _faction get (if (_isFIA) then {"groupsMilitiaSmall"} else {"groupsSmall"});
		if ([_markerX,false] call A3A_fnc_fogCheck < 0.3) then {_arraygroups = _arraygroups - (_faction get "groupSniper")};
		private _typeGroup = selectRandom _arraygroups;
		private _spawnPosition = [_positionX, 10, 50, 10, 0, -1, 0] call A3A_fnc_getSafeSpawnPos;
		private _groupX = [_spawnPosition, _sideX, _typeGroup, false, true] call A3A_fnc_spawnGroup;
		
		if !(isNull _groupX) then {
			sleep 1;
			
			if ((random 10 < 2.5) and (_typeGroup isNotEqualTo (_faction get "groupSniper"))) then {
				private _dog = [_groupX, "Fin_random_F", _spawnPosition,[],0,"FORM"] call A3A_fnc_createUnit;
				_dogs pushBack _dog;
				[_dog] spawn A3A_fnc_guardDog;
				sleep 1;
			};

			// GIVE UNIT PATCOM CONTROL
			_groupX setVariable ["PATCOM_Controlled", false];
			_groupX setVariable ["PATCOM_Patrol_Marker", [true, _positionX]];
			_groupX setVariable ["PATCOM_Patrol_Radius", _size];
			A3A_Patrol_Controlled_AI pushBack _groupX;

			diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_createAIResources#1"];

			_groups pushBack _groupX;
			{[_x,_markerX] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
		};
		_countX = _countX +1;
	};
};

private _typeVehX = _faction get "flag";
private _flagX = createVehicle [_typeVehX, _positionX, [],0, "NONE"];
_flagX allowDamage false;
[_flagX,"take"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];
_vehiclesX pushBack _flagX;
if (flagTexture _flagX != (_faction get "flagTexture")) then {[_flagX,(_faction get "flagTexture")] remoteExec ["setFlagTexture",_flagX]};

private _spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
if (_spawnParameter isEqualType []) then {
	private _typeVehX = if (_sideX == Occupants) then {
		private _types = if (!_isFIA) then {
			(_faction get "vehiclesTrucks") + (_faction get "vehiclesCargoTrucks");
		} else {
			_faction get "vehiclesMilitiaTrucks";
		};
		_types = _types select { _x in FactionGet(all,"vehiclesCargoTrucks") };
		if (count _types == 0) then { 
			(_faction get "vehiclesCargoTrucks");
		} else { 
			_types;
		};
	} else {
		(_faction get "vehiclesTrucks")
	};
	private _veh = createVehicle [selectRandom _typeVehX, (_spawnParameter select 0), [], 0, "NONE"];
	_veh setDir (_spawnParameter select 1);
	_vehiclesX pushBack _veh;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	sleep 1;
};

{ 
	_x setVariable ["originalPos", getPos _x];
} forEach _vehiclesX;

private _array = [];
private _subArray = [];
private _countX = 0;
_radiusX = _radiusX -1;
while {_countX <= _radiusX} do {
	_array pushBack (_garrison select [_countX, 7]);
	_countX = _countX + 8;
};

for "_i" from 0 to (count _array - 1) do {
	_groupX = if (_i == 0) then {
		[_positionX,_sideX, (_array select _i),true, false] call A3A_fnc_spawnGroup;
	} else {
		private _spawnPosition = [_positionX, 10, 50, 10, 0, -1, 0] call A3A_fnc_getSafeSpawnPos;
		[_spawnPosition, _sideX, (_array select _i), false, true] call A3A_fnc_spawnGroup
	};
	_groups pushBack _groupX;

	{
		[_x, _markerX] call A3A_fnc_NATOinit;
		_soldiers pushBack _x;
	} forEach units _groupX;

	if (_i == 0) then {
		[_groupX, getMarkerPos _markerX, _size] call A3A_fnc_patrolGroupGarrison;

		// Disable VCOM. It gives weird behaviour if enabled.
		_groupX setVariable ["Vcm_Disable", true];
		diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_createAIResources#3"];

	} else {
		// GIVE UNIT PATCOM CONTROL
		_groupX setVariable ["PATCOM_Controlled", false];
		_groupX setVariable ["PATCOM_Defense_Patrol", true];
		_groupX setVariable ["PATCOM_Defense_Patrol_Distance", 150];
		A3A_Patrol_Controlled_AI pushBack _groupX;

		diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_createAIResources#4"];
	};
};

waitUntil {sleep 5; (spawner getVariable _markerX == 2)};

[_markerX] call A3A_fnc_freeSpawnPositions;

deleteMarker _mrk;

{ if (alive _x) then { deleteVehicle _x } } forEach _soldiers;
{ deleteVehicle _x } forEach _civs;
{ deleteVehicle _x } forEach _dogs;

{ 
	A3A_Patrol_Controlled_AI = A3A_Patrol_Controlled_AI - [_x];
	_x setVariable ["PATCOM_Controlled", ""];
	deleteGroup _x ;
} forEach _groups;

{
	// delete all vehicles that haven't been captured
	if (_x getVariable ["ownerSide", _sideX] == _sideX) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { if !(_x isKindOf "StaticWeapon") then { [_x] spawn A3A_fnc_VEHdespawner } };
	};
} forEach _vehiclesX;
