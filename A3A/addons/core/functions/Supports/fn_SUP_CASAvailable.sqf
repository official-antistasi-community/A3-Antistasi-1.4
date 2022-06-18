#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side"];


private _faction = Faction(_side);
if (_faction get "vehiclesPlanesCAS" isEqualTo []) exitWith { 0 };      // AA aircraft don't exist in this modset
// TODO: move these existence checks to initSupports?

if (_target isKindOf "Air") exitWith { 0 };         // can't hit air

if (_target isKindOf "Man") exitWith { 0.2 };       // Don't use too often against meatsacks

// Against vehicles and statics, use more frequently against more dangerous stuff
private _threat = A3A_groundVehicleThreat getOrDefault [typeOf _target, 0];
0.4 + _threat / 100;
