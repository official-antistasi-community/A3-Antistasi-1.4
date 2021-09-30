/*
Maintainer: Caleb Serafin
    Generates the lookup tables for uintToHex.
Public: Yes, if you really need to inpliment your own hexadecimal formatter.
Example:
    #include "fn_uintToHexGenTables.sqf"
    class fn_uintToHexGenTables { preinit = 1; };
*/
if (isNil {A3A_base16e2LookupTable}) then {
    if (isNil {A3A_base16LookupTable}) then {
        A3A_base16LookupTable = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"];
    };
    if (isNil {A3A_base16e2LookupTable}) then {
        A3A_base16e2LookupTable = [];
        {
            private _prefix = _x;
            A3A_base16e2LookupTable append (A3A_base16LookupTable apply {_prefix + _x});
        } forEach A3A_base16LookupTable;
    };
};
