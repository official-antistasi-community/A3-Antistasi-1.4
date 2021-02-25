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

    Scope: Server,Server/HC,Clients,Any
    Environment: Scheduled/unscheduled/Any
    Public: [Yes/No]
    Dependencies:

    Example: [HR_GRG_PlayerUID, player, HR_GRG_SelectedVehicles] remoteExecCall ["HR_GRG_fnc_toggleLock",2];

    License: MIT License
*/
#include "defines.inc"
params ["_UID", "_player", "_selectedVehicle"];
if (!isServer) exitWith {};
_selectedVehicle params [["_catIndex", -1], ["_vehUID", -1]];
if ( (_catIndex isEqualTo -1) || (_vehUID isEqualTo -1) ) exitWith {};
Trace_2("Attempting to toggle lock for vehicle at cat: %1 | vehUID: %2", _catIndex, _vehUID);

private _cat = HR_GRG_Vehicles#_catIndex;
private _veh = _cat get _vehUID;
private _lock = _veh#2;
_succes = call {
    if ( _lock isEqualTo "" ) exitWith { true };
    if ( _lock isEqualTo _UID) exitWith { _UID = ""; true };
    if (_player isEqualTo call HR_GRG_cmdClient) exitWith { _UID = ""; true };
    false
};

if (_succes) exitWith {
    _veh set [2, _UID];
    [_UID, nil, _catIndex, _vehUID, _player, false] call HR_GRG_fnc_broadcast;
    Trace("Lock state toggled");
};
Trace("Failed to toggle lock");
