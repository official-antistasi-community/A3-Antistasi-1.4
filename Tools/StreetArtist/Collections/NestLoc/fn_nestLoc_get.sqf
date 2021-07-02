/*
Author: Caleb Serafin
    Exactly the same as nesting getVariables.
    Allows something similar in effect to a dynamic config.
    missionNamespace > "A3A_UIDPlayers" > "1234567890123456" > "equipment" > "weapon".

Arguments:
    <VARSPACE/OBJECT> Parent variable space
    <STRING> Names of nested objects {0 ≤ repeat this param < ∞}
    ...
    <STRING> Name of variable.
    <ANY> Default value.

Return Value:
    <ANY> Queried value or default;

Scope: Local, Interacts with many objects. Should not be networked.
Environment: Unscheduled, Recommended as it queries possibly changing data. | Scheduled will work, but may cause race conditions.
Public: Yes

Example:
    _lootNo = [player, "lootBoxesOpened", 0] call Col_fnc_nestLoc_get;
        // is equal to _lootNo = player getVariable ["lootBoxesOpened", 0, false];

    _gun = [missionNamespace, "A3A_UIDPlayers", "1234567890123456", "equipment", "weapon", "hgun_Pistol_heavy_01_F"] call Col_fnc_nestLoc_get;
        // Is almost Equal to:    (* returns default if any namespaces is not defined)
        // _1 = missionNamespace getVariable ["A3A_UIDPlayers", *];
        // _2 = _1 getVariable ["1234567890123456", *];
        // _3 = _2 getVariable ["equipment", *];
        // _lootNo = _3 getVariable ["weapon", "hgun_Pistol_heavy_01_F"];
*/
private _count = count _this;
if (_count < 2) then {
    diag_log "ERROR: Col_fnc_nestLoc_get: params has less than 2 values. If no log bellow, params were nil."; // TODO: implement overridable method for logging.
    diag_log ("ERROR: Col_fnc_nestLoc_get: params: '"+str _this+"'");
};
private _varSpace = _this#0;
for "_i" from 1 to _count - 3 do {
    _varSpace = _varSpace getVariable [_this#_i, false];
    if (!(_varSpace isEqualType locationNull) || {isNull _varSpace}) exitWith {
        _varSpace = locationNull;
    };
};
_varSpace getVariable [_this#(_count-2), _this#(_count-1)];
