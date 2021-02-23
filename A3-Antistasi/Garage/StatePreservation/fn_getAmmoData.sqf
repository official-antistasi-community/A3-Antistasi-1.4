/*
    Author: [Håkon]
    Description:
        Returns Ammo data for a vehicle

    Arguments:
    0. <Object> Vehicle

    Return Value:
    <Array>
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

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_veh] call HR_GRG_fnc_getPylonData;

    License: MIT License
*/
params [["_veh", objNull, [objNull]]];

private _nonPylon = weaponsItems _veh select {! ((_x#4) isEqualTo []) };
_nonPylon = _nonPylon apply { [false, [_x#0, _x#4#1]] }; // [<Bool>Pylon, <Array>[<String>Weapon, <Int>Ammo] Ammo Detail ]

private _pylonsCfg = (configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent");

private _pylonAmmo = [];
private _magName = getPylonMagazines _veh;
{
    private _pylonIndex = _forEachIndex + 1;
    _pylonAmmo pushBack [
        true
        , [
            _pylonIndex
            , configName _x
            , [_veh, _pylonIndex] call HR_GRG_fnc_getPylonTurret
            , _magName#_forEachIndex
            , _veh ammoOnPylon _pylonIndex
        ]
    ];
} forEach ("true" configClasses (_pylonsCfg >> "Pylons"));

_nonPylon + _pylonAmmo
