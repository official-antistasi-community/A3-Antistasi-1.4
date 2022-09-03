params ["_marker"];

if (isNil "A3A_markerNavPoints") then {
    A3A_markerNavPoints = createHashMap;
};

private _navIndex = A3A_markerNavPoints get _marker;
if !(isNil "_navIndex") exitWith { _navIndex };

private _spawnPoint = server getVariable ["spawn_"+_x, _x];
private _pos = markerPos _spawnPoint;

_navIndex = [_pos] call A3A_fnc_getNearestNavPoint;
A3A_markerNavPoints set [_marker, _navIndex];

_navIndex;
