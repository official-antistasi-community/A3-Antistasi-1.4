/*
    Author: [Håkon]
    Description:
        strips pylon weapons to avoid unusable dry weapons in the vehicle on use

        note: needs to be called on vehicle before state restoration or pylon modifications

    Arguments:
    0. <Object> Vehicle to clean up weapons from vehicle

    Return Value:
    <nil>

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_veh] call HR_GRG_fnc_prepPylons;

    License: MIT License
*/
params [["_veh", objNull, [objNull]]];

private _toRemove = [];
{
    if ( (_x#0) isEqualTo "rhs_weap_MASTERSAFE" ) then { continue }; //RHS mastersafe compat
    if ( (_x#4) isEqualTo [] ) then { _toRemove pushBack (_x#0) };
} forEach weaponsItems _veh;

{
    private _turretPath = _x;
    { _veh removeWeaponTurret [_x, _turretPath] } forEach _toRemove;
} forEach ((allTurrets _veh) + [[-1]]);
