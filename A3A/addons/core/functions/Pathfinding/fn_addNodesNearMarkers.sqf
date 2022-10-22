/*
    A3A_fnc_addNodesNearMarkers
    Inserts suitable nodes into nav grid if markers don't have one sufficiently close

    Scope: Server or HC
    Environment: Unscheduled

    Arguments: None

    Dependencies:
        Marker arrays: airportsX, outposts etc.
        NavGrid
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// Generate additional nav nodes near markers
_straddlePoints = [];
{
    private _spawnPoint = server getVariable ["spawn_"+_x, _x];
    private _mpos = markerPos _spawnPoint;

    private _navCell = format ["%1/%2", floor ((_mpos#0)/1000), floor ((_mpos#1)/1000)];
    private _navPoints =  A3A_navCellHM getOrDefault [_navCell, []];
    private _navPoints = _navPoints inAreaArray [_mpos, 300, 300];
    if (_navPoints isEqualTo []) then { Trace_1("%1 has no navpoints within 300m", _x); continue };
    if (_navPoints inAreaArray [_mpos, 50, 50] isNotEqualTo []) then { Trace_1("%1 already has nearby navpoints", _x); continue };     // close enough already
    // if there are no navpoints then we should just mark this as unconnected somehow?

    // find nearest nav point in case that's actually the closest point
    private _nearDist = 1e6;
    {
        private _distance = _x distance2d _mpos;
        if (_nearDist > _distance) then { _nearDist = _distance };
    } forEach _navPoints;

    Trace_2("Checking %1 navPoints near %2", count _navPoints, _x);
    private _nearData = false;
    {
        private _index = _x#2;
        private _node = NavGrid#_index;
        private _pos1 = _node#0;
        private _relpos1 = _mpos vectorDiff _pos1;
        {
            private _pos2 = NavGrid#(_x#0)#0;
            private _dir = _pos1 vectorFromTo _pos2;
            private _relpos2 = _mpos vectorDiff _pos2;
            if (_relpos1 vectorDotProduct _dir <= 0) then { continue };     // check that it's actually a straddle case
            if (_relpos2 vectorDotProduct _dir >= 0) then { continue };     // wouldn't need both of these if we sorted by distance first

            private _dist = vectorMagnitude (_relpos1 vectorCrossProduct _dir);
            if (_dist < _nearDist) then {
                private _nearPos = _dir vectorMultiply (_relpos1 vectorDotProduct _dir) vectorAdd _pos1;
                _nearDist = _dist;
                _nearData = [_index, _x#0, _nearPos];
            };
        } forEach _node#3;      // connected nodes [index, type, roaddist]
    } forEach _navPoints;

    if (_nearData isEqualType false) then { Trace_1("No suitable pairs found near %1", _x); continue };     // no suitable pairs
    if (NavGrid#(_nearData#0)#0 distance2d _nearData#2 < 30 or NavGrid#(_nearData#1)#0 distance2d _nearData#2 < 30) then {
        Trace_1("New nav point near %1 would be too close", _x); continue;
    };

    Trace_3("Found straddle point for %1 at distance %2 (check %3)", _x, _nearDist, _nearData#2 distance2d _mpos);

    // first find nearest road segment to position
    private _nearRoad = objNull;
    private _nearDist = 1e4;
    {
        private _dist = _nearData#2 distance2d _x;
        if (_dist < _nearDist) then { _nearDist = _dist; _nearRoad = _x };
    } forEach (_nearData#2 nearRoads 50);       // is this enough? allegedly

    if (isNull _nearRoad) then { Error_2("No road on path near %1 at %2", _x, _nearData#2); continue }; 
    Trace_2("Road found for %1 at distance %2 from point", _x, _nearRoad distance2d _nearData#2);

    // Build a new node between the pair
    private _node1 = NavGrid#(_nearData#0);
    private _node2 = NavGrid#(_nearData#1);
    private _newPos = getPosATL _nearRoad;
    private _newNode = [_newPos, _node1#1, false, []];
    private _newIndex = count NavGrid;
    private _roadType = 1;

    _straddlePoints append [_nearData#0, _nearData#1, _newIndex];

    // relink node 1
    private _n1dist = _node1#0 distance2d _newPos;
    _node1#3 apply { if (_x#0 == _nearData#1) then { _x set [0, _newIndex]; _x set [2, _n1dist]; _roadType = _x#1 } };
    _newNode#3 pushBack [_nearData#0, _roadType, _n1dist];

    // relink node 2
    private _n2dist = _node2#0 distance2d _newPos;
    _node2#3 apply { if (_x#0 == _nearData#0) then { _x set [0, _newIndex]; _x set [2, _n2dist] } };
    _newNode#3 pushBack [_nearData#1, _roadType, _n2dist];

    NavGrid pushBack _newNode;
    _newIndex call A3A_fnc_addToNavCells;

} forEach (airportsX + resourcesX + factories + outposts + seaports + citiesX);

/*
// Test rendering
{
    private _index = _x;
    private _node = NavGrid#_index;
    private _marker = createMarkerLocal [format ["navPoint_%1", _index], _node#0];
    _marker setMarkerTypeLocal "mil_dot";
    _marker setMarkerColor "ColorRed";
    {
        private _nPos = NavGrid#(_x#0)#0;
        private _mid = _node#0 vectorAdd _nPos vectorMultiply 0.5;
        private _dir = _node#0 getDir _nPos;
        private _lineMarker = createMarkerLocal [format ["np_%1_line_%2", _index, _forEachIndex], _mid];
        _lineMarker setMarkerShapeLocal "RECTANGLE";
        _lineMarker setMarkerBrushLocal "SOLID";
        _lineMarker setMarkerColorLocal "ColorBlue";
        _lineMarker setMarkerDirLocal _dir;
        _lineMarker setMarkerSize [3, (_node#0 distance2d _nPos) * 0.5];
    } forEach _node#3;
} forEach _straddlePoints;
*/