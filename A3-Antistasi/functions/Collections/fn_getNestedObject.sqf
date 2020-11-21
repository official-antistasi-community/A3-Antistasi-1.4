/*
Function:
    A3A_fnc_getNestedObject

Description:
    Exactly the same as nesting getVariables.
    Allows something similar in effect to a dynamic config.
    missionNamespace > "A3A_UIDPlayers" > "1234567890123456" > "equipment" > "weapon".

Scope:
    <LOCAL> Interacts with many objects. Should not be networked.

Environment:
    <UNSCHEDULED> Recommended as it queries global data. | <SCHEDULED> Not recommended.

Parameters:
    <VARSPACE/OBJECT> Parent variable space
    <STRING> Names of nested objects {0 ≤ repeat this param < ∞}
    ...
    <STRING> Name of variable.
    <ANY> Default value.

Returns:
    <ANY> Queried value or default;

Examples:
    _lootNo = [player, "lootBoxesOpened", 0] call A3A_fnc_getNestedObject;
        // is equal to _lootNo = player getVariable ["lootBoxesOpened", 0, false];

    _gun = [missionNamespace, "A3A_UIDPlayers", "1234567890123456", "equipment", "weapon", "hgun_Pistol_heavy_01_F"] call A3A_fnc_getNestedObject;
        // Is almost Equal to:    (* returns default if any namespaces is not defined)
        // _1 = missionNamespace getVariable ["A3A_UIDPlayers", *];
        // _2 = _1 getVariable ["1234567890123456", *];
        // _3 = _2 getVariable ["equipment", *];
        // _lootNo = _3 getVariable ["weapon", "hgun_Pistol_heavy_01_F"];

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
private _count = count _this;
private _varSpace = _this#0;
for "_i" from 1 to _count - 3 do {
    _varSpace = _varSpace getVariable [_this#_i, false];
    if (!(_varSpace isEqualType locationNull) || {isNull _varSpace}) exitWith {
        _varSpace = locationNull;
    };
};
_varSpace getVariable [_this#(_count-2), _this#(_count-1)];
