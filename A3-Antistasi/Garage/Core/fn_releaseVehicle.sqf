/*
    Author: [Håkon]
    [Description]
        releases claim on vehicle, or if it cant release indicated vehicle it will release all vehicles in the category as a safety

    Arguments:
    0. <String> Player UID
    1. <Int>    Category of vehicle
    2. <Int>    Index of vehicle

    Return Value:
    <Bool> successful

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_UID, _cat, _index] remoteExecCall ["HR_GRG_fnc_releaseVehicle",2];

    License: MIT License
*/
#include "defines.inc"
params [["_UID","",[""]], ["_cat", -1, [0]], ["_index", -1, [0]], ["_bc", true, [true]]];
Trace_4("Attempting targeted vehicle release | UID: %1 | Cat: %2 | Index: %3 | BC: %4" ,_UID,_cat,_index,_bc);
if (!isServer) exitWith {false};
if (_UID isEqualTo "") exitWith {false};

_category = HR_GRG_Vehicles#_cat;

//Try to do a targeted releas of the vehicle
_veh = _category get _index;
if ( (_veh#3) isEqualTo _UID) exitWith { _veh set [3, ""]; true };

// targeted release failed, doing broad release
Trace("Targetted release failed, doing broad release");
{
    if ( (_x#3) isEqualTo _UID) then { _x set [3, ""] };
} forEach _category;

if (_bc) then {
    [] call HR_GRG_fnc_broadcast;
};

true
