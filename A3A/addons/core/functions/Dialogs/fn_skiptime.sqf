//TODO: add header

private _titleStr = localize "STR_A3A_fn_dialogs_skiptime_title";

if (player!= theBoss) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_commander"] call A3A_fnc_customHint;};

private _rebelSpawners = units teamPlayer select { _x getVariable ["spawner",false] };
private _presente = (-1 != (_rebelSpawners findIf { [getPosATL _x] call A3A_fnc_enemyNearCheck }));
if (_presente) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_enemy1"] call A3A_fnc_customHint;};
if ("rebelAttack" in A3A_activeTasks) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_enemy2"] call A3A_fnc_customHint;};
if ("invaderPunish" in A3A_activeTasks) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_civatt"] call A3A_fnc_customHint;};
if ("DEF_HQ" in A3A_activeTasks) exitWith {[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_hqatt"] call A3A_fnc_customHint;};

private _absentPlayers = [];
private _posHQ = getMarkerPos respawnTeamPlayer;
{
if ((_x distance _posHQ > 100) and (side _x in [teamPlayer,civilian])) then {_absentPlayers pushBackUnique name _x;};
} forEach (allPlayers - (entities "HeadlessClient_F"));

if (count _absentPlayers > 0) exitWith {
	if (count _absentPlayers > 10) then {
		[_titleStr, localize "STR_A3A_fn_dialogs_skiptime_no_radius"] call A3A_fnc_customHint;};
	} else {
		private _lastPlayer = _absentPlayers deleteAt (count _absentPlayers - 1);
		private _absentString = _absentPlayers joinString ", ";
		[_titleStr, format [localize "STR_A3A_fn_dialogs_skiptime_no_radius",_absentString,_lastPlayer]] call A3A_fnc_customHint;
	};

remoteExec ["A3A_fnc_resourcecheckSkipTime", 0];
