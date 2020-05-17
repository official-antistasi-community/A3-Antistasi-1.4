/**
	Generates an array in the RoadsDB format for the current map.
	
	Example usage:
		copyToClipboard str (call A3A_fnc_generateRoadsDB)
**/

private _worldName = worldName;

private _fn_generatePointsOnRoadsInArea = {
	private _areaCenter = param [0, getPos player];
	private _radius = param [1, 1000];
	
	private _roads = _areaCenter nearRoads _radius;
	private _result = _roads apply {(getPos _x) apply {round _x}};

	_result;
};

private _fn_findLocationsOfGivenTypes = {
	private _typesToLookFor = param [0];

	private _locConfigs = "true" configClasses (configfile >> "CfgWorlds" >> _worldName >> "Names");
	private _locations = [];

	{
		private _type = getText (_x >> "type");
		if (_type in _typesToLookFor) then {
			_locations pushBack [configName _x, getArray (_x >> "position"), _type];
		};
	} forEach _locConfigs;
	
	_locations;
};

private _fn_diagLogArrayLog = {
	diag_log ("ARRAYLOG: " + (_this select 0));
};

private _settlementLocations = [["NameVillage", "NameCity", "NameCityCapital"]] call _fn_findLocationsOfGivenTypes;
private _roadsAroundSettlements = [];

{
	private _name = _x select 0;
	private _center = _x select 1;
	_roadsAroundSettlements pushBack [_name, [_center, 500] call _fn_generatePointsOnRoadsInArea];
} forEach _settlementLocations;

_roadsAroundSettlements;