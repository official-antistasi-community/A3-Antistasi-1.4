/*
    Author: [Håkon]
    Description:
        removes unused weapons (exludes pylons)

    Arguments:
    0. <Object> Vehicle to clean up weapons from vehicle

    Return Value:
    <nil>

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_veh] call HR_GRG_fnc_removeUnusedWeapons;

    License: MIT License
*/
params [["_veh", objNull, [objNull]]];

private _weaponItems = weaponsItems _veh select { !((_x#4) isEqualTo []) };

{
    private _turretPath = _x;
    private _weapons = (_veh weaponsTurret _turretPath);
    private _turretMags = _veh magazinesTurret [_turretPath, false]; // use alternate syntax otherwise path of [0,0] etc. will error out

    private _turretWeapon = _weaponItems select {(_x#0) in _weapons};
    if (_turretWeapon isEqualTo []) then {continue};
    {
        if !((_x#4#0) in _turretMags) then { _veh removeWeaponTurret [_x#0, _turretPath] };
    } forEach _turretWeapon;
} forEach (allTurrets _veh) + [[-1]];
