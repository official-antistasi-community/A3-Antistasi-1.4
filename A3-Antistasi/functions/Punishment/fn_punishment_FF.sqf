Params ["_instigator","_timeAdded","_offenceAdded",["_victim",objNull]];
// MUST be executed on foolish for 'BIS_fnc_admin' and 'isServer' to work.
// EG: [_instigator, 20, 0.34, _victim] remoteExec ["A3A_fnc_punishment_FF",_instigator];
/*
	Checks if incident reported is indeed a rebel Friendly Fire event.
	Refer to A3A_fnc_punishment for actual punishment logic.
*/
/*
[Required]
	_instigator expects player object
	_timeX expects time out (Added to player's total)
	_offenceLevel expects percentage between 0 and 1 how server it is severe it is
[OPTIONAL]
	_victim expects player object
*/
/*
	[player, 0, 0, objNull] call A3A_fnc_punishment_FF;      // Test self with no victim
	[player, 0, 0, cursorObject] call A3A_fnc_punishment_FF; // Test self with victim
	[player] call A3A_fnc_punishment_release;                // Self forgive all sins
*/
/////////////////Definitions////////////////
_notifyVictim = {
	if (isPlayer _victim) then {["FF Notification", format["%1 hurt you!",name _instigator]] remoteExec ["A3A_fnc_customHint", _victim, false];};
};
_notifyInstigator = {
	Params ["_message"];
	["FF Notification", _message] remoteExec ["A3A_fnc_customHint", _instigator, false];
};
_gotoExemption = {
	Params ["_exemptionDetails"];
	_playerStats = format["Player: %1 [%2], _timeAdded: %3, _offenceAdded: %4", name _instigator, getPlayerUID _instigator,str _timeAdded, str _offenceAdded];
	[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, %2 | %3", servertime, _exemptionDetails, _playerStats]] remoteExec ["diag_log", 2];
	_exemptionDetails;
};
_vehicle = typeOf vehicle _instigator;
///////////////Checks if is FF//////////////
_exemption = switch (true) do {
	case (!tkPunish):                                  {"FF PUNISH IS DISABLED"};
	case (isDedicated || isServer):                    {"FF BY SERVER"};
	case (!isMultiplayer):                             {"IS NOT MULTIPLAYER"};
	case (_instigator != player):                      {"NOT INSTIGATOR"};	// Must be local for 'BIS_fnc_admin'
	case !(side _instigator in [Invaders, Occupants]): {"NOT REBEL"};
	case (_victim == _instigator):                     {"SUICIDE"};
	case !(isNull _victim && alive _victim):           {"CORPSE"};	// Ace check is further on
	default                                            {""};
};
//////Cool down prevents multi-hit spam/////
	// Is below previous checks as to not spam getVariable.
	// Is above following checks to avoid unnecessary calculations.
	// Doesn't log to avoid RPT spam.
if (_instigator getVariable ["punishment_coolDown", 0] > servertime) exitWith {"PUNISHMENT COOL-DOWN ACTIVE"};
_instigator setVariable ["punishment_coolDown", servertime + 1, true];
////////////////Logs if is FF///////////////
if (_exemption !=  "") exitWith {
	[format["NOT FF, %1", _exemption]] call _gotoExemption;
};
/////////Checks for important roles/////////
_exemption = switch (true) do {
	case (hasACE && {_victim getVariable ["ACE_isUnconscious", false]}): {
		"CORPSE"
	};
	case (call BIS_fnc_admin != 0): {
		["You damaged a friendly as admin."] call _notifyInstigator;	// Admin not reported for Zeus remote control.
		format ["ADMIN, %1", ["Not","Voted","Logged"] select (call BIS_fnc_admin)];
	};
	case (vehicle _instigator isKindOf "Air"): {
		call _notifyVictim;
		["You damaged a friendly as CAS support."] call _notifyInstigator;
		format["AIRCRAFT, %1", _vehicle];
	};
	case (
		isNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner") &&
		getNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner") != 0
	): {
		call _notifyVictim;
		["You damaged a friendly as arty support."] call _notifyInstigator;
		format ["ARTY, %1", _vehicle];
	};
	case (_instigator == theBoss): {
		call _notifyVictim;
		["You damaged a friendly as the Commander."] call _notifyInstigator;
		"COMMANDER";
	};
	case ([_instigator] call A3A_fnc_isMember): {
		call _notifyVictim;
		["You damaged a friendly as a trusted member."] call _notifyInstigator;
		"MEMBER";
	};
	// TODO: if( remoteControlling(_instigator) ) exitWith
		// For the meantime do either one of the following: login for Zeus, use the memberList addon;
		// Or change your player side to enemy faction
		// Without above: your controls will be free, and you won't die or lose inventory. If you have debug consol you can self forgive.
	default {""};
};

if (_exemption != "") exitWith {
	[_exemption] call _gotoExemption;
};

["_instigator","_timeAdded","_offenceAdded","_victim"] call A3A_fnc_punishment;


