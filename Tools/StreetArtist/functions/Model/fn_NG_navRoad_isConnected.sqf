/*
Maintainer: Caleb Serafin
    Returns if two roads are connected.

Arguments:
    <NavRoad> NavRoad 1
    <NavRoad> NavRoad 2

Return:
    <BOOLEAN> if the roads are connected.

Environment: Any
Public: No

Example:
    [_leftNavRoad, _rightNavRoad] call A3A_fnc_NG_navRoad_isConnected;
*/

params [
    "_leftNavRoad",
    "_rightNavRoad"
];

private _leftRoad = _leftNavRoad#0;
private _rightRoad = _rightNavRoad#0;
private _leftConnections = _leftNavRoad#1;
private _rightConnections = _rightNavRoad#1;

_leftRoad in _rightConnections || _rightRoad in _leftConnections;
