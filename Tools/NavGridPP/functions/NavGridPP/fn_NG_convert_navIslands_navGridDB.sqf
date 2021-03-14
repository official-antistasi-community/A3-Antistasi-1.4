/*
Maintainer: Caleb Serafin
    Converts navIslands (Format used in navGridPP) to navGridDB (format used in A3-Antistasi).
    navGridDB is based on road positions.
    navIslands is based on road object references.
    Conversion is transparent (reversible).

Arguments:
    <ARRAY<             navIslands:
        <ARRAY<             A single road network island:
            <OBJECT>            Road
            <ARRAY<OBJECT>>         Connected roads.
            <ARRAY<SCALAR>>         True driving distance in meters to connected roads.
        >>
    >>

Return Value:
    <ARRAY<             navGridDB:
        <POS2D|POSAGL>      Road pos.
        <SCALAR>            Island ID.
        <BOOLEAN>           isJunction.
        <ARRAY<             Connections:
            <SCALAR>            Index in navGridDB of connected road.
            <SCALAR>            Road type Enumeration. {TRACK = 0; ROAD = 1; MAIN ROAD = 2} at time of writing.
            <SCALAR>            True driving distance to connection, includes distance of roads swallowed in simplification.
        >>
        <STRING|SCALAR>     Road name or 0 if name not needed for finding road (Ie. name is need if roadAt cannot find road).
    >> _navGridDB format

Scope: Any, Global Arguments
Environment: Scheduled
Public: Yes

Example:
    private _navGridDB = [navGridDB] call A3A_fnc_NG_convert_navIslands_navGridDB;
*/
params [
    ["_navIslands_IN",[],[ [] ]]
];
private _navIslands = +_navIslands_IN;

{
    private _islandID = _forEachIndex;
    {
        _x pushBack _islandID;
    } forEach _x;   // forEach island, inner _x will be a road struct
} forEach _navIslands;

private _navGrid = [_navIslands] call A3A_fnc_NG_convert_navIslands_navGrid;
private _roadIndexNS = [localNamespace,"NavGridPP","convert_navIslands_navGrid_roadIndex", nil, nil] call Col_fnc_nestLoc_set;
{
    _roadIndexNS setVariable [str (_x#0),_forEachIndex];
} forEach _navGrid; // [road, [connectedRoad], [connectedDistances], islandID]

private _const_roadTypeEnum = ["TRACK","ROAD","MAIN ROAD"]; // Case sensitive
{
    private _struct = _x;
    private _connected = _struct#1;

    {
        private _connection = _x;
        _connected set [_forEachIndex, [
            _roadIndexNS getVariable [str _x, -1],
            _const_roadTypeEnum find (getRoadInfo _x #0),
            _struct#2#_forEachIndex
        ]];
    } forEach _connected;
} forEach _navGrid; // [road, [[connectedRoadIndex,typeEnum,connectedDistance]], [connectedDistances], islandID]
[_roadIndexNS] call Col_fnc_nestLoc_rem;

private _const_pos2DSelect = [0,2];
private _const_posOffsetMatrix = [];    // Okay, not really constant, but you get the deal
for "_axis_x" from -3 to 3 step 1 do {
    for "_axis_y" from -3 to 3 step 1 do {
        _const_posOffsetMatrix pushBack [_axis_x,_axis_y];
    };
};
_fnc_NG_convert_road_DBPosName = {
    params ["_road"];

    private _pos = getPos _road;
    private _name = 0;      // Type may change to string if name is required
    if (isNull roadAt _pos && !(roadAt _pos isEqualTo _road)) then {
        _pos = _pos select _const_pos2DSelect;
    };
    if (isNull roadAt _pos && !(roadAt _pos isEqualTo _road)) then {    // Now we go all out and try a bunch of values from an offset matrix.
        {
            private _newPos = _pos vectorAdd _x select _const_pos2DSelect;  // vectorAdd puts the z back
            if (roadAt _newPos isEqualTo _road) exitWith { _pos = _newPos };   // isEqual check in case a different road was found.
        } forEach _const_posOffsetMatrix;
    };
    if (isNull roadAt _pos && !(roadAt _pos isEqualTo _road)) then {
        _name = str _road;
        [1,"Could not use pos alone to find road '"+_name+"' " + str getPos _road + ".","fn_NG_main"] call A3A_fnc_log;
    };
    [_pos,_name];
};

private _navGridDB = _navGrid apply {
    private _DBPosName = (_x#0) call _fnc_NG_convert_road_DBPosName;
    [
        _DBPosName#0,
        _x#3,
        count (_x#1) > 2,
        _x#1,
        _DBPosName#1
    ]
};

_navGridDB;
