/*
    A3A_fnc_roadAStar
    Find shortest road path between two roads using simple A*. Not recommended for >1km.

Parameters:
    <OBJECT> Start road.
    <OBJECT> End road.
    <NUMBER> (Optional, default 2) Maximum travel distance, as multiplier of start->end distance.

Returns:
    <ARRAY> Road objects from start to end, inclusive. Empty array if a path wasn't found.
*/

params ["_startRoad", "_endRoad", ["_breakMul", 2], ["_debug", false]];

private _breakDist = (_startRoad distance _endRoad) * _breakMul;
private _curEntry = [_startRoad distance _endRoad, _startRoad, [0, objNull], 0];
private _open = [];
private _touched = [_startRoad];                // consider converting to hash
private ["_connRoads", "_newG", "_newGH"];      // optimization

while {!isNil "_curEntry"} do
{
    _curEntry params ["_curGH", "_curRoad", "_curParent", "_curG"];

    _connRoads = (roadsConnectedTo [_curRoad, true]) - [_curParent];    // need advanced form for crossroads
    if (_endRoad in _connRoads) exitWith {};                            // found the end, just exit
    {
        if (_x in _touched) then { continue };
        if (getRoadInfo _x select 2) then { continue };     // filter out pedestrian trails

        _newG = _curG + ((_x distance _curRoad) max 1);		// max 1 works around dupe roads case
        _newGH = _newG + 1.2*(_x distance _endRoad);
        if (_newGH < _breakDist) then { _open pushBack [_newGH, _x, _curEntry, _newG] };
        _touched pushBack _x;
    } forEach _connRoads;
    _open sort true;
    _curEntry = _open deleteAt 0;
};
if (isNil "_curEntry") exitWith { [] };

// Walk parents to generate route
private _route = [_endRoad];
while {count _curEntry == 4} do {
    _route pushBack (_curEntry select 1);
    _curEntry = _curEntry select 2;
};
reverse _route;

if (_debug) then
{
    deleteMarker "ras_start";
    private _marker = createMarkerLocal ["ras_start", _startRoad];
    _marker setMarkerTypeLocal "mil_dot";
    _marker setMarkerColor "colorblue";

    deleteMarker "ras_end";
    _marker = createMarkerLocal ["ras_end", _endRoad];
    _marker setMarkerTypeLocal "mil_dot";
    _marker setMarkerColor "colorblue";

    for "_i" from 0 to (ras_count-1) do {
        deleteMarker format ["ras_r%1", _i];
    };
    ras_count = count _touched;

    {
        _marker = createMarkerLocal [format ["ras_r%1", _forEachIndex], _x];
        _marker setMarkerTypeLocal "mil_dot";
        _marker setMarkerColor (["colorblack","colorgreen"] select (_x in _route));
    } forEach _touched;
};
_route;
