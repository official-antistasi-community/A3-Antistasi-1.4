/*
    Author: [Håkon]
    Description:
        Sets restores the ammo state of a vehicle based on its ammo data

    Arguments:
    0. <Object> Vehicle to restore ammo state
    1. <Array>
        <Struct>[
            <Bool> if is pylon

            <Struct> [ //if not pylon
                <String> Weapon name
                <Int> Ammo count
            ] Weapon Data

            or

            <Struct> [ //if pylon
                <Int> pylon index
                <String> pylon name
                <Array> Turret path
                <String> Magazine name
                <Int> Magazine ammo count
            ] Pylon data
        ]
    ] Ammo Data

    Return Value:
    <Nil>

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_vehicle, _ammoData] call HR_GRG_fnc_setAmmoData;

    License: MIT License
*/
params ["_vehicle", "_ammoData"];
if !(local _vehicle) exitWith {};
if (HR_GRG_hasAmmoSource) exitWith {};
private _weaponData = _ammoData select {!(_x#0)};
private _pylonData = _ammoData - _weaponData;

{ _vehicle setAmmo (_x#1) } forEach _weaponData;

{
    (_x#1) params ["_index", "", "_turret", "_mag", "_count"];
    _vehicle setPylonLoadOut [_index, _mag, false, _turret]; //claims effect local, actually global
    _vehicle setAmmoOnPylon [_index, _count]; //global effect
} forEach _pylonData;
