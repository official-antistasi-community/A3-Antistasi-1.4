params ["_road"];

if (isNull _road) exitWith { random 360 };

private _roadConnectedTo = roadsConnectedTo _road;
if (count _roadConnectedTo == 0) exitWith { random 360 };

private _connectedRoad = _roadConnectedTo select 0;
private _direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
_direction;
