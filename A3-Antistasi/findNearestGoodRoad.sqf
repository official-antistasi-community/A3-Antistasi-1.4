private ["_pos","_roads","_road","_tam"];

_pos = _this select 0;

_roads = [];
_tam = 10;
_road = objNull;
while {isNull _road} do
	{
	_roads = _pos nearRoads _tam;
	if (count _roads > 0) then
		{
		{
		if ((surfaceType (position _x)!= "#GdtForest") and (surfaceType (position _x)!= "#GdtRock") and (surfaceType (position _x)!= "#GdtGrassTall")) exitWith {_road = _x};
		} forEach _roads;
		};
	_tam = _tam + 10;
	};
_road