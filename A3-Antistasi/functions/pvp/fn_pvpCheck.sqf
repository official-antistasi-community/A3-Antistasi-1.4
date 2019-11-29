private _filename = "fn_pvpCheck";

params ["_unit"];

private _friendlyPlayers = ({(side group _x == teamPlayer)} count playableUnits);
private _enemyPlayers = count playableUnits - _friendlyPlayers;

// Player checks to prevent them logging into PvP for whatever reason.
switch (true) do {
	case (!_isJip): {
		["noJip",false,1,false,false] call BIS_fnc_endMission;
		[2,"Player kicked as they are not Jipping",_filename] call A3A_fnc_log;
	};

	case (!pvpEnabled): {
		["noPvP",false,1,false,false] call BIS_fnc_endMission;
		[2,"Player kicked as PvP slots are disabled",_filename] call A3A_fnc_log;
	};

	case (!([_unit] call A3A_fnc_isMember)): {
		["pvpMem",false,1,false,false] call BIS_fnc_endMission;
		[2,"PvP player kicked because they are not a member.",_filename] call A3A_fnc_log;
	};

	case (_enemyPlayers > _friendlyPlayers): {
		["pvpCount",false,1,false,false] call BIS_fnc_endMission;
		[2,"PvP player kicked because there are wayyyyyy too many PvP players..",_filename] call A3A_fnc_log;
	};

	case (_friendlyPlayers < minPlayersRequiredforPVP): {
		["pvpCount",false,1,false,false] call BIS_fnc_endMission;
		[2,"PvP player kicked as there are not enough normal players.",_filename] call A3A_fnc_log;
	};

	case (isnil "theBoss" || {isNull theBoss}): {
		["BossMiss",false,1,false,false] call BIS_fnc_endMission;
		[2,"PvP player kicked as there is no Rebel Commander.",_filename] call A3A_fnc_log;
	};

	default {
		[2,"PvP player logged in, doing server side checks if the player has been rebel recently.",_filename] call A3A_fnc_log;
		[_unit] remoteExec ["A3A_fnc_playerHasBeenPvPCheck",2];
	};
};