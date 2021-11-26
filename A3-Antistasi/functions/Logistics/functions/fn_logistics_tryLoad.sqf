/*
    Author: [Håkon]
    [Description]
        Trys to a cargo into the nearest vehicle to the cargo, handles feedback to player

    Arguments:
    0. <Object> cargo

    Return Value:
    <nil>

    Scope: Server
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: [_cargo] remoteExecCall ["A3A_fnc_logistics_tryLoad",2];

    License: MIT License
*/
if (!isServer) exitWith {};
params ["_cargo"];
#include "..\..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private _vehicles = (nearestObjects [_cargo,["Car","Ship"], 10]) - [_cargo];
private _vehicle = _vehicles#0;
if (isNil "_vehicle") exitWith {["Logistics", "No vehicle is close enough."] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner]};

private _return = [_vehicle, _cargo] call A3A_fnc_logistics_canLoad;
if (_return isEqualType 0) exitWith {

    private _cargoName = getText (configFile >> "CfgVehicles" >> typeOf _cargo >> "displayName");
    private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
    if (_cargo isKindOf "CAManBase") then {_cargoName = name _cargo};

    switch _return do {
        case -1: { ["Logistics", "You can't load cargo into a destroyed vehicle."] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -2: { ["Logistics", "You can't load destroyed cargo into a vehicle."] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -3: { ["Logistics", format ["%1 cannot be loaded.", _cargoName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -4: { ["Logistics", "Can't load a static that's mounted."] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -5: { ["Logistics", format ["%1 can not be mounted on a %2.", _cargoName, _vehicleName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] }; //vehicle in weapon blacklist
        case -6: { ["Logistics", format ["%1 is being helped or no longer needs your help.",_cargoName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -7: { ["Logistics", format ["%1 is unable to load any cargo.", _vehicleName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -8: { ["Logistics", format ["%1 does not have enough space to load %2.", _vehicleName, _cargoName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        case -9: { ["Logistics", format ["%1 can not load cargo while units are blocking the cargo plane.", _vehicleName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner] };
        default { Error_1("Unknown error code: %1", _return) };
    };
};

_return spawn A3A_fnc_logistics_load;

nil
