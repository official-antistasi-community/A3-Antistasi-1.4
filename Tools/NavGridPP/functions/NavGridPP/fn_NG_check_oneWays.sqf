/*
Maintainer: Caleb Serafin
    Checks that roads connections are not one-way. Going from road A to road B, but not road B to road A

Arguments:
    <ARRAY<
        <OBJECT>        road
        <ARRAY<OBJECT>> connected roads
        <ARRAY<SCALAR>> distances to connected roads
    >> _navGrid format

Return Value:
    <ARRAY> Same reference, no changes

Scope: Any, Global Arguments
Environment: Scheduled
Public: No

Example:
    [_navGrid] call A3A_fnc_NG_check_oneWays;
*/
params [
    ["_navGrid",[],[ [] ]]
];

private _roadIndexNS = [localNamespace,"NavGridPP","simplify_junc_roadIndex", nil, nil] call Col_fnc_nestLoc_set;
{
    _roadIndexNS setVariable [str (_x#0),_forEachIndex];
} forEach _navGrid; // _x is road struct <road,ARRAY<connections>,ARRAY<indices>>

private _throwAndCrash = false;
private _const_emptyArray = [];
{
    private _myStruct = _x;
    private _myRoad = _myStruct#0;
    private _myConnections = _myStruct#1;

    if !(_myConnections isEqualTo _const_emptyArray) then {
        {
            private _otherStruct = _navGrid# (_roadIndexNS getVariable [str _x,-1]);
            if !(_myRoad in (_otherStruct#1)) then {
                _throwAndCrash = true;
                [1,"Road '"+str _x+"' " + str getPos _x + " has no return connection to '"+str _myRoad+"' " + str getPos _myRoad + ".","fn_NG_check_oneWays"] call A3A_fnc_log;
                ["fn_NG_check_oneWays Error","Please check RPT."] call A3A_fnc_customHint;
            };
        } forEach _myConnections;
    };
} forEach _navGrid;
[_roadIndexNS] call Col_fnc_nestLoc_rem;

if (_throwAndCrash) then {
    throw ["fn_NG_check_oneWays","Please check RPT."];
};

_navGrid;

