/*
    Author: [Håkon]
    [Description]
        adds fluf functionality to mounted weapons

    Arguments:
    0. <Object> Weapon that is mounted

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: _cargo call A3A_fnc_logistics_initMountedWeapon;
*/
params ["_weapon"];

//weapon recoil
private _model = getText (configFile >> "CfgVehicles" >> typeOf _weapon >> "model");
private _fireForce = 0;
{
    if ((_x#0) isEqualTo _model) exitWith {_fireForce = +(_x#4)};
}forEach logistics_attachmentOffset;
_weapon setVariable ["fireForce", _fireForce, true];

private _idRecoil = _weapon addEventHandler ["Fired", { //credits to audiocustoms on youtube (Cup dev) for the concept
    params ["_weapon"];
    private _vehicle = attachedTo _weapon;
    private _force = _weapon getVariable ["fireForce", 0];

    private _vehDir = vectorDir _vehicle;
    private _weaponDir = _weapon weaponDirection currentWeapon _weapon;
    private _fireDir = _vehDir vectorAdd (_weaponDir vectorDiff _vehDir);

    private _location = _weapon getVariable ["AttachmentOffset", [0,0,0]];

    private _appliedForce = (_fireDir vectorMultiply -_force);
    _vehicle addForce [_appliedForce, _location];
}];

[_weapon, _idRecoil] spawn {
    params ["_weapon", "_idRecoil"];
    waitUntil {sleep 1; (attachedTo _weapon) isEqualTo objNull};
    _weapon removeEventHandler ["Fired", _idRecoil];
};
