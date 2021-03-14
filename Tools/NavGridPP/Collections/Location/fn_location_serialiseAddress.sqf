/*
Author: Caleb Serafin
    WORK IN PROGRESS
    Turns a parent array into a string.
    attempts to recurse up tree if root is not a namespace.
    Process can be reversed by deserialise.

Arguments:
    <VARSPACE/OBJECT> Root variable space
    <STRING> Names of nested locations {0 ≤ repeat this param < ∞}
    ...
    <STRING> Name of final location.

Return Value:
    <STRING> serialisation of namespace parents.

Scope: Local return. Local arguments.
Environment: Any.
Public: Yes

Example:
    [localNamespace,"Collections","TestBucket","NewLocation"] call Col_fnc_location_serialiseAddress;  // "col_locaddress:[4,""collections"",""testbucket"",""newlocation""]"
*/
private _parentArray = [_this] param [0, [missionNamespace], [ [] ]];
if (count _parentArray < 2) exitWith {
    diag_log "WARNING: Col_fnc_location_serialiseAddress: Less than one parent plus name."; // TODO: implement overridable method for logging.
    "";
};

private _root = _parentArray#0;
switch (true) do {
    case (_root isEqualType 0): {
        toLower ("col_locaddress:" + str _parentArray);
    };
    case (_root isEqualType missionNamespace): {
        _parentArray set [0,([locationNull,_root] call Col_fnc_serialise_namespace)#1];
        toLower ("col_locaddress:" + str _parentArray);
    };
    case (_root isEqualType locationNull): {
        _textRoot = text _root;
        if ((_textRoot select [0,15]) isEqualTo "col_locaddress:" ) then {
            _parentArray deleteAt 0;
            toLower str (parseSimpleArray (_textRoot select [15,1e9]) + _parentArray);
        } else {
            diag_log "WARNING: Col_fnc_location_serialiseAddress: Location at address root does not contain col_locaddress meta data."; // TODO: implement overridable method for logging.
            "";
        };
    };
    default {
        diag_log "WARNING: Col_fnc_location_serialiseAddress: Address root of type <"+typeName _root+">."; // TODO: implement overridable method for logging.
        "";
    };
};
