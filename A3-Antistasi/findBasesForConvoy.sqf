private ["_marcador","_pos","_aeropuertosAAF","_aeropuertos","_base","_posbase","_busy","_lado"];

_marcador = _this select 0;
_pos = getMarkerPos _marcador;
_lado = lados getVariable [_marcador,sideUnknown];

_aeropuertosAAF = (aeropuertos + puestos) select {(spawner getVariable _x == 2) and (dateToNumber date > server getVariable _x) and ([_x,_marcador] call A3A_fnc_isTheSameIsland) and (!(_x in forcedSpawn)) and (lados getVariable [_x,sideUnknown] == _lado) and !(_x in blackListDest) and (getMarkerPos _x distance _pos > distanciaSPWN)};
if (_marcador in ciudades) then {_aeropuertosAAF = _aeropuertosAAF select {lados getVariable [_x,sideUnknown] == malos}};
_aeropuertos = [];
_base = "";
{
_base = _x;
_posbase = getMarkerPos _base;
if ((_pos distance _posbase < distanceForLandAttack) and (({_x == _marcador} count (killZones getVariable [_base,[]])) < 3)) then {_aeropuertos pushBack _base}
} forEach _aeropuertosAAF;
if (count _aeropuertos > 0) then {_base = [_aeropuertos,_pos] call BIS_fnc_nearestPosition} else {_base = ""};
_base