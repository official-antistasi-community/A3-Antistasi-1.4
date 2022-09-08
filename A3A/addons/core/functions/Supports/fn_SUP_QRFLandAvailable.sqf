/*  Get land QRF support selection weight against target

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

if (_target in (A3A_faction_all get "vehiclesFixedWing")) exitWith { 0 };     // Arguable but whatever

// Otherwise fine?
[1, 1.8] select (Faction(_side) getOrDefault ["attributeLowAir", false]);
