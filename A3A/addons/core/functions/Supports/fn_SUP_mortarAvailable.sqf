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

_weight;
