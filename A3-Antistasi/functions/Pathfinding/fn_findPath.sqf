/*
Author: Wurzel0701
    Searches a path between two given points
    Start and End position will always be part of the path and marked as junction if path is found

Arguments:
    <POSITION> The position from which the search is starting
    <POSITION> The position to which the search is going to
    <ARRAY> Node data (actual data from the navGrid) of blocked nodes

Return Value:
    <ARRAY> An path based of <POSITION, BOOL isJunction>

Scope: Any
Environment: Scheduled
Public: Yes
Dependencies:
    <BOOLEAN> pathfindingActive
    <ARRAY> navGrid

Example:
    [pos player, pos _target, []] call A3A_fnc_findPath;
*/

params
[
    ["_startPos", [0,0,0], [[]]],
    ["_endPos", [0,0,0], [[]]],
    ["_avoid", [], [[]]]
];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
#define WORKSTATE_UNTOUCHED         0
#define WORKSTATE_OPENED            1
#define WORKSTATE_CLOSED            2
#define WORKSTATE_AVOID_OPENED      3
#define WORKSTATE_AVOID_UNTOUCHED   4

#define AVOID_PENALTY               15

private _fileName = "findPath";
private _deltaTime = time;
Debug_2("Starting pathfinding from %1 to %2", _startPos, _endPos);

private _startNavIndex = [_startPos] call A3A_fnc_getNearestNavPoint;
private _endNavIndex = [_endPos] call A3A_fnc_getNearestNavPoint;

private _preCheckValue = [_startNavIndex, _endNavIndex] call A3A_fnc_findPathPrecheck;
if(_preCheckValue isEqualType []) exitWith
{
    Info("Requested path was cached, returned cached path");
    _preCheckValue;
};

if(!_preCheckValue) exitWith
{
    [];
};

if(isNil "pathfindingActive") then
{
    pathfindingActive = false;
};
waitUntil {!pathfindingActive};
pathfindingActive = true;

private _startNav = navGrid select _startNavIndex;
private _endNav = navGrid select _endNavIndex;

Info_4("Start %1 at %2 End %3 at %4", _startNav, str _startPos, _endNav, str _endPos);

private _touchedNodes = [];
//Blocking avoid elements
{
    missionNamespace setVariable [format ["PF_%1", str (_x select 0)], WORKSTATE_AVOID_UNTOUCHED];
    _touchedNodes pushBack (str (_x select 0));
} forEach _avoid;

//Start A* here
private _openList = [];
private _closedList = [];
private _targetPos = _endNav select 0;
private _startNavPos = _startNav select 0;
private _maxDistance = 10 * ((_endNav select 0) distance (_startNav select 0));
private _lastNav = -1;

_openList pushBack [_startNav, 0, [_startNav select 0, _endNav select 0] call A3A_fnc_calculateH, "Start"];
missionNamespace setVariable [format ["PF_%1", str (_startNav select 0)], WORKSTATE_OPENED];
_touchedNodes pushBack (str (_startNav select 0));

