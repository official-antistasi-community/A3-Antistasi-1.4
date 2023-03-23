#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_display","_childControl"];
createDialog "A3A_BuyVehicleDialog";

//sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	private _vehicleBasic = selectRandom (FactionGet(reb,"vehiclesBasic"));
	private _vehicleLightUnarmed = selectRandom (FactionGet(reb,"vehiclesLightUnarmed"));
	private _vehicleTruck = selectRandom (FactionGet(reb,"vehiclesTruck"));
	private _vehicleLightArmed = selectRandom (FactionGet(reb,"vehiclesLightArmed"));
	private _staticMG = selectRandom (FactionGet(reb,"staticMGs"));
	private _staticMortar = selectRandom (FactionGet(reb,"staticMortar"));
	private _staticAT = selectRandom (FactionGet(reb,"staticAT"));
	private _staticAA = selectRandom (FactionGet(reb,"staticAA"));

	_ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[_vehicleBasic] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> _vehicleBasic >> "displayName")];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[_vehicleLightUnarmed] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> _vehicleLightUnarmed >> "displayName")];
	_ChildControl = _display displayCtrl 106;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[_vehicleTruck] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> _vehicleTruck >> "displayName")];
	_ChildControl = _display displayCtrl 107;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[_vehicleLightArmed] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> _vehicleLightArmed >> "displayName")];
	_ChildControl = _display displayCtrl 108;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[_staticMG] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> _staticMG >> "displayName")];
	_ChildControl = _display displayCtrl 109;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[_staticMortar] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> _staticMortar>> "displayName")];
	_ChildControl = _display displayCtrl 110;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[_staticAT] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> _staticAT >> "displayName")];
	_ChildControl = _display displayCtrl 111;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[_staticAA] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> _staticAA >> "displayName")];
};
