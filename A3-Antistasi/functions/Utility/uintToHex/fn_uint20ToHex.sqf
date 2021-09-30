#include "fn_uintToHexGenTables.sqf"
A3A_base16e2LookupTable # floor (_this / 4096) +
A3A_base16e2LookupTable # floor (_this / 256 mod 256) +
A3A_base16LookupTable # (_this mod 16);
