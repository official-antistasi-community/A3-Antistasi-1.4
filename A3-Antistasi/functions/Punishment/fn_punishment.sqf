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

	[cursorObject, 0, 0] remoteExec ["A3A_fnc_punishment",cursorObject];				//ping
	[cursorObject,120, 1, "sudo"] remoteExec ["A3A_fnc_punishment",cursorObject];		//Insta Punish, 120 seconds
	[player,120, 1, "sudo"] remoteExec ["A3A_fnc_punishment",player];					//Self Punish, 120 seconds
	[cursorObject,-99999, -1] remoteExec ["A3A_fnc_punishment",cursorObject];			//Insta Forgive

*/
//////////////////SETTINGS//////////////////
_depreciationCoef = 0.75;							//Modifies the drop-off curve of the punishment value; a higher number drops off quicker, a lower number lingers longer.
_overheadPercent = 0.3;								//Lowers the bar (1.0 - accumulated overhead) for getting punished
/////////////////         //////////////////
if (!tkPunish) exitWith {"tkPunish is Disabled"};

if (isDedicated) exitWith {"Is a Dedicated Server"};

if (!isMultiplayer) exitWith {"Is not Multiplayer"};

if (_foolish != player) exitWith {"Not Instigator"};	//Must be local for [BIS_fnc_admin, isServer]

_forgive = (_timeAdded < 0 || _offenceAdded < 0);

