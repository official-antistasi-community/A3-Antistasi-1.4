//Mission: Logistics for ammunition
if (!isServer and hasInterface) exitWith{};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_markerX"];

private _groups = [];
private _vehicles = [];
private _difficultX = if (random 10 < tierWar) then {true} else {false};
private _positionX = getMarkerPos _markerX;
private _sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);
private _timeLimit = if (_difficultX) then {30} else {60};

if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};

private _dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
private _dateLimitNum = dateToNumber _dateLimit;
private _dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
private _displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

private _nameDest = [_markerX] call A3A_fnc_localizar;
private _typeVehX = selectRandom (_faction get "vehiclesAmmoTrucks");
private _size = [_markerX] call A3A_fnc_sizeMarker;

private _road = [_positionX] call A3A_fnc_findNearestGoodRoad;
private _pos = position _road;
_pos = _pos findEmptyPosition [1,60,_typeVehX];
if (count _pos == 0) then {
	_pos = position _road;
};

private _taskId = "LOG" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[format ["We've spotted an Ammotruck in an %1. Go there and destroy or steal it before %2.",_nameDest,_displayTime],"Steal or Destroy Ammotruck",_markerX],_pos,false,0,true,"rearm",true] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

private _truckCreated = false;
waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or ((spawner getVariable _markerX != 2) and !(sidesX getVariable [_markerX,sideUnknown] == teamPlayer))};
private _bonus = if (_difficultX) then {2} else {1};
if ((spawner getVariable _markerX != 2) and !(sidesX getVariable [_markerX,sideUnknown] == teamPlayer)) then {
	//sleep 10;

	private _truckX = _typeVehX createVehicle _pos;
	_truckX setDir (getDir _road);
	_truckCreated = true;
	[_truckX] spawn A3A_fnc_fillLootCrate;
	[_truckX, _sideX] call A3A_fnc_AIVEHinit;
	_vehicles pushBack _truckX;

	private _mrk = createMarkerLocal [format ["%1patrolarea", floor random 100], _pos];
	_mrk setMarkerShapeLocal "RECTANGLE";
	_mrk setMarkerSizeLocal [20,20];
	_mrk setMarkerTypeLocal "hd_warning";
	_mrk setMarkerColorLocal "ColorRed";
	_mrk setMarkerBrushLocal "DiagGrid";

	if (!debug) then {
		_mrk setMarkerAlphaLocal 0;
	};

	private _typeGroup = if (_difficultX) then {selectRandom (_faction get "groupsSquads")} else {_faction get "groupSentry"};

	private _groupX = [_pos, _sideX, _typeGroup] call A3A_fnc_spawnGroup;

	_groups pushBack _groupX;

	sleep 1;

	if (random 10 < 33) then {
		private _dog = [_groupX, "Fin_random_F", _positionX, [], 0, "FORM"] call A3A_fnc_createUnit;
		[_dog] spawn A3A_fnc_guardDog;
	};

	[_groupX, "Patrol_Area", 25, 50, 100, false, [], false] call A3A_fnc_patrolLoop;

	//todo Hazey to replace this function
	diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_LOG_Ammo#1"];

	private _groupX1 = [_pos, _sideX, _typeGroup] call A3A_fnc_spawnGroup;

	_groups pushBack _groupX1;
	sleep 1;

	[_groupX1, "Patrol_Area", 25, 50, 100, false, [], false] call A3A_fnc_patrolLoop;

	//todo Hazey to replace this function
	diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_LOG_Ammo#2"];

	{[_x, ""] call A3A_fnc_NATOinit} forEach units _groupX;
	{[_x, ""] call A3A_fnc_NATOinit} forEach units _groupX1;

	private _fnc_truckReturnedToBase = {
		//DistanceSqr is faster, and we're hard coding it anyway.
		(_truckX distanceSqr posHQ) < 10000;
	};

	_truckX setVariable ["ammoTruckLocation", _nameDest];
	_truckX addEventHandler ["GetIn", {
		params ["_vehicle", "_role", "_unit", "_turret"];

		private _owningSide = (_vehicle getVariable "originalSide");

		if (_unit getVariable ["spawner",false]) then {
			["TaskFailed", ["", format ["Ammotruck Stolen in an %1",(_vehicle getVariable ["ammoTruckLocation", ""])]]] remoteExec ["BIS_fnc_showNotification",_owningSide];
		};

		_truckX removeEventHandler ["GetIn", _thisEventHandler];
	}];

	waitUntil {sleep 3; (not alive _truckX) or (dateToNumber date > _dateLimitNum) or (call _fnc_truckReturnedToBase)};

	if (dateToNumber date > _dateLimitNum) then {
		[_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
		[-1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	};

	if ((not alive _truckX) or (call _fnc_truckReturnedToBase)) then {
			[_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;
			[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
			[1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
			{
				if (_x distance _truckX < 500) then {
					[10*_bonus,_x] call A3A_fnc_playerScoreAdd
				};
			} forEach (allPlayers - (entities "HeadlessClient_F"));
			[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
		};
} else {
	[_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
	[-1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
};

[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;

if (_truckCreated) then {
	// TODO: Head off to nearby base
	{
		[_x] spawn A3A_fnc_groupDespawner 
	} forEach _groups;

	// TODO: delete truck contents maybe?
	{
		[_x] spawn A3A_fnc_vehDespawner 
	} forEach _vehicles;
};
