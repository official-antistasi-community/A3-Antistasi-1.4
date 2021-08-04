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
params [ ["_vehicle", objNull, [objNull]] ];
if (isNull _vehicle) exitWith {false};

if (A3A_hasAce) then {
    private _value = _vehicle getVariable ["ACE_isRepairVehicle", getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "ace_repair_canRepair")];
    _value in [1, true];
} else {
    getRepairCargo _vehicle > 0
};
