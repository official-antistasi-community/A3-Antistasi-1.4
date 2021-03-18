#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_unit"];

private _friendlyPlayers = ({(side group _x == teamPlayer)} count (call A3A_fnc_playableUnits));
private _enemyPlayers = count (call A3A_fnc_playableUnits) - _friendlyPlayers;

// Player checks to prevent them logging into PvP for whatever reason.
switch (true) do {
	case (!_isJip): {
		["noJip",false,1,false,false] call BIS_fnc_endMission;
        Info("Player kicked as they are not Jipping");
	};

	case (!pvpEnabled): {
		["noPvP",false,1,false,false] call BIS_fnc_endMission;
        Info("Player kicked as PvP slots are disabled");
	};

	case (!([_unit] call A3A_fnc_isMember)): {
		["pvpMem",false,1,false,false] call BIS_fnc_endMission;
        Info("PvP player kicked because they are not a member.");
	};

	case (_enemyPlayers > _friendlyPlayers): {
		["pvpCount",false,1,false,false] call BIS_fnc_endMission;
        Info("PvP player kicked because there are wayyyyyy too many PvP players..");
	};

	case (_friendlyPlayers < minPlayersRequiredforPVP): {
		["pvpCount",false,1,false,false] call BIS_fnc_endMission;
        Info("PvP player kicked as there are not enough normal players.");
	};

	case (isnil "theBoss" || {isNull theBoss}): {
		["BossMiss",false,1,false,false] call BIS_fnc_endMission;
        Info("PvP player kicked as there is no Rebel Commander.");
	};

	default {
        Info("PvP player logged in, doing server side checks if the player has been rebel recently.");
		[_unit] remoteExec ["A3A_fnc_playerHasBeenPvPCheck",2];
	};
};
