if (player!= theBoss) exitWith {hint "Only the Commander can order to rest"};
_presente = false;

{
if ((side _x == malos) or (side _x == muyMalos)) then
	{
	if ([500,1,_x,"GREENFORSpawn"] call A3A_fnc_distanceUnits) then {_presente = true};
	};
} forEach allUnits;
if (_presente) exitWith {hint "You cannot rest while enemies are near our units"};
if (["AtaqueAAF"] call BIS_fnc_taskExists) exitWith {hint "You cannot rest while the enemy is counterattacking"};
if (["DEF_HQ"] call BIS_fnc_taskExists) exitWith {hint "You cannot rest while your HQ is under attack"};

_chequeo = false;
_posHQ = getMarkerPos respawnBuenos;
{
if ((_x distance _posHQ > 100) and (side _x == buenos)) then {_chequeo = true};
} forEach (allPlayers - (entities "HeadlessClient_F"));

if (_chequeo) exitWith {hint "All players must be in a 100m radius from HQ to be able to rest"};

[[],"A3A_fnc_resourcecheckSkipTime"] call BIS_fnc_MP;


