private ["_positionX","_size","_buildings","_groupX","_typeUnit","_sideX","_building","_typeB","_frontierX","_typeVehX","_veh","_vehiclesX","_soldiers","_pos","_ang","_markerX","_unit","_return"];
_markerX = _this select 0;
_positionX = getMarkerPos _markerX;
_size = _this select 1;
_buildings = nearestObjects [_positionX, listMilBld, _size * 1.2, true];

if (count _buildings == 0) exitWith {[grpNull,[],[]]};

_sideX = _this select 2;
_frontierX = _this select 3;

_vehiclesX = [];
_soldiers = [];

_groupX = createGroup _sideX;
_typeUnit = if (_sideX==Occupants) then {staticCrewOccupants} else {staticCrewInvaders};

//New system to place helis, does not care about heli types currently
private _helicopterTypes = [];
_helicopterTypes pushBack (if (_sideX == Occupants) then {vehNATOPatrolHeli} else {vehCSATPatrolHeli});
private _spawnParameter = [_markerX, "Heli"] call A3A_fnc_findSpawnPosition;
private _count = 1 + round (random 3); //Change these numbers as you want, first number is minimum, max is first plus second number
while {_spawnParameter isEqualType [] && {_count > 0}} do
{
	_typeVehX = selectRandom _helicopterTypes;
	_veh = createVehicle [_typeVehX, (_spawnParameter select 0), [],0, "CAN_COLLIDE"];
	_veh setDir (_spawnParameter select 1);
	_vehiclesX pushBack _veh;
	_spawnParameter = [_markerX, "Heli"] call A3A_fnc_findSpawnPosition;
	_count = _count - 1;
};

