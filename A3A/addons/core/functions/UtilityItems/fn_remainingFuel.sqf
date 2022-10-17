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

private _vehCfg = configFile/"CfgVehicles"/typeOf _vehicle;

if(A3A_hasACE) then {
    private _vehicleMaxFuel = getNumber (_vehCfg >> "ace_refuel_fuelCargo");
    if(_vehicleMaxFuel == 0) exitwith {0};
    private _currentFuelCargo = [_vehicle] call ace_refuel_fnc_getFuel;
    (_currentFuelCargo / _vehicleMaxFuel);
} else {
    getFuelCargo _vehicle;
};