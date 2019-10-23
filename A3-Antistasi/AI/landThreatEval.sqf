private ["_marcador","_threat","_posicion","_analizado","_size"];

_threat = 0;

//if (("launch_I_Titan_short_F" in unlockedWeapons) or ("launch_NLAW_F" in unlockedWeapons)) then {_threat = 3};

_marcador = _this select 0;

if (_marcador isEqualType []) then {_posicion = _marcador} else {_posicion = getMarkerPos _marcador};
_threat = _threat + 2 * ({(isOnRoad getMarkerPos _x) and (getMarkerPos _x distance _posicion < distanciaSPWN)} count puestosFIA);

{
if (getMarkerPos _x distance _posicion < distanciaSPWN) then
	{
	_analizado = _x;
	_garrison = garrison getVariable [_analizado,[]];
	_threat = _threat + (2*({(_x == "B_G_Soldier_A_F")} count _garrison)) + (floor((count _garrison)/8));
	_size = [_analizado] call A3A_fnc_sizeMarker;
	_estaticas = staticsToSave select {_x distance (getMarkerPos _analizado) < _size};
	if (count _estaticas > 0) then
		{
		_threat = _threat + ({typeOf _x == SDKMortar} count _estaticas) + (2*({typeOf _x == staticATBuenos} count _estaticas))
		};
	};
} forEach (marcadores - ciudades - controles - puestosFIA) select {lados getVariable [_x,sideUnknown] == buenos};

_threat