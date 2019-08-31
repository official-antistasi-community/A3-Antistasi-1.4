private ["_display","_childControl"];
_nul = createDialog "buy_vehicle";

//sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[rebelVehQuadbike] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> rebelVehQuadbike >> "displayName")];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[rebelVehLiteUnarmed] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> rebelVehLiteUnarmed >> "displayName")];
	_ChildControl = _display displayCtrl 106;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[rebelVehTransport] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> rebelVehTransport >> "displayName")];
	_ChildControl = _display displayCtrl 107;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[rebelVehLiteArmed] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> rebelVehLiteArmed >> "displayName")];
	_ChildControl = _display displayCtrl 108;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[rebelStaticMG] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> rebelStaticMG >> "displayName")];
	_ChildControl = _display displayCtrl 109;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[rebelMortar] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> rebelMortar >> "displayName")];
	_ChildControl = _display displayCtrl 110;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[rebelStaticAT] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> rebelStaticAT >> "displayName")];
	_ChildControl = _display displayCtrl 111;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[rebelStaticAA] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> rebelStaticAA >> "displayName")];
};