if (player != theBoss) exitWith {["Clean Forest", "Only Commanders can order to clean the forest"] call A3A_fnc_customHint;};
{ [_x, true] remoteExec ["hideObjectGlobal",2] } forEach (nearestTerrainObjects [getMarkerPos respawnTeamPlayer,["tree","bush","small tree"],70]);
["Clean Forest", "You've cleared the surroundings of trees and bushes"] call A3A_fnc_customHint;
chopForest = true; publicVariable "chopForest";
