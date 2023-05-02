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

// City
private _nearestCity = nearestLocation [getPosASL _unit, "nameCity"];
_locationPos = locationPosition _nearestCity;
if ((_locationPos distance _unit) < 500) exitWith {
    if (!isNull objectParent _unit) then {
        _group setFormation "COLUMN";
    } else {
        _group setFormation "STAG COLUMN";
    };
    _group setVariable ["PATCOM_Form_Set", [true, serverTime + 300]];
};

// Village
private _nearestVillage = nearestLocation [getPosASL _unit, "NameVillage"];
_locationPos = locationPosition _nearestVillage;
if ((_locationPos distance _unit) < 500) exitWith {
    if ((vehicle _unit) != _unit) then {
        _group setFormation "COLUMN"; 
    } else {
        _group setFormation "STAG COLUMN";
    };
    _group setVariable ["PATCOM_Form_Set", [true, serverTime + 300]];
};

// Hill
private _nearestHill = nearestLocation [getPosASL _unit, "Hill"];
_locationPos = locationPosition _nearestHill;
if ((_locationPos distance _unit) < 500) exitWith {
    if ((vehicle _unit) != _unit) then {
        _group setFormation "LINE";
    } else {
        _group setFormation "LINE";
    };
    _group setVariable ["PATCOM_Form_Set", [true, serverTime + 300]];
};

// Airports/Seaports
private _nearestLocal = nearestLocation [getPosASL _unit, "NameLocal"];
_locationPos = locationPosition _nearestLocal;
if ((_locationPos distance _unit) < 300) exitWith {
    if ((vehicle _unit) != _unit) then {
        _group setFormation "COLUMN"; 
    } else {
        _group setFormation "COLUMN"; 
    };
    _group setVariable ["PATCOM_Form_Set", [true, serverTime + 300]];
};

// Default
_group setFormation "WEDGE";
_group setVariable ["PATCOM_Form_Set", [true, serverTime + 300]];

