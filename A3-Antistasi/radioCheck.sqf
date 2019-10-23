private ["_marcador","_ok","_posicion","_antena","_cercano"];

_marcador = _this select 0;
_posicion = _this select 0;
if (typeName _marcador == typeName "") then {_posicion = getMarkerPos _marcador};
_ok = false;
if (count antenas > 0) then
	{
	for "_i" from 0 to (count antenas) - 1 do
		{
		_antena = antenas select _i;
		if ((alive _antena) and (_posicion distance _antena < 3500)) then
			{
			_cercano = [marcadores,_antena] call BIS_fnc_nearestPosition;
			if (not(lados getVariable [_cercano,sideUnknown] == buenos)) then {_ok = true};
			};
		};
	};
_ok