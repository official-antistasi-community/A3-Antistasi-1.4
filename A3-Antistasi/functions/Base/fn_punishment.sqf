Params ["_foolish","_timeAdded","_offenceLevel"]; 
// EG: [_instigator, 20, 0.34] remoteExec ["A3A_fnc_punishment",_instigator];
/*
	_foolish expects player object
	_timeX expects time out
	_offenceLevel expects percentage between 0 and 1 how server it is severe it is
*/
/*
	Some Debug Consol Interactions:

	[cursorTarget, 0, 0] remoteExec ["A3A_fnc_punishment",cursorTarget];		//ping
	[cursorTarget,120, 1] remoteExec ["A3A_fnc_punishment",cursorTarget];		//Insta Punish, 120 seconds
	[cursorTarget,-99999, -1] remoteExec ["A3A_fnc_punishment",cursorTarget];	//Insta Forgive

*/

if (isDedicated) exitWith {};

if (!isMultiplayer) exitWith {};

if (_foolish != player) exitWith {"Not Instigator"};

_forgive = (_timeAdded < 0 || _offenceLevel < 0);
_accumulatedTime = player getVariable ["punishment_accumulatedime",0];
_TKThreshold = player getVariable ["punishment_TKThreshold", 0];
_playerStats = format["Player: %1 [%2], _accumulatedTime: %3, _TKThreshold: %4, _timeAdded: %5, _offenceLevel: %6", name player, getPlayerUID player, str _accumulatedTime, str _TKThreshold, str _timeAdded, str _offenceLevel];

if (player getVariable ["punishment_coolDown", false]) exitWith {"punishment_coolDown active"};
player setVariable ["punishment_coolDown", true, true];
[player] spawn 
{
	params ["_player"];
	sleep 1;
	_player setVariable ["punishment_coolDown", false, true];
};

_innocent = false;
if (vehicle player != player && !_forgive) then 
{
	_vehicle = typeOf vehicle player;
	if (isNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner")) then
	{
		_artilleryScanner = getNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner");
		if (_artilleryScanner != 0) then 
		{
			_innocent = true;
			[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXCEPTION, ARTY, %2 | %3", servertime, _vehicle, _playerStats]] remoteExec ["diag_log", 2];
		};
	};
	if (_vehicle isKindOf "Helicopter" || _vehicle isKindOf "Plane") then
	{
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXCEPTION, AIRCRAFT, %2 | %3", servertime, _vehicle, _playerStats]] remoteExec ["diag_log", 2];
		_innocent = true;
	};
};
if (_innocent) exitWith {"Player is innocent inside a Arty or Aircraft"};

if (call BIS_fnc_admin != 0) exitWith 
{
	_adminType = "Voted";
	if (call BIS_fnc_admin == 2) then {_adminType = "Logged"};
	[format ["%1: [Antistasi] | INFO | PUNISHMENT | EXCEPTION, ADMIN, %2 | %3", servertime, _adminType, _playerStats]] remoteExec ["diag_log", 2];
	["TK NOTIFICATION!\nYou would be punished but it appears you remembered to #login before you started killing people.."] remoteExec ["hint", player, false];
	"Player is Voted or Logged Admin";
};

_accumulatedTime = _accumulatedTime + _timeAdded;
_TKThreshold = _TKThreshold + _offenceLevel;
if (_accumulatedTime < 0) then {_accumulatedTime = 0}; 
if (_TKThreshold < 0) then {_TKThreshold = 0}; 
player setVariable ["punishment_accumulatedime",_accumulatedTime,true];
player setVariable ["punishment_TKThreshold", _TKThreshold,true];
if (_forgive) then 
{	
	[format ["%1: [Antistasi] | INFO | PUNISHMENT | FORGIVE | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
	["TK NOTIFICATION!\nAn admin looks with pitty upon you.\nYou have been partially forgiven."] remoteExec ["hint", player, false];	
}
else
{	
	[format ["%1: [Antistasi] | INFO | PUNISHMENT | WARNING | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
	["TK WARNING!\nWatch your fire!"] remoteExec ["hint", player, false];
};

if (_TKThreshold < 1) exitWith {"Strike"};

[format ["%1: [Antistasi] | INFO | PUNISHMENT | GUILTY | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
disableUserInput true;
player removeMagazines (primaryWeapon player);
removeAllItemsWithMagazines player;
player removeMagazines (secondaryWeapon player);
player removeWeaponGlobal (primaryWeapon player);
player removeWeaponGlobal (secondaryWeapon player);
player setPosASL [0,0,0];

["Being an asshole is not a desired skill of the general Antistasi player."] remoteExec ["hint", player, false];
sleep 5;
["This is a COOP game and you are welcome to do so."] remoteExec ["hint", player, false];
sleep 5;
["If you are bored, I think there is a new episode on SpongeBob Square Pants today."] remoteExec ["hint", player, false];
sleep 5;
_countX = _accumulatedTime;
while {_countX > 0} do
{
	[format ["Now enjoy the view for the following %1 seconds.\n\nPlease be thankful this is a game. In reality you could be sentenced to death by a firing squad, this little punishment is not that bad.", _countX]] remoteExec ["hint", player, false];
	sleep 1;
	_countX = _countX -1;
};
["Enough then."] remoteExec ["hint", player, false];
disableUserInput false;
player setVariable ["punishment_TKThreshold", 0.1,true];
//punishment_accumulatedime accumulates until relog (or forgiveness)
player setdamage 1;