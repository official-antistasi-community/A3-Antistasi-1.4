/*
Maintainer: Caleb Serafin
    Converts navGridHM (Format used in StreetArtist) to navGridDB (format saved for A3-Antistasi).
    navGridHM connections are positions.
    navGridDB connections are array indices.
    Conversion is transparent (reversible).

Arguments:
    <navGridHM>

Return Value:
    <navGrdDB>

Scope: Any, Global Arguments
Environment: Scheduled
Public: Yes

Example:
    private _navGridHM = [navGridDB] call A3A_fnc_NG_convert_navGridHM_navGridDB;
*/
params [
    "_navGridHM"
];

private _navGridDB = [];
private _posIndexHM = createHashMapFromArray (keys _navGridHM apply {
    private _struct = _navGridHM get _x;
    [_x,_navGridDB pushBack [+(_struct#0),_struct#1,_struct#2,_struct#3]] // Copy values, positions will not be copied, the connections are copied later.
});

private _error_foundUnknownConnection = false;

{
    private _posLabelledConnections = _x#3;  // Copy as the original will be emptied
    private _indexLabelledConnections = [];  // index Name referes to final state, right now its pos labelled.
    _x set [3,_indexLabelledConnections];
    
    {
        if (isNil {_x#0}) then {
            _error_foundUnknownConnection = true;
            continue;
        };
        private _connectedRoadIndex = _posIndexHM getOrDefault [_x#0, -1];
        if (_connectedRoadIndex >= 0) then {
            _indexLabelledConnections pushBack [_connectedRoadIndex,_x#1,_x#2];
        } else {
            [1,"navGridHm to DB | Could not find position " + str (_x#0),"fn_NG_convert_navGridHM_navGridDB"] call A3A_fnc_log;
            _error_foundUnknownConnection = true;
        }
    } forEach _posLabelledConnections;
} forEach _navGridDB;

if (_error_foundUnknownConnection) then {
    private _errorTitle = "navGridHm to DB";
    private _errorDetails = "Warning: Unknown connections were removed from the DB, please re-import to check that all roads are connected properly.";
    [1,_errorTitle+" | "+_errorDetails,"fn_NG_convert_navGridHM_navGridDB"] call A3A_fnc_log;
    [_errorTitle,_errorDetails,true,600] call A3A_fnc_customHint;
};

_navGridDB;
