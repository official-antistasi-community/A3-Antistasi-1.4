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
private _maxAceFuelCargo = getNumber (configOf _vehicle/"ace_refuel_fuelCargo");
[fuel _vehicle, _fuelCargo, if (A3A_hasAce) then { _vehicle getVariable ["ace_refuel_currentFuelCargo",_maxAceFuelCargo] } else {nil} ];
