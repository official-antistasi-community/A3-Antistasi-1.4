params ["_road"];

if (isNull _road) exitWith {private _direction = random 360; _direction};

private _roadConnectedTo = roadsConnectedTo _road;
private _connectedRoad = _roadConnectedTo select 0;
private _direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
_direction;