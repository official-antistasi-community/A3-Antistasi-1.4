if (!isServer) exitWith {};

if (leader group Petros != Petros) exitWith {};

_tipos = ["CON","DES","LOG","RES","CONVOY"];

_tipo = selectRandom (_tipos select {!([_x] call BIS_fnc_taskExists)});
if (isNil "_tipo") exitWith {};
_nul = [_tipo,true] call A3A_fnc_missionRequest;