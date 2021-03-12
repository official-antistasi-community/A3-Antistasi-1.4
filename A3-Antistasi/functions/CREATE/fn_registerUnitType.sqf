private _fileName = "fn_registerUnitType";

params [["_unitTypeName", nil, [""]], ["_unitLoadouts", nil, [[]]]];

if (!isServer) exitWith {};

[3, format ["Registering unit %1 with %2 loadouts", _unitTypeName, count _unitLoadouts], _fileName] call A3A_fnc_log;

customUnitTypes setVariable [_unitTypeName, _unitLoadouts, true];