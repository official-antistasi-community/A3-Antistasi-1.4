/*
    Find shortest road path between two roads using simple A*. Not recommended for >1km.

Parameters:
    <OBJECT> Start road.
    <OBJECT> End road.
    <NUMBER> (Optional, default 2) Maximum travel distance, as multiplier of start->end distance.

Returns:
    <ARRAY> Road objects from start to end, inclusive. Empty array if a path wasn't found.
*/

/* Navgrid format?
ARRAY<           navGridDB:
  <POSATL>          Road pos.
  <SCALAR>          Island ID.
  <BOOLEAN>         isJunction.
  <ARRAY<           Connections:
    <SCALAR>          Index in navGridDB of connected road.
    <SCALAR>          Road type Enumeration. {TRACK = 0; ROAD = 1; MAIN ROAD = 2} at time of writing.
    <SCALAR>          True driving distance to connection, includes distance of roads swallowed in simplification.
  >>
>
[[_posATL,_islandID,_isJunction,[_conPos2D,_roadEnum,_distance]]]
*/

params ["_startPos", "_endPos", "_maxDist"];

private _startIndex = [_startPos] call A3A_fnc_getNearestNavPoint;
private _endIndex = [_endPos] call A3A_fnc_getNearestNavPoint;
// TODO: subtract start->nav and end->nav from distance? Or fancier?
if (NavGrid#_startIndex#1 != NavGrid#_endIndex#1) exitWith { -1 };          // different islands, no route

private _endPos = NavGrid#_endIndex#0;
private _curEntry = [NavGrid#_startIndex#0 distance2d _endNavPos, _startIndex, -1, 0];
private _open = [];
private _touched = createHashMapFromArray [[_startIndex, true]];
private ["_newIndex", "_newG", "_newGH"];      // optimization

scopeName "main";
while {!isNil "_curEntry"} do
{
    _curEntry params ["_curGH", "_curIndex", "_curParent", "_curG"];
    {
        _newIndex = _x#0;
        if (_newIndex in _touched) then { continue };
        if (_newIndex == _endIndex) exitWith { (_curG + _x#2) breakOut "main" };                            // found the end, return distance

        _newG = _curG + _x#2;
        _newGH = _newG + 1.2*(NavGrid#_newIndex#0 distance _endPos);
        if (_newGH < _maxDist) then { _open pushBack [_newGH, _newIndex, _curIndex, _newG] };
        _touched set [_newIndex, true];

    } forEach (NavGrid#_curIndex#3);

    _open sort true;
    _curEntry = _open deleteAt 0;
};
-1;         // If we got here then pathfinding failed



/*
// Walk parents to generate route
private _route = [_endRoad];
while {count _curEntry == 4} do {
    _route pushBack (_curEntry select 1);
    _curEntry = _curEntry select 2;
};
reverse _route;
*/