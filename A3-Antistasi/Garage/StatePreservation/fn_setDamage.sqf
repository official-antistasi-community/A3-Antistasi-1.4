/*
    Author: [Håkon]
    [Description]
        

    Arguments:
        0. <Object> Vehicle to set damage state off
        1. <Array> [
            <Int> Overall damage
            <Array> Hitpoint damage
            <Int> Repair cargo
        ] Damage state

    Return Value: <nil>

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example:

    License: MIT License
*/
params ["_vehicle", "_dmgStats"];
if !(local _vehicle) exitWith {};
_dmgStats params [["_dmg",0,[0]], ["_hitDmg", [[],[]], [[]]], ["_repairCargo", -1, [0]]];
_vehicle setDamage ([_dmg,0] select HR_GRG_hasRepairSource);
for "_i" from 0 to count (_hitDmg#1) - 1 do {
    private _hit = _hitDmg#0#_i;
    private _dmg = _hitDmg#1#_i;
    _vehicle setHit [_hit, [_dmg, 0] select HR_GRG_hasRepairSource, false];
};
_vehicle setRepairCargo _repairCargo;
