private ["_destino","_origen","_tam","_dif","_roads","_road","_dist","_result","_safe","_blackList","_roadsTmp","_ok"];

_destino = _this select 0;
_origen = _this select 1;
_safe = _this select 2;
_blacklist = _this select 3;
if (count _blackList == 0) then {_blackList = [[0,0,0]]};
_tam = if (!_safe) then {400} else {50};
_dif = (_destino select 2) - (_origen select 2);

if (_dif > 0) then
	{
	_tam = _tam + (_dif * 2);
	};

_roads = [];
while {count _roads == 0} do
	{
	_roadsTmp = (_destino nearRoads _tam) select {(surfaceType (position _x)!= "#GdtForest") and (surfaceType (position _x)!= "#GdtRock") and (surfaceType (position _x)!= "#GdtGrassTall")};
	{
	_road = _x;
	_ok = true;
	{
	if (position _road distance2D _x < 150) exitWith {_ok = false};
	} forEach _blacklist;
	if (_ok) then {_roads pushBack _road};
	} forEach _roadsTmp;
	_tam = _tam + 50;
	};

//_road = _roads select 0;
if (!_safe) then
	{
	_roads = [_roads,[],{_origen distance _x},"ASCEND"] call BIS_fnc_sortBy;
	/*
	_dist = _origen distance (position _road);
	{
	if ((_origen distance (position _x)) < _dist) then
		{
		_dist = _origen distance (position _x);
		_road = _x;
		};
	} forEach _roads - [_road];
	*/
	}
else
	{
	_roads = [_roads,[],{_destino distance _x},"DESCEND"] call BIS_fnc_sortBy;
	/*
	_dist = _destino distance (position _road);
	{
	if ((_destino distance (position _x)) < _dist) then
		{
		_dist = _destino distance (position _x);
		_road = _x;
		};
	} forEach _roads - [_road];
	*/
	};
_road = _roads select 0;
_result = position _road;

_result