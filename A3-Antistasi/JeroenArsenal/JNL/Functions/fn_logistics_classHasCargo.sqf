/*
	Description:
	Returns true if the vehicle class input has JNL cargo capability

	Parameter(s):
	STRING vehicle class

	Returns:
	True if vehicle class has cargo nodes in JNL, false otherwise
*/

params ["_vehClass"];

_nodes = [];
private _model = gettext (configfile >> "CfgVehicles" >> _vehClass >> "model");
{
	private _model2 = _x select 0;
	if(_model isEqualTo _model2)exitWith{
		_nodes = _x select 1;
	};
} forEach jnl_vehicleHardpoints;

// return
-1 != _nodes findIf { _x select 0 == 1 };
