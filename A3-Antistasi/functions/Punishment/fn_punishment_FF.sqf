Params ["_instigator","_timeAdded","_offenceAdded",["_victim",objNull]];
//MUST be executed on foolish for 'BIS_fnc_admin' and 'isServer' to work.
// EG: [_instigator, 20, 0.34, _victim] remoteExec ["A3A_fnc_punishment_FF",_instigator];
/*
	Checks if incident reported is indeed a rebel Friendly Fire event.
	Refer to A3A_fnc_punishment for actual punishment logic.
*/
/*
[Required]
	_instigator expects player object
	_timeX expects time out
	_offenceLevel expects percentage between 0 and 1 how server it is severe it is
[OPTIONAL]
	_victim expects player object
*/
/*
	[cursorObject, 0, 0] remoteExec ["A3A_fnc_punishment_FF",cursorObject];					// Test with no victim
	[cursorObject, 0, 0 player] remoteExec ["A3A_fnc_punishment_FF",cursorObject];			// Test with victim
*/
/////////////////Definitions////////////////
_hurtYou = {
	if (isPlayer _victim) then {["TK Notification", format["%1 hurt you!",name _instigator]] remoteExec ["A3A_fnc_customHint", _victim, false];};
};
_warn = {
	Params ["_message"];
	["TK Notification", _message] remoteExec ["A3A_fnc_customHint", _instigator, false];
};
_gotoExemption = {
	Params ["_exemptionDetails"];
	_playerStats = format["Player: %1 [%2], _timeAdded: %3, _offenceAdded: %4", name player, getPlayerUID player,str _timeAdded, str _offenceAdded];
	[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, %2 | %3", servertime, _exemptionDetails, _playerStats]] remoteExec ["diag_log", 2];
	_exemptionDetails;
};
_vehicle = typeOf vehicle _instigator;
/////////////Checks if is TK/FF/////////////
_exemption = "";
_exemption = switch (true) do {
	case !tkPunish:								{"tkPunish is Disabled"};
	case isDedicated || isServer:				{"Is a Server"};
	case !isMultiplayer:						{"Is not Multiplayer"};
	case _instigator != player:					{"Not Instigator"};		// Must be local for 'BIS_fnc_admin' and 'isServer'
	case !_instigator in [Invaders, Occupants]:	{"Not Rebel"};
	case _victim == _instigator:				{"SUICIDE"};
	case !isNull _victim && !alive _victim:		{"CORPSE"};				//Ace check is further on
	default 									{""};
};
//////Cool down prevents multi-hit spam/////
	// Is below previous checks as to not spam getVariable.
	// Is above following checks to avoid unnecessary calculations.
	// Doesn't log to avoid RPT spam.
if (_instigator getVariable ["punishment_coolDown", 0] > servertime) exitWith {"punishment_coolDown active"};
_instigator setVariable ["punishment_coolDown", servertime + 1, true];
//////////////Logs if is TK/FF//////////////
if (_exemption !=  "") exitWith {
	[format["NOT FF, %1", _exemption]] call _gotoExemption;
};
/////////Checks for important roles/////////
_exemption = switch (true) do {
	case hasACE && {_victim getVariable ["ACE_isUnconscious", false]}: {
		"CORPSE"
	};
	case vehicle _instigator isKindOf "Air": {
		call _hurtYou;
		["You damaged a friendly as CAS support."] call _warn;
		format["AIRCRAFT, %1", _vehicle];
	};
	case
		isNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner") &&
		getNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner") != 0
	: {
		call _hurtYou;
		["You damaged a friendly as arty support."] call _warn;
		format ["ARTY, %1", _vehicle];
	};
	case call BIS_fnc_admin != 0: {
		call _hurtYou;
		["You damaged a friendly as admin."] call _warn;
		format ["ADMIN, %1", ["Not","Voted","Logged"] select (call BIS_fnc_admin)];
	};
	case _instigator == theBoss: {
		call _hurtYou;
		["You damaged a friendly as the Commander."] call _warn;
		"COMMANDER";
	};
	case [_instigator] call A3A_fnc_isMember: {
		call _hurtYou;
		["You damaged a friendly as a trusted member."] call _warn;
		"MEMBER";
	};
	//TODO: if( remoteControlling(_instigator) ) exitWith
		// For the meantime do either one of the following: login for Zeus, use the memberList addon;
		// Or change your player side to enemy faction
		// Without above: your controls will be free, and you won't die or lose inventory. If you have debug consol you can self forgive.
	default {""};
};

if (_exemption != "") exitWith {
	[_exemption] call _gotoExemption;
};

["_instigator","_timeAdded","_offenceAdded","_victim"] call A3A_fnc_punishment;


