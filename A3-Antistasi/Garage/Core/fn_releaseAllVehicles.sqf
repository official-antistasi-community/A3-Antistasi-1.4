/*
    Author: [Håkon]
    [Description]
        releases all claims on vehicles

    Arguments:
    0. <String> Player UID

    Return Value:
    <Bool> Success

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_UID] remoteExecCall ["HR_GRG_fnc_releaseAllVehicles",_recipients];

    License: MIT License
*/
#include "defines.inc"
params [ ["_UID" ,"", [""]]];
if (_UID isEqualTo "") exitWith {false};
Trace_1("Releasing all vehicles with UID: %1", _UID);

//release all vehicles in all HR_GRG_categories
{
    private _hash = _x;
    {
        _veh = _hash get _x;
        if ( (_veh#3) isEqualTo _UID) then {_veh set [3, ""] };
    } forEach (keys _x);
} forEach HR_GRG_Vehicles;

//refresh category if client
if (!isNull player) then {
    {
        if (ctrlEnabled _x) then {
            [_x, _forEachIndex] call HR_GRG_fnc_reloadCategory;
        };
    } forEach HR_GRG_Cats;
};

true