_coolDown = _foolish getVariable ["punishment_coolDown", 0];
if (_forgive) exitWith 
{
	if (_coolDown > 1) then {[_foolish] call A3A_fnc_punishment_release;};
	["TK NOTIFICATION!\nAn admin looks with pity upon your soul.\nYou have been partially forgiven."] remoteExec ["hint", _foolish, false];	
	if (_coolDown > 1) exitWith {"Admin Forgive"};

	_punishment_vars = _foolish getVariable ["punishment_vars", [0,0,[0,0],[scriptNull,scriptNull]]];		//[timeTotal,offenceTotal,_lastOffenceData,[wardenHandle,sentenceHandle]]
	_timeTotal = _punishment_vars select 0;
	_offenceTotal = _punishment_vars select 1;
	_lastOffenceData = _punishment_vars select 2;

	_timeTotal = _timeTotal + _timeAdded;	
	_offenceTotal = _offenceTotal + _offenceAdded;
	_lastOffenceData set [1, 0];

	if (_timeTotal < 0) then {_timeTotal = 0}; 
	if (_offenceTotal < 0) then {_offenceTotal = 0}; 

	_punishment_vars = [_timeTotal,_offenceTotal,_lastOffenceData,[scriptNull,scriptNull]];;		//[timeTotal,offenceTotal,_lastOffenceData,[wardenHandle,sentenceHandle]]
	_foolish setVariable ["punishment_vars", _punishment_vars, true];								//[timeTotal,offenceTotal,_lastOffenceData,[wardenHandle,sentenceHandle]]
	_playerStats = format["Player: %1 [%2], _timeTotal: %3, _offenceTotal: %4, _offenceOverhead: %5, _timeAdded: %6, _offenceAdded: %7", name player, getPlayerUID player, str _timeTotal, str _offenceTotal, str 0, str _timeAdded, str _offenceAdded];
	[format ["%1: [Antistasi] | INFO | PUNISHMENT | FORGIVE | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
};
if (_coolDown > 0) exitWith {"punishment_coolDown active"};
_foolish setVariable ["punishment_coolDown", 1, true]; 
[_foolish] spawn 
{
	params ["_player"];
	sleep 1;	//Using raw sleep to help include lag spikes that may effect damage and shooting. 
	
	_coolDown = _player getVariable ["punishment_coolDown", 0];
	if (_coolDown < 2) then {_player setVariable ["punishment_coolDown", 0, true]};
};

_punishment_vars = _foolish getVariable ["punishment_vars", [0,0,[0,0],[scriptNull,scriptNull]]];		//[timeTotal,offenceTotal,_lastOffenceData,[wardenHandle,sentenceHandle]]
_timeTotal = _punishment_vars select 0;
_offenceTotal = _punishment_vars select 1;
_lastTime = (_punishment_vars select 2) select 0;																//[lastTime,overhead]
_overhead = (_punishment_vars select 2) select 1;																//[lastTime,overhead]	

if (_lastTime <= 0) then {_lastTime = serverTime;};
_periodDelta = serverTime - _lastTime;
if (_offenceAdded < 0) then {_offenceAdded = 0};
if (_offenceTotal < 0) then {_offenceTotal = 0};
if (_timeAdded < 0) then {_timeAdded = 0}; 
if (_timeTotal < 0) then {_timeTotal = 0}; 	
if  (_periodDelta > 60*60) then				//Hourly falloff
{								
	_offenceTotal = 0;
	_timeTotal = 0;
	_overhead = 0;
};
_overhead = _overhead + _offenceAdded * _overheadPercent; 	
_offenceTotal = _offenceTotal + _offenceAdded;
_offenceTotal = (_offenceTotal)*((1-_depreciationCoef*(1-(_offenceTotal)))^(_periodDelta/300));
_grandOffence = _offenceTotal + _overhead;
_timeTotal = _timeTotal + _timeAdded;
_timeTotal = (_timeTotal)*((1-_depreciationCoef*(1-(_timeTotal)))^(_periodDelta/300));

_lastOffenceData = [serverTime,_overhead];


_forcePunish = false;
if (_victim isEqualTo "sudo") then {_victim = objNull; _forcePunish = true};
_victimListed = !isNull _victim;

_playerStats = format["Player: %1 [%2], _timeTotal: %3, _offenceTotal: %4, _offenceOverhead: %5, _timeAdded: %6, _offenceAdded: %7", name player, getPlayerUID player, str _timeTotal, str _offenceTotal, str _overhead, str _timeAdded, str _offenceAdded];

_exitCode = "";
if (!_forcePunish) then
{	
	if (vehicle _foolish != _foolish && !_forgive) then 
	{
		_vehicle = typeOf vehicle _foolish;
		if (isNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner")) then
		{
			_artilleryScanner = getNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner");
			if (_artilleryScanner != 0) then 
			{
				_exitCode = "Inside Artillery";
				[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, ARTY, %2 | %3", servertime, _vehicle, _playerStats]] remoteExec ["diag_log", 2];
				["TK NOTIFICATION!\nArty Team Damage."] remoteExec ["hint", _foolish, false];
			};
		};
		if (_vehicle isKindOf "Helicopter" || _vehicle isKindOf "Plane") then
		{
			[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, AIRCRAFT, %2 | %3", servertime, _vehicle, _playerStats]] remoteExec ["diag_log", 2];
			["TK NOTIFICATION!\nCAS Team Damage."] remoteExec ["hint", _foolish, false];
			_exitCode = "Inside Aircraft";
		};
	};
	if (
		if (_victimListed) then
		{
			if (!alive _victim || (_victim getVariable ["ACE_isUnconscious", false])) exitWith {_exitCode = "Victim is a corpse"; true;};
			if (_victim == _foolish) exitWith {_exitCode = "Victim of Suicide"; true;};
			false;
		}
	) exitWith {_exitCode};

	//TODO: if( remoteControlling(_foolish) ) exitWith		//For the meantime do either one of the following: login for Zeus, use the memberList addon, disable TKPunish `_player setVariable ["punishment_coolDown", 2, true]; or change your player side to enemy faction`
	//														//Even then: your controls will be free, and you won't die or lose inventory. If you have debug consol you can self forgive.
	_adminType = ["Not","Voted","Logged"] select ([] call BIS_fnc_admin);
	if (_adminType != "Not" || isServer ) exitWith
	{
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, ADMIN, %2 | %3", servertime, _adminType, _playerStats]] remoteExec ["diag_log", 2];
		["TK NOTIFICATION!\nYou damaged a player as admin."] remoteExec ["hint", _foolish, false];
		_exitCode = "Player is Voted or Logged Admin"; "Player is Voted or Logged Admin";
	};
	if (_foolish == theBoss) exitWith 
	{
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, COMMANDER | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
		["TK NOTIFICATION!\nYou damaged a player as the Supreme Commander."] remoteExec ["hint", _foolish, false];
		if (_victimListed) then {[format["%1 hurt you!",name _foolish]] remoteExec ["hint", _victim, false];};
		_exitCode = "Player is  Commander";
	};
	if ([_foolish] call A3A_fnc_isMember) exitWith 
	{
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, MEMBER | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
		["TK NOTIFICATION!\nYou damaged a player as a trusted member."] remoteExec ["hint", _foolish, false];
		if (_victimListed) then {[format["%1 hurt you!",name _foolish]] remoteExec ["hint", _victim, false];};
		_exitCode = "Player is  Member";
	};

	_pvpNearby = false;
	_pvpPerson = objNull;
	if (_victimListed) then 
	{
		{
			_enemyX = _x;
			if (((side _enemyX == Occupants) or (side _enemyX == Invaders)) and {(_enemyX distance _victim < 50)}) exitWith {_pvpNearby = true; _pvpPerson = _enemyX};
		} forEach allPlayers;
	};
	if (_pvpNearby) exitWith 
	{
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXEMPTION, PVP COMBAT, PVP: %2 | %3", servertime, name _pvpPerson, _playerStats]] remoteExec ["diag_log", 2];
		["TK NOTIFICATION!\nYou damaged a player around the PVP players."] remoteExec ["hint", _foolish, false];
		_exitCode = "Victim is nearby PVP players";
	};
};
if (_exitCode != "") exitWith {_exitCode;};

[format ["%1: [Antistasi] | INFO | PUNISHMENT | WARNING | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
["TK WARNING!\nWatch your fire!"] remoteExec ["hint", _foolish, false]; 
if (_victimListed) then {[format["%1 hurt you!",name _foolish]] remoteExec ["hint", _victim, false];}; 

_punishment_vars set [0,_timeTotal];
_punishment_vars set [1,_offenceTotal];
_punishment_vars set [2,_lastOffenceData];
_foolish setVariable ["punishment_vars", _punishment_vars, true];		//[timeTotal,offenceTotal,_lastOffenceData,[wardenHandle,sentenceHandle]]

if (_grandOffence < 1) exitWith {"Strike"};

[format ["%1: [Antistasi] | INFO | PUNISHMENT | GUILTY | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];

[_foolish,_timeTotal] call A3A_fnc_punishment_warden;
"Found Guilty";
