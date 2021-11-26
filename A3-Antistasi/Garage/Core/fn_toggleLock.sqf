/*
    Author: [Håkon]
    [Description]
        Toggles lock of current vehicle

    Arguments:
    0. <String> player UID
    1. <Object> Player
    2. <Array>  vehicle to lock [Category, Index] (intended use with HR_GRG_SelectedVehicles)

    Return Value:
    <>

    Scope: Server
    Environment: Uncheduled
    Public: [No]
    Dependencies:

    Example: [HR_GRG_PlayerUID, player, HR_GRG_SelectedVehicles] remoteExecCall ["HR_GRG_fnc_toggleLock",2];

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_UID", "_player", "_selectedVehicle"];
if (!isServer) exitWith {};
_selectedVehicle params [["_catIndex", -1], ["_vehUID", -1]];
if ( (_catIndex isEqualTo -1) || (_vehUID isEqualTo -1) ) exitWith {};
Trace_2("Attempting to toggle lock for vehicle at cat: %1 | Vehicle ID: %2", _catIndex, _vehUID);

private _cat = HR_GRG_Vehicles#_catIndex;
private _veh = _cat get _vehUID;
private _lock = _veh#2;
private _owner = _veh#5;
_succes = call {
    if ( _lock isEqualTo "" ) exitWith { true };
    if ( _lock isEqualTo _UID) exitWith { _UID = ""; true };
    if (_player isEqualTo (_player call HR_GRG_cmdClient)) exitWith { _UID = ""; Info_4("Commander unlock | Vehicle ID: %1 | Owner: %2 [%3] | Commander: %4[%5]", _vehUID, _owner, _lock, name _player, _UID); true };
    false
};

if (_succes) exitWith {
    _veh set [2, _UID];
    _veh set [5, [name _player, ""] select (_UID isEqualTo "")];
    [_UID, nil, _catIndex, _vehUID, _player, false] call HR_GRG_fnc_broadcast;
    Info_3("Lock state toggled for Vehicle ID: %1 | By: %2 | Locked: %3", _vehUID, name _player, (_UID isNotEqualTo ""));
};
Trace("Failed to toggle lock");
