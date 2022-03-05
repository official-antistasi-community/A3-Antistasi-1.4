/*
Maintainer: Caleb Serafin
    Disconnects two navRoads from each other.

Arguments:
    <NavRoad> NavRoad 1
    <NavRoad> NavRoad 2
    <STRING> Calling function's name (Default = nil)
    <NavRoadHM> Parent hashmap, Used for assertions, optional. (Default = nil)

Environment: Any
Public: No

Example:
    [_leftStruct, _rightStruct, "fn_myFunction", _navRoadHM] call A3A_fnc_NG_navRoad_disconnect;
*/

params [
    "_leftStruct",
    "_rightStruct",
    ["_callingFunctionTitle", "NavRoad Disconnect", [""]],
    ["_navRoadHM", nil]
];

private _fnc_reportHaltingError = {
    params [["_details","!Sub Error, error details failed to created.", [ "" ]]];
    [1,"From " + _callingFunctionTitle + " | " + _details,"fn_NG_navRoad_disconnect"] call A3A_fnc_log;
    [_callingFunctionTitle,"Please check RPT.<br/>" + _details,true,600] call A3A_fnc_customHint;
};

[_leftStruct,_navRoadHM, "fn_NG_navRoad_disconnect"] call A3A_fnc_NG_navRoad_assert;
[_rightStruct,_navRoadHM, "fn_NG_navRoad_disconnect"] call A3A_fnc_NG_navRoad_assert;

private _leftRoad = _leftStruct#0;
private _rightRoad = _rightStruct#0;


private _rightConnections = _rightStruct#1;
private _rightDistances = _rightStruct#2;
while {_leftRoad in _rightConnections} do {  // sometimes due to simplification or map roads, nodes may be connected multiple times.
    private _leftInRight = _rightConnections find _leftRoad;
    _rightConnections deleteAt _leftInRight;
    _rightDistances deleteAt _leftInRight;
};


private _leftConnections = _leftStruct#1;
private _leftDistances = _leftStruct#2;
while {_rightRoad in _leftConnections} do {  // sometimes due to simplification or map roads, nodes may be connected multiple times.
    private _rightInLeft = _leftConnections find _rightRoad;
    _leftConnections deleteAt _rightInLeft;
    _leftDistances deleteAt _rightInLeft;
};


private _leftForcedConnections = _leftStruct#3;
private _rightForcedConnections = _rightStruct#3;
while {_leftRoad in _rightForcedConnections} do {  // sometimes due to simplification or map roads, nodes may be connected multiple times.
    _rightForcedConnections deleteAt (_rightForcedConnections find _leftRoad);
};
while {_rightRoad in _leftForcedConnections} do {  // sometimes due to simplification or map roads, nodes may be connected multiple times.
    _leftForcedConnections deleteAt (_leftForcedConnections find _rightRoad);
};


[_leftStruct,_navRoadHM, "fn_NG_navRoad_disconnect"] call A3A_fnc_NG_navRoad_assert;
[_rightStruct,_navRoadHM, "fn_NG_navRoad_disconnect"] call A3A_fnc_NG_navRoad_assert;
