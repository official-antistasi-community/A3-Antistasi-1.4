/*  Get mortar support selection weight against target

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

if (_target isKindOf "Air") exitWith { 0 };     // can't hit air

// Mortars don't exist in this modset
private _faction = Faction(_side);
if (_faction get "staticMortars" isEqualTo []) exitWith { 0 };

// balance this one against artillery
if (tierWar < 2) exitWith { 0 };
private _weight = 1 - (0 max (tierWar - 5) / 10);
if (_faction getOrDefault ["attributeLowAir", false]) exitWith { _weight * 1.8 };         // more arty fewer airstrikes
_weight;
