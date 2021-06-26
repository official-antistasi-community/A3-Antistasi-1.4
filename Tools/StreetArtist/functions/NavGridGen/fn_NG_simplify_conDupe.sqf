/*
Maintainer: Caleb Serafin
    Input _navRoadHM is modified!
    Removes duplicate connects between roads.
    Road A has two connections to Road B.

Arguments:
    <navRoadHM> Modifies Reference

Return Value:
    <navRoadHM> Same reference

Scope: Any, Global Arguments
Environment: Scheduled
Public: No

Example:
    [navRoadHM] call A3A_fnc_NG_simplify_conDupe;
*/
params [
    "_navRoadHM"
];
{
    private _myStruct = _navRoadHM get _x;
    private _myConnections = _myStruct#1;
    private _myDistances = _myStruct#2;

    if (count _myConnections > 1) then {
        private _uniqueRoads = [];
        {
            _uniqueRoads pushBackUnique _x
        } forEach _myConnections;

        if (count _myConnections isEqualTo count _uniqueRoads) exitWith {};

        _uniqueDistances = [];
        {
            _uniqueDistances pushBack (_myDistances #(_myConnections find _x) );
        } forEach _uniqueRoads;

        _myConnections resize 0;
        _myDistances resize 0;
        { _myConnections pushBack _x; } forEach _uniqueRoads;
        { _myDistances pushBack _x; } forEach _uniqueDistances;
    };
} forEach _navRoadHM;
_navRoadHM;
