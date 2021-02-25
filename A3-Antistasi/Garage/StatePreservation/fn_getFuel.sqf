params [["_vehicle", objNull, [objNull]]];
private _fuelCargo = getFuelCargo _vehicle;
[fuel _vehicle, _fuelCargo, _vehicle getVariable ["ace_refuel_currentFuelCargo",-2]];
