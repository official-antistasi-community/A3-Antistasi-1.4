#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
//Mission: Assassinate an official
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

private _difficultX = if (random 10 < tierWar) then {true} else {false};
private _sideX = if (sidesX getVariable [_markerX, sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);
private _positionX = getMarkerPos _markerX;

private _timeLimit = if (_difficultX) then {15} else {30};//120

if (A3A_hasIFA) then {
	_timeLimit = _timeLimit * 2;
};

private _dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
private _dateLimitNum = dateToNumber _dateLimit;
private _nameDest = [_markerX] call A3A_fnc_localizar;
private _naming = if (_sideX == Occupants) then {"NATO"} else {"CSAT"};
private _taskString = format ["A %1 officer is inspecting %2. Go there and kill him before %3:%4.", _naming, _nameDest, numberToDate [2035, _dateLimitNum] select 3, numberToDate [2035, _dateLimitNum] select 4];

private _taskId = "AS" + str A3A_taskCount;
[[teamPlayer, civilian], _taskId, [_taskString, "Kill the Officer", _markerX], _positionX, false, 0, true, "Kill", true] call BIS_fnc_taskCreate;
[_taskId, "AS", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

private _grp = createGroup _sideX;
private _typeX = _faction get "unitOfficial";
private _official = [_grp, _typeX, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
_typeX = _faction get "unitBodyguard";

private _pilot = [_grp, _typeX, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
if (_difficultX) then {
	for "_i" from 1 to 4 do {
		_pilot = [_grp, _typeX, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
	};
};

_grp selectLeader _official;
sleep 1;

//todo Hazey to replace this function
[_grp, "Patrol_Area", 25, 50, 100, false, [], true] call A3A_fnc_patrolSetParams;
_grp setVariable ["PATCOM_Controlled", false];
A3A_Patrol_Controlled_AI pushBack _grp;
diag_log text format["Hazey Debug--- CALL ATTEMPT: UPSMON FROM: fn_AS_Official#1"];

{_nul = [_x,""] call A3A_fnc_NATOinit; _x allowFleeing 0} forEach units _grp;

waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or (not alive _official)};

if (not alive _official) then {
	[_taskId, "AS", "SUCCEEDED"] call A3A_fnc_taskSetState;
	if (_difficultX) then {
		[0,600] remoteExec ["A3A_fnc_resourcesFIA",2];
		[2400, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		{if (isPlayer _x) then {[20,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_positionX,teamPlayer] call A3A_fnc_distanceUnits);
		[10,theBoss] call A3A_fnc_playerScoreAdd;
		[_markerX,60] call A3A_fnc_addTimeForIdle;
	} else {
		[0,300] remoteExec ["A3A_fnc_resourcesFIA",2];
		[1800, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		{if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_positionX,teamPlayer] call A3A_fnc_distanceUnits);
		[5,theBoss] call A3A_fnc_playerScoreAdd;
		[_markerX,30] call A3A_fnc_addTimeForIdle;
	};
} else {
		[_taskId, "AS", "FAILED"] call A3A_fnc_taskSetState;
	if (_difficultX) then {
		[-1200, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-20,theBoss] call A3A_fnc_playerScoreAdd;
		[_markerX,-60] call A3A_fnc_addTimeForIdle;
	} else {
		[-600, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_playerScoreAdd;
		[_markerX,-30] call A3A_fnc_addTimeForIdle;
	};
};

{deleteVehicle _x} forEach units _grp;
deleteGroup _grp;

[_taskId, "AS", 1200] spawn A3A_fnc_taskDelete;
