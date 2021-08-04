/*
    Author: [Håkon]
    [Description]
        gets the fuel state of a vehicle

    Arguments:
        0. <Objet> Vehicle

    Return Value:
        <Array> [
            <Int> Fuel
            <Int> Fuel cargo
            <Int> Ace Fuel cargo
        ] Fuel state

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example:

    License: APL-ND
*/
params [["_vehicle", objNull, [objNull]]];
private _fuelCargo = getFuelCargo _vehicle;
[fuel _vehicle, _fuelCargo, _vehicle getVariable ["ace_refuel_currentFuelCargo",-2]];
