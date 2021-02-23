params [["_vehicle", objNull, [objNull]]];
if (isNull _vehicle) exitWith {};
[
    [_vehicle] call HR_GRG_fnc_getFuel,
    [_vehicle] call HR_GRG_fnc_getDamage,
    [_vehicle] call HR_GRG_fnc_getAmmoData
];
