#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side"];

if !(_target isKindOf "Air") exitWith { 0 };     // can't hit anything except air

private _faction = Faction(_side);
if (_faction get "vehiclesPlanesAA" isEqualTo []) exitWith { 0 };      // AA aircraft don't exist in this modset
// TODO: move these existence checks to initSupports?

1;          // maybe set higher, especially if it's fixed-wing aircraft?
