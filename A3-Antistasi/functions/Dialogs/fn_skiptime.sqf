if (player!= theBoss) exitWith {hint "Only the Commander can order to rest"};
_presente = false;

{
if ((side _x == Occupants) or (side _x == Invaders)) then
	{
	if ([500,1,_x,teamPlayer] call A3A_fnc_distanceUnits) then {_presente = true};
	};
} forEach allUnits;
if (_presente) exitWith {hint "You cannot rest while enemies are near our units"};
if (["rebelAttack"] call BIS_fnc_taskExists) exitWith {hint "You cannot rest while the enemy is counterattacking"};
if (["invaderPunish"] call BIS_fnc_taskExists) exitWith {hint "You cannot rest while citizens are under attack"};
if (["DEF_HQ"] call BIS_fnc_taskExists) exitWith {hint "You cannot rest while your HQ is under attack"};

_checkX = false;
_posHQ = getMarkerPos respawnTeamPlayer;
{
if ((_x distance _posHQ > 100) and (side _x == teamPlayer)) then {_checkX = true};
} forEach (allPlayers - (entities "HeadlessClient_F"));

if (_checkX) exitWith {hint "All players must be in a 100m radius from HQ to be able to rest"};

remoteExec ["A3A_fnc_resourcecheckSkipTime", 0];


