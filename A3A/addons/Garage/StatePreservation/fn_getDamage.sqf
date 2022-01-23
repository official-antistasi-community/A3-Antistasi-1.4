/*
    Author: [Håkon]
    [Description]


    Arguments:
        0. <Object> Vehicle to get damage state from

    Return Value:
        <Array> [
            <Scalar> Overall damage
            <Array> Hitpoint damage
            <Scalar> Repair cargo
        ] Damage state

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example:

    License: APL-ND
*/
params ["_vehicle"];
private _dmg = damage _vehicle min 0.89;
private _hitPointDamage = getAllHitPointsDamage _vehicle;
if !(_hitPointDamage isEqualTo []) then { //ensure it has hitpoints
    _hitPointDamage = _hitPointDamage#2
};
private _repairCargo = getRepairCargo _vehicle;

[_dmg, _hitPointDamage, _repairCargo];
