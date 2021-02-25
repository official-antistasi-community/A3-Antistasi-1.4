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
private _garage = call compile str HR_GRG_Vehicles; //have had issus with refrences persisting trough save procces causing mangling of save data
private _UID = call compile str HR_GRG_UID;
private _sources = call compile str HR_GRG_Sources;

//correct some data to savable state
{
    {
        _x set [3, ""]; //remove checkouts
    } forEach _x;
} forEach _garage;

//log the save data (due to issues with save mangeling)
diag_log (str serverTime + " | Red Rebelion | Garage | Trace | " + format ["Vehicles saved: %1",_garage]);
diag_log (str serverTime + " | Red Rebelion | Garage | Trace | " + format ["UID saved: %1",_UID]);
diag_log (str serverTime + " | Red Rebelion | Garage | Trace | " + format ["Sources saved: %1",_sources]);

//return save data struct
[_garage, _UID, _sources];
