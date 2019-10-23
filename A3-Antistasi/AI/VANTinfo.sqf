private ["_veh","_marcador","_posicion","_grupos","_conocidos","_grupo","_lider"];

_veh = _this select 0;
_marcador = _this select 1;
_lado = _this select 2;

_posicion = getMarkerPos _marcador;

_amigos = "BLUFORSpawn";
_enemigosS = muyMalos;
if (_lado == muyMalos) then
	{
	_amigos == "OPFORSpawn";
	_enemigosS = malos;
	};

while {alive _veh} do
	{
	_conocidos = [];
	_grupos = [];
	_enemigos = [distanciaSPWN,0,_posicion,_amigos] call A3A_fnc_distanceUnits;
	sleep 60;
	_grupos = allGroups select {(leader _x in _enemigos) and ((vehicle leader _x) != (leader _x))};
	_conocidos = allUnits select {((side _x == buenos) or (side _x == _enemigosS)) and (alive _x) and (_x distance _posicion < 500)};
	{
	_grupo = _x;
		{
		_grupo reveal [_x,4];
		} forEach _conocidos;
	} forEach _grupos;
	};