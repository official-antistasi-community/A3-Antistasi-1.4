#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params [["_unitTypeName", nil, [""]], ["_unitDefinition", nil, [[]]]];

if (!isServer) exitWith {};

Debug_3("Registering unit %1 with class %2 and %3 loadouts", _unitTypeName, _unitDefinition#2, count (_unitDefinition#0));

A3A_customUnitTypes setVariable [_unitTypeName, _unitDefinition, true];
