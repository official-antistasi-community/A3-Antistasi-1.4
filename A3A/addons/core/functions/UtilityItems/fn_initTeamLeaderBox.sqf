/*
Author: [Killerswin2]
	creates the add action for teamleaders
Arguments:
	object to add action to
Return Value:
	NONE
Scope: Client
Environment: Unscheduled
Public: 
no
Example:
[_object] call A3A_fnc_initTeamLeaderBox;
*/

params[["_object", objNull, [objNull]],["_jipKey", "", [""]]];

if (isNull _object) exitwith {remoteExec ["", _jipKey];};

_object addAction [
    "TeamLeader Placer",
    {
		if ([getPosATL (_this#3)] call A3A_fnc_enemyNearCheck) exitWith {
			["TeamLeader Placer", "You can not use the placer while there are enemies nearby."] call A3A_fnc_customHint;
		};
        [_this#3, 75] call A3A_fnc_teamLeaderRTSPlacer;
    },
    _object,
    1.5,
    true,
    true,
    "",
    "(
        ((typeOf _this) isEqualTo 'I_G_Soldier_TL_F') or (_this == theBoss)
    )", 
    4
];