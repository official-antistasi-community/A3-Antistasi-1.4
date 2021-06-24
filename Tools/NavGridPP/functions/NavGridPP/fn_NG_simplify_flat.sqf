/*
Maintainer: Caleb Serafin
    If a node is within the tolerance azimuth to its neighbours, and it is not a junction:
    It's neighbours will be connected directly with the distance equal to the distance to each summed (maintaining true distance)

Arguments:
    <ARRAY<             navGrid:
        <OBJECT>            Road
        <ARRAY<OBJECT>>         Connected roads.
        <ARRAY<SCALAR>>         True driving distance in meters to connected roads.
    >>
    <SCALAR> Max drift the simplified line segment can stray from the road in metres. (Default = 50)

Return Value:
    <ARRAY> Simplified navGrid

Scope: Any, Global Arguments
Environment: Scheduled
Public: No

Example:
    _navGrid = [_navGrid,50] call A3A_fnc_NG_simplify_flat;
*/
params [
    ["_navGrid",[],[ [] ]],
    ["_maxDrift",50,[ 0 ]]
];
private _navGridSimple = +_navGrid;
private _maxDriftSqr = _maxDrift^2;

private _diag_step_sub = "";

private _fnc_diag_render = { // call _fnc_diag_render;
    [
        "Nav Grid++",
        "<t align='left'>" +
        "Simplifying navGrid<br/>"+
        "Simplifying Flat Segments<br/>"+
        _diag_step_sub+"<br/>"+
        "</t>"
    ] remoteExec ["A3A_fnc_customHint",0];
};

private _fnc_getStruct = {
    params ["_navGridSimple","_roadIndexNS","_roadName"];
    _navGridSimple #(_roadIndexNS getVariable [_roadName,-1]);
};
private _fnc_replaceRoadConnection = {
    params ["_roadStruct","_oldRoadConnection","_newRoadConnection","_newDistance"];
    private _connectionRoads = _roadStruct#1;
    private _conIndex = _connectionRoads find _oldRoadConnection;
    if (_conIndex == -1) exitWith {
        [4,"Road '"+str (_roadStruct#0)+"' " + str getPos (_roadStruct#0) + " was not connected to old road '"+str _oldRoadConnection+"' " + str getPos _oldRoadConnection + ".","fn_NG_simplify_flat"] call A3A_fnc_log;
        ["fn_NG_simplify_flat Error","Please check RPT."] call A3A_fnc_customHint;
    };
    _connectionRoads set [_conIndex,_newRoadConnection];
    (_roadStruct#2) set [_conIndex,_newDistance];
};
private _fnc_removeRoadConnection = {
    params ["_roadStruct","_oldRoadConnection"];
    private _connectionRoads = _roadStruct#1;
    private _conIndex = _connectionRoads find _oldRoadConnection;
    _connectionRoads deleteAt _conIndex;
    (_roadStruct#2) deleteAt _conIndex;
};
private _fnc_isRoadConnected = {    // Assumes both will have connection, no one-way.
    params ["_struct","_road"];

    _road in (_struct#1);
};

call _fnc_diag_render;

private _orphanedIndices = [];

private _orphanedRoadsNS = [localNamespace,"NavGridPP","simplify_flat_orphanedRoads", nil, nil] call Col_fnc_nestLoc_set;

private _roadIndexNS = [localNamespace,"NavGridPP","simplify_flat_roadIndex", nil, nil] call Col_fnc_nestLoc_set;
{
    _roadIndexNS setVariable [str (_x#0),_forEachIndex];
} forEach _navGridSimple; // _x is road struct <road,ARRAY<connections>,ARRAY<indices>>


private _const_emptyArray = [];
private _const_allowedRoadTypes = ["ROAD", "MAIN ROAD", "TRACK"];
private _const_pos2DSelect = [0,2];
private _fnc_canSimplify = {
    params ["_myRoad","_otherRoad","_realDistance","_currentRoad"];

    if !(getRoadInfo _myRoad#0 isEqualTo getRoadInfo _otherRoad#0) exitWith {false;};   // Must be same type

    private _base = 0.5 * (_myRoad distance _otherRoad);
    private _hypotenuse = 0.5 * _realDistance; //  The hypotenuse is half, as the worst real road can do is climb to a point, then come back down.

    if ((_hypotenuse^2 - _base^2) > _maxDriftSqr) exitWith { false; };

    private _midPoint2D = getPos _myRoad vectorAdd getPos _otherRoad vectorMultiply 0.5 select _const_pos2DSelect;
    private _nearRoads = (nearestTerrainObjects [_midPoint2D, _const_allowedRoadTypes, _base, false, true]) - [_myRoad,_otherRoad,_currentRoad];
    _nearRoads = _nearRoads select {!(_orphanedRoadsNS getVariable [str _x,false])};

    _nearRoads isEqualTo _const_emptyArray;
};

private _diag_totalSegments = count _navGridSimple;
{
    if (_forEachIndex mod 100 == 0) then {
        _diag_step_sub = "Completion &lt;" + ((100*_forEachIndex /_diag_totalSegments) toFixed 1) + "% &gt; Processing segment &lt;" + (str _forEachIndex) + " / " + (str _diag_totalSegments) + "&gt;";;
        call _fnc_diag_render;
    };

    private _currentStruct = _x;
    private _currentRoad = _currentStruct#0;
    private _currentConnectionNames = _currentStruct#1;
    if ((count _currentConnectionNames) == 2) then {

        private _connectRoad0 = _currentConnectionNames#0;
        private _connectRoad1 = _currentConnectionNames#1;

        private _connectionDistances = _currentStruct#2;
        private _newDistance = _connectionDistances#0 + _connectionDistances#1;

        if !([_connectRoad0,_connectRoad1,_newDistance,_currentRoad] call _fnc_canSimplify) exitWith {};  // Only merge same types of roads and similar azimuth, this will preserve road types and corners
        private _connectStruct0 = [_navGridSimple,_roadIndexNS,str _connectRoad0] call _fnc_getStruct;
        private _connectStruct1 = [_navGridSimple,_roadIndexNS,str _connectRoad1] call _fnc_getStruct;

        if !([_connectStruct0,_connectRoad1] call _fnc_isRoadConnected) then {  // If our neighbours are not already connected:

            [_connectStruct0,_currentRoad,_connectRoad1,_newDistance] call _fnc_replaceRoadConnection;       // We connect our two neighbors together, replacing our own connection
            [_connectStruct1,_currentRoad,_connectRoad0,_newDistance] call _fnc_replaceRoadConnection;
        } else {
            [_connectStruct0,_currentRoad] call _fnc_removeRoadConnection;
            [_connectStruct1,_currentRoad] call _fnc_removeRoadConnection;
        };
        _orphanedIndices pushBack _forEachIndex;
        _orphanedRoadsNS setVariable [str _currentRoad,true];
    };
} forEach _navGridSimple;
[_roadIndexNS] call Col_fnc_nestLoc_rem;
[_orphanedRoadsNS] call Col_fnc_nestLoc_rem;

_diag_step_sub = "Cleaning orphans...";
call _fnc_diag_render;
reverse _orphanedIndices;
[_navGridSimple,_orphanedIndices] call Col_fnc_array_remIndices;

_navGridSimple;
