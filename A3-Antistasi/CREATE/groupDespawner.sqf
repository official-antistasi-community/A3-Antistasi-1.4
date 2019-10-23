private ["_grupo","_lado","_eny1","_eny2"];
_grupo = _this select 0;
_lado = side _grupo;
_eny1 = "BLUFORSpawn";
_eny2 = "OPFORSpawn";
if (_lado == malos) then {_eny1 = "GREENFORSpawn"} else {if (_lado == muyMalos) then {_eny2 = "GREENFORSpawn"}};

{_unit = _x;
if (!([distanciaSPWN,1,_unit,_eny1] call A3A_fnc_distanceUnits) and !([distanciaSPWN,1,_unit,_eny2] call A3A_fnc_distanceUnits)) then {deleteVehicle _unit}} forEach units _grupo;

{_unit = _x;
waitUntil {sleep 1;!([distanciaSPWN,1,_unit,_eny1] call A3A_fnc_distanceUnits) and !([distanciaSPWN,1,_unit,_eny2] call A3A_fnc_distanceUnits)};deleteVehicle _unit} forEach units _grupo;

deleteGroup _grupo;