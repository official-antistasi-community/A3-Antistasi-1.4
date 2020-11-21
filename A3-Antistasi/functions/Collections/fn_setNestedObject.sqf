/*
Function:
    A3A_fnc_setNestedObject

Description:
    Exactly the same as nesting getVariables to find final object to set variable on.
    Allows something similar in effect to a dynamic config.
    missionNamespace > "A3A_UIDPlayers" > "1234567890123456" > "equipment" > "weapon".
    Will create tree as it works towards final value.

Scope:
    <LOCAL> Interacts with many objects. Should not be networked.

Environment:
    <UNSCHEDULED> Recommended as it queries global data. | <SCHEDULED> Not recommended.

Parameters:
    <VARSPACE/OBJECT> Parent variable space
    <STRING> Names of nested locations {0 ≤ repeat this param < ∞}
    ...
    <STRING> Name of variable.
    <ANY> Default value.

Returns:
    <LOCATION> last varSpace; locationNull if issue.

Exceptions:
    ["nameAlreadyInUse",_details] If the desired name of a new nested location already holds another value type other than locationNull.

Examples:
    [player, "lootBoxesOpened", 5] call A3A_fnc_setNestedObject;
        // is equal to player setVariable ["lootBoxesOpened", 5, false];

    [missionNamespace, "A3A_UIDPlayers", "1234567890123456", "equipment", "weapon", "SMG_02_F"] call A3A_fnc_setNestedObject;
        // Is almost Equal to:    (* creates namespaces if not already defined)
        // _1 = missionNamespace getVariable ["A3A_UIDPlayers", *];
        // _2 = _1 getVariable ["1234567890123456", *];
        // _3 = _2 getVariable ["equipment", *];
        // _3 setVariable ["weapon", "SMG_02_F"];

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
private _count = count _this;
private _varSpace = _this#0;
private _lastVarSpace = _varSpace;
for "_i" from 1 to _count - 3 do {
    _lastVarSpace = _varSpace;
    _varSpace = _lastVarSpace getVariable [_this#_i, locationNull];
    if (!(_varSpace isEqualType locationNull)) exitWith {
        throw ["nameAlreadyInUse",["Variable '",_this#_i,"' in (",(_this select [0,_i]) joinString " > ",") already has <",typeName _varSpace,"> '",str _varSpace,"'."] joinString ""];
    };
    if (isNull _varSpace) then {
        _varSpace = [false] call A3A_fnc_createNamespace;
        _lastVarSpace setVariable [_this#_i,_varSpace];
    };
};
_varSpace setVariable [_this#(_count-2), _this#(_count-1)];
_varSpace;
