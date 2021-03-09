/*
    Author: [Håkon]
    [Description]
        initilizes the garage on the server

    Arguments:
    0. <nil>

    Return Value:
    <>

    Scope: Server
    Environment: unscheduled
    Public: [Yes]
    Dependencies:

    Example: [] call HR_GRG_fnc_initServer;

    License: MIT License
*/
#include "config.inc"
#include "defines.inc"
Trace("Running server init");

if (isNil "HR_GRG_Vehicles") then {[] call HR_GRG_fnc_loadSaveData};
if (isNil "HR_GRG_Users") then {HR_GRG_Users = []};

//validate and fix garage vehicle pool
private _invalidentries = [];
_cfg = (configFile >> "CfgVehicles");
{
    private _cat = _x;
    private _catIndex = _forEachIndex;
    {
        private _veh = _cat get _x;
        private _class = _veh#1;
        if !(isClass (_cfg >> _class)) then {_invalidentries pushBack [_catIndex, _x]};
    } forEach (keys _x);
} forEach HR_GRG_Vehicles;

{
    _x params ["_catIndex", "_entry"];
    private _cat = HR_GRG_Vehicles#_catIndex;
    _cat deleteAt _entry;
} forEach _invalidentries;

//mark init complete
HR_GRG_Init = true;
publicVariable "HR_GRG_Init";
