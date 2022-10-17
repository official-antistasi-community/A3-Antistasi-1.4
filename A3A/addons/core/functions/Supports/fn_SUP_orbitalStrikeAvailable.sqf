/*  Get orbital stike support selection weight against target

Arguments:
    <OBJECT> Target object
    <SIDE> Side to send support from
    <SCALAR> Max resource spend
    <ARRAY> Array of strings of available types for this faction

Return value:
    <SCALAR> Weight value, 0 for unavailable or useless
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side", "_maxSpend", "_availTypes"];

if (_target isKindOf "Air") exitWith { 0 };     // can't hit air (reliably)

if (_maxSpend < 300) exitWith { 0 };        // don't use unless we're rich
if (tierWar < 8) exitWith { 0 };            // don't use until lategame
1;
