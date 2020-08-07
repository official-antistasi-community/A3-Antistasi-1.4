params ["_object", ["_action", "load"]];

if (isNil "logistics_vehicleHardpoints") then {
	call A3A_fnc_logistics_initNodes;
};

[_object , _action] remoteExec ["A3A_fnc_logistics_addAction", 0, _object];