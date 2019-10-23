private ["_marcador","_result","_posicion"];
_marcador = _this select 0;
//if (!(_marcador in ciudades)) exitWith {true; diag_log format ["Error en cálculo de Antena para %1",_marcador]};
if (count antenas == 0) exitWith {sideUnknown};
//_result = false;
_posicion = getMarkerPos _marcador;
_ant1 = [antenas,_posicion] call BIS_fnc_nearestPosition;
_ant2 = [antenasMuertas, _posicion] call BIS_fnc_nearestPosition;

if (_ant1 distance _posicion > _ant2 distance _posicion) exitWith {sideUnknown};

_puesto = [marcadores,_ant1] call BIS_fnc_NearestPosition;
/*
if (lados getVariable [_marcador,sideUnknown] == buenos) then
	{
	if (lados getVariable [_puesto,sideUnknown] == buenos) then {_result = true};
	}
else
	{
	if (lados getVariable [_puesto,sideUnknown] == malos) then {_result = true};
	};*/
private _lado = lados getVariable [_puesto,sideUnknown];
//_result
_lado