/*  Get SAM support selection weight against target

Arguments:
    <OBJECT> Target object
    <SIDE> Side to send support from
    <SCALAR> Max resource spend (not currently used)

Return value:
    <SCALAR> Weight value, 0 for unavailable or useless
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side"];

if !(_target isKindOf "Air") exitWith { 0 };     // can't hit anything except air

// Should limit to certain templates?

1;          // maybe set higher, especially if it's fixed-wing aircraft?
