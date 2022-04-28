

_pos = [] call BIS_fnc_randomPos;
_truckX = "B_supplyCrate_F" createVehicle _pos;
[_truckX] spawn A3A_fnc_fillLootCrate;