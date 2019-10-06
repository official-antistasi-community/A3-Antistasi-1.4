if (!isServer) exitWith {};

if (leader group Petros != Petros) exitWith {};

_typesX = ["CON","DES","LOG","RES","CONVOY"];

_typeX = selectRandom (_typesX select {!([_x] call BIS_fnc_taskExists)});
if (isNil "_typeX") exitWith {};
_nul = [_typeX,true] call A3A_fnc_missionRequest;