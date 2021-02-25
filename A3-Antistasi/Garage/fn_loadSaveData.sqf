/*
    Author: [Håkon]
    Description:
        Loads garage from garage save data

    Arguments:
    0. <Struct> [
        <Array> [
            Array [
                <Struct> [
                    <String> Vehicle display name
                    <String> Vehicle classname
                    <String> Vehicl lock UID
                    <String> Vehicle check out UID
                    <Int>    Vehicle UID
                ] Vehicle data
            ] Vehicle category
        ] Garage vehicle data

        <Int> Last vehicle UID

        <Array> [
            <Array> [Vehicle UID] Ammo sources
            <Array> [Vehicle UID] Fuel sources
            <Array> [Vehicle UID] Repair sources
        ] Sources
    ] Garage save data

    Return Value:
    <Bool> Save loaded

    Scope: Server
    Environment: unscheduled
    Public: Yes
    Dependencies:

    Example: [_save] call HR_GRG_fnc_loadSaveData;

    License: MIT License
*/
if (!isServer) exitWith {false};
#include "defines.inc"
params ["_save"];
_save params ["_garage", "_uid", "_sources"];

HR_GRG_Vehicles = +_garage;
HR_GRG_UID = +_uid;
HR_GRG_Sources = +_sources;

diag_log (str serverTime + " | Red Rebelion | Garage | Trace | " + format ["Vehicles Loaded: %1",HR_GRG_Vehicles]);
diag_log (str serverTime + " | Red Rebelion | Garage | Trace | " + format ["UID Loaded: %1",HR_GRG_UID]);
diag_log (str serverTime + " | Red Rebelion | Garage | Trace | " + format ["Sources Loaded: %1",HR_GRG_Sources]);

if (isNil "HR_GRG_Sources") exitWith {HR_GRG_Sources = [[],[],[]]};
{
    [_forEachIndex] call HR_GRG_fnc_declairSources;
} forEach HR_GRG_Sources;

true;
