/*
Author: Wurzel0701
    Sets the given nav node index on the given position

Arguments:
    <NUMBER> The index of the nav node to set (Has to be an integer)
    <STRING> A string describing the position as given by A3A_fnc_getMainPositions

Return Value:
    <NULL>

Scope: Server
Environment: Any
Public: No
Dependencies:
    <NULL>

Example:
    [_navNodeIndex, _position] call A3A_fnc_setNavData;
*/

params
[
    ["_index", -1, [-1]],
    ["_posString", "", [""]]
];

private _navPoints = missionNamespace getVariable [(format ["%1_navData", _posString]), []];
_navPoints pushBack _index;
missionNamespace setVariable [(format ["%1_navData", _posString]), _navPoints];
