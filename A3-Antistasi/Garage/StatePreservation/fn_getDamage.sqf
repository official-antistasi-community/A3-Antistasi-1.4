params ["_vehicle"];
private _dmg = damage _vehicle min 0.89;
private _hitPointDamage = getAllHitPointsDamage _vehicle;
if (_hitPointDamage isEqualTo []) then {
    _hitPointDamage = [[],[]];
} else {
    _hitPointDamage = [_hitPointDamage#1, _hitPointDamage#2];
};
private _repairCargo = getRepairCargo _vehicle;

[_dmg, _hitPointDamage, _repairCargo];
