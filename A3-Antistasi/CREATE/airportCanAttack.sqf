_marcador = _this select 0;
if (!(_marcador in aeropuertos) and !(_marcador in puestos)) exitWith {false};
if !(dateToNumber date > server getVariable [_marcador,0]) exitWith {false};
_isQRF = _this select 1;
if (_isQRF and (count (garrison getVariable [_marcador,[]]) <= 8)) exitWith {false};
if (!_isQRF and (count (garrison getVariable [_marcador,[]]) < 16)) exitWith {false};
if ([distanciaSPWN/2,1,getMarkerPos _marcador,"GREENFORSpawn"] call A3A_fnc_distanceUnits) exitWith {false};
if (_marcador in forcedSpawn) exitWith {false};
true