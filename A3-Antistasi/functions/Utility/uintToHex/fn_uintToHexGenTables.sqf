/*
Maintainer: Caleb Serafin
    Generates the lookup tables for uintToHex.
    Only needs to run once per machine.
Public: No.
Example:
    call A3A_fnc_uintToHexGenTables;
*/
A3A_base16LookupTable = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"];

A3A_base16e2LookupTable = [];
{
    private _prefix = _x;
    A3A_base16e2LookupTable append (A3A_base16LookupTable apply {_prefix + _x});
} forEach A3A_base16LookupTable;
