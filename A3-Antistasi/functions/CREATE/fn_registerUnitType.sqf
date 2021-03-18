#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params [["_unitTypeName", nil, [""]], ["_unitLoadouts", nil, [[]]]];

if (!isServer) exitWith {};

Debug_2("Registering unit %1 with %2 loadouts", _unitTypeName, count _unitLoadouts);

customUnitTypes setVariable [_unitTypeName, _unitLoadouts, true];
