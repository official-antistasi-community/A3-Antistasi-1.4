
civVehCommonData = [];
civVehRepairData = [];
civVehMedicalData = [];
civVehRefuelData = [];
civVehIndustrialData = [];
civBoatData = [];

private _civVehConfigs = "(
	getNumber (_x >> 'scope') isEqualTo 2 && {
		getNumber (_x >> 'side') isEqualTo 3 && {
			getText (_x >> 'simulation') == 'carx'
		}
	}
)" configClasses (configFile >> "CfgVehicles");

{
	private _category = call { 
		if (getNumber (_x >> "transportRepair") > 0) exitWith {civVehRepairData};
		if (getNumber (_x >> "ace_repair_canRepair") > 0) exitWith {civVehRepairData};
		if (getNumber (_x >> "transportFuel") > 0) exitWith {civVehRefuelData};
		if (getNumber (_x >> "ace_refuel_fuelCargo") > 0) exitWith {civVehRefuelData};
		if (getNumber (_x >> "transportAmmo") > 0) exitWith {};
		if (getNumber (_x >> "ace_rearm_defaultSupply") > 0) exitWith {};
		if (getNumber (_x >> "attendant") > 0) exitWith {civVehMedicalData};
		civVehCommonData;
	};
	if (!isNil "_category") then { _category pushBack [configName _x, 1.0] };
} forEach _civVehConfigs;


//Civilian Boats
_civBoatConfigs = "(
	getNumber (_x >> 'scope') isEqualTo 2 && {
		getNumber (_x >> 'side') isEqualTo 3 && {
			getText (_x >> 'vehicleClass') isEqualTo 'Ship'
		}
	}
)" configClasses (configFile >> "CfgVehicles");

{ civBoatData pushBack [configName _x, 1.0] } forEach _civBoatConfigs;

