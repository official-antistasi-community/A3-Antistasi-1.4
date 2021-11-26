/*
Author: Caleb Serafin
    WORK IN PROGRESS
    Turns a path array into a string.
    attempts to recurse up tree if root is not a namespace.
    Process can be reversed by deserialise.

Arguments:
    <VARSPACE/OBJECT> Root variable space
    <STRING> Names of nested locations {0 ≤ repeat this param < ∞}
    ...
    <STRING> Name of final location.

Return Value:
    <STRING> serialisation of namespace path.

Scope: Local return. Local arguments.
Environment: Any.
Public: Yes

Example:
    [localNamespace,"Collections","TestBucket","NewLocation"] call Col_fnc_location_serialiseAddress;  // "col_locaddress:[4,""collections"",""testbucket"",""newlocation""]"
*/
private _pathArray = _this;
if (count _pathArray < 2) exitWith {
    diag_log "WARNING: Col_fnc_location_serialiseAddress: Less than one path plus a name. If no log bellow, params were nil."; // TODO: implement overridable method for logging.
    diag_log ("WARNING: Col_fnc_location_serialiseAddress: params: '"+str _this+"'");
    "";
};

private _root = _pathArray#0;
switch (true) do {
    case (_root isEqualType 0): {
        toLower ("col_locaddress:" + str _pathArray);
    };
    case (_root isEqualType missionNamespace): {
        _pathArray set [0,[missionNamespace,parsingNamespace,uiNamespace,profileNamespace,localNamespace] find _root];
        toLower ("col_locaddress:" + str _pathArray);
    };
    case (_root isEqualType locationNull): {
        _textRoot = text _root;
        if ((_textRoot select [0,15]) isEqualTo "col_locaddress:" ) then {
            _pathArray deleteAt 0;
            toLower str (parseSimpleArray (_textRoot select [15,1e9]) + _pathArray);
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
