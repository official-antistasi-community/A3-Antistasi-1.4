#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_display","_childControl"];
createDialog "A3A_BuyVehicleDialog";

//sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	private _vehicleCivCar = selectRandom(FactionGet(reb,"vehicleCivCar"));
	private _vehicleCivTruck = selectRandom(FactionGet(reb,"vehicleCivTruck"));
	private _vehicleCivHeli = selectRandom(FactionGet(reb,"vehicleCivHeli"));
	private _vehicleCivBoat = selectRandom(FactionGet(reb,"vehicleCivBoat"));

	_ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[_vehicleCivCar] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> _vehicleCivCar >> "displayName")];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[_vehicleCivTruck] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> _vehicleCivTruckvTruck >> "displayName")];
	_ChildControl = _display displayCtrl 106;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[_vehicleCivHeli] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> _vehicleCivHelivHeli >> "displayName")];
	_ChildControl = _display displayCtrl 107;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[_vehicleCivBoat] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> _vehicleCivBoat >> "displayName")];
};
