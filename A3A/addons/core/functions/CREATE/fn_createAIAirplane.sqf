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
		[[_marker], "A3A_fnc_createAIAirplane"] call A3A_fnc_scheduler;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

if (!isServer and hasInterface) exitWith{};
//Not sure if that ever happens, but it reduces redundance
if(spawner getVariable _markerX == 2) exitWith {};

ServerDebug_1("Spawning Airbase %1", _markerX);

private _vehiclesX = [];
private _groups = [];
private _soldiers = [];
private _dogs = [];
private _positionX = getMarkerPos (_markerX);
private _pos = [];
private _ang = 0;
private _countX = 0;
private _size = [_markerX] call A3A_fnc_sizeMarker;
private _frontierX = [_markerX] call A3A_fnc_isFrontline;
private _busy = if (dateToNumber date > server getVariable _markerX) then {false} else {true};
private _nVeh = round (_size/60);
private _sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);


///////////////////
// Random Vehicle and AA setup.
///////////////////
private _typeVehX = selectRandom (_faction get "vehiclesAA");
private _vehiclesAvilable = if (_frontierX && {[_typeVehX] call A3A_fnc_vehAvailable}) then {2} else {1};
for "_i" from 1 to _vehiclesAvilable do {
	private _spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;

	if (_spawnParameter isEqualType []) then {
		private _vehicle=[(_spawnParameter # 0), (_spawnParameter # 1),_typeVehX, _sideX] call A3A_fnc_spawnVehicle;
		private _veh = (_vehicle # 0);
		private _vehCrew = (_vehicle # 1);

		{
			[_x, _markerX] call A3A_fnc_NATOinit;
		} forEach _vehCrew;

		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		private _groupVeh = (_vehicle # 2);
		_soldiers = _soldiers + _vehCrew;
		_groups pushBack _groupVeh;
		
		// GIVE UNIT PATCOM CONTROL
		[_groupVeh, "Patrol_Area", 25, 100, 250, true, _positionX, false] call A3A_fnc_patrolLoop;

		_vehiclesX pushBack _veh;
		sleep 1;
	} else {
		_i = _vehiclesAvilable;
	};
};

///////////////////
// Frontline Check and Roadblock Setup
///////////////////
if (_frontierX) then {
	private _roads = _positionX nearRoads _size;
	if (count _roads != 0) then {
		private _groupX = createGroup _sideX;
		_groups pushBack _groupX;

		private _dist = 0;
		private _road = objNull;
		{
			if ((position _x) distance _positionX > _dist) then {
				_road = _x;
				_dist = position _x distance _positionX;
			};
		} forEach _roads;

		private _roadscon = roadsConnectedto _road;
		private _roadcon = objNull;
		{
			if ((position _x) distance _positionX > _dist) then {
				_roadcon = _x;
			};
		} forEach _roadscon;

		private _dirveh = [_roadcon, _road] call BIS_fnc_DirTo;
		_pos = [getPos _road, 7, _dirveh + 270] call BIS_Fnc_relPos;
		private _bunker = "Land_BagBunker_01_small_green_F" createVehicle _pos;
		_vehiclesX pushBack _bunker;
		_bunker setDir _dirveh;
		_pos = getPosATL _bunker;

		_typeVehX = selectRandom (_faction get "staticAT");
		private _veh = _typeVehX createVehicle _positionX;
		_vehiclesX pushBack _veh;
		_veh setDir _dirVeh + 180;
		_veh setPos _pos;

		private _typeUnit = _faction get "unitStaticCrew";
		private _unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
		[_unit,_markerX] call A3A_fnc_NATOinit;
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		_unit moveInGunner _veh;
		_soldiers pushBack _unit;
	};
};

///////////////////
// Markers
///////////////////
private _mrk = createMarkerLocal [format ["%1patrolarea", random 100], _positionX];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [(distanceSPWN/2),(distanceSPWN/2)];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_ang = markerDir _markerX;
_mrk setMarkerDirLocal _ang;
if (!debug) then {_mrk setMarkerAlphaLocal 0};

///////////////////
// Garrison Pre Init
///////////////////
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

///////////////////
// Patrols
///////////////////
if (_patrol) then {
	_countX = 0;
	while {_countX < 4} do {
		private _arraygroups = _faction get "groupsSmall";
		if ([_markerX, false] call A3A_fnc_fogCheck < 0.3) then {_arraygroups = _arraygroups - (_faction get "groupSniper")};
		private _typeGroup = selectRandom _arraygroups;
		private _spawnPosition = [_positionX, 10, 50, 10, 0, -1, 0] call A3A_fnc_getSafePos;
		private _groupX = [_spawnPosition, _sideX, _typeGroup, false, true] call A3A_fnc_spawnGroup;
		if !(isNull _groupX) then {
			sleep 1;
			if ((random 10 < 2.5) and (_typeGroup isNotEqualTo (_faction get "groupSniper"))) then {
				private _dog = [_groupX, "Fin_random_F", _positionX, [], 0, "FORM"] call A3A_fnc_createUnit;
				_dogs pushBack _dog;
				[_dog] spawn A3A_fnc_guardDog;
				sleep 1;
			};

			// GIVE UNIT PATCOM CONTROL
			[_groupX, "Patrol_Area", 25, 150, 300, false, [], false] call A3A_fnc_patrolLoop;
			_groups pushBack _groupX;

			{
				[_x,_markerX] call A3A_fnc_NATOinit; 
				_soldiers pushBack _x;
			} forEach units _groupX;
		};
		_countX = _countX +1;
	};
};

///////////////////
// Mortars / Support
///////////////////
if ((_frontierX) and (_markerX in airportsX)) then {
	private _typeUnit = _faction get "unitStaticCrew";
	_typeVehX = selectRandom (_faction get "staticMortars");
	private _spawnParameter = [_markerX, "Mortar"] call A3A_fnc_findSpawnPosition;
	
	if(_spawnParameter isEqualType []) then {
		private _groupX = createGroup _sideX;
		private _veh = _typeVehX createVehicle (_spawnParameter select 0);

		[_groupX] call A3A_fnc_artilleryAdd;
		diag_log text format["Hazey Debug--- CALL ATTEMPT: MON_artillery_add FROM: fn_createAIOutposts#1"];

		private _unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
		[_unit, _markerX] call A3A_fnc_NATOinit;
		_unit moveInGunner _veh;
		_groups pushBack _groupX;
		_soldiers pushBack _unit;
		_vehiclesX pushBack _veh;
		sleep 1;
	};
};

///////////////////
// Add Statics to buildings
///////////////////
private _ret = [_markerX, _size, _sideX, _frontierX] call A3A_fnc_milBuildings;
_groups pushBack (_ret select 0);
_vehiclesX append (_ret select 1);
_soldiers append (_ret select 2);
{[_x, _sideX] call A3A_fnc_AIVEHinit} forEach (_ret select 1);

///////////////////
// Place Intel
///////////////////
if(random 100 < (50 + tierWar * 3)) then {
	private _large = (random 100 < (40 + tierWar * 2));
	[_markerX, _large] spawn A3A_fnc_placeIntel;
};

///////////////////
// Aircraft Generation
///////////////////
if (!_busy) then {
	//Newer system in place
	private _runwaySpawnLocation = [_markerX] call A3A_fnc_getRunwayTakeoffForAirportMarker;
	private _spawnParameter = [_markerX, "Plane"] call A3A_fnc_findSpawnPosition;
	if !(_runwaySpawnLocation isEqualTo []) then {
		_pos = (_runwaySpawnLocation # 0);
		_ang = (_runwaySpawnLocation # 1);
	};

	private _groupX = createGroup _sideX;
	_groups pushBack _groupX;

	_countX = 0;
	while {_countX < 3} do {
		private _veh = objNull;
		if(_spawnParameter isEqualType []) then {
			private _vehPool = ((_faction get "vehiclesPlanesCAS") + (_faction get "vehiclesPlanesAA")) select {[_x] call A3A_fnc_vehAvailable};
			if(count _vehPool > 0) then {
				_typeVehX = selectRandom _vehPool;
				_veh = createVehicle [_typeVehX, (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
				_veh setDir (_spawnParameter # 1);
				_veh setPos (_spawnParameter # 0);
				_vehiclesX pushBack _veh;
				[_veh, _sideX] call A3A_fnc_AIVEHinit;
			};
			_spawnParameter = [_markerX, "Plane"] call A3A_fnc_findSpawnPosition;
		} else {
			if !(_runwaySpawnLocation isEqualTo []) then {
				_typeVehX = selectRandom ((
                    (_faction get "vehiclesHelisLight")
                    + (_faction get "vehiclesHelisTransport")
                    + (_faction get "vehiclesPlanesCAS")
                    + (_faction get "vehiclesPlanesAA")
                    + (_faction get "vehiclesPlanesTransport")
                ) select {[_x] call A3A_fnc_vehAvailable});
				_veh = createVehicle [_typeVehX, _pos, [],3, "NONE"];
				_veh setDir (_ang);
				_pos = [_pos, 50,_ang] call BIS_fnc_relPos;
				_vehiclesX pushBack _veh;
				[_veh, _sideX] call A3A_fnc_AIVEHinit;
			} else {
				//No places found, neither hangar nor runway
				_countX = 3;
			};
		};
		_countX = _countX + 1;
	};
};

///////////////////
// Flag Generation
///////////////////
_typeVehX = _faction get "flag";
private _flagX = createVehicle [_typeVehX, _positionX, [], 0, "NONE"];
_flagX allowDamage false;
[_flagX, "take"] remoteExec ["A3A_fnc_flagaction", [teamPlayer, civilian], _flagX];
_vehiclesX pushBack _flagX;
if (flagTexture _flagX != (_faction get "flagTexture")) then {
	[_flagX, (_faction get "flagTexture")] remoteExec ["setFlagTexture", _flagX];
};


///////////////////
// Ammobox Generation
///////////////////
// Only create ammoBox if it's been recharged (see reinforcementsAI)
private _ammoBox = if (garrison getVariable [_markerX + "_lootCD", 0] == 0) then {
	private _ammoBoxType = _faction get "ammobox";
	private _ammoBox = [_ammoBoxType, _positionX, 15, 5, true] call A3A_fnc_safeVehicleSpawn;
	// Otherwise when destroyed, ammoboxes sink 100m underground and are never cleared up
	_ammoBox addEventHandler ["Killed", { [_this # 0] spawn { sleep 10; deleteVehicle (_this # 0) } }];
	[_ammoBox] spawn A3A_fnc_fillLootCrate;
	[_ammoBox] call A3A_fnc_logistics_addLoadAction;

	[_ammoBox] spawn {
		sleep 1;
		{
			_this#0 addItemCargoGlobal [_x, round random [5, 15, 15]];
		} forEach (A3A_faction_reb get "flyGear");
	};
	_ammoBox;
};


if (!_busy) then {
	for "_i" from 1 to (round (random 2)) do {
		private _arrayVehAAF = ((_faction get "vehiclesAPCs") + (_faction get "vehiclesTanks")) select {[_x] call A3A_fnc_vehAvailable};
		private _spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
		if (count _arrayVehAAF > 0 && {_spawnParameter isEqualType []}) then {
			private _veh = createVehicle [selectRandom _arrayVehAAF, (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
			_veh setDir (_spawnParameter select 1);
			_vehiclesX pushBack _veh;
			[_veh, _sideX] call A3A_fnc_AIVEHinit;
			_nVeh = _nVeh -1;
			sleep 1;
		};
	};
};

///////////////////
// Random Vehicles
///////////////////
private _arrayVehAAF = (_faction get "vehiclesLight") + (_faction get "vehiclesTrucks") + (_faction get "vehiclesAmmoTrucks") + (_faction get "vehiclesRepairTrucks") + (_faction get "vehiclesFuelTrucks") + (_faction get "vehiclesMedical");
_countX = 0;
while {_countX < _nVeh && {_countX < 3}} do {
	_typeVehX = selectRandom _arrayVehAAF;
	private _spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
	if(_spawnParameter isEqualType []) then {
		private _veh = createVehicle [_typeVehX, (_spawnParameter select 0), [], 0, "NONE"];
		_veh setDir (_spawnParameter select 1);
		_vehiclesX pushBack _veh;
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		sleep 1;
		_countX = _countX + 1;
	} else {
		_countX = _nVeh;
	};
};

{ 
	_x setVariable ["originalPos", getPos _x];
} forEach _vehiclesX;


///////////////////
// Garrison Units
///////////////////
private _array = [];
private _subArray = [];
_countX = 0;
_radiusX = _radiusX -1;
while {_countX <= _radiusX} do {
	_array pushBack (_garrison select [_countX, 7]);
	_countX = _countX + 8;
};
for "_i" from 0 to (count _array - 1) do {
	private _groupX = if (_i == 0) then {
		[_positionX,_sideX, (_array select _i), true, false] call A3A_fnc_spawnGroup;
	} else {
		private _spawnPosition = [_positionX, 50, 100, 20, 0, -1, 0] call A3A_fnc_getSafePos;
		[_spawnPosition, _sideX, (_array select _i), false, true] call A3A_fnc_spawnGroup;
	};
	_groups pushBack _groupX;
	{
		[_x,_markerX] call A3A_fnc_NATOinit; 
		_soldiers pushBack _x;
	} forEach units _groupX;

	if (_i == 0) then {
		[_groupX, getMarkerPos _markerX, _size] spawn A3A_fnc_patrolGroupGarrison;
		
		// Disable VCOM. It gives weird behaviour if enabled.
		_groupX setVariable ["Vcm_Disable", true];
	} else {
		// GIVE UNIT PATCOM CONTROL
		[_groupX, "Patrol_Defend", 0, 200, -1, true, _positionX, false] call A3A_fnc_patrolLoop;
	};
};

///////////////////
// Handle Unit Removal
///////////////////
waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

[_markerX] call A3A_fnc_freeSpawnPositions;

deleteMarker _mrk;
{ if (alive _x) then { deleteVehicle _x } } forEach _soldiers;
{ deleteVehicle _x } forEach _dogs;

{
	_x setVariable ["PATCOM_Controlled", false];
	deleteGroup _x;
} forEach _groups;

{
	// delete all vehicles that haven't been stolen
	if (_x getVariable ["ownerSide", _sideX] == _sideX) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { if !(_x isKindOf "StaticWeapon") then { [_x] spawn A3A_fnc_VEHdespawner } };
	};
} forEach _vehiclesX;

// If loot crate was stolen, set the cooldown
if (!isNil "_ammoBox") then {
	if ((alive _ammoBox) and (_ammoBox distance2d _positionX < 100)) exitWith { deleteVehicle _ammoBox };
	if (alive _ammoBox) then { [_ammoBox] spawn A3A_fnc_VEHdespawner };
	private _lootCD = 120*16 / ([_markerX] call A3A_fnc_garrisonSize);
	garrison setVariable [_markerX + "_lootCD", _lootCD, true];
};
