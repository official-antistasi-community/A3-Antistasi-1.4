_marcador = _this select 0;
_posMarcador = getMarkerPos _marcador;

_arrayCiudades = (ciudades select {getMarkerPos _x distance _posMarcador < 3000}) - [_marcador];
/*
for "_i" from 0 to (count ciudades - 1) do
	{
	if ((getMarkerPos (ciudades select _i)) distance _posMarcador < 3000) then {_arrayCiudades set [count _arrayCiudades,ciudades select _i]};
	};

_arrayCiudades = _arrayCiudades - [_marcador];
*/
_arrayCiudades