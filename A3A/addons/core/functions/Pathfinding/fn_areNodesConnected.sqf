/*
Author: Wurzel0701
    Determines if two nodes are connected by roads

Arguments:
    <NUMBER> The index of the first node OR <ARRAY> The first node
    <NUMBER> The index of the second node OR <ARRAY> The second node

Return Value:
    <BOOLEAN> True if the nodes are connected, false otherwise

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <ARRAY> navGrid

Example:
    [12, _myNode] call A3A_fnc_areNodesConnected;
*/

params
[
    ["_firstNode", -1, [0, []]],
    ["_secondNode", -1, [0, []]]
];

private _isConnected = true;
if(_firstNode isEqualType 0) then
{
    if(_firstNode == -1) exitWith
    {
        _isConnected = false;
    };
    _firstNode = navGrid select _firstNode;
};

if(_secondNode isEqualType 0) then
{
    if(_secondNode == -1) exitWith
    {
        _isConnected = false;
    };
    _secondNode = navGrid select _secondNode;
};

if(!_isConnected) exitWith {false};

_isConnected = (_secondNode select 1) == (_firstNode select 1);
_isConnected;
