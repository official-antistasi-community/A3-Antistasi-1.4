#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_house"];

private _enterable = !((_house buildingPos 0) isEqualTo [0,0,0]);

// Check if the house is blacklisted
if (_enterable && !(isNil "PATCOM_Building_Blacklist")) then {
    if ((typeOf _house) in PATCOM_Building_Blacklist) then {
        _enterable = false;
    };
};

_enterable