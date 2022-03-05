/*
Maintainer: Wurzel0701
    Determines if two positions or markers are connected by roads

Arguments:
    <POS> The first position OR <STRING> The first marker
    <POS> The second position OR <STRING> The second marker

Return Value:
    <BOOLEAN> True if the positions are connected, false otherwise

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <NONE>

Example:
    ["outpost1", getPos player] call A3A_fnc_arePositionsConnected;
*/

params
[
    ["_pos1", [0,0,0], ["", []]],
    ["_pos2", [0,0,0], ["", []]]
];

if (_pos1 isEqualType "") then {_pos1 = getMarkerPos _pos1};
if (_pos2 isEqualType "") then {_pos2 = getMarkerPos _pos2};

private _node1 = [_pos1] call A3A_fnc_getNearestNavPoint;
private _node2 = [_pos2] call A3A_fnc_getNearestNavPoint;

private _result = [_node1, _node2] call A3A_fnc_areNodesConnected;
_result;
