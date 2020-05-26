params ["_instigator","_timeAdded","_offenceAdded",["_victim",objNull]];
// EG: [_instigator, 20, 0.34, _victim] call A3A_fnc_punishment;
/*
[Required]
	_instigator expects player object
	_timeX expects time out (Added to player's total)
	_offenceLevel expects percentage between 0 and 1 how server it is severe it is
[OPTIONAL]
	_victim expects player object
*/
/*
	Some Debug Console Interactions:

	[cursorObject, 0, 0] call A3A_fnc_punishment;             // Ping
	[cursorObject,120, 1] call A3A_fnc_punishment;            // Punish, 120 seconds
	[player,10, 1] call A3A_fnc_punishment;                   // Test Punish, 10 seconds
	[cursorObject,"forgive"] call A3A_fnc_punishment_release; // Forgive all sins

*/
//////////////////Settings//////////////////
private _depreciationCoef = 0.75;	// Modifies the drop-off curve of the punishment score; a higher number drops off quicker, a lower number lingers longer.
private _overheadPercent = 0.3;		// Percentage of _offenceAdded that does not get depreciated.

//////////Fetches punishment values/////////
private _keyPairs = [["timeTotal",0],["offenceTotal",0],["lastOffenceTime",0],["overhead",0]];
private _UID = getPlayerUID _instigator;
private _data_instigator = [_UID,_keyPairs] call A3A_fnc_punishment_dataGet;
_data_instigator params ["_timeTotal","_offenceTotal","_lastTime","_overhead"];

///////////////Data validation//////////////
if (_lastTime <= 0) then    {_lastTime = serverTime;};
if (_overhead < 0) then {_overhead = 0};
if (_offenceAdded < 0) then {_offenceAdded = 0};
if (_offenceTotal < 0) then {_offenceTotal = 0};
if (_timeAdded < 0) then    {_timeAdded = 0};
if (_timeTotal < 0) then    {_timeTotal = 0};

//////////////FF score addition/////////////
private _periodDelta = serverTime - _lastTime;
_overhead = _overhead + _offenceAdded * _overheadPercent;
_offenceTotal = _offenceTotal + _offenceAdded;
_offenceTotal = _offenceTotal * (1-_depreciationCoef*(1-(_offenceTotal))) ^(_periodDelta/300); // Depreciation formula
private _grandOffence = _offenceTotal + _overhead;
_timeTotal = _timeTotal + _timeAdded;
_timeTotal = _timeTotal * (1-_depreciationCoef*(1-(_timeTotal))) ^(_periodDelta/300);       // Depreciation formula
private _sentenceEndTime = serverTime + _timeTotal;

//////////Saves data to instigator//////////
private _keyPairs = [["timeTotal",_timeTotal],["offenceTotal",_offenceTotal],["lastOffenceTime",serverTime],["overhead",_overhead],["_sentenceEndTime",_sentenceEndTime]];
[_UID,_keyPairs] call A3A_fnc_punishment_dataSet;

/////////Where punishment is issued/////////
private _playerStats = format["Player: %1 [%2], _timeTotal: %3, _offenceTotal: %4, _offenceOverhead: %5, _timeAdded: %6, _offenceAdded: %7", name _instigator, _UID, str _timeTotal, str _offenceTotal, str 0, str _timeAdded, str _offenceAdded];
if (isPlayer _victim) then {["FF Notification", format["%1 hurt you!",name _instigator]] remoteExec ["A3A_fnc_customHint", _victim, false];};
if (_grandOffence < 1) exitWith {
	["FF Warning", "Watch your fire!"] remoteExec ["A3A_fnc_customHint", _instigator, false];
	[format ["%1: [Antistasi] | INFO | PUNISHMENT | WARNING | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
	"WARNED"
};
[format ["%1: [Antistasi] | INFO | PUNISHMENT | GUILTY | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
[_instigator,_sentenceEndTime] remoteExec ["A3A_fnc_punishment_warden",_instigator,false];
"FOUND GUILTY";
