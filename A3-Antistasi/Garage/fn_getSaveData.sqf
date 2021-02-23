/*
    Author: [Håkon]
    Description:
        gets garage save data

    Arguments: <Nil>

    Return Value:
    <Struct> [
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

    Scope: Server
    Environment: unscheduled
    Public: Yes
    Dependencies:

    Example: [] call HR_GRG_fnc_getSaveData;

    License: MIT License
*/
if (!isServer) exitWith {};
#include "defines.inc"
//get data to be saved
private _garage = HR_GRG_Vehicles call HR_GRG_fnc_removeReferences;
private _UID = HR_GRG_UID call HR_GRG_fnc_removeReferences;
private _sources = HR_GRG_Sources call HR_GRG_fnc_removeReferences;
diag_log (str serverTime + " | Red Rebelion | Garage | Trace | " + format ["Sources Loaded: %1",_sources]);

//correct some data to savable state
{
    {
        _x set [3, ""]; //remove checkouts
    } forEach _x;
} forEach _garage;

//return save data struct
[_garage, _UID, _sources];
