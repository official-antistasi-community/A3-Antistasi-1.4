#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_marker", "_patrolMarker", "_flag", "_box"];

if(isNil "_marker") exitWith {Error("No marker given!")};

private _side = sidesX getVariable [_marker, sideUnknown];

if (_side == sideUnknown) exitWith {Error("Marker side resulted in sideUnknown!")};

Debug("Spawning in now!");

private _garrison = [_marker] call A3A_fnc_getGarrison;
private _garCount = [_garrison, false] call A3A_fnc_countGarrison;
private _patrolSize = [_patrolMarker] call A3A_fnc_calculateMarkerArea;
private _positionX = getMarkerPos _marker;
private _size = [_marker] call A3A_fnc_sizeMarker;

VerboseArray("Garrison", _garrison);

private _allSoldiers = [];
private _allVehicles = [];
private _allGroups = [];
private _stayGroups = [];
private _patrolGroups = [];
private _spawnParameter = [];
private _lineIndex = 0;
{
	private _vehicleType = _x # 0;
	private _crewArray = _x # 1;
	private _cargoArray = _x # 2;
	private _groupX = createGroup _side;
	_allGroups pushBack _groupX;
	private _skip = false;

	if (_vehicleType != "") then {
		//Array got a vehicle, spawn it in
		if(_vehicleType isKindOf "Car") then {
			_spawnParameter = [_marker, "Vehicle"] call A3A_fnc_findSpawnPosition;
		};

		if(_vehicleType isKindOf "Helicopter") then {
			_spawnParameter = [_marker, "Heli"] call A3A_fnc_findSpawnPosition;
		};

		if(_vehicleType isKindOf "Plane") then {
			_spawnParameter = [_marker, "Plane"] call A3A_fnc_findSpawnPosition;
		};

		if(_spawnParameter isEqualType []) then {
			private _vehicle = createVehicle [_vehicleType, _spawnParameter select 0, [], 0 , "CAN_COLLIDE"];
			_vehicle allowDamage false;

			[_vehicle] spawn {
				params ["_vehicle"];
				sleep 3;
				_vehicle allowDamage true;
			};

			_vehicle setDir (_spawnParameter select 1);
			_allVehicles pushBack _vehicle;
			_groupX addVehicle _vehicle;

			//Should work as a local variable needs testing
			_vehicle setVariable ["UnitIndex", (_lineIndex * 10 + 0)];
			_vehicle setVariable ["UnitMarker", _marker];

			//On vehicle death, remove it from garrison
			_vehicle addEventHandler ["Killed", {
				_vehicle = _this select 0;
				private _id = _vehicle getVariable "UnitIndex";
				_marker = _vehicle getVariable "UnitMarker";
				[_marker, typeOf _vehicle, _id] call A3A_fnc_addRequested;
			}];
			sleep 0.25;
			//That would work perfectly with the breach script i did a PR for, without it it would just frustrate player
			//_vehicle lock 3;
		} else {
			_skip = true;
		};
	};

	if(!_skip) then {
		_spawnParameter = [getMarkerPos _marker, objNull];
		{
			private _unitX = [_groupX, _x, (_spawnParameter select 0), [], 5, "NONE"] call A3A_fnc_createUnit;
			_allSoldiers pushBack _unitX;
			//Should work as a local variable needs testing
			_unitX setVariable ["UnitIndex", (_lineIndex * 10 + 1)];
			_unitX setVariable ["UnitMarker", _marker];

			//On vehicle death, remove it from garrison
			_unitX addEventHandler ["Killed", {
				_unitX = _this select 0;
				private _id = _unitX getVariable "UnitIndex";
				_marker = _unitX getVariable "UnitMarker";
				[_marker, _unitX getVariable "unitType", _id] call A3A_fnc_addRequested;
			}];
			sleep 0.25;
		} forEach _crewArray;

		[_groupX, getMarkerPos _markerX, _patrolSize] spawn A3A_fnc_patrolGroupGarrison;
		// Disable VCOM. It gives weird behaviour if enabled.
		_groupX setVariable ["Vcm_Disable", true];

		diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_cycleSpawn#1"];


		private _forcePatrol = ((count _allGroups) > ((count _patrolGroups) * 3));
		private _counter = 0;
		_groupSoldier = createGroup _side;
		_allGroups pushBack _groupSoldier;
		_stayGroups pushBack _groupSoldier;
		{
			private _unitX = [_groupSoldier, _x, (_spawnParameter select 0), [], 5, "NONE"] call A3A_fnc_createUnit;
			_allSoldiers pushBack _unitX;

			//Should work as a local variable needs testing
			_unitX setVariable ["UnitIndex", (_lineIndex * 10 + 2)];
			_unitX setVariable ["UnitMarker", _marker];

			//On vehicle death, remove it from garrison
			_unitX addEventHandler ["Killed", {
				_unitX = _this select 0;
				private _id = _unitX getVariable "UnitIndex";
				_marker = _unitX getVariable "UnitMarker";
				[_marker, _unitX getVariable "unitType", _id] call A3A_fnc_addRequested;
			}];
			sleep 0.25;
			_counter = _counter + 1;
			if((_counter >= 2) && {_forcePatrol || {count _cargoArray < 5}}) then {
				_groupSoldier = createGroup _side;
				_counter = 0;
				_allGroups pushBack _groupSoldier;
				_patrolGroups pushBack _groupSoldier;
			};
		} forEach _cargoArray;
	};
	_lineIndex = _lineIndex + 1;
} forEach _garrison;