while {(!(_lastNav isEqualType [])) && {count _openList > 0}} do
{
    //Select node with lowest score
    private _current = _openList deleteAt 0;

    //Close node
    private _closedListIndex = _closedList pushBack _current;
    missionNamespace setVariable [format ["PF_%1", str (_current select 0 select 0)], WORKSTATE_CLOSED];
    missionNamespace setVariable [format ["CL_%1", str (_current select 0 select 0)], _closedListIndex];

    //Gather next nodes
    private _currentConnections = _current select 0 select 3;
    private _currentPos = _current select 0 select 0;
    {
        private _conData = _x;
        private _conIndex = _conData select 0;


        //sleep 1;

        //Found a path to the node
        if(_conIndex == _endNavIndex) exitWith
        {
            _lastNav = _current;
        };
        private _conNode = navGrid select _conIndex;

        //Not in closed list
        private _workState = missionNamespace getVariable [format ["PF_%1", str (_conNode select 0)], WORKSTATE_UNTOUCHED];
        if(_workState != WORKSTATE_CLOSED) then
        {
            if(_workState == WORKSTATE_UNTOUCHED || _workState == WORKSTATE_AVOID_UNTOUCHED) then
            {
                //Not in open list, add to it
                private _h = [_conNode select 0, _targetPos] call A3A_fnc_calculateH;
                private _newDistance = (_current select 1) + (_conData select 2) * (1 / ((_conData select 1) max 0.5));
                if(_workState == WORKSTATE_AVOID_UNTOUCHED) then
                {
                    _newDistance = (_current select 1) + (_conData select 2) * AVOID_PENALTY;
                };
                if(_newDistance < _maxDistance) then
                {
                    //[_conIndex, "mil_dot", "ColorBlue", str (count (_conNode select 3))] call A3A_fnc_markNode;
                    //Debug_1("Adding %1 to the list", str ([_conNode, _newDistance, _h, (_current select 0 select 0)]));
                    _openList = [_openList, [_conNode, _newDistance, _h, (_current select 0 select 0)]] call A3A_fnc_listInsert;
                    missionNamespace setVariable [format ["PF_%1", str (_conNode select 0)], WORKSTATE_OPENED];
                    if(_workState == WORKSTATE_AVOID_UNTOUCHED) then
                    {
                        missionNamespace setVariable [format ["PF_%1", str (_conNode select 0)], WORKSTATE_AVOID_OPENED];
                    };
                    _touchedNodes pushBack (str (_conNode select 0));
                }
                else
                {
                    //Debug_1("Not adding %1 to the list because of distance", _conData);
                };
            }
            else
            {
                //In open list, adapt distance if needed
                private _openListIndex = _openList findIf {(_x select 0 select 0) isEqualTo (_conNode select 0)};
                //Debug_3("ConNode %3 || Open list index is %1, state was %2", _openListIndex, _workState, _conNode);
                if(_openListIndex != -1) then
                {
                    private _openData = _openList deleteAt _openListIndex;
                    private _newDistance = (_current select 1) + (_conData select 2) * (1 / ((_conData select 1) max 0.5));
                    if(_workState == WORKSTATE_AVOID_OPENED) then
                    {
                        _newDistance = (_current select 1) + (_conData select 2) * AVOID_PENALTY;
                    };
                    if((_openData select 1) > _newDistance) then
                    {
                        //New way is shorter, adapt node
                        _openData set [1, _newDistance];
                        _openData set [3, (_current select 0 select 0)];
                    };
                    //Debug_1("Replacing %1 into the list", str (_openData));
                    _openList = [_openList, _openData] call A3A_fnc_listInsert;
                }
                else
                {
                    Error_1("BROKEN NODE %1", _conNode);
                    //[_conIndex, "mil_dot", "ColorRed", "BROKEN"] call A3A_fnc_markNode;
                };
            };
        };
    } forEach _currentConnections;
};
//A* finished, way found



//Create raw path out of data now
private _wayPoints = [];
private _lastIndex = 0;
if(_lastNav isEqualType []) then
{
    //Way found, reverting way through path
    Info_2("Max Distance %1, Distance %2", _maxDistance, _lastNav select 1);
    _wayPoints = [[_endPos, true], [_targetPos, true]];
    while {_lastNav isEqualType []} do
    {
        _wayPoints pushBack [_lastNav select 0 select 0, _lastNav select 0 select 2];
        _lastIndex = missionNamespace getVariable [format ["CL_%1", _lastNav select 3], -1];
        if(_lastIndex != -1) then
        {
            _lastNav = _closedList select _lastIndex;
        }
        else
        {
            _lastNav = -1;
        }
    };
    _wayPoints pushBack [_startPos, true];
    reverse _wayPoints;

    _deltaTime = time - _deltaTime;
    Info_1("Successful finished pathfinding after %1 seconds", _deltaTime);
}
else
{
    _deltaTime = time - _deltaTime;
    Error_1("Could not find a way, search took %1 seconds, max distance reached", _deltaTime);
};

{
    missionNamespace setVariable [format ["PF_%1", _x], WORKSTATE_UNTOUCHED];
    missionNamespace setVariable [format ["CL_%1", _x], WORKSTATE_UNTOUCHED];
} forEach _touchedNodes;

pathfindingActive = false;

//Cache results
private _cachedPaths = missionNamespace getVariable ["CachedPaths", []];
private _pathKey = format ["%1->%2", _startNavIndex, _endNavIndex];
private _cachedIndex = _cachedPaths findIf {(_x select 0) == _pathKey};
if(_cachedIndex == -1) then
{
    _cachedPaths pushBack [_pathKey, _wayPoints];
    if(count _cachedPaths > 20) then
    {
        _cachedPaths deleteAt 0;
    };
    missionNamespace setVariable ["CachedPaths", _cachedPaths, true];
};

_wayPoints;
