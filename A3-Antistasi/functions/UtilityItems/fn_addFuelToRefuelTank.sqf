/*
    Author: [Killerswin2]
    [Description]
        Refuels a tanker in ace

    Arguments:
    0. <Object> Vehicle that the player is in, that is trying to refuel the fuel cargo.
	1. <Object> The refuel source that the refueling process will use.
    Return Value:
    <nil>

    Scope: Server?
    Environment: Any
    Public: [no]
    Dependencies: ACE

    Example: [vehicle,_tanker] call A3A_fnc_addFuelToRefuelTank;

    License: MIT License
*/
params ["_refuelTanker", "_refuelSource"];
private _vehCfg = configFile >> "CfgVehicles" >> typeOf _refuelTanker;
_fuelCargoValue = getNumber (_vehCfg >> "ace_refuel_fuelCargo");

_currentFuelValue = [_refuelTanker] call ace_refuel_fnc_getFuel;

_fuelNeeded = _fuelCargoValue - _currentFuelValue;

_tankerCurrentFuel = [_refuelSource] call ace_refuel_fnc_getFuel;

if(_fuelCargoValue == _currentFuelValue)then{
	["Cargo Refueling", "You already have a full cargo."] call A3A_fnc_customHint;
};
if(_fuelNeeded > [_refuelSource] call ace_refuel_fnc_getFuel)then{
	[_refuelTanker,[_refuelSource] call ace_refuel_fnc_getFuel + _currentFuelValue] call ace_refuel_fnc_setFuel; 
	[_refuelSource, 0] call ace_refuel_setFuel;
	["Cargo Refueling", "The refueling source now is empty."] call A3A_fnc_customHint;
}else{
	[_refuelTanker, _fuelCargoValue] call ace_refuel_fnc_setFuel;
	[_refuelSource,_tankerCurrentFuel - _fuelNeeded] call ace_refuel_fnc_setFuel; //subtract from the source
    ["Cargo Refueling", "The fuel cargo is now full."] call A3A_fnc_customHint;
};
