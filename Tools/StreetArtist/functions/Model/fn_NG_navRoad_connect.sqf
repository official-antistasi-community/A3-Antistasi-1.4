/*
Maintainer: Caleb Serafin
    Connects two navRoads to each other.

Arguments:
    <NavRoad> NavRoad 1
    <NavRoad> NavRoad 2
    <BOOLEAN> true to set forced connection. Will result in a middle node being added.
    <STRING> Calling function's name (Default = nil)
    <NavRoadHM> Parent hashmap, Used for assertions, optional. (Default = nil)

Environment: Any
Public: No

Example:
    [_leftStruct, _rightStruct, "fn_myFunction", _navRoadHM] call A3A_fnc_NG_navRoad_connect;
*/

params [
    "_leftStruct",
    "_rightStruct",
    "_forcedConnection",
    ["_callingFunctionTitle", "NavRoad Disconnect", [""]],
    ["_navRoadHM", nil]
];

private _fnc_reportMinorIssue = {
    params [["_details","!Sub Error, error details failed to created.", [ "" ]]];
    [3,"From " + _callingFunctionTitle + " | " + _details,"fn_NG_navRoad_connect"] call A3A_fnc_log;
};

[_leftStruct,_navRoadHM,"fn_NG_navRoad_connect"] call A3A_fnc_NG_navRoad_assert;
[_rightStruct,_navRoadHM,"fn_NG_navRoad_connect"] call A3A_fnc_NG_navRoad_assert;


private _leftRoad = _leftStruct#0;
private _rightRoad = _rightStruct#0;
if (_leftRoad isEqualTo _rightRoad) exitWith {
    if (_leftStruct isNotEqualTo _rightStruct) exitWith {
        ("STRUCTS DIFFERENT!!! Tried to connect Road ("+str _leftRoad+") at "+str getPosATL _leftRoad+" to itself.") call _fnc_reportMinorIssue;
    };
    ("Tried to connect Road ("+str _leftRoad+") at "+str getPosATL _leftRoad+" to itself.") call _fnc_reportMinorIssue;
};
private _distance = _leftRoad distance _rightRoad;

private _rightConnections = _rightStruct#1;
private _rightDistances = _rightStruct#2;
if (_leftRoad in _rightConnections) then {
    ("Road ("+str _leftRoad+") at "+str getPosATL _leftRoad+" is already in connections of road ("+str _rightRoad+") at "+str getPosATL _rightRoad+".") call _fnc_reportMinorIssue;
} else {
    _rightConnections pushBack _leftRoad;
    _rightDistances pushBack _distance;
};

private _leftConnections = _leftStruct#1;
private _leftDistances = _leftStruct#2;
if (_rightRoad in _leftConnections) then {
    ("Road ("+str _rightRoad+") at "+str getPosATL _rightRoad+" is already in connections of road ("+str _leftRoad+") at "+str getPosATL _leftRoad+".") call _fnc_reportMinorIssue;
} else {
    _leftConnections pushBack _rightRoad;
    _leftDistances pushBack _distance;
};

if (_forcedConnection) then {
    private _leftForcedConnections = _leftStruct#3;
    private _rightForcedConnections = _rightStruct#3;
    _leftForcedConnections pushBackUnique _rightRoad;
    _rightForcedConnections pushBackUnique _leftRoad;
};

[_leftStruct,_navRoadHM, "fn_NG_navRoad_connect"] call A3A_fnc_NG_navRoad_assert;
[_rightStruct,_navRoadHM, "fn_NG_navRoad_connect"] call A3A_fnc_NG_navRoad_assert;
