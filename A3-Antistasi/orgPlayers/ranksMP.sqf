_jugador = _this select 0;
_jugador = _jugador getVariable ["owner",_jugador];
//if ((!isServer) and (player != _jugador)) exitWith {};
_rank = _this select 1;
_jugador setRank _rank;
[] spawn A3A_fnc_statistics;