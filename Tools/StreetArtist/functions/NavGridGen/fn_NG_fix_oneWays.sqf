/*
Maintainer: Caleb Serafin
    Modifies Reference.
    Fixes connections are one-way. Going from road A to road B, but not road B to road A.
    They output connects will all have a return.

Arguments:
    <navRoadHM> Modifies Reference

Return Value:
    <navRoadHM> Same reference to nav grid with one-ways fixed.

Scope: Any, Global Arguments
Environment: Scheduled
Public: No

Example:
    [_navRoadHM] call A3A_fnc_NG_fix_oneWays;
*/
params [
    "_navRoadHM"
];

{
    private _myStruct = _navRoadHM get _x;
    private _myRoad = _myStruct#0;
    private _myConnections = _myStruct#1;
    private _connectionDistances = _myStruct#2;

    if !(_myConnections isEqualTo A3A_NG_const_emptyArray) then {
        {
            private _otherStruct = _navRoadHM get str _x;
            if !(_myRoad in (_otherStruct#1)) then {
                //[4,"Connecting Road '"+str _x+"' " + str getPosATL _x + " to '"+str _myRoad+"' " + str getPosATL _myRoad + ".","fn_NG_fix_oneWays"] call A3A_fnc_log;

                _otherStruct#1 pushBack _myRoad;
                _otherStruct#2 pushBack (_connectionDistances #_forEachIndex);
                _otherStruct#3 pushBackUnique _myRoad;
                _myStruct#3 pushBackUnique _x;
            };
        } forEach _myConnections;
    };
} forEach _navRoadHM;

_navRoadHM;
