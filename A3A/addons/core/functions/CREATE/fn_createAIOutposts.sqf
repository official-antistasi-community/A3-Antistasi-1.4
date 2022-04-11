/*
    Author: [Unknown] / [Hazey]
    Description:
		Create Outpost patrols based on Invader or Occupant forces

    Arguments:
    	<String> Marker where you want the patrol to spawn.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[[_marker], "A3A_fnc_createAIOutposts"] call A3A_fnc_scheduler;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer and hasInterface) exitWith{};
params ["_markerX"];

//Not sure if that ever happens, but it reduces redundance
if (spawner getVariable _markerX == 2) exitWith {};

private _vehiclesX = [];
private _groups = [];
private _soldiers = [];
private _dogs = [];
private _positionX = getMarkerPos (_markerX);
private _pos = [];
private _buildings = [];
private _size = [_markerX] call A3A_fnc_sizeMarker;
private _frontierX = [_markerX] call A3A_fnc_isFrontline;
private _sideX = Invaders;
private _isFIA = false;
private _antenna = objNull;

ServerDebug_1("Spawning Outpost %1", _markerX);

if (sidesX getVariable [_markerX, sideUnknown] == Occupants) then {
	_sideX = Occupants;
	if ((random 10 >= (tierWar + difficultyCoef)) and !(_frontierX) and !(_markerX in forcedSpawn)) then {
		_isFIA = true;
	};
};

private _faction = Faction(_sideX);

if (_sideX == Occupants) then {
	if (_markerX in outposts) then {
		_buildings = nearestObjects [_positionX,["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_Communication_F"], _size];

		if (count _buildings > 0) then {
			_antenna = (_buildings#0);
		};
	};
};

///////////////////
// Markers
///////////////////
private _mrk = createMarkerLocal [format ["%1patrolarea", random 100], _positionX];
private _ang = markerDir _markerX;
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [(distanceSPWN/2),(distanceSPWN/2)];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerDirLocal _ang;

if (!debug) then {_mrk setMarkerAlphaLocal 0};

///////////////////
// Setup Garrisons
///////////////////
private _garrison = garrison getVariable [_markerX,[]];
_garrison = _garrison call A3A_fnc_garrisonReorg;
private _garrisonCount = count _garrison;

///////////////////
// Setup Patrols
///////////////////
private _patrol = true;
//If one is missing, there are no patrols??
if (_garrisonCount < ([_markerX] call A3A_fnc_garrisonSize)) then {
	_patrol = false;
} else {
	//No patrol if patrol area overlaps with an enemy site
	_patrol = ((markersX findIf {(getMarkerPos _x inArea _mrk) && {sidesX getVariable [_x, sideUnknown] != _sideX}}) == -1);
};

///////////////////
// Patrols
///////////////////
if (_patrol) then {
	private _loopCount = 0;

	while {_loopCount < 4} do {
    	private _groupTypes = _faction get (if (_isFIA) then {"groupsMilitiaSmall"} else {"groupsSmall"});

		if ([_markerX,false] call A3A_fnc_fogCheck < 0.3) then {
			_groupTypes = _groupTypes - (_faction get "groupSniper")
		};

		private _groupType = selectRandom _groupTypes;

		private _spawnPosition = [_positionX, 50, 150, 10, 0, -1, 0] call A3A_fnc_getSafeSpawnPos;
		// We run a final check to see if the position is actually valid. If its not, we just exit.
		if (count _spawnPosition <= 2) exitWith {};

		private _groupX = [_spawnPosition, _sideX, _groupType, false, true] call A3A_fnc_spawnGroup;

		if !(isNull _groupX) then {
			sleep 1;
			if ((random 10 < 2.5) && (_groupType isNotEqualTo (_faction get "groupSniper"))) then {
				private _dog = [_groupX, "Fin_random_F", _positionX, [], 0, "FORM"] call A3A_fnc_createUnit;
				_dogs pushBack _dog;
				[_dog] spawn A3A_fnc_guardDog;
				sleep 1;
			};

			diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_createAIOutposts#1"];

			// GIVE UNIT PATCOM CONTROL
			_groupX setVariable ["PATCOM_Controlled", false];
			A3A_Patrol_Controlled_AI pushBack _groupX;
			_groups pushBack _groupX;

			{
				[_x,_markerX] call A3A_fnc_NATOinit; 
				_soldiers pushBack _x;
			} forEach units _groupX;
		};
		_loopCount = _loopCount +1;
	};
};

///////////////////
// Mortars / Support
///////////////////
if ((_frontierX) and (_markerX in outposts)) then {
	private _typeUnit = _faction get "unitStaticCrew";
	private _typeVehX = selectRandom (_faction get "staticMortars");
	private _spawnParameter = [_markerX, "Mortar"] call A3A_fnc_findSpawnPosition;
	
	if(_spawnParameter isEqualType []) then {
		private _groupX = createGroup _sideX;
		private _veh = _typeVehX createVehicle (_spawnParameter select 0);

		//_nul=[_veh] execVM QPATHTOFOLDER(scripts\UPSMON\MON_artillery_add.sqf);//TODO need delete UPSMON link
		//todo Hazey to replace this function
		diag_log text format["Hazey Debug--- CALL ATTEMPT: MON_artillery_add FROM: fn_createAIOutposts#1"];

		private _unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
		[_unit,_markerX] call A3A_fnc_NATOinit;
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
_groups pushBack (_ret # 0);
_vehiclesX append (_ret # 1);
_soldiers append (_ret # 2);

// Add Event handlers to Statics
{ 
	[_x, _sideX] call A3A_fnc_AIVEHinit;
} forEach _vehiclesX;

///////////////////
// Place Intel
///////////////////
if(random 100 < (40 + tierWar * 3)) then {
	private _large = (random 100 < (30 + tierWar * 2));
	[_markerX, _large] spawn A3A_fnc_placeIntel;
};

///////////////////
// Handle the flag (with care)
///////////////////
private _factionFlag = _faction get "flag";
private _flagX = createVehicle [_factionFlag, _positionX, [],0, "NONE"];
_flagX allowDamage false;
[_flagX, "take"] remoteExec ["A3A_fnc_flagaction", [teamPlayer, civilian], _flagX];
_vehiclesX pushBack _flagX;

if (flagTexture _flagX != (_faction get "flagTexture")) then {
	[_flagX,(_faction get "flagTexture")] remoteExec ["setFlagTexture",_flagX];
};

///////////////////
// AMMO BOX
///////////////////
// Only create ammoBox if it's been recharged (see reinforcementsAI)
private _ammoBox = if (garrison getVariable [_markerX + "_lootCD", 0] == 0) then {
	private _ammoBoxType = _faction get "ammobox";
	private _ammoBox = [_ammoBoxType, _positionX, 15, 5, true] call A3A_fnc_safeVehicleSpawn;

	// Otherwise when destroyed, ammoboxes sink 100m underground and are never cleared up
	_ammoBox addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
	[_ammoBox] spawn A3A_fnc_fillLootCrate;
	[_ammoBox] call A3A_fnc_logistics_addLoadAction;

	if (_markerX in seaports) then {
		//make sure fillLootCrate finished clearing the crate
		[_ammoBox] spawn {
			sleep 1;
			{
				_this#0 addItemCargoGlobal [_x, round random [2,6,8]];
			} forEach (A3A_faction_reb get "diveGear");
		};
	};

	_ammoBox;
};

///////////////////
// Boat Patrols!
///////////////////
private _roads = _positionX nearRoads _size;
if ((_markerX in seaports) and !A3A_hasIFA) then {
	private _typeVehX = selectRandom (_faction get "vehiclesGunBoats");
	if ([_typeVehX] call A3A_fnc_vehAvailable) then {
		private _mrkMar = seaSpawn select {getMarkerPos _x inArea _markerX};
		if(count _mrkMar > 0) then {
			private _pos = (getMarkerPos (_mrkMar select 0)) findEmptyPosition [0, 20, _typeVehX];
			private _vehicle=[_pos, 0,_typeVehX, _sideX] call A3A_fnc_spawnVehicle;
			private _veh = (_vehicle # 0);
			[_veh, _sideX] call A3A_fnc_AIVEHinit;
			private _vehCrew = (_vehicle # 1);
			{[_x,_markerX] call A3A_fnc_NATOinit} forEach _vehCrew;
			private _groupVeh = (_vehicle # 2);
			_soldiers = _soldiers + _vehCrew;
			_groups pushBack _groupVeh;
			_vehiclesX pushBack _veh;
			sleep 1;
		} else {
			Error_1("Could not find seaSpawn marker on %1!", _markerX);
		};
	};
} else {
	if (_frontierX) then {
		if (count _roads != 0) then {
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

			//This is a extrem complex way, use vector and scalar product to determine which way they are pointing
			{
				if ((position _x) distance _positionX > _dist) then {
					_roadcon = _x;
				};
			} forEach _roadscon;
			private _dirveh = [_roadcon, _road] call BIS_fnc_DirTo;
			private _groupX = createGroup _sideX;
			_groups pushBack _groupX;
			private _pos = [getPos _road, 7, _dirveh + 270] call BIS_Fnc_relPos;
			private _bunker = "Land_BagBunker_01_Small_green_F" createVehicle _pos;
			_vehiclesX pushBack _bunker;
			_bunker setDir _dirveh;
			_pos = getPosATL _bunker;
			private _staticAt = selectRandom (_faction get "staticAT");
			private _veh = _staticAt createVehicle _positionX;
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
};

///////////////////
// Random Vehicles
///////////////////
private _spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
if (_spawnParameter isEqualType []) then {
	private _typeVehX = if (_sideX == Occupants) then {
		private _types = if (!_isFIA) then {(_faction get "vehiclesTrucks") + (_faction get "vehiclesCargoTrucks")} else {_faction get "vehiclesMilitiaTrucks"};
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
	_x setVariable ["originalPos", getPos _x] 
} forEach _vehiclesX;

///////////////////
// Antenna
///////////////////
if (!isNull _antenna) then {
	if ((typeOf _antenna == "Land_TTowerBig_1_F") or (typeOf _antenna == "Land_TTowerBig_2_F")) then {
		private _groupX = createGroup _sideX;
		private _pos = getPosATL _antenna;
		private _dir = getDir _antenna;
		private _posF = _pos getPos [2,_dir];
		_posF set [2,23.1];

		if (typeOf _antenna == "Land_TTowerBig_2_F") then {
			_posF = _pos getPos [1,_dir];
			_posF set [2,24.3];
		};

        private _typeUnit = _faction get (if (_isFIA) then {"unitMilitiaMarksman"} else {"unitMarksman"});
		private _unit = [_groupX, _typeUnit, _positionX, [], _dir, "NONE"] call A3A_fnc_createUnit;
		_unit setPosATL _posF;
		_unit forceSpeed 0;
		_unit setUnitPos "UP";
		[_unit,_markerX] call A3A_fnc_NATOinit;
		_soldiers pushBack _unit;
		_groups pushBack _groupX;
	};
};

///////////////////
// Garrison
///////////////////
private _array = [];
private _subArray = [];
private _countX = 0;
_garrisonCount = _garrisonCount -1;
while {_countX <= _garrisonCount} do {
	_array pushBack (_garrison select [_countX, 7]);
	_countX = _countX + 8;
};

for "_i" from 0 to (count _array - 1) do {
	//What is so special about the first?
	// ^^ It makes the first group the group that gets moved into a position.
	_groupX = if (_i == 0) then {
		[_positionX, _sideX, (_array select _i), true, false] call A3A_fnc_spawnGroup
	} else {
		private _spawnPosition = [_positionX, 10, 50, 10, 0, -1, 0] call A3A_fnc_getSafeSpawnPos;
		[_spawnPosition, _sideX, (_array select _i), false, true] call A3A_fnc_spawnGroup
	};

	_groups pushBack _groupX;
	{
		[_x,_markerX] call A3A_fnc_NATOinit;
		_soldiers pushBack _x;
	} forEach units _groupX;

	// Garrison the first group into buildings
	if (_i == 0) then {
		diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_createAIOutposts#2"];
		[_groupX, getMarkerPos _markerX, _size] call A3A_fnc_patrolGroupGarrison;

		// Disable VCOM. It gives weird behaviour if enabled.
		_groupX setVariable ["Vcm_Disable", true];

	} else {
		// GIVE UNIT PATCOM CONTROL
		_groupX setVariable ["PATCOM_Controlled", false];
		_groupX setVariable ["PATCOM_Defense_Patrol", true];
		_groupX setVariable ["PATCOM_Defense_Patrol_Distance", 150];

		A3A_Patrol_Controlled_AI pushBack _groupX;
		_groups pushBack _groupX;
		diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_createAIOutposts#3"];

	};
};

///////////////////
// Handle Deletion
///////////////////
waitUntil {sleep 10; (spawner getVariable _markerX == 2)};

[_markerX] call A3A_fnc_freeSpawnPositions;
deleteMarker _mrk;

{ if (alive _x) then { deleteVehicle _x } } forEach _soldiers;
{ deleteVehicle _x } forEach _dogs;
{ 
	A3A_Patrol_Controlled_AI = A3A_Patrol_Controlled_AI - [_x];
	_x setVariable ["PATCOM_Controlled", ""];
	deleteGroup _x ;
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
