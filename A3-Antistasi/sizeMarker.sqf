private ["_marcador","_size","_area"];

_marcador = _this select 0;
_size = 0;

_area = markerSize _marcador;
_size = _area select 0;
if (_size < _area select 1) then {_size = _area select 1};
_size