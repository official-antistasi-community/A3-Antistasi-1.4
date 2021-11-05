/*
Author: [Killerswin2]
    find the remaining fuel cargo and returns a precentage 
Arguments:
0.  <object>    Object to find the remaining fuel cargo


Return Value:
    <number>

Scope: Clients
Environment: Unscheduled
Public: yes
Dependencies:

Example:
    [_veh] call A3A_fnc_remainingFuel
*/

params [["_vehicle", objNull, [objNull]]];

if(A3A_hasACE) then {
	(_vehicle getVariable ["ace_refuel_currentFuelCargo"] / getNumber (_vehCfg >> "ace_refuel_fuelCargo"));
} else {
	getFuelCargo _vehicle;
};