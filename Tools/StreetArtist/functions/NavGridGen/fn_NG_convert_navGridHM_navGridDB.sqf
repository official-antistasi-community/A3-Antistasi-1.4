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
    [_x,_navGridDB pushBack [+(_struct#0),_struct#1,_struct#2,+(_struct#3)]] // Copy values, positions will not be copied
});

{
    {
        _x set [0,_posIndexHM get (_x#0)]
    } forEach _x#3;  // _connections
} forEach _navGridDB;

_navGridDB;
