/*  Get carpet bombing support selection weight against target

Arguments:
    <OBJECT> Target object
    <SIDE> Side to send support from
    <SCALAR> Max resource spend (not currently used)
    <ARRAY> Array of strings of available types for this faction

Return value:
    <SCALAR> Weight value, 0 for unavailable or useless
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side", "_maxSpend", "_availTypes"];

if (_target isKindOf "Air") exitWith { 0 };     // can't hit air. What about isTouchingGround though?

// balance this one against airstrikes
if (tierWar < 6) exitWith { 0 };
(tierWar - 5) / 10;       // 10% at tier 6 to 50% at tier 10
