/*
Maintainer: Caleb Serafin
    Converts navGridDB (format used in A3-Antistasi) to navIslands (Format used in navGridPP).
    navGridDB is based on road positions.
    navIslands is based on road object references.
    Conversion is transparent (reversible).

Arguments:
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

Return Value:
    <ARRAY<             navIslands:
        <ARRAY<             A single road network island:
            <OBJECT>            Road
            <ARRAY<OBJECT>>         Connected roads.
            <ARRAY<SCALAR>>         True driving distance in meters to connected roads.
        >>
    >>

Scope: Any, Global Arguments
Environment: Scheduled
Public: Yes

Example:
    private _navIslands = [navGridDB] call A3A_fnc_NG_convert_navGridDB_navIslands;
*/

params [
    ["_navGridDB_IN",[],[ [] ]]
];
private _navGridDB = +_navGridDB_IN;

{
    _x set [0, _x call A3A_fnc_NG_convert_DBStruct_road];
} forEach _navGridDB;
// [road, islandID, isJunction, [connectedRoadIndex, roadTypeEnum, distance]]

private _failedRoadList = [];
{
    if (isNull (_x#0)) then {
        _failedRoadList pushBack _navGridDB_IN #_forEachIndex #0;
    };
} forEach _navGridDB;
if !(_failedRoadList isEqualTo []) exitWith {
    ["ERROR: COULD NOT FIND ROAD AT",str _failedRoadList] call A3A_fnc_customHint;
    copyToClipboard str _failedRoadList;
    {
        private _name = "NGPP_error_" + str _x;
        createMarkerLocal [_name,_x];
        _name setMarkerTypeLocal "mil_dot";
        _name setMarkerSizeLocal [1, 1];
        _name setMarkerColor "ColorRed";
    } forEach _failedRoadList;
    [];
};


{
    private _connections = _x#3;
    {
        _x set [0, (_navGridDB #(_x#0) )#0 ];
    } forEach _connections;
} forEach _navGridDB;
// [road, islandID, isJunction, [connectedRoad, roadTypeEnum, distance]]

  // This process is done in case the ID's jump numbers
private _islandIDs = [];
{
    _islandIDs pushBackUnique (_x#1);
} forEach _navGridDB;
_islandIDs sort true;

_navGridDBIslands = _islandIDs apply {[]};
{
    _navGridDBIslands#(_x#1) pushBack _x;
} forEach _navGridDB;
// [road, islandID, isJunction, [connectedRoad, roadTypeEnum, distance]]

private _navIslands = _navGridDBIslands apply {_x apply {[
    _x#0,
    (_x#3) apply {_x#0},
    (_x#3) apply {_x#2}
]}};
_navIslands;
