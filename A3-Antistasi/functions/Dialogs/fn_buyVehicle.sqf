private ["_display","_childControl"];
_nul = createDialog "buy_vehicle";

//sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[vehSDKBike] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> vehSDKBike >> "displayName")];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[vehSDKLightUnarmed] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> vehSDKLightUnarmed >> "displayName")];
	_ChildControl = _display displayCtrl 106;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[vehSDKTruck] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> vehSDKTruck >> "displayName")];
	_ChildControl = _display displayCtrl 107;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[vehSDKLightArmed] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> vehSDKLightArmed >> "displayName")];
	_ChildControl = _display displayCtrl 108;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[SDKMGStatic] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> SDKMGStatic >> "displayName")];
	_ChildControl = _display displayCtrl 109;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[SDKMortar] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> SDKMortar >> "displayName")];
	_ChildControl = _display displayCtrl 110;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[staticATteamPlayer] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> staticATteamPlayer >> "displayName")];
	_ChildControl = _display displayCtrl 111;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[staticAAteamPlayer] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1",getText (configFile >> "CfgVehicles" >> staticAAteamPlayer >> "displayName")];
		_ChildControl = _display displayCtrl 112;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[vehSDKAPC] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1","M113 MK19"];
	_ChildControl = _display displayCtrl 113;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[vehSDKIFV] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1","M2A3 BFV"];
	_ChildControl = _display displayCtrl 114;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[vehSDKTANK] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1","US MBT"];
	_ChildControl = _display displayCtrl 115;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",[vehSDKHeli] call A3A_fnc_vehiclePrice];
	_childControl ctrlSetText format ["%1","MI24"];
};