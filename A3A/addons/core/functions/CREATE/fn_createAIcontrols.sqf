#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

private _positionX = getMarkerPos _markerX;
private _sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);
private _vehiclesX = [];
private _soldiers = [];
private _groups = [];
private _dogs = [];
private _pilots = [];
private _roads = [];
private _conquered = false;
private _groupX = grpNull;
private _isFIA = false;
private _leave = false;
private _dirVeh = 0;
private _isControl = if (isOnRoad _positionX) then {true} else {false};

ServerInfo_1("Spawning Control Point %1", _markerX);

if ((_sideX == teamPlayer) or (_sideX == sideUnknown)) exitWith {};

if ({if ((sidesX getVariable [_x,sideUnknown] != _sideX) and (_positionX inArea _x)) exitWith {1}} count markersX >1) exitWith {};

if (_isControl) then {
	if (gameMode != 4) then {
		if (_sideX == Occupants) then {
			if ((random 10 > (tierWar + difficultyCoef)) and (!([_markerX] call A3A_fnc_isFrontline))) then {
				_isFIA = true;
			};
		};
	} else {
		if (_sideX == Invaders) then {
			if ((random 10 > (tierWar + difficultyCoef)) and (!([_markerX] call A3A_fnc_isFrontline))) then {
				_isFIA = true;
			};
		};
	};

	// Attempt to find nearby road with two connected roads
	private _radiusX = 20;
	while {_radiusX < 100} do {
		_roads = _positionX nearRoads _radiusX;
		_roads = _roads select { count (roadsConnectedTo _x) == 2 };
		if (count _roads > 0) exitWith {};
		_radiusX = _radiusX + 10;
	};

	if (_radiusX >= 100) then {
		// fallback case, shouldn't happen unless the map is very broken
        Error_2("Roadblock error for %1 at %2", _markerX, _positionX);
		_roads = _positionX nearRoads 20;		// guaranteed due to isOnRoad check
		_dirveh = random 360;
	} else {
		private _roadscon = roadsConnectedto (_roads select 0);
		_dirveh = [_roads select 0, _roadscon select 0] call BIS_fnc_DirTo;
	};

	if (!_isFIA) then {
		private _groupE = grpNull;
		if !(A3A_hasIFA) then {
			private _pos = [getPos (_roads select 0), 7, _dirveh + 270] call BIS_Fnc_relPos;
			private _bunker = "Land_BagBunker_01_Small_green_F" createVehicle _pos;
			_vehiclesX pushBack _bunker;
			_bunker setDir _dirveh;
			_pos = getPosATL _bunker;

			private _typeVehX = selectRandom (_faction get "staticMGs");
			private _veh = _typeVehX createVehicle _positionX;
			_vehiclesX pushBack _veh;
			_veh setPosATL _pos;
			_veh setDir _dirVeh;

			_groupE = createGroup _sideX;
			private _typeUnit = _faction get "unitStaticCrew";
			private _unit = [_groupE, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
			_unit moveInGunner _veh;
			_soldiers pushBack _unit;

			sleep 1;

			_pos = [getPos (_roads select 0), 7, _dirveh + 90] call BIS_Fnc_relPos;
			_bunker = "Land_BagBunker_01_Small_green_F" createVehicle _pos;
			_vehiclesX pushBack _bunker;
			_bunker setDir _dirveh + 180;
			_pos = getPosATL _bunker;
			_pos = [getPos _bunker, 6, getDir _bunker] call BIS_fnc_relPos;
			_typeVehX = _faction get "flag";
			_veh = createVehicle [_typeVehX, _pos, [],0, "NONE"];
			_vehiclesX pushBack _veh;
			if (flagTexture _veh != (_faction get "flagTexture")) then {[_veh,(_faction get "flagTexture")] remoteExec ["setFlagTexture",_veh]};
			_veh setPosATL _pos;
			_veh setDir _dirVeh;

			sleep 1;

			_unit = [_groupE, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
			_unit moveInGunner _veh;
			_soldiers pushBack _unit;

			sleep 1;

			// Disable VCOM on Unit as we don't want it wandering off.
			_groupE setVariable ["Vcm_Disable", true];
			_groups pushBack _groupE;
			{ [_x, _sideX] call A3A_fnc_AIVEHinit } forEach _vehiclesX;
		};

        private _typeGroup = selectRandom (_faction get "groupsMedium");
		_groupX = [_positionX,_sideX, _typeGroup, true] call A3A_fnc_spawnGroup;

		if !(isNull _groupX) then {

			if !(A3A_hasIFA) then {
				{[_x] join _groupX} forEach units _groupE;
				deleteGroup _groupE;
			};

			if (random 10 < 2.5) then {
				private _dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
				_dogs pushBack _dog;
				[_dog,_groupX] spawn A3A_fnc_guardDog;
			};

			// GIVE UNIT PATCOM CONTROL
			_groupX setVariable ["PATCOM_Controlled", false];
			A3A_Patrol_Controlled_AI pushBack _groupX;
			_groups pushBack _groupX;
			diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_createAIcontrols#1"];

			// Forced non-spawner as they're very static.
			{[_x,"",false] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
		};
	} else {
		private _typeVehX = selectRandom (_faction get (if !(A3A_hasIFA) then {"vehiclesMilitiaLightArmed"} else {"vehiclesMilitiaCars"}));
		private _veh = _typeVehX createVehicle getPos (_roads select 0);
		_veh setDir _dirveh + 90;
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		_vehiclesX pushBack _veh;
		sleep 1;
		private _typeGroup = selectRandom (_faction get "groupsMilitiaMedium");
		_groupX = [_positionX, _sideX, _typeGroup, true] call A3A_fnc_spawnGroup;
		
		if !(isNull _groupX) then {
			_unit = [_groupX, _faction get "unitMilitiaGrunt", _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
			_unit moveInGunner _veh;
			diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_createAIcontrols#extra1 %1", _groupX];

			// Disable VCOM on Unit as we don't want it wandering off.
			_groupX setVariable ["Vcm_Disable", true];
			_groups pushBack _groupX;
			{_soldiers pushBack _x; [_x,"", false] call A3A_fnc_NATOinit} forEach units _groupX;
		};
	};
} else {
	private _markersX = markersX select {(getMarkerPos _x distance _positionX < distanceSPWN) and (sidesX getVariable [_x,sideUnknown] == teamPlayer)};
	_markersX = _markersX - ["Synd_HQ"] - outpostsFIA;
	private _frontierX = if (count _markersX > 0) then {true} else {false};
	if (_frontierX) then {
		private _cfg = _faction get "groupSpecOps";
		if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {
			_sideX = Occupants;
		};

		private _size = [_markerX] call A3A_fnc_sizeMarker;

		if ({if (_x inArea _markerX) exitWith {1}} count allMines == 0) then {
			Debug_1("Creating a Minefield at %1", _markerX);
				private _mines = (_faction get "minefieldAPERS");
				for "_i" from 1 to 45 do {
					private _mineX = createMine [ selectRandom _mines ,_positionX,[],_size];
					_sideX revealMine _mineX;
				};
		};

		_groupX = [_positionX,_sideX, _cfg] call A3A_fnc_spawnGroup;

		// GIVE UNIT PATCOM CONTROL
		_groupX setVariable ["PATCOM_Controlled", false];
		A3A_Patrol_Controlled_AI pushBack _groupX;
		_groups pushBack _groupX;
		diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_createAIcontrols#2"];

		private _typeVehX = selectRandom (_faction get "uavsPortable");
		if !(isNil "_typeVehX") then {
			sleep 1;
			{_soldiers pushBack _x} forEach units _groupX;
			private _uav = createVehicle [_typeVehX, _positionX, [], 0, "FLY"];
			[_sideX, _uav] call A3A_fnc_createVehicleCrew;
			_vehiclesX pushBack _uav;
			private _groupUAV = group (crew _uav select 1);
			{[_x] joinSilent _groupX; _pilots pushBack _x} forEach units _groupUAV;
			deleteGroup _groupUAV;
		};
		{[_x,""] call A3A_fnc_NATOinit} forEach units _groupX;
	} else {
		_leave = true;
	};
};

if (_leave) exitWith {};

{ _x setVariable ["originalPos", getPos _x] } forEach _vehiclesX;

private _spawnStatus = 0;
while {(spawner getVariable _markerX != 2) and ({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers > 0)} do {
	if ((spawner getVariable _markerX == 1) and (_spawnStatus != spawner getVariable _markerX)) then {
		_spawnStatus = 1;
		if (isMultiplayer) then {
			{if (vehicle _x == _x) then {[_x,false] remoteExec ["enableSimulationGlobal",2]}} forEach _soldiers
		} else {
			{if (vehicle _x == _x) then {_x enableSimulationGlobal false}} forEach _soldiers
		};
	} else {
		if ((spawner getVariable _markerX == 0) and (_spawnStatus != spawner getVariable _markerX)) then {
			_spawnStatus = 0;
			if (isMultiplayer) then {
				{if (vehicle _x == _x) then {[_x,true] remoteExec ["enableSimulationGlobal",2]}} forEach _soldiers
			} else {
				{if (vehicle _x == _x) then {_x enableSimulationGlobal true}} forEach _soldiers
			};
		};
	};
	sleep 3;
};

waitUntil {sleep 1;((spawner getVariable _markerX == 2))  or ({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers == 0)};

_conquered = false;
private _winner = Occupants;
if (spawner getVariable _markerX != 2) then {
	_conquered = true;
	private _allUnits = allUnits select {(side _x != civilian) and (side _x != _sideX) and (alive _x) and (!captive _x)};
	private _closest = [_allUnits,_positionX] call BIS_fnc_nearestPosition;
	_winner = side _closest;
	private _loser = Occupants;

    Debug_3("Control %1 captured by %2. Is Roadblock: %3", _markerX, _winner, _isControl);

	if (_isControl) then {
		["TaskSucceeded", ["", "Roadblock Destroyed"]] remoteExec ["BIS_fnc_showNotification",_winner];
		["TaskFailed", ["", "Roadblock Lost"]] remoteExec ["BIS_fnc_showNotification",_sideX];
	};

	if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {
		if (_winner == Invaders) then {
			[-5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
			sidesX setVariable [_markerX,Invaders,true];
		} else {
			sidesX setVariable [_markerX,teamPlayer,true];
		};
	} else {
		_loser = Invaders;
		if (_winner == Occupants) then {
			sidesX setVariable [_markerX,Occupants,true];
			[5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		} else {
			sidesX setVariable [_markerX,teamPlayer,true];
			[0,5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		};
	};
};

waitUntil {sleep 1;(spawner getVariable _markerX == 2)};


{ if (alive _x) then { deleteVehicle _x } } forEach (_soldiers + _pilots);
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


if (_conquered) then {
	private _indexX = controlsX find _markerX;
	if (_indexX > defaultControlIndex) then {
		private _timeLimit = 120;
		private _dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
		private _dateLimitNum = dateToNumber _dateLimit;
		waitUntil {sleep 60;(dateToNumber date > _dateLimitNum)};
		private _base = [(markersX - controlsX),_positionX] call BIS_fnc_nearestPosition;
		if (sidesX getVariable [_base,sideUnknown] == Occupants) then {
			sidesX setVariable [_markerX,Occupants,true];
		} else {
			if (sidesX getVariable [_base,sideUnknown] == Invaders) then {
				sidesX setVariable [_markerX,Invaders,true];
			};
		};
	};
};