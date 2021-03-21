/*
Author: Wurzel0701
    Searches for the nodes in a given distance around a starting position

Arguments:
    <POSITION> The position from which the search is starting
    <NUMBER> The distance in which the nodes should be found

Return Value:
    <ARRAY<INT>> An array containing the indeces of the defined nodes, empty if none found

Scope: Any
Environment: Scheduled
Public: Yes
Dependencies:
    <BOOLEAN> pathfindingActive
    <ARRAY> navGrid

Example:
    [pos player, 500] call A3A_fnc_findNodesInDistance;
*/

params
[
    ["_startPos", [], [[]]],
    ["_distance", 0, [0]]
];

#define WORKSTATE_UNTOUCHED         0
#define WORKSTATE_OPENED            1
#define WORKSTATE_CLOSED            2

private _fileName = "findNodesInDistance";
private _deltaTime = time;

private _startNavIndex = [_startPos] call A3A_fnc_getNearestNavPoint;

if(_startNavIndex == -1) exitWith
{
    [1, "No navnode found to start node search at", _fileName] call A3A_fnc_log;
    [];
};

if(isNil "pathfindingActive") then
{
    pathfindingActive = false;
};
waitUntil {!pathfindingActive};
pathfindingActive = true;

private _startNav = navGrid select _startNavIndex;

private _openList = [];
private _closedList = [];
private _startNavPos = _startNav select 0;
private _rangeNodes = [];
private _touchedNodes = [];

_openList pushBack [_startNav, 0, 0];
missionNamespace setVariable [format ["PF_%1", str (_startNav select 0)], WORKSTATE_OPENED];
_touchedNodes pushBack (str (_startNav select 0));

while {count _openList > 0} do
{
    //Select node with lowest score
    private _current = _openList deleteAt 0;

    //Close node
    _closedList pushBack _current;
    missionNamespace setVariable [format ["PF_%1", str (_current select 0 select 0)], WORKSTATE_CLOSED];

    //Gather next nodes
    private _currentConnections = _current select 0 select 3;
    private _currentPos = _current select 0 select 0;
    {

        private _conData = _x;
        private _conIndex = _conData select 0;
        private _conNode = navGrid select _conIndex;

        //Not in closed list
        private _workState = missionNamespace getVariable [format ["PF_%1", str (_conNode select 0)], WORKSTATE_UNTOUCHED];
        if(_workState != WORKSTATE_CLOSED) then
        {
            if(_workState == WORKSTATE_UNTOUCHED) then
            {
                //Not in open list, add to it
                private _newDistance = (_current select 1) + (_conData select 2);
                if(_newDistance < _distance) then
                {
                    _openList = [_openList, [_conNode, _newDistance, 0]] call A3A_fnc_listInsert;
                    missionNamespace setVariable [format ["PF_%1", str (_conNode select 0)], WORKSTATE_OPENED];
                    _touchedNodes pushBack (str (_conNode select 0));
                }
                else
                {
                    _rangeNodes pushBack _conIndex;
                    missionNamespace setVariable [format ["PF_%1", str (_conNode select 0)], WORKSTATE_CLOSED];
                    _touchedNodes pushBack (str (_conNode select 0));
                };
            }
            else
            {
                //In open list, adapt distance if needed
                private _openListIndex = _openList findIf {(_x select 0 select 0) isEqualTo (_conNode select 0)};
                if(_openListIndex != -1) then
                {
                    private _openData = _openList deleteAt _openListIndex;
                    private _newDistance = (_current select 1) + (_conData select 2);
                    if((_openData select 1) > _newDistance) then
                    {
                        //New way is shorter, adapt node
                        _openData set [1, _newDistance];
                    };
                    _openList = [_openList, _openData] call A3A_fnc_listInsert;
                };
            };
        };
    } forEach _currentConnections;
};

{
    missionNamespace setVariable [format ["PF_%1", _x], WORKSTATE_UNTOUCHED];
} forEach _touchedNodes;

pathfindingActive = false;

_rangeNodes;
