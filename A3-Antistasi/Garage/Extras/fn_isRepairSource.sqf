/*
    Author: [Håkon]
    Description:
        Checks if vehicle is a repair source, ace compatible

    Arguments:
    0. <Object> Vehicle your checking if is source

    Return Value:
    <Bool> is repair source

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies: <Bool> A3A_hasAce

    Example: [_veh] call HR_GRG_fnc_isRepairSource;

    License: APL-ND
*/
params [ ["_vehicle", objNull, [objNull,""]] ];

//handle obj input and class input
private _vehType = if (_vehicle isEqualType objNull) then {typeOf _vehicle} else {_vehicle};
if (_vehicle isEqualType "") then {_vehicle = objNull};

if (_vehType isEqualTo "") exitWith {false}; //null obj passed
private _vehCfg = configFile/"CfgVehicles"/_vehType;
if (!isClass _vehCfg) exitWith {false}; //invalid class string passed

if (A3A_hasAce) then {
    private _value = _vehicle getVariable ["ACE_isRepairVehicle", getNumber (_vehCfg/"ace_repair_canRepair")];
    _value in [1, true];
} else {
    if (isNull _vehicle) then {
        getNumber (_vehCfg/"transportRepair") > 0
    } else {
        getRepairCargo _vehicle > 0
    };
};
