Params ["_instigator","_timeAdded","_offenceAdded",["_victim",objNull]];
//MUST be executed on foolish for 'BIS_fnc_admin' and 'isServer' to work.
// EG: [_instigator, 20, 0.34, _victim] remoteExec ["A3A_fnc_punishment_FF",_instigator];
/*
	Checks if incident reported is indeed a rebel Friendly Fire event.
	Refer to A3A_fnc_punishment for actual punishment logic.
*/
/*
	_instigator expects player object
	_timeX expects time out
	_offenceLevel expects percentage between 0 and 1 how server it is severe it is
*/
/*
	Some Debug Console Interactions:

	[cursorObject, 0, 0] remoteExec ["A3A_fnc_punishment_FF",cursorObject];					//ping
	[cursorObject,120, 1, "sudo"] remoteExec ["A3A_fnc_punishment_FF",cursorObject];		//Insta Punish, 120 seconds
	[player,120, 1, "sudo"] remoteExec ["A3A_fnc_punishment_FF",player];					//Self Punish, 120 seconds
	[cursorObject,-99999, -1] remoteExec ["A3A_fnc_punishment_FF",cursorObject];			//Insta Forgive

*/
/////////////Checks if TK/FF on/////////////
if (!tkPunish) exitWith {"tkPunish is Disabled"};
if (isDedicated) exitWith {"Is a Dedicated Server"};
if (!isMultiplayer) exitWith {"Is not Multiplayer"};
if (_instigator != player) exitWith {"Not Instigator"};	// Must be local for 'BIS_fnc_admin' and 'isServer'
if (!_instigator in [Invaders, Occupants]) exitWith {"Not Rebel"};

//////Cool down prevents multi-hit spam/////
_coolDown = _instigator getVariable ["punishment_coolDown", 0];
if (_coolDown > 0) exitWith {"punishment_coolDown active"};
_instigator setVariable ["punishment_coolDown", 1, true];
[_instigator] spawn {
	params ["_player"];
	sleep 1;	//Using raw sleep to help include lag spikes that may effect damage and shooting.

	_coolDown = _player getVariable ["punishment_coolDown", 0];
	if (_coolDown < 2) then {_player setVariable ["punishment_coolDown", 0, true]};
};

/////////Checks if manual punishment////////
_forcePunish = false;
if (_victim isEqualTo "sudo") then {_victim = objNull; _forcePunish = true};
_victimListed = !isNull _victim;

_playerStats = format["Player: %1 [%2], _timeTotal: %3, _offenceTotal: %4, _offenceOverhead: %5, _timeAdded: %6, _offenceAdded: %7", name player, getPlayerUID player, str _timeTotal, str _offenceTotal, str _overhead, str _timeAdded, str _offenceAdded];

_exitCode = "";
if (!_forcePunish) then {
///////////Checks for CAS or Arty///////////
	if (vehicle _instigator != _instigator && !_forgive) then {
		_vehicle = typeOf vehicle _instigator;
		if (isNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner")) then {
			_artilleryScanner = getNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner");
			if (_artilleryScanner != 0) then {
				_exitCode = "Inside Artillery";
				[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, ARTY, %2 | %3", servertime, _vehicle, _playerStats]] remoteExec ["diag_log", 2];
				["TK Notification", "Arty Team Damage."] remoteExec ["A3A_fnc_customHint", _instigator, false];
			};
		};
		if (_vehicle isKindOf "Helicopter" || _vehicle isKindOf "Plane") then {
			[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, AIRCRAFT, %2 | %3", servertime, _vehicle, _playerStats]] remoteExec ["diag_log", 2];
			["TK Notification", "CAS Team Damage."] remoteExec ["A3A_fnc_customHint", _instigator, false];
			_exitCode = "Inside Aircraft";
		};
	};
	if (
		if (_victimListed) then	{
			if (!alive _victim || (_victim getVariable ["ACE_isUnconscious", false])) exitWith {_exitCode = "Victim is a corpse"; true;};
			if (_victim == _instigator) exitWith {_exitCode = "Victim of Suicide"; true;};
			false;
		}
	) exitWith {_exitCode};
/////////Checks for important roles/////////
	//TODO: if( remoteControlling(_instigator) ) exitWith		//For the meantime do either one of the following: login for Zeus, use the memberList addon, disable TKPunish `_player setVariable ["punishment_coolDown", 2, true]; or change your player side to enemy faction`
	//														//Even then: your controls will be free, and you won't die or lose inventory. If you have debug consol you can self forgive.
	_adminType = ["Not","Voted","Logged"] select ([] call BIS_fnc_admin);
	if (_adminType != "Not" || isServer ) exitWith {
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, ADMIN, %2 | %3", servertime, _adminType, _playerStats]] remoteExec ["diag_log", 2];
		["TK Notification", "You damaged a player as admin."] remoteExec ["A3A_fnc_customHint", _instigator, false];
		_exitCode = "Player is Voted or Logged Admin"; "Player is Voted or Logged Admin";
	};
	if (_instigator == theBoss) exitWith {
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, COMMANDER | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
		["TK Notification", "You damaged a player as the Commander."] remoteExec ["A3A_fnc_customHint", _instigator, false];
		if (_victimListed) then {["TK Notification", format["%1 hurt you!",name _instigator]] remoteExec ["A3A_fnc_customHint", _victim, false];};
		_exitCode = "Player is  Commander";
	};
	if ([_instigator] call A3A_fnc_isMember) exitWith {
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, MEMBER | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
		["TK Notification", "You damaged a player as a trusted member."] remoteExec ["A3A_fnc_customHint", _instigator, false];
		if (_victimListed) then {["TK Notification", format["%1 hurt you!",name _instigator]] remoteExec ["A3A_fnc_customHint", _victim, false];};
		_exitCode = "Player is  Member";
	};
};
if (_exitCode != "") exitWith {_exitCode;};

["_instigator","_timeAdded","_offenceAdded","_victim"] remoteExec ["A3A_fnc_punishment",_instigator];