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

if (_vehicle isEqualType objNull) then {
    if (isNull _vehicle) exitWith {false};
    if (getRepairCargo _vehicle > 0) exitWith {true};                                     // vanilla
    private _canRepair = getNumber (configOf _vehicle/"ace_repair_canRepair");
    if (_vehicle getVariable ["ACE_isRepairVehicle", _canRepair] in [1, true]) exitWith {true};
    false;
} else {
    private _vehCfg = configFile/"CfgVehicles"/_vehicle;
    if (!isClass _vehCfg) exitWith {false}; //invalid class string passed
    if (getNumber (_vehCfg/"transportRepair") > 0) exitWith {true};                       // vanilla
    if (getNumber (_vehCfg/"ace_repair_canRepair") > 0) exitWith {true};
    false;
};
