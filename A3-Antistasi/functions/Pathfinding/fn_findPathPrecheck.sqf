/*
Author: Wurzel0701
    Prechecks the given nav node indeces if a path can be found

Arguments:
    <NUMBER> The index of the first nav node
    <NUMBER> The index of the second nav node

Return Value:
    <BOOLEAN> True if path should be possible, false otherwise
    OR
    <ARRAY> Cached path

Scope: Any
Environment: Any
Public: No
Dependencies:
    <NULL>

Example:
    [_indexOne, _indexTwo] call A3A_fnc_findPathPrecheck;
*/

params
[
    ["_startNav", 0, [0]],
    ["_endNav", 0, [0]]
];

private _fileName = "fn_findPathPrecheck";
if(_startNav == -1) exitWith
{
    [1, "No navnode found to start pathfinding at", _fileName] call A3A_fnc_log;
    false;
};

if(_endNav == -1) exitWith
{
    [1, "No navnode found to end pathfinding at", _fileName] call A3A_fnc_log;
    false;
};

if(_startNav == _endNav) exitWith
{
    [1, "Same nodes given, cannot plot between them", _fileName] call A3A_fnc_log;
    false;
};

private _nodesConnected = [_startNav, _endNav] call A3A_fnc_areNodesConnected;
if(!_nodesConnected) exitWith
{
    [2, "The given nodes were not connected, cannot create path", _fileName] call A3A_fnc_log;
    false;
};

private _cachedPaths = missionNamespace getVariable ["CachedPaths", []];
private _pathKey = format ["%1->%2", _startNav, _endNav];
private _cachedIndex = _cachedPaths findIf {(_x select 0) == _pathKey};
if(_cachedIndex != -1) exitWith
{
    _cachedPaths select _cachedIndex select 1;
};
true;
