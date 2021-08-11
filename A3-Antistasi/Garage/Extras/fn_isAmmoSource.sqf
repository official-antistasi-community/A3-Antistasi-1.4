/*
    Author: [Håkon]
    Description:
        Checks if vehicle is a ammo source, ace compatible

    Arguments:
    0. <Object> Vehicle your checking if is source

    Return Value:
    <Bool> is ammo source

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies: <Bool> A3A_hasAce

    Example: [_veh] call HR_GRG_fnc_isAmmoSource;

    License: APL-ND
*/
params [ ["_vehicle", objNull, [objNull,""]] ];

//handle obj input and class input
private _vehType = if (_vehicle isEqualType objNull) then {typeOf _vehicle} else {_vehicle};
if (_vehicle isEqualType "") then {_vehicle = objNull};

if (_vehType isEqualTo "") exitWith {false}; //null obj passed
private _vehCfg = configFile/"CfgVehicles"/_vehType;
if (!isClass _vehCfg) exitWith {false}; //invalid class string passed

//check if is source
if (A3A_hasAce) then { //Ace
    private _aceCurrent = _vehicle getVariable ["ace_rearm_currentSupply", 0];
    if (_aceCurrent < 0) exitWith {false};

    private _ammoCap = getNumber (_vehCfg >> "transportAmmo");
    private _aceDefault = getNumber (_vehCfg >> "ace_rearm_defaultSupply");
    private _aceIsSupply = _vehicle getVariable ["ace_rearm_isSupplyVehicle", false];
    (_aceDefault > 0) || {_aceIsSupply} || {_ammoCap > 0}
} else { //Vanilla
    if (isNull _vehicle) then {
        getNumber (_vehCfg/"transportAmmo") > 0
    } else {
        getAmmoCargo _vehicle > 0
    };
};
