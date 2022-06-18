#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side", "_maxSpend"];

if (_target isKindOf "Air") exitWith { 0 };     // can't hit air. What about isTouchingGround though?

// Carpet bombs exist in every modset because they use a fake plane?
//private _faction = Faction(_side);
//if (_faction get "staticMortars" isEqualTo []) exitWith { 0 };

// balance this one against airstrikes
if (tierWar < 6) exitWith { 0 };
private _weight = 1 - (tierWar - 5) / 10;       // 10% at tier 1 to 50% at tier 10

_weight;
