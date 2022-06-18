#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side"];

if (_target isKindOf "Air") exitWith { 0 };     // can't hit air

private _faction = Faction(_side);
if (_faction get "vehiclesArtillery" isEqualTo []) exitWith { 0 };      // Artillery doesn't exist in this modset
// TODO: move these existence checks to initSupports?

// Weighted against mortars
if(tierWar < 6) exitWith { 0 };
private _weight = (tierWar - 5) / 5;

_weight;
