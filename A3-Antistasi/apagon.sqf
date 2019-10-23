private ["_marcador","_damage","_lamps","_onoff","_posicion","_tam","_size"];

_marcador = _this select 0;
_onoff = _this select 1;

_posicion = getMarkerPos _marcador;
_damage = 0;
if (not _onoff) then {_damage = 0.95;};

_tam = markerSize _marcador;
_size = _tam select 0;

for "_i" from 0 to ((count lamptypes) -1) do
    {
    _lamps = _posicion nearObjects [lamptypes select _i,_size];
    {sleep 0.3; _x setDamage _damage} forEach _lamps;
    };
    //123