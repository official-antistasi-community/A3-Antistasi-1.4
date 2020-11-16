/*
    Author: [Håkon]
    [Description]
        adds logistics load action to objects

    Arguments:
    0. <Object> Cargo that you want to be able to load in a vehicle
	1. <String> "load" or "unload" action (optional - should not really be used)

    Return Value:
    <Nil>

    Scope: Any
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: [_object] call A3A_fnc_logistics_addLoadAction;
*/
params ["_object", ["_action", "load"]];

if (isNil "logistics_vehicleHardpoints") exitWith {
	[1, "Logistics nodes not initialized", "fn_logistics_addLoadAction.sqf"] call A3A_fnc_log;
};

_nonSupportedStatic = false;
if (_object isKindOf "StaticWeapon") then {
	private _model = getText (configFile >> "CfgVehicles" >> typeOf _object >> "model");
	if (({(_X#0) isEqualTo _model } count logistics_weapons) isEqualTo 0) then {_nonSupportedStatic = true};
};
if (_nonSupportedStatic) exitWith {};

[_object , _action] remoteExec ["A3A_fnc_logistics_addAction", 0, _object];
