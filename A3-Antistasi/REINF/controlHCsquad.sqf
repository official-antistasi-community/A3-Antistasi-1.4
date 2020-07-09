if (player != theBoss) exitWith {["Control Squad", "Only Commander has the ability to control HC units"] call A3A_fnc_customHint;};
private _punishmentoffenceTotal = [getPlayerUID player, [ ["offenceTotal",0] ]] call A3A_fnc_punishment_dataGet select 0;
if (_punishmentoffenceTotal >= 1) exitWith {["Control Squad", "Nope. Not happening."] call A3A_fnc_customHint;};

_groups = _this select 0;

_groupX = _groups select 0;
_unit = leader _groupX;

if !([_unit] call A3A_fnc_canFight) exitWith {["Control Squad", "You cannot control an unconscious or dead unit"] call A3A_fnc_customHint;};

while {(count (waypoints _groupX)) > 0} do
 {
  deleteWaypoint ((waypoints _groupX) select 0);
 };

_wp = _groupX addwaypoint [getpos _unit,0];

{
if (_x != vehicle _x) then
	{
	[_x] orderGetIn true;
	};
} forEach units group player;

hcShowBar false;
hcShowBar true;

_unit setVariable ["owner",player,true];
_eh1 = player addEventHandler ["HandleDamage",
	{
	_unit = _this select 0;
	_unit removeEventHandler ["HandleDamage",_thisEventHandler];
	//removeAllActions _unit;
	selectPlayer _unit;
	(units group player) joinsilent group player;
	group player selectLeader player;
	["Control Squad", "Returned to original Unit as it received damage"] call A3A_fnc_customHint;
	nil;
	}];
_eh2 = _unit addEventHandler ["HandleDamage",
	{
	_unit = _this select 0;
	_unit removeEventHandler ["HandleDamage",_thisEventHandler];
	removeAllActions _unit;
	selectPlayer (_unit getVariable "owner");
	(units group player) joinsilent group player;
	group player selectLeader player;
	["Control Squad", "Returned to original Unit as controlled AI received damage"] call A3A_fnc_customHint;
	nil;
	}];
selectPlayer _unit;

_timeX = 60;

_unit addAction ["Return Control to AI",{selectPlayer (player getVariable ["owner",player])}];

waitUntil {sleep 1;["Control Squad", format ["Time to return control to AI: %1", _timeX]] call A3A_fnc_customHint; _timeX = _timeX - 1; (_timeX < 0) or (isPlayer theBoss)};

removeAllActions _unit;
if (!isPlayer (_unit getVariable ["owner",_unit])) then {selectPlayer (_unit getVariable ["owner",_unit])};
//_unit setVariable ["owner",nil,true];
_unit removeEventHandler ["HandleDamage",_eh2];
player removeEventHandler ["HandleDamage",_eh1];
(units group theBoss) joinsilent group theBoss;
group theBoss selectLeader theBoss;
["Control Squad", ""] call A3A_fnc_customHint;

