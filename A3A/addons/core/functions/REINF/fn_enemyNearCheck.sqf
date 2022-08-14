/*
Author: [A3A Team]
    Enemy near searches
Arguments:
    0.<ANY>  object/location/postion that will be used for the center of search
Return Value:
    <BOOL> 		if enemies are near

Scope: Clients
Environment: Unscheduled
Public: yes
Dependencies: 

Example:
    [cursorObject] call A3A_fnc_enemyNearCheck; 
*/

params ["_unitPos"];



private _nearEnemies = (units Occupants + units Invaders) inAreaArray [_unitPos, enemyNearDistance, enemyNearDistance];
_nearEnemies = _nearEnemies select { behaviour _x == "COMBAT" and _x call A3A_fnc_canFight };


(_nearEnemies isNotEqualTo [])




