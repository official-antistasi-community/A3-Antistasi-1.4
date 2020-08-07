params ["_vehicle"];

_cargo = _vehicle getVariable ["Cargo",[]];
if (_cargo findIf {!((_x#0) isEqualTo objNull)} isEqualTo -1) then { //if all remaining cargo on list is objNull, reset list
	private _nodes = [_vehicle] call A3A_fnc_logistics_getVehicleNodes;
	_vehicle setVariable ["logisticsCargoNodes",_nodes, true];
	_vehicle setVariable ["Cargo", [], true];
};