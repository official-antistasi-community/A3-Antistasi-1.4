/*  Get Air QRF support selection weight against target

Arguments:
    <OBJECT> Target object
    <SIDE> Side to send support from
    <ARRAY> Array of strings of available types for this faction

Return value:
    <SCALAR> Weight value, 0 for unavailable or useless
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side", "_maxSpend", "_availTypes"];

// make air a bit more likely with war tier? or not?
// air QRFs are typically *less* effective at higher tiers, right?

// specifically don't use it to attack:
// - Fixed wing aircraft
// - static AA
// - AA tanks/trucks
// TODO: Rework vehicle type system to handle this shit better
private _allAA = (A3A_faction_all get "vehiclesPlanesAA") + (A3A_faction_all get "vehiclesAA") + (A3A_faction_all get "staticAA");
if (typeOf _target in _allAA) exitWith { 0 };

// Otherwise fine?
// Could reduce chance for heli or non-infantry targets in general
// It can technically hit air/tanks, it's just not great at it

if (_target isKindOf "Air") exitWith { 0.2 };
if !(_target isKindOf "Man") exitWith { 0.5 };
1;
