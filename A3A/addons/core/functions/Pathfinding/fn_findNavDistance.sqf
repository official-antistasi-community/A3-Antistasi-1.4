/*
    A3A_fnc_findNavDistance
    Find shortest road distance between two positions or nav indices using simple A*

Parameters:
    <INTEGER|POS2D|STRING> Start marker, position or nav index.
    <INTEGER|POS2D|STRING> End marker, position or nav index.
    <SCALAR> Optional: Maximum travel distance in metres.

Returns:
    <SCALAR> Minimum Road distance from start to end, or -1 if none found or max dist exceeded
*/

params ["_start", "_end", ["_maxDist", 1e5]];

private _startIndex = if (_start isEqualType 0) then { _start } else { [_start] call A3A_fnc_getNearestNavPoint };
private _endIndex = if (_end isEqualType 0) then { _end } else { [_end] call A3A_fnc_getNearestNavPoint };
if (_startIndex < 0 or _endIndex < 0) exitWith { -1 };
if (NavGrid#_startIndex#1 != NavGrid#_endIndex#1) exitWith { -1 };          // different islands, no route

// TODO: subtract start->nav and end->nav from distance? Or fancier?

private _endPos = NavGrid#_endIndex#0;
private _curEntry = [0, _startIndex, 0, -1];            // curGH is really (NavGrid#_startIndex#0 distance2d _endPos), but not accessed here
private _open = [];
private _touched = createHashMapFromArray [[_startIndex, true]];
private ["_newIndex", "_newG", "_newGH"];      // optimization

scopeName "main";
while {!isNil "_curEntry"} do
{
    _curEntry params ["", "_curIndex", "_curG"];        // full is [curGH, curIndex, curG, curParent]
    {
        _newIndex = _x#0;
        if (_newIndex in _touched) then { continue };
        if (_newIndex == _endIndex) exitWith { (_curG + _x#2) breakOut "main" };                            // found the end, return distance

        _newG = _curG + _x#2;
        _newGH = _newG + 1.2*(NavGrid#_newIndex#0 distance _endPos);
        if (_newGH < _maxDist) then { _open pushBack [_newGH, _newIndex, _newG, _curIndex] };
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