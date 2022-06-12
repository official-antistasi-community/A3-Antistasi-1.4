/*
Maintainer: Caleb Serafin
    Similar to sizeOf, but it will always return the accurate size.
    The bounding-box diameters are cached after the first sizeOf call.
    If sizeOf returns 0, a vehicle will be created temporally for measurement.

Arguments:
    <STRING> Vehicle Classname.

Return Value:
    <SCALAR> The bounding-box diameter of the vehicle.

Scope: Any, Local Effect
Environment: Any
Public: Yes

Example:
    ["C_Offroad_01_F"] call A3A_GUI_fnc_sizeOf;  // 11.4563
    ["C_Heli_Light_01_civil_F"] call A3A_GUI_fnc_sizeOf;  // 12.6111
    // Within GUI
    ["C_Offroad_01_F"] call FUNC(sizeOf);  // 11.4563

*/

params [
    ["_classname", "", [""]]
];

if (isNil "A3A_GUI_sizeOf_cache") then {
    A3A_GUI_sizeOf_cache = createHashMap;
};

if (_classname in A3A_GUI_sizeOf_cache) exitWith {
    A3A_GUI_sizeOf_cache get _classname;  // Object is cached.
};

private _diameter = sizeOf _classname;
if (_diameter != 0) exitWith {
    A3A_GUI_sizeOf_cache set [_classname, _diameter];
    _diameter;  // Object was not cached but did exist.
};

private _object =  createVehicle [_classname, [random 1000, random 1000, 1000 + random 1000], [], 0, "CAN_COLLIDE"];

if (isNull _object) exitWith {
    0;  // Object does not exist.
};

_diameter = sizeOf _classname;
deleteVehicle _object;
A3A_GUI_sizeOf_cache set [_classname, _diameter];
_diameter;  // Object was not cached and did not exist.
