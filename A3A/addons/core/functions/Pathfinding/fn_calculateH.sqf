/*
Author: Wurzel0701
    Calculate the H (hypotethic) value for the pathfinding

Arguments:
    <POSITION> The start position from which the value will be measured
    <POSITION> The end position to which the value will be measured

Return Value:
    <NUMBER> The calculated H value

Scope: Any
Environment: Any
Public: No
Dependencies:
    <NULL>

Example:
    [getPos player, getPos _target] call A3A_fnc_calculateH;
*/

#define OVERHEAD 1.2

//Behavior:
//A lower overhead value will make the estimated way shorter, resulting in better score for nodes that are not far away from the start point
//This will yield better results for paths where the obvious way is not correct
//A higher overhead value will make the estimated way longer, resulting in better score for nodes that are not far away from the end point
//This will yield better results for paths where the obvious way is correct

//Better results means faster results with less touched nodes
//Hint by Wurzel: 1.2 returns fair results in both cases. I recommend some value around it

params
[
    ["_pos", [0,0,0], [[]]],
    ["_target", [0,0,0], [[]]]
];

private _distance = _pos distance _target;
_distance = _distance * OVERHEAD;

_distance;
