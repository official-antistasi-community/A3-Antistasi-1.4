/*
Maintainer: Caleb Serafin
    Converts navGridDB (format saved for A3-Antistasi) to navGridHM (Format used in StreetArtist).
    navGridHM connections are positions.
    navGridDB connections are array indices.
    Conversion is transparent (reversible).

Arguments:
    <navGrdDB>

Return Value:
    <navGridHM>

Scope: Any, Global Arguments
Environment: Scheduled
Public: Yes

Example:
    private _navGridHM = [navGridDB] call A3A_fnc_NG_convert_navGridDB_navGridHM;
*/
params [
    "_navGridDB"
];

{
    {
        _x set [0,_navGridDB #(_x#0) #0];
    } forEach _x#3;  // _connections
} forEach _navGridDB;

createHashMapFromArray (_navGridDB apply { [_x#0,_x] });
