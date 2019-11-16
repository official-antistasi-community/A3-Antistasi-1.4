if (player != theBoss) exitWith {hint "Only Commander has the ability to control HC units"};

_groups = _this select 0;

_groupX = _groups select 0;
_unit = leader _groupX;

if !([_unit] call A3A_fnc_canFight) exitWith {hint "You cannot control an unconscious or dead unit"};

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
	hint "Returned to original Unit as it received damage";
	}];
_eh2 = _unit addEventHandler ["HandleDamage",
	{
	_unit = _this select 0;
	_unit removeEventHandler ["HandleDamage",_thisEventHandler];
	removeAllActions _unit;
	selectPlayer (_unit getVariable "owner");
	(units group player) joinsilent group player;
	group player selectLeader player;
	hint "Returned to original Unit as controlled AI received damage";
	}];
selectPlayer _unit;

_timeX = 60;

_unit addAction ["Return Control to AI",{selectPlayer (player getVariable ["owner",player])}];

waitUntil {sleep 1; hint format ["Time to return control to AI: %1", _timeX]; _timeX = _timeX - 1; (_timeX < 0) or (isPlayer theBoss)};

removeAllActions _unit;
if (!isPlayer (_unit getVariable ["owner",_unit])) then {selectPlayer (_unit getVariable ["owner",_unit])};
//_unit setVariable ["owner",nil,true];
_unit removeEventHandler ["HandleDamage",_eh2];
player removeEventHandler ["HandleDamage",_eh1];
(units group theBoss) joinsilent group theBoss;
group theBoss selectLeader theBoss;
hint "";

