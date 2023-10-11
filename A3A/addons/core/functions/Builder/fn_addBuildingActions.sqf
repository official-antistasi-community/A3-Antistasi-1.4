/*
Description:
    Client-side function to add actions for building and cancelling construction

Environment: Client, unscheduled
Arguments:
    1. <object> Plank object to add actions for
    2. <number> Hold time for build action (object type dependent) 
*/

params ["_plankObject", "_holdTime"];

[
    _plankObject,
    "Build",
    "a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    "a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    'player getUnitTrait "engineer"',
    "[player] call A3A_fnc_canFight",
    {},
    {},
    {
        [_this#0, true] remoteExecCall ["A3A_fnc_buildingComplete", 2];
    },
    {},
    [],
    _holdTime
] call BIS_fnc_holdActionAdd;

_plankObject addAction ["Cancel",
    {
        [_this#0, false] remoteExecCall ["A3A_fnc_buildingComplete", 2];
    },
    nil,
    1.5,
    true,
    true,
    "",
    'player getUnitTrait "engineer"',
    10
];
