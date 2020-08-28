/*
Function:
	A3A_fnc_punishment

Description:
	Punishes the player given for FF.
	Doesn't do the checking itself, refer to A3A_fnc_punishment_FF.

Scope:
	<ANY>

Environment:
	<UNSCHEDULED>

Parameters:
	<OBJECT> Player that is being verified for FF.
	<NUMBER> The amount of time to add to the players total sentence time.
	<NUMBER> Raise the player's total offence level by this percentage. (100% total = Ocean Gulag).
	<OBJECT> [OPTIONAL] The victim of the player's FF.

Returns:
	<STRING> Either an exemption type or a return from fn_punishment.sqf.

Examples:
	[_instigator,_timeAdded,_offenceAdded,_victim] remoteExec ["A3A_fnc_punishment",2,false]; // How it should be called from another A3A_fnc_punishment_FF.
	// Unit Tests:
	[cursorObject, 0, 0] remoteExec ["A3A_fnc_punishment",2];                                 // Ping with FF Warning
	[cursorObject,120, 1] remoteExec ["A3A_fnc_punishment",2];                                // Punish, 120 additional seconds
	[player,10, 1] remoteExec ["A3A_fnc_punishment",2];                                       // Test Self Punish, 10 additional seconds
	// Function that goes hand-in-hand
	[cursorObject,"forgive"] remoteExec [A3A_fnc_punishment_release,2]; // Forgive all sins

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_instigator","_timeAdded","_offenceAdded",["_victim",objNull],["_customMessage",""]];
private _filename = "fn_punishment.sqf";

if (!isServer) exitWith {
	[1, "NOT SERVER", _filename] call A3A_fnc_log;
	"NOT SERVER";
};

//////////////////Settings//////////////////
private _depreciationCoef = 0.75;	// Modifies the drop-off curve of the punishment score; a higher number drops off quicker, a lower number lingers longer.
private _overheadPercent = 0.3;		// Percentage of _offenceAdded that does not get depreciated.

////////Exit Remote Control (if any)////////
private _UID = getPlayerUID _instigator; // Player still occupies this object.
private _name = name _instigator;
private _instigatorHuman = _instigator getVariable ["owner",_instigator]; // Refer to controlunit.sqf for source of this *function*
if (_instigator != _instigatorHuman) then {
    (units group _instigatorHuman) joinSilent group _instigatorHuman;
    group _instigator selectLeader _instigatorHuman;
    ["Control Unit", "Returned to original Unit due to FF"] remoteExec ["A3A_fnc_customHint",_instigator,false];
    [_instigatorHuman] remoteExec ["selectPlayer",_instigator,false];
};

//////////Fetches punishment values/////////
private _currentTime = (floor serverTime);
private _keyPairs = [["timeTotal",0],["offenceTotal",0],["lastOffenceTime",_currentTime],["overhead",0]];
private _data_instigator = [_UID,_keyPairs] call A3A_fnc_punishment_dataGet;
_data_instigator params ["_timeTotal","_offenceTotal","_lastTime","_overhead"];

///////////////Data validation//////////////
_lastTime = (0 max _lastTime) min _currentTime;
_overhead = (0 max _overhead) min 1;
_offenceAdded = 0 max _offenceAdded;
_offenceTotal = (0 max _offenceTotal) min 2;
_timeAdded = 0 max _timeAdded;
_timeTotal = 0 max _timeTotal;

//////////////FF score addition/////////////
private _periodDelta = _currentTime - _lastTime;
_offenceTotal = _offenceTotal - _overhead;
_overhead = (_overhead + _offenceAdded * _overheadPercent) min 1;

_offenceTotal = _offenceTotal * (1-_depreciationCoef*(1-(_offenceTotal))) ^(_periodDelta/300); // Depreciation formula, slow curve -> exponential drop -> slow curve ‾‾\__

_offenceTotal = (_offenceTotal + _offenceAdded * (1-_overheadPercent)) min 1;                  // Added is subtracted so that it does not add the new offence plus extra.
_offenceTotal = (_offenceTotal + _overhead) min 2;

_timeTotal = _timeTotal * (1-_depreciationCoef) ^(_periodDelta/3000);                          // Simpler depreciation formula
_timeTotal = _timeTotal + _timeAdded;

//////////Saves data to instigator//////////
private _keyPairs = [["timeTotal",_timeTotal],["offenceTotal",_offenceTotal],["lastOffenceTime",_currentTime],["overhead",_overhead],["name",_name]];
[_UID,_keyPairs] call A3A_fnc_punishment_dataSet;

/////////Where punishment is issued/////////
private _victimStats = ["",format [" damaged %1 ", name _victim]] select (_victim isKindOf "Man");
_victimStats = _victimStats + (["[AI]",format ["[%1]", getPlayerUID _victim]] select (isPlayer _victim));
private _playerStats = format["Total-time: %1 (incl. +%2), Offence+Overhead: %3 [%4+%5] (incl. +%6)", str _timeTotal, str _timeAdded, str _offenceTotal, str (_offenceTotal-_overhead), str _overhead, str _offenceAdded];

private _logProsecution = {
    params [ ["_actionTaken", "" ,[""]] ];
    private _playerInfo = format["%1 [%2]%3, %4", name _instigator, getPlayerUID _instigator, _victimStats, _playerStats];
    [2, format ["%1 | %2", _actionTaken, _playerInfo], _filename] remoteExecCall ["A3A_fnc_log",2,false];
    _actionTaken;
};

if (_offenceTotal < 1) exitWith {
    private _message = format ["Watch your fire!%1%2","<br/>",_customMessage];
	private _comradeStats = ["<br/>",format ["<br/>Injured comrade: %1<br/>",name _victim]] select (_victim isKindOf "Man");
	["FF Warning", _message + _comradeStats] remoteExec ["A3A_fnc_customHint", _instigator, false]; // This may or may not work for remoteControlled units depending on deSync.
	["WARNING"] call _logProsecution;
};

if (isPlayer _victim) then {["FF Notification", format["%1 hurt you!",name _instigator]] remoteExec ["A3A_fnc_customHint", _victim, false];};

["GUILTY"] call _logProsecution;
[_UID,_timeTotal] spawn { // SteamingHotFixPatch Ghetto has just reached a new level to combat remoteControlling AI
	params ["_UID","_timeTotal"];
	private _instigator = objNull;
	private _instigatorHuman = objNull;
	waitUntil {
		_instigator = [_UID] call BIS_fnc_getUnitByUid;
		_instigatorHuman = _instigator getVariable ["owner",_instigator];
		if (_instigator isEqualTo _instigatorHuman) exitWith {true;};
		uiSleep 0.1;
		false;
	};
	[_UID,_timeTotal] call A3A_fnc_punishment_sentence_server; // Scope is within scheduled space.
};
"FOUND GUILTY";
