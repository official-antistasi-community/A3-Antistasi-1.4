params [["_vehicle", objNull, [objNull]], "_state"];
if (isNull _vehicle) exitWith {};
_state params ["_fuelStats", "_dmgStats", "_ammoStats"];

[_vehicle, _fuelStats] call HR_GRG_fnc_setFuel;
[_vehicle, _dmgStats] call HR_GRG_fnc_setDamage;
[_vehicle, _ammoStats] call HR_GRG_fnc_setAmmoData;
