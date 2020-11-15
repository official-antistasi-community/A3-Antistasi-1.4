if (player != theBoss) exitWith {["Clean Forest", "Only Commanders can order to clean the forest"] call A3A_fnc_customHint;};
{ _x hideObjectGlobal true } foreach (nearestTerrainObjects [getMarkerPos respawnTeamPlayer,["tree","bush","small tree"],70]);
["Clean Forest", "You've cleared the surroundings of trees and bushes"] call A3A_fnc_customHint;
chopForest = true; publicVariable "chopForest";
