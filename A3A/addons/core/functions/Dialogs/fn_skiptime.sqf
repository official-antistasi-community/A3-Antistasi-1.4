//TODO: add header

private _titleStr = localize "STR_A3A_fn_dialogs_skiptime_title";

if (player!= theBoss) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_commander"] call A3A_fnc_customHint;};
_presente = false;

private _rebelSpawners = units teamPlayer select { _x getVariable ["spawner",false] };
private _presente = (-1 != (_rebelSpawners findIf { [getPosATL _x] call A3A_fnc_enemyNearCheck }));
if (_presente) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_enemy1"] call A3A_fnc_customHint;};
if ("rebelAttack" in A3A_activeTasks) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_enemy2"] call A3A_fnc_customHint;};
if ("invaderPunish" in A3A_activeTasks) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_civatt"] call A3A_fnc_customHint;};
if ("DEF_HQ" in A3A_activeTasks) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_hqatt"] call A3A_fnc_customHint;};

_checkX = false;
_posHQ = getMarkerPos respawnTeamPlayer;
{
if ((_x distance _posHQ > 100) and (side _x == teamPlayer)) then {_checkX = true};
} forEach (allPlayers - (entities "HeadlessClient_F"));

if (_checkX) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_radius"] call A3A_fnc_customHint;};

remoteExec ["A3A_fnc_resourcecheckSkipTime", 0];
