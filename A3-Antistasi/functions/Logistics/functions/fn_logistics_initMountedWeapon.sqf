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
    Dependencies: <Array< <String>model,<vec3>location,<vec3>rotation,<scalar>size,<scalar>recoil >> A3A_logistics_attachmentOffset

    Example: _cargo call A3A_fnc_logistics_initMountedWeapon;
*/
params ["_weapon"];

//weapon recoil
private _model = getText (configFile >> "CfgVehicles" >> typeOf _weapon >> "model");
private _fireForce = 0;
{
    if ((_x#0) isEqualTo _model) exitWith {_fireForce = +(_x#4)};
}forEach A3A_logistics_attachmentOffset;
_weapon setVariable ["fireForce", _fireForce, true];

//credits to audiocustoms on youtube (Cup dev) for the concept and CalebSerafin for optimisation.
private _idRecoil = _weapon addEventHandler ["Fired", compile ('
    params ["_weapon"];
    private _vehicle = attachedTo _weapon;
    private _weaponDir = _weapon weaponDirection currentWeapon _weapon;
    private _appliedForce = (_weaponDir vectorMultiply -' + (str _fireForce) +');
    _vehicle addForce [_appliedForce, ' + (str (_weapon getVariable ["AttachmentOffset", [0,0,0]])) + '];
')];

[_weapon, _idRecoil] spawn {
    params ["_weapon", "_idRecoil"];
    waitUntil {sleep 1; (attachedTo _weapon) isEqualTo objNull};
    _weapon removeEventHandler ["Fired", _idRecoil];
};
nil
