/*
Maintainer: Caleb Serafin
    Converts navGrid (The internal format) to navIslands.
    navGrid is not divided into island s.

Arguments:
    <ARRAY<             navGrid:
        <OBJECT>            Road
        <ARRAY<OBJECT>>         Connected roads.
        <ARRAY<SCALAR>>         True driving distance in meters to connected roads.
    >>

Return Value:
    <ARRAY<             navIslands:
        <ARRAY<             A single road network island:
            <OBJECT>            Road
            <ARRAY<OBJECT>>         Connected roads.
            <ARRAY<SCALAR>>         True driving distance in meters to connected roads.
        >>
    >>

Scope: Any, Global Arguments
Environment: Scheduled
Public: Yes

Example:
    private _navGrid = [_navIslands] call A3A_fnc_NG_convert_navGrid_navIslands;
*/
params [
    ["_navGridFlat",[],[ [] ]]
];

private _diag_step_sub = "";

private _fnc_diag_render = { // call _fnc_diag_render;
    [
        "Nav Grid++",
        "<t align='left'>" +
        "Conversion<br/>"+
        "Separating Islands<br/>"+
        _diag_step_sub+"<br/>"+
        "</t>"
    ] remoteExec ["A3A_fnc_customHint",0];
};


private _navIslands = [];    // Array<island>

private _currentNames = [];    // Array<struct>
private _nextNames = [];    // Array<struct>

private _unprocessed = _navGridFlat apply {str (_x#0)};    // Array<road>
private _unprocessedNS = [localNamespace,"NavGridPP","separateIslands","unprocessed", nil, nil] call Col_fnc_nestLoc_set;
{
    _unprocessedNS setVariable [_x,true];
} forEach _unprocessed;

private _structNS = [localNamespace,"NavGridPP","separateIslands","structs", nil, nil] call Col_fnc_nestLoc_set;
{
    _structNS setVariable [str (_x#0),_x];
} forEach _navGridFlat;

private _fnc_nameToStruct = {
    params ["_name"];
    _structNS getVariable [_name,[]];
};

private _fnc_markProcessed = {
    params ["_name"];
    _unprocessedNS setVariable [_name,false];
    _unprocessed deleteAt (_unprocessed find _name);    // Please save a group of indices at a time, then use Col_fnc_remIndices
};

private _fnc_expandCurrent = {
    params ["_name"];
    private _struct = [_name] call _fnc_nameToStruct;
    _currentNavGrid pushBack _struct;
    private _connectedNames = (_struct#1) apply {str _x};
    _connectedNames = _connectedNames select {_unprocessedNS getVariable [_x, false]};
    { [_x] call _fnc_markProcessed } forEach _connectedNames;
    _nextNames append _connectedNames;
};
private _diag_totalSegments = count _unprocessed;
private _diag_sub_counter = 0;
while {count _unprocessed != 0} do {

    private _currentNavGrid = [];    // Array<struct>
    private _newName =_unprocessed deleteAt 0;
    [_newName] call _fnc_markProcessed;
    _nextNames pushBack _newName;

    while {count _nextNames != 0} do {
        if (_diag_sub_counter mod 100 == 0) then {
            _diag_step_sub = "Completion &lt;" + ((100*_diag_sub_counter /_diag_totalSegments) toFixed 1) + "% &gt; Processing segment &lt;" + (str _diag_sub_counter) + " / " + (str _diag_totalSegments) + "&gt;";;
            call _fnc_diag_render;
        };
        _currentNames = _nextNames;
        _nextNames = [];

        {
            _diag_sub_counter = _diag_sub_counter +1;
            [_x] call _fnc_expandCurrent
        } forEach _currentNames;
    };
    _navIslands pushBack _currentNavGrid;
};
deleteLocation _structNS;
[_unprocessedNS] call Col_fnc_nestLoc_rem;
[_structNS] call Col_fnc_nestLoc_rem;

_navIslands;
