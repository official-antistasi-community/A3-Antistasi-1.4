/*
Maintainer: DoomMetal
    Gets the vehicle type to support a High Command group

Arguments:
    <ARRAY>/<STRING> Type of high command group, can be either an array of loadouts or a vehicle classname.

Return Value:
    <STRING> Classname for vehicle to be used

Scope: Any
Environment: Any
Public: Yes
Dependencies:
    None

Example:
    [groupsSDKSquad] call A3A_fnc_getHCsquadVehicleType

*/

#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params [["_squadFormat", []]];

private _vehicleType = "";

// Workaround for vehicle classname squad formats
if (_squadFormat isEqualType "") exitWith {
    // This just gives a quad for now as MG and Mortar teams are the only
    // teams using this format that also uses separate vehicles
    // TODO UI-update: only add vic for those exact cases
    vehSDKBike;
};

if (count _squadFormat == 2) then {
	_vehicleType = vehSDKBike;
} else {
	if (count _squadFormat > 4) then {
		_vehicleType = vehSDKTruck;
	} else {
		_vehicleType = vehSDKLightUnarmed;
	};
};

_vehicleType;
