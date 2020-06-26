/*
Function:
	A3A_fnc_punishment

Description:
	Punishes the player given for FF.
	Doesn't do the checking itself, refer to A3A_fnc_punishment_FF.

Scope:
	<ANY>

Environment:
	<ANY>

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
Date Updated: 29 May 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_instigator","_timeAdded","_offenceAdded",["_victim",objNull]];
private _filename = "fn_punishment.sqf";

if (!isServer) exitWith {
	[[1, "NOT SERVER"], _filename] call A3A_fnc_log;
	"NOT SERVER";
};

//////////////////Settings//////////////////
private _depreciationCoef = 0.75;	// Modifies the drop-off curve of the punishment score; a higher number drops off quicker, a lower number lingers longer.
private _overheadPercent = 0.3;		// Percentage of _offenceAdded that does not get depreciated.

//////////Fetches punishment values/////////
private _keyPairs = [["timeTotal",0],["offenceTotal",0],["lastOffenceTime",0],["overhead",0]];
private _UID = getPlayerUID _instigator;
private _data_instigator = [_UID,_keyPairs] call A3A_fnc_punishment_dataGet;
_data_instigator params ["_timeTotal","_offenceTotal","_lastTime","_overhead"];
private _currentTime = (floor serverTime);

///////////////Data validation//////////////
_lastTime = (_lastTime max 1) min _currentTime;
_overhead = _overhead max 0;
_offenceAdded = _offenceAdded max 0;
_offenceTotal = _offenceTotal max 0;
_timeAdded = _timeAdded max 0;
_timeTotal = _timeTotal max 0;

//////////////FF score addition/////////////
private _periodDelta = _currentTime - _lastTime;
_overhead = _overhead + _offenceAdded * _overheadPercent;
_offenceTotal = _offenceTotal * (1-_depreciationCoef*(1-(_offenceTotal))) ^(_periodDelta/300); // Depreciation formula
_offenceTotal = _offenceTotal + _offenceAdded;
private _grandOffence = _offenceTotal + _overhead;
_timeTotal = _timeTotal * (1-_depreciationCoef) ^(_periodDelta/300);       // Depreciation formula
_timeTotal = _timeTotal + _timeAdded;

//////////Saves data to instigator//////////
private _keyPairs = [["timeTotal",_timeTotal],["offenceTotal",_offenceTotal],["lastOffenceTime",_currentTime],["overhead",_overhead]];
[_UID,_keyPairs] call A3A_fnc_punishment_dataSet;

/////////Where punishment is issued/////////
private _playerStats = format["Player: %1 [%2], _timeTotal: %3, _offenceTotal: %4, _offenceOverhead: %5, _timeAdded: %6, _offenceAdded: %7", name _instigator, _UID, str _timeTotal, str _offenceTotal, str 0, str _timeAdded, str _offenceAdded];
if (isPlayer _victim) then {["FF Notification", format["%1 hurt you!",name _instigator]] remoteExec ["A3A_fnc_customHint", _victim, false];};
if (_grandOffence < 1) exitWith {
	["FF Warning", "Watch your fire!"] remoteExec ["A3A_fnc_customHint", _instigator, false];
	[2, format ["WARNING | %1", _playerStats], _filename] call A3A_fnc_log;
	"WARNED"
};
[2, format ["GUILTY | %1", _playerStats], _filename] call A3A_fnc_log;
[getPlayerUID _instigator,_timeTotal] remoteExec ["A3A_fnc_punishment_sentence_server",2,false];
"FOUND GUILTY";
