/*
Author: [Killerswin2]
    find the remaining fuel cargo and returns a precentage 
Arguments:
0.  <object>    Object to find the remaining fuel cargo


Return Value:
    <number>    percentile remaining fuel 0 -> 1

Scope: Clients
Environment: Unscheduled
Public: yes
Dependencies:

Example:
    [_veh] call A3A_fnc_remainingFuel
*/

params [["_vehicle", objNull, [objNull]]];

private _vehType = if (_vehicle isEqualType objNull) then {typeOf _vehicle} else {_vehicle};
private _vehCfg = configFile/"CfgVehicles"/_vehType;

if(A3A_hasACE) then {
    private _ace_refuel_cargo = getNumber (_vehCfg >> "ace_refuel_fuelCargo");
    if(_ace_refuel_cargo == 0) exitwith {};
	(_vehicle getVariable ["ace_refuel_currentFuelCargo"] / _ace_refuel_cargo);
} else {
	getFuelCargo _vehicle;
};