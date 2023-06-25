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

    Example: _cargo call A3A_Logistics_fnc_initMountedWeapon;
*/
params ["_weapon"];

//weapon recoil
private _cargoConfig = [_weapon] call A3A_Logistics_fnc_getCargoConfig;
private _fireForce = if (isNull _cargoConfig) then { 0 } else { getNumber (_cargoConfig/"recoil") };
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
