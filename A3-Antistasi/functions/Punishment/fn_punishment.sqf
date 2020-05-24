Params ["_instigator","_timeAdded","_offenceAdded",["_victim",objNull]];
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

	[cursorObject, 0, 0] call A3A_fnc_punishment;      // Ping
	[cursorObject,120, 1] call A3A_fnc_punishment;     // Punish, 120 seconds
	[player,120, 1] call A3A_fnc_punishment;           // Punish, 120 seconds
	[cursorObject] call A3A_fnc_punishment_release;    // Forgive all sins

*/
//////////////////Settings//////////////////
_depreciationCoef = 0.75;	// Modifies the drop-off curve of the punishment score; a higher number drops off quicker, a lower number lingers longer.
_overheadPercent = 0.3;		// Percentage of _offenceAdded that does not get depreciated.
/////////////////Definitions////////////////
//////////Fetches punishment values/////////
_playerStats = format["Player: %1 [%2], _timeTotal: %3, _offenceTotal: %4, _offenceOverhead: %5, _timeAdded: %6, _offenceAdded: %7", name _instigator, getPlayerUID _instigator, str _timeTotal, str _offenceTotal, str 0, str _timeAdded, str _offenceAdded];
_punishment_vars = _instigator getVariable ["punishment_vars", [0,0,[0,0],[scriptNull,scriptNull]]];	// [timeTotal,offenceTotal,[lastOffenceServerTime,overhead],[wardenHandle,sentenceHandle]]
_timeTotal = _punishment_vars select 0;
_offenceTotal = _punishment_vars select 1;
_lastTime = (_punishment_vars select 2) select 0;
_overhead = (_punishment_vars select 2) select 1;
///////////////Data validation//////////////
if (_lastTime <= 0) then    {_lastTime = serverTime;};
if (_offenceAdded < 0) then {_offenceAdded = 0};
if (_offenceTotal < 0) then {_offenceTotal = 0};
if (_timeAdded < 0) then    {_timeAdded = 0};
if (_timeTotal < 0) then    {_timeTotal = 0};
///////////////Hourly falloff///////////////
_periodDelta = serverTime - _lastTime;
if  (_periodDelta > 60*60) then	{
	_offenceTotal = 0;
	_timeTotal = 0;
	_overhead = 0;
};
//////////////FF score addition/////////////
_overhead = _overhead + _offenceAdded * _overheadPercent;
_offenceTotal = _offenceTotal + _offenceAdded;
_offenceTotal = _offenceTotal * (1-_depreciationCoef*(1-(_offenceTotal))) ^(_periodDelta/300); // Depreciation formula
_grandOffence = _offenceTotal + _overhead;
_timeTotal = _timeTotal + _timeAdded;
_timeTotal = _timeTotal * (1-_depreciationCoef*(1-(_timeTotal))) ^(_periodDelta/300);       // Depreciation formula
_lastOffenceData = [serverTime,_overhead];
//////////Saves data to instigator//////////
_punishment_vars set [0,_timeTotal];
_punishment_vars set [1,_offenceTotal];
_punishment_vars set [2,_lastOffenceData];
_instigator setVariable ["punishment_vars", _punishment_vars, true];
/////////Where punishment is issued/////////
if (isPlayer _victim) then {["FF Notification", format["%1 hurt you!",name _instigator]] remoteExec ["A3A_fnc_customHint", _victim, false];};
if (_grandOffence < 1) exitWith {
	["FF Warning", "Watch your fire!"] remoteExec ["A3A_fnc_customHint", _instigator, false];
	[format ["%1: [Antistasi] | INFO | PUNISHMENT | WARNING | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
	"WARNED"
};
[format ["%1: [Antistasi] | INFO | PUNISHMENT | GUILTY | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
[_instigator,_timeTotal] call A3A_fnc_punishment_warden;
"FOUND GUILTY";
