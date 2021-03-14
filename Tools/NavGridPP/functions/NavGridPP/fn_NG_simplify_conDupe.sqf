/*
Maintainer: Caleb Serafin
    Input _navGrid is modified!
    Removes duplicate connects between roads.
    Road A has two connections to Road B.

Arguments:
    <ARRAY<             navGrid:
        <OBJECT>            Road
        <ARRAY<OBJECT>>         Connected roads.
        <ARRAY<SCALAR>>         True driving distance in meters to connected roads.
    >>

Return Value:
    <ARRAY> Same reference

Scope: Any, Global Arguments
Environment: Scheduled
Public: No

Example:
    _navGrid = [_navGrid] call A3A_fnc_NG_simplify_conDupe;
*/
params [
    ["_navGrid",[],[ [] ]]
];
{
    private _myStruct = _x;
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
} forEach _navGrid;
_navGrid;