for "_i" from 0 to (count _buildings) - 1 do
	{
	if (spawner getVariable _markerX == 2) exitWith {};
	_building = _buildings select _i;
	/*
	if !(_building getVariable ["conEH",false]) then
		{
		_building setVariable ["conEH",true,true];
		_building addEventHandler ["Killed",{
			_building = _this select 0;
			destroyedBuildings pushBackUnique (getPos _building);
			publicVariable "destroyedBuildings";
			}
			];
		};*/
	_typeB = typeOf _building;
	//Helipads spawn in different types of helicopter. By default, patrol helis.
	//In the editor, drop this code in 'init' on the helipad to change that.
	//this setVariable ["spawnableHelicopterTypes", ["patrol", "transport", "attack"]];
	//Disabled by Wurzel, newer system in place

	/*
	if ((_typeB == "Land_HelipadSquare_F") and (!_frontierX)) then
	{
		private _helicopterCategories = _building getVariable ["spawnableHelicopterTypes", ["patrol"]];
		private _helicopterTypes = [];
		{
			switch _x do
			{
				case "patrol":
				{
					_helicopterTypes pushBack (if (_sideX == Occupants) then {vehNATOPatrolHeli} else {vehCSATPatrolHeli});
				};
				case "transport":
				{
					_helicopterTypes append (if (_sideX == Occupants) then {vehNATOTransportHelis} else {vehCSATTransportHelis});
				};
				case "attack":
				{
					_helicopterTypes append (if (_sideX == Occupants) then {vehNATOAttackHelis} else {vehCSATAttackHelis});
				};
			};
		} forEach _helicopterCategories;
		diag_log format ["Types of All Heli: %1", _helicopterTypes];
		_helicopterTypes = _helicopterTypes select {[_x] call A3A_fnc_vehAvailable};
		diag_log format ["Types of Heli: %1", _helicopterTypes];
		_typeVehX = selectRandom _helicopterTypes;
		_veh = createVehicle [_typeVehX, position _building, [],0, "CAN_COLLIDE"];
		_veh setDir (getDir _building);
		_vehiclesX pushBack _veh;
	}
	else
	{
		*/
	if 	((_typeB == "Land_Cargo_HQ_V1_F") or (_typeB == "Land_Cargo_HQ_V2_F") or (_typeB == "Land_Cargo_HQ_V3_F")) then
	{
		_typeVehX = if (_sideX == Occupants) then {staticAAOccupants} else {staticAAInvaders};
		_veh = createVehicle [_typeVehX, (_building buildingPos 8), [],0, "CAN_COLLIDE"];
		_veh setDir (getDir _building);
		_veh setPosATL [(getPos _building select 0),(getPos _building select 1),(getPosATL _veh select 2)];
		_unit = _groupX createUnit [_typeUnit, _positionX, [], 0, "NONE"];
		[_unit,_markerX] call A3A_fnc_NATOinit;
		_unit moveInGunner _veh;
		_soldiers pushBack _unit;
		_vehiclesX pushBack _veh;
	}
else
{
	if 	((_typeB == "Land_Cargo_Patrol_V1_F") or (_typeB == "Land_Cargo_Patrol_V2_F") or (_typeB == "Land_Cargo_Patrol_V3_F")) then
	{
		_typeVehX = if (_sideX == Occupants) then {NATOMG} else {CSATMG};
		_veh = createVehicle [_typeVehX, (_building buildingPos 1), [], 0, "CAN_COLLIDE"];
		_ang = (getDir _building) - 180;
		_pos = [getPosATL _veh, 2.5, _ang] call BIS_Fnc_relPos;
		_veh setPosATL _pos;
		_veh setDir (getDir _building) - 180;
		_unit = _groupX createUnit [_typeUnit, _positionX, [], 0, "NONE"];
		[_unit,_markerX] call A3A_fnc_NATOinit;
		_unit moveInGunner _veh;
		_soldiers pushBack _unit;
		_vehiclesX pushBack _veh;
	}
	else
	{
		if 	((_typeB == "Land_fortified_nest_small_EP1") or (_typeB == "Land_BagBunker_Small_F") or (_typeB == "Land_BagBunker_01_small_green_F") or (_typeB == "Land_fortified_nest_small") or (_typeB == "Fort_Nest")) then
		{
			_typeVehX = if (_sideX == Occupants) then {NATOMG} else {CSATMG};
			_veh = createVehicle [_typeVehX, (_building buildingPos 1), [], 0, "CAN_COLLIDE"];
			_ang = (getDir _building) - 180;
			_pos = [getPosATL _veh, -1, _ang] call BIS_Fnc_relPos;
			_veh setPosATL _pos;
			_veh setDir (getDir _building) - 180;
			_unit = _groupX createUnit [_typeUnit, _positionX, [], 0, "NONE"];
			[_unit,_markerX] call A3A_fnc_NATOinit;
			_unit moveInGunner _veh;
			_soldiers pushBack _unit;
			_vehiclesX pushBack _veh;
		}
		else
		{
			if 	((_typeB == "Land_Hlaska")) then
			{
				_typeVehX = if (_sideX == Occupants) then {NATOMG} else {CSATMG};
				_veh = createVehicle [_typeVehX, (_building buildingPos 1), [], 0, "CAN_COLLIDE"];
				_ang = (getDir _building) - 180;
				_pos = [getPosATL _veh, -1, _ang] call BIS_Fnc_relPos;
				_veh setPosATL _pos;
				_veh setDir (getDir _building) - 180;
							 
			  
																					   
				_unit = _groupX createUnit [_typeUnit, _positionX, [], 0, "NONE"];
				[_unit,_markerX] call A3A_fnc_NATOinit;
				_unit moveInGunner _veh;
				_soldiers pushBack _unit;
				_vehiclesX pushBack _veh;
			}
			else
			{
				if 	(_typeB in listbld) then
				{
					_typeVehX = if (_sideX == Occupants) then {NATOMG} else {CSATMG};
					_veh = createVehicle [_typeVehX, (_building buildingPos 11), [], 0, "CAN_COLLIDE"];
					_unit = _groupX createUnit [_typeUnit, _positionX, [], 0, "NONE"];
					[_unit,_markerX] call A3A_fnc_NATOinit;
					_unit moveInGunner _veh;
					_soldiers pushBack _unit;
					_vehiclesX pushBack _veh;
					sleep 0.5;
					_veh = createVehicle [_typeVehX, (_building buildingPos 13), [], 0, "CAN_COLLIDE"];
					_unit = _groupX createUnit [_typeUnit, _positionX, [], 0, "NONE"];
					[_unit,_markerX] call A3A_fnc_NATOinit;
					_unit moveInGunner _veh;
					_soldiers pushBack _unit;
					_vehiclesX pushBack _veh;
				};
			};
		};
	};
};
};
[_groupX,_vehiclesX,_soldiers]
