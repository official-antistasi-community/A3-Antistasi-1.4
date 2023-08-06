/*
Author: Killerswin2
    Function that adds addActions for buyable items locally

Arguments:
    0.<Object> Object that we try to add actions to
    1.<String> Custom JIP key to prevent overwriting

Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: No
Dependencies:

Example:
    [_object, _jipKey] remoteExec [A3A_fnc_initObjectRemote, _jipKey];
*/
#include "..\..\script_component.hpp"

params [["_object", objNull, [objNull]],["_jipKey", "", [""]]];

// If object no longer exists, clear the JIP entry
if (isNull _object) exitwith {remoteExec ["", _jipKey]};

// Wait until client init is complete so that all the subsystems (inc utilityItemHM) are ready
if (isNil "initClientDone") then {
    waitUntil {sleep 1; !isNil "initClientDone"};
};

private _flags = (A3A_utilityItemHM get typeof _object) # 4;

// movable object
// TODO: Do we really want rotate on everything?
if ("move" in _flags) then {
    [_object] call A3A_fnc_initMovableObject;
};

// loot crate object
if ("loot" in _flags && lootToCrateRadius > 0) then {
    [_object] call A3A_fnc_initLootToCrate;
};

// packable object
if ("pack" in _flags) then {
    _object addAction [
        "Pack object",
        { _this#0 call A3A_Logistics_fnc_packObject },
        nil, 1.5, true, true, "",
        "(isNull attachedTo _originalTarget)", 10
    ];
};

// unpackable object
if ("unpack" in _flags) then {
    _object addAction [
        "Unpack object",
        { _this#0 call A3A_Logistics_fnc_unpackObject },
        nil, 1.5, true, true, "",
        "(isNull attachedTo _originalTarget)", 10
    ];
};

// specific to the tent
if (typeOf _object == "Land_MedicalTent_01_MTP_closed_F") then {
    _object addAction [
        "Open Doors",
        { _this#0 animateSource ["Door_Hide", 1, true] },
        nil, 1.5, true, true, "",
        "true", 10
    ];
};

// teamleader placer stuff
if ("team" in _flags) then {
    [_object] call A3A_fnc_initTeamLeaderBox;
};
