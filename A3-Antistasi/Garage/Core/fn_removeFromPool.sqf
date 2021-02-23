/*
    Author: [Håkon]
    [Description]
        removes all checked out vehicles from the vehicle pool

    Arguments:
    0. <Int> Client UID

    Return Value:
    <Bool> succesfull

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [HR_GRG_PlayerUID] remoteExecCall ["HR_GRG_fnc_removeFromPool",_recipients];

    License: MIT License
*/
#include "defines.inc"
params [["_UID", "", [""]], ["_player", objNull, [objNull]]];
Trace_1("Removing vehicles from garage with UID: %1", _UID);
if (_UID isEqualTo "") exitWith {false};

//find vehicles to remove
private _toRemove = [];
{
    _catIndex = _forEachIndex;
    {
        if ((_x#3) isEqualTo _UID) then {_toRemove pushBack [_catIndex, _x]};
    } forEach _x;
} forEach HR_GRG_Vehicles;

//remove vehicles
{
    //remove vehicle
    _x params ["_catIndex", "_entry"];
    private _cat = HR_GRG_Vehicles#_catIndex;
    private _removedVeh = _cat deleteAt (_cat find _entry);

    //remove from source registre
    private _vehUID = _removedVeh#4;
    {
        private _index = _x find _vehUID;
        if (_index != -1) exitWith {
            (HR_GRG_Sources#_forEachIndex) deleteAt _index;
            [_forEachIndex] call HR_GRG_fnc_declairSources;
        };
    }forEach HR_GRG_Sources;

} forEach _toRemove;

//refresh category if client
if (!isNull player) then {
    {
        if (ctrlEnabled _x) then {
            [_x, _forEachIndex] call HR_GRG_fnc_reloadCategory;
        };
    } forEach HR_GRG_Cats;
};

//logging is low priority do it after done modifying the pool
{
    (_x#1) params ["_dispName", "", "", "_UID", "_vehUID"];
    LogDebug_4("Vehicle ungaraged | By: %1 [%2] | Type: %3 | Vehicle ID: %4", name _player, _UID, _dispName, _vehUID);
} forEach _toRemove;

true
