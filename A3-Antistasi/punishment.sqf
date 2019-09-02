Params ["_foolish","_timeAdded","_offenceAdded",["_victim",objNull]]; 
//MUST be executed on foolish for [BIS_fnc_admin, isServer] to work.
// EG: [_instigator, 20, 0.34, _victim] remoteExec ["A3A_fnc_punishment",_instigator];
/*
	_foolish expects player object
	_timeX expects time out
	_offenceLevel expects percentage between 0 and 1 how server it is severe it is
*/
/*
	Some Debug Consol Interactions:

	[cursorObject, 0, 0] call A3A_fnc_punishment;		//ping
	[cursorObject,120, 1] call A3A_fnc_punishment;		//Insta Punish, 120 seconds
	[cursorObject,-99999, -1] call A3A_fnc_punishment;	//Insta Forgive

*/

if (!tkPunish) exitWith {"tkPunish is Disabled"};

if (isDedicated) exitWith {"Is a Dedicated Server"};

if (!isMultiplayer) exitWith {"Is not Multiplayer"};

if (_foolish != player) exitWith {"Not Instigator"};	//Must be local for [BIS_fnc_admin, isServer]

_forgive = (_timeAdded < 0 || _offenceAdded < 0);

if (_forgive) exitWith 
{
	["release",[_foolish]] call A3A_fnc_punishment_utills;
	[format ["%1: [Antistasi] | INFO | PUNISHMENT | FORGIVE | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
	["TK NOTIFICATION!\nAn admin looks with pitty upon your soul.\nYou have been partially forgiven."] remoteExec ["hint", _foolish, false];	

	_punishment_vars = _foolish getVariable ["punishment_vars", [0,0,[scriptNull,scriptNull]]];		//[timeTotal,offenceTotal,_lastOffenceTime,[wardenHandle,sentanceHandle]]
	//_lastOffenceTime = serverTime;
	_timeTotal = _punishment_vars select 0;
	_offenceTotal = _punishment_vars select 1;
	_timeTotal = _timeTotal + _timeAdded;					//Will be a function soon
	_offenceTotal = _offenceTotal + _offenceAdded;
	if (_timeTotal < 0) then {_timeTotal = 0}; 
	if (_offenceTotal < 0) then {_offenceTotal = 0}; 
	_punishment_vars set [0,_timeTotal];
	_punishment_vars set [1,_offenceTotal];
	_foolish setVariable ["punishment_vars", _punishment_vars, true];		//[timeTotal,offenceTotal,_lastOffenceTime,[wardenHandle,sentanceHandle]]
};
_coolDown = _foolish getVariable ["punishment_coolDown", 0];
if (_coolDown > 0) exitWith {"punishment_coolDown active"};
_foolish setVariable ["punishment_coolDown", 1, true]; 
[_foolish] spawn 
{
	params ["_player"];
	sleep 1;	//Using raw sleep to help include lag spikes that may effect damage and shooting. 
	
	_coolDown = _player getVariable ["punishment_coolDown", 0];
	if (_coolDown < 2) then {_player setVariable ["punishment_coolDown", 0, true]};
};

_punishment_vars = _foolish getVariable ["punishment_vars", [0,0,[scriptNull,scriptNull]]];		//[timeTotal,offenceTotal,_lastOffenceTime,[wardenHandle,sentanceHandle]]
_timeTotal = _punishment_vars select 0;
_offenceTotal = _punishment_vars select 1;

_timeTotal = _timeTotal + _timeAdded;

_offenceTotal = _offenceTotal + _offenceAdded;
///////////////////////// TODO: _offenceTotal Depreciation, For WIP see: https://1drv.ms/x/s!AhRKsW_EtNcbzgtdQ-eGglK7ej29
// ADD ME
//////////////////////////

if (_timeTotal < 0) then {_timeTotal = 0}; 
if (_offenceTotal < 0) then {_offenceTotal = 0}; 
_victimListed = !isNull _victim;

_playerStats = format["Player: %1 [%2], _timeTotal: %3, _offenceTotal: %4, _lastOffenceTime: %5, _timeAdded: %6, _offenceAdded: %7", name player, getPlayerUID player, str _timeTotal, str _offenceTotal, "TODO", str _timeAdded, str _offenceAdded];
//_lastOffenceTime = serverTime;

_innocent = false;
if (vehicle _foolish != _foolish && !_forgive) then 
{
	_vehicle = typeOf vehicle _foolish;
	if (isNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner")) then
	{
		_artilleryScanner = getNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner");
		if (_artilleryScanner != 0) then 
		{
			_innocent = true;
			[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, ARTY, %2 | %3", servertime, _vehicle, _playerStats]] remoteExec ["diag_log", 2];
			["Team Damage!"] remoteExec ["hint", _foolish, false];
		};
	};
	if (_vehicle isKindOf "Helicopter" || _vehicle isKindOf "Plane") then
	{
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, AIRCRAFT, %2 | %3", servertime, _vehicle, _playerStats]] remoteExec ["diag_log", 2];
		["Team Damage!"] remoteExec ["hint", _foolish, false];
		_innocent = true;
	};
};
if (_innocent) exitWith {"Player is innocent inside a Arty or Aircraft"};

//TODO: if( remoteControlling(_foolish) ) exitWith		//For the meantime do either one of the following: login for zues, use the memberlist addon, disable tkpunish `_player setVariable ["punishment_coolDown", 2, true];`
//{														//Even then: your controls will be free, and you won't die or lose inventory. If you have debug consol you can self forgive.
//	"Player is remote controlling AI";
//};
if (_foolish == theBoss) exitWith 
{
	[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, COMMANDER | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
	["TK NOTIFICATION!\nYou would be punished but it appears you are the Supreme Commander."] remoteExec ["hint", _foolish, false];
	"Player is  Commander";
};
if ([_foolish] call A3A_fnc_isMember) exitWith 
{
	[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, MEMBER | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
	["TK NOTIFICATION!\nYou would be punished but it appears you're a trusted member."] remoteExec ["hint", _foolish, false];
	"Player is  Member";
};
_adminType = ["Not","Voted","Logged"] select ([] call BIS_fnc_admin);
if (_adminType != "Not" || isServer) exitWith
{
	[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, ADMIN, %2 | %3", servertime, _adminType, _playerStats]] remoteExec ["diag_log", 2];
	["TK NOTIFICATION!\nYou damaged a player as admin."] remoteExec ["hint", _foolish, false];
	"Player is Voted or Logged Admin";
};
_pvpNearby = false;
_pvpPerson = objNull;
if (_victimListed) then 
{
	{
		_enemyX = _x;
		if ({((side _enemyX == Occupants) or (side _enemyX == Invaders))} and {(_enemyX distance _victim < 50)}) exitWith {_pvpNearby = true; _pvpPerson = _enemyX};
	} forEach allPlayers;
	if (_pvpNearby) exitWith 
	{
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, PVP COMBAT, PVP: %2 | %3", servertime, name _pvpPerson, _playerStats]] remoteExec ["diag_log", 2];
		["TK NOTIFICATION!\nYou would be punished but it appears there are PVP players near your victim."] remoteExec ["hint", _foolish, false];
		"Victim is nearby PVP players";
	};
};

[format ["%1: [Antistasi] | INFO | PUNISHMENT | WARNING | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
["TK WARNING!\nWatch your fire!"] remoteExec ["hint", _foolish, false];
if (_victimListed) then {[format["%1 hurt you!",name _foolish]] remoteExec ["hint", _victim, false];};
["forgive_addAction",[_foolish]] call A3A_fnc_punishment_utills;
if (_offenceTotal < 1) exitWith {"Strike"};

[format ["%1: [Antistasi] | INFO | PUNISHMENT | GUILTY | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];

["warden",[_foolish,_timeTotal]] call A3A_fnc_punishment_utills;

_punishment_vars set [0,_timeTotal];
_punishment_vars set [1,_offenceTotal];
_foolish setVariable ["punishment_vars", _punishment_vars, true];		//[timeTotal,offenceTotal,_lastOffenceTime,[wardenHandle,sentanceHandle]]