private _sizePerUnit = 0;
if(count _allSoldiers != 0) then {
	_sizePerUnit = _patrolSize / (count _allSoldiers);
};

Debug_3("The size is %1/ Unit count is %2/ Per Unit is %3", _patrolSize, count _allSoldiers, _sizePerUnit);

//Every unit can search a area of 12500 m^2, if the unit is bigger, reduce patrol area
private _patrolMarkerSize = getMarkerSize _patrolMarker;
if(_sizePerUnit > 12500) then {
    Debug("The area is to large, make it smaller");
  	_patrolMarkerSize set [0, (_patrolMarkerSize select 0) * (12500/_sizePerUnit)];
  	_patrolMarkerSize set [1, (_patrolMarkerSize select 1) * (12500/_sizePerUnit)];
};

private _mainMarkerSize = getMarkerSize _marker;
if(((_patrolMarkerSize select 0) < (_mainMarkerSize select 0)) || {(_patrolMarkerSize select 1) < (_mainMarkerSize select 1)}) then {
    Debug("Resizing to marker size");
  _patrolMarkerSize = _mainMarkerSize;
};

_patrolMarker setMarkerSizeLocal _patrolMarkerSize;

{
  // GIVE UNIT PATCOM CONTROL
	[_x, "Patrol_Defend", 0, 100, -1, true, _positionX, false] call A3A_fnc_patrolLoop;
  	diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_cycleSpawn#2"];

} forEach _stayGroups;

{
  	diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_cycleSpawn#3"];
	[_x, "Patrol_Area", 25, 150, 300, false, [], false] call A3A_fnc_patrolLoop;

} forEach _patrolGroups;

/*
waitUntil {sleep 5; (spawner getVariable _marker == 2)};

[_marker] call A3A_fnc_freeSpawnPositions;

deleteMarker _patrolMarker;

{
	if (alive _x) then
	{
		deleteVehicle _x;
	};
} forEach _allSoldiers;

{
	deleteGroup _x
} forEach _allGroups;

{
	if (!(_x in staticsToSave)) then
	{
		if ((!([distanceSPWN, 1, _x, teamPlayer] call A3A_fnc_distanceUnits))) then
		{
			deleteVehicle _x;
		};
	};
} forEach _allVehicles;
*/
