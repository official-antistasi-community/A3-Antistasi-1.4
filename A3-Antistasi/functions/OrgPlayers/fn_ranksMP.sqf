_playerX = _this select 0;
_playerX = _playerX getVariable ["owner",_playerX];
//if ((!isServer) and (player != _playerX)) exitWith {};
_rank = _this select 1;
_playerX setRank _rank;
[] spawn A3A_fnc_statistics;