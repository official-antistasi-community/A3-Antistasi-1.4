private ["_road","_roadConnectedTo","_connectedRoad","_direction"];

_road = _this select 0;

if (isNull _road) exitWith {_direction = random 364;_direction};

_roadConnectedTo = roadsConnectedTo _road;
_connectedRoad = _roadConnectedTo select 0;
_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
_direction;