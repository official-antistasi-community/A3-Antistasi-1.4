/*
    Author: [Håkon]
    [Description]


    Arguments:
        0. <Object> Vehicle to set damage state off
        1. <Array> [
            <Scalar> Overall damage
            <Array> Hitpoint damage
            <Scalar> Repair cargo
        ] Damage state

    Return Value: <nil>

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example:

    License: APL-ND
*/
params ["_vehicle", "_dmgStats"];
if !(local _vehicle) exitWith {};
_dmgStats params [["_dmg",0,[0]], ["_hitDmg", [], [[]]], ["_repairCargo", -1, [0]]];
private _restoreState = [0,1] select (HR_GRG_hasRepairSource && !HR_GRG_ServiceDisabled_Repair);
_vehicle setDamage ([_dmg, 0] # _restoreState);

if (_hitDmg#0 isEqualTo []) then {_hitDmg = _hitDmg#1}; //temp compat while testing, old had selection names we no longer care about those
{
    _vehicle setHitIndex [_forEachIndex, [_x, 0] # _restoreState , false];
} forEach _hitDmg;

_vehicle setRepairCargo _repairCargo;
