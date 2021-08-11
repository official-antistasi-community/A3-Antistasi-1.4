/*
    Author: [Håkon]
    Description:
        Checks if vehicle is a fuel source, ace compatible

    Arguments:
    0. <Object> Vehicle your checking if is source

    Return Value:
    <Bool> is fuel source

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies: <Bool> A3A_hasAce

    Example: [_veh] call HR_GRG_fnc_isFuelSource;

    License: APL-ND
*/
params [ ["_vehicle", objNull, [objNull,""]] ];

//handle obj input and class input
private _vehType = if (_vehicle isEqualType objNull) then {typeOf _vehicle} else {_vehicle};
if (_vehicle isEqualType "") then {_vehicle = objNull};

if (_vehType isEqualTo "") exitWith {false}; //null obj passed
private _vehCfg = configFile/"CfgVehicles"/_vehType;
if (!isClass _vehCfg) exitWith {false}; //invalid class string passed

if (A3A_hasAce) then { //Ace
    _vehicle getVariable ["ace_refuel_currentFuelCargo", getNumber (_vehCfg >> "ace_refuel_fuelCargo")] > 0;
} else { //Vanilla
    if (isNull _vehicle) then {
        getNumber (_vehCfg/"transportFuel") > 0
    } else {
        getFuelCargo _vehicle > 0
    };
};
