/*  Get airstrike support selection weight against target

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

if (_target isKindOf "Air") exitWith { 0 };     // airstrikes can't hit air

// balance against carpetbombs from tier 6+
if (tierWar < 3) exitWith { 0 };
if (tierWar < 6 or !("CARPETBOMBS" in _availTypes)) exitWith { 1 };
1 - (tierWar - 5) / 10;       // 90% at tier 6 to 50% at tier 10
