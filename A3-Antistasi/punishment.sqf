
private ["_countX","_foolish","_timeX","_punish"];
if (isDedicated) exitWith {};

if (!isMultiplayer) exitWith {};

_foolish = _this select 0;
_timeX = _this select 1;

if (player!= _foolish) exitWith {};

_punish = _foolish getVariable ["punish",0];
_punish = _punish + _timeX;

disableUserInput true;
player removeMagazines (primaryWeapon player);
removeAllItemsWithMagazines player;
player removeMagazines (secondaryWeapon player);
player removeWeaponGlobal (primaryWeapon player);
player removeWeaponGlobal (secondaryWeapon player);
player setPosASL [0,0,0];

hint "Being an asshole is not a desired skill of the general Antistasi player";
sleep 5;
hint "This is a COOP game and you are welcome to do so";
sleep 5;
hint "If you are bored, I think there is a new episode on SpongeBob Square Pants today";
sleep 5;
_countX = _punish;
while {_countX > 0} do
	{
	hint format ["Now watch the sights for the following %1 seconds.\n\nPlease be thankful this is a game. In reality you could be sentenced to death by a firing squad, this little punish is not that bad.", _countX];
	sleep 1;
	_countX = _countX -1;
	};
hint "Enough then";
disableUserInput false;
player setdamage 1;
player setVariable ["punish",_punish,true];
