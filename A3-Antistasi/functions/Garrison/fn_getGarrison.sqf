#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_marker"];

/*  Returns the garrison of a marker in the format it is needed
*   Params:
*     _marker: STRING : The name of the marker to get the garrison from
*
*   Returns:
*     _result: ARRAY : The garrison in the correct format
*/

private ["_result"];

if(isNil "_marker") exitWith {Error("No marker given!")};

_result = garrison getVariable [format ["%1_garrison", _marker], [["", [], []]]];

_result;
