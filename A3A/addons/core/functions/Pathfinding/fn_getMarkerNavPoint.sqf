params ["_marker"];

if (isNil "A3A_markerNavPoints") then {
    A3A_markerNavPoints = createHashMap;
};

private _navIndex = A3A_markerNavPoints get _marker;
if !(isNil "_navIndex") exitWith { _navIndex };

private _pos = if (_marker in airportsX) then
{
    // use the map-defined spawnpoint as a starting point for airfields
    private _spawnPoint = server getVariable (format ["spawn_%1", _marker]);
    getMarkerPos _spawnPoint;
}
else
{
    // Might be able to skip this given that getNearestNavPoint does a 300m search
    private _spawnRoad = [getMarkerPos _marker] call A3A_fnc_findNearestGoodRoad;
    position _spawnRoad;
};

_navIndex = [_pos] call A3A_fnc_getNearestNavPoint;
A3A_markerNavPoints set [_marker, _navIndex];

_navIndex;
