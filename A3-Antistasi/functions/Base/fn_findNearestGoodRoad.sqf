private ["_pos","_roads","_road","_radiusX"];

_pos = _this select 0;

_roads = [];
_radiusX = 10;
_road = objNull;
while {isNull _road} do
	{
	_roads = _pos nearRoads _radiusX;
	if (count _roads > 0) then
		{
		{
		if ((surfaceType (position _x)!= "#GdtForest") and (surfaceType (position _x)!= "#GdtRock") and (surfaceType (position _x)!= "#GdtGrassTall")) exitWith {_road = _x};
		} forEach _roads;
		};
	_radiusX = _radiusX + 10;
	};
_road