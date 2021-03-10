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
[] call HR_GRG_fnc_validateGarage;

//mark init complete
HR_GRG_Init = true;
publicVariable "HR_GRG_Init";
