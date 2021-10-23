/*
Maintainer: DoomMetal
    Calculates the price for high command squads and their vehicle (if any)

Arguments:
    <ARRAY>/<STRING> Type of high command group, can be either an array of loadouts or a vehicle classname.
    <STRING> Classname for the vehicle type for the group if one is to be purchased. Empty string means no vehicle.

Return Value:
    <INTEGER, INTEGER> Price in money and HR

Scope: Any
Environment: Any
Public: Yes
Dependencies:
    None

Example:
    [groupsSDKSquad, vehSDKTruck] call A3A_fnc_getHCsquadPrice

*/

#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params [["_typeGroup", []], ["_vehicleType", ""]];

private _money = 0;
private _hr = 0;

if (_typeGroup isEqualType []) then {
    // Array of unit types format, used for infantry groups

	{
		// private _typeUnit = if (random 20 <= skillFIA) then {_x select 1} else {_x select 0};
        // ^ These are arrays of 2 identical references originally, replaced it with this for now:
		private _typeUnit = _x select 0;

		_money = _money + (server getVariable _typeUnit);
        _hr = _hr + 1;
	} forEach _typeGroup;

    // Old code used for MG/Mortar squads (not to be confused with MG/Mortar teams) that wasn't working
    // Needs an additional param "_withBackpck" to be enabled
	/* if (count _this > 1) then {
		if (_withBackpck == "MG") then {_money = _money + ([SDKMGStatic] call A3A_fnc_vehiclePrice)};
		if (_withBackpck == "Mortar") then {_money = _money + ([SDKMortar] call A3A_fnc_vehiclePrice)};
	}; */

    // Add vehicle price if a vehicle is specified
    if !(_vehicleType isEqualTo "") then {
        private _vehiclePrice = [_vehicleType] call A3A_fnc_vehiclePrice;
        _money = _money + _vehiclePrice;
    };

} else {
    // Vehicle classname format, used for mortar/MG teams, AT cars and AA trucks

    // Add costs for 2 crewmen + vehicle
	_money = _money + (2*(server getVariable staticCrewTeamPlayer)) + ([_typeGroup] call A3A_fnc_vehiclePrice);
	_hr = 2;

    // Add costs for vehicle
	if ((_typeGroup == SDKMortar) or (_typeGroup == SDKMGStatic)) then {
        if !(_vehicleType isEqualTo "") then {
            private _vehiclePrice = [_vehicleType] call A3A_fnc_vehiclePrice;
            _money = _money + _vehiclePrice;
        };
	};
};

[_money, _hr];
