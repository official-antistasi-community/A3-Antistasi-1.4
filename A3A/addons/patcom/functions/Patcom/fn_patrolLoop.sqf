/*
    Author: [Hazey]
    Description:
		Patrol Loop, Add's units to Array to be controlled.

    Arguments:
    	N/A

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[] call A3A_fnc_patrolLoop;

    License: MIT License

	Todo: 
		Giddi: Make sleep dynamic with AI population - hazey: Good idea.
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
	"_group",
	["_patrolType", "Patrol_Area"], 
	["_minDist", 0], 
	["_maxDist", 100], 
	["_dist", -1], 
	["_fromCenter", true], 
	["_centerPos", []], 
	["_searchBuildings", false]
];

waitUntil {((!isNil "PATCOM_INIT_COMPLETE") && (PATCOM_INIT_COMPLETE))};

[_group, _patrolType, _minDist, _maxDist, _dist, _fromCenter, _centerPos, _searchBuildings] spawn {
	params ["_group","_patrolType", "_minDist", "_maxDist", "_dist", "_fromCenter", "_centerPos", "_searchBuildings"];

	if (count _centerPos < 3) then {
		_centerPos = (getPos (leader _group));
	};

	if !((side leader _group) == civilian) then {
		[_group, _patrolType, _minDist, _maxDist, _dist, _fromCenter, _centerPos, _searchBuildings] call A3A_fnc_patrolSetParams;
	};

	while {true} do {
		private _aiLoad = [PATCOM_AI_LOAD] call A3A_fnc_patrolAILoad;

		if ((isNull _group) || (({alive _x} count units _group) < 1)) exitWith {};

		// Will not run unless PATCOM_Controlled is set to false.
		[_group] call A3A_fnc_patrolGroupVariables;

		if ((side leader _group) == civilian) then {
			[_group] call A3A_fnc_patrolCivilianCommander;
		} else {
			[_group] call A3A_fnc_patrolCommander;
		};

		sleep _aiLoad;
	};
};