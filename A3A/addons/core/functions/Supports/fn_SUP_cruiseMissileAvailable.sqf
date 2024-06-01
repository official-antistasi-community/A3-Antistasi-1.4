#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side", "_maxSpend", "_availTypes"];

///if(tierWar < 7) exitWith {-1}; don't forget to uncommnet it
if !(allowUnfairSupports) exitWith {-1};
private _loadedTemplate = if (_side isEqualTo Occupants) then {A3A_Occ_template} else {A3A_Inv_template};
if (toLower _loadedTemplate isEqualTo "VN") exitWith {-1}; //dont allow with VN
if ("lowTech" in A3A_factionEquipFlags) exitWith {-1}; //leave it like this untill, we add CM launcher vehicle type, and if WW2 modsets have V-2 rockets or something

if (_target isKindOf "Air") exitWith { 0 };     // can't hit anything except air

// Should limit to certain templates?

1;          // maybe set higher, especially if it's fixed-wing aircraft?