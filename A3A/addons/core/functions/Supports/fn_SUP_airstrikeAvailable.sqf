#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side"];

//Vehicles not available, block support
private _faction = Faction(_side);
if (_faction get "vehiclesPlanesCAS" isEqualTo []) exitWith { 0 };

if (_target isKindOf "Air") exitWith { 0 };     // airstrikes can't hit air

// balance against carpetbombs from tier 6+
if (tierWar < 3) exitWith { 0 };
if (tierWar < 6 or !("carpetBombs" in A3A_supportTypesHM) ) exitWith { 1 };
(tierWar - 5) / 10;       // 90% at tier 6 to 50% at tier 10
