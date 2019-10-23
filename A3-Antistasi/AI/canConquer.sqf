private _unit = _this select 0;
if !([_unit] call A3A_fnc_canFight) exitWith {false};
if (fleeing _unit) exitWith {false};
if (vehicle _unit isKindOf "Air") exitWith {false};
private _marcador = _this select 1;
_size = [_marcador] call A3A_fnc_sizeMarker;
_posicion = getMarkerPos _marcador;
if (_unit distance2D _posicion > (_size * 1.5)) exitWith {false};
true