/*
    Author: [Hazey] [Genesis]

    Description:
        Set Units formation based on location

    Arguments:
        <Object> Leader of group you want formations set on.

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_unit] call A3A_fnc_patrolHandleFormation;

    License: MIT License
*/

params ["_unit"];

// Distance to check on surrounding features to set formation around.
private _distanceToCheck = 300;

//Grab the group of the unit
private _group = group _unit;

private _formationSet = _group getVariable ["PATCOM_Form_Set", [false, 0]];

if ((_formationSet # 1) < serverTime) then {
    _group setVariable ["PATCOM_Form_Set", [false, 0]];
};

if (_formationSet # 0) exitWith {};

private _locationPos = [];

//Vehicular groups in "SAFE" behaviour will move in convoys
if (!isNull objectParent _unit && {behaviour _unit == "SAFE"}) exitWith {
    _group setFormation "FILE";
    _group setVariable ["PATCOM_Form_Set", [true, serverTime + 300]];
};

// City / Village
private _nearestCity = nearestLocations [getPosASL _unit, ["nameCity", "NameVillage"], _distanceToCheck];
if (count _nearestCity > 0) exitWith {
    if (!isNull objectParent _unit) then {
        _group setFormation "COLUMN";
    } else {
        _group setFormation "STAG COLUMN";
    };
    _group setVariable ["PATCOM_Form_Set", [true, serverTime + 300]];
};

// Hill
private _nearestHill = nearestLocations [getPosASL _unit, ["Hill"], _distanceToCheck];
if (count _nearestHill > 0) exitWith {
    _group setFormation "LINE";
    _group setVariable ["PATCOM_Form_Set", [true, serverTime + 300]];
};

// Airports/Seaports
private _nearestLocal = nearestLocations [getPosASL _unit, ["NameLocal"], _distanceToCheck];
if (count _nearestLocal > 0) exitWith {
    _group setFormation "COLUMN"; 
    _group setVariable ["PATCOM_Form_Set", [true, serverTime + 300]];
};

// Default
_group setFormation "WEDGE";
_group setVariable ["PATCOM_Form_Set", [true, serverTime + 300]];

