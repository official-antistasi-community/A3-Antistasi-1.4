/*
    Function: A3A_fn_TV_verifyAssets

    Author: 
        - Håkon

    Description:
        Verifies the template assets

    Params:
        _faction - hashmap containing faction information
        _side - Side to of faction
        _templatePath - path to the template

    Return: 
        Failed Loadouts (key 'valid' contains the faction valid state)

    Scope: 
        Server,Server/HC,Clients,Any

    Environment: 
        Scheduled/unscheduled/Any

    Public: 
        Yes/No

    Dependencies:
        NONE

    Example:
        [_faction, _side, _file] call A3A_fnc_TV_verifyAssets;

    License: 
        MIT License

*/

#include "..\..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_faction", "_side", "_templatePath"];

//===========|
// Functions |
//===========|

/* 
  Functions: _fnc_printInvalidReasons
  prints invalid templates issues

*/ 
private _fnc_printInvalidReasons = {
    if (_invalidReasons isEqualTo []) exitWith {};
    Error(_templatePath+" Template validation failed for:" + endl + _LOG_newLineIndicator + (_invalidReasons joinString (endl + _LOG_newLineIndicator)));
};

/* 
  Functions: _fnc_validClassCaseSensitive
  checks for valid case sensitive of classnames

  Params:
        _cfg - configFile
        _class - classname of object
        _entry - template entry
*/
private _fnc_validClassCaseSensitive = {
    params ["_cfg", "_class", ["_entry", ""]];
    if !(_class isEqualType "") exitWith {
        _invalidReasons pushBack ("Entry: "+ (str _entry)  + " | Invalid data type: "+ (str _class) + " | Data type: "+ (typeName _class) + " | Expected: String");
        false;
    };
    if !(isClass (configFile/_cfg/_class) && configName (configFile/_cfg/_class) isEqualTo _class) exitWith {
        _invalidReasons pushBack ( if (isClass (configFile/_cfg/_class)) then {
            "Entry: "+(str _entry)+ " | Bad case on classname: "+_class+", expected: "+ configName (configFile/_cfg/_class)
        } else {
            "Entry: "+(str _entry)+ " | Invalid classname: "+_class+" | Classname should be from config "+_cfg
        });
        false;
    };
    true;
};

/* 
  Functions: _fnc_validateArrayOfClasses
  runs through array to validate each item
  
  Info:
    this functions hacks the parent scope for the variables; _y, _entry
*/
private _fnc_validateArrayOfClasses = {
    if (_y isEqualTo []) exitWith {};
    if !(_y isEqualType []) exitWith { _invalidReasons pushBack ("Entry "+(str _entry)+" is not an array, This entry should be an array of vehicle class names.") };
    { ["CfgVehicles", _x, _entry] call _fnc_validClassCaseSensitive } forEach _y;
};

/* 
  Functions: _fnc_validateSingleClass
  runs through single class to validate
  
  Info:
    this functions hacks the parent scope for the variables; _y, _entry
*/
private _fnc_validateSingleClass = {
    if (_y isEqualTo "") exitWith {};
    if !(_y isEqualType "") exitWith { _invalidReasons pushBack ("Entry "+(str _entry)+" is not a string, This entry should be a vehicle class name.") };
    ["CfgVehicles", _y, _entry] call _fnc_validClassCaseSensitive;
};

/* 
  Functions: _fnc_validateString
  validates a string
  
  Info:
    this functions hacks the parent scope for the variables; _y, _entry
*/
private _fnc_validateString = {
    if !(_y isEqualType "") then { _invalidReasons pushBack ("Entry "+(str _entry)+" is not a string.") };
};

/* 
  Functions: _fnc_validateMagazine
  validates the magazine
  
  Info:
    this functions hacks the parent scope for the variables; _y, _entry
*/
private _fnc_validateMagazine = {
    if (_y isEqualTo "") exitWith {};
    if !(_y isEqualType "") exitWith { _invalidReasons pushBack ("Entry "+(str _entry)+" is not a string, This entry should be a magazine class name.") };
    ["CfgMagazines", _y, _entry] call _fnc_validClassCaseSensitive;
};

/* 
  Functions: _fnc_validateArrayMagazines
  validates an array of magazines
  
  Info:
    this functions hacks the parent scope for the variables; _y, _entry
*/
private _fnc_validateArrayMagazines = {
    if !(_y isEqualType []) exitWith { _invalidReasons pushBack ("Entry "+(str _entry)+" is not an array, This entry should be an array of magazine class names.")};
    { ["CfgMagazines", _x, _entry] call _fnc_validClassCaseSensitive } forEach _y;
};

/* 
  Functions: _fnc_validateMagazinesHM
  validates a hashmap of magazines
  
  Info:
    this functions hacks the parent scope for the variables; _y, _entry
*/
private _fnc_validateMagazinesHM = {
    //hm of key: Vehicle class, Value: Array of magazine classes
    if !(_y isEqualType createHashmap) exitWith { _invalidReasons pushBack ("Entry "+(str _entry)+" is not a hashmap, This entry should be a hashmap of vehicles and there corresponding magazine classes.") };
    {
        ["CfgVehicles", _x, _entry] call _fnc_validClassCaseSensitive;
        call _fnc_validateArrayMagazines;
    } forEach _y;
};

/* 
  Functions: _fnc_validateWeightedArray
  validates a weighted array
  
  Info:
    this functions hacks the parent scope for the variables; _y, _entry
*/
private _fnc_validateWeightedArray = {
    if !(_y isEqualType []) exitWith { _invalidReasons pushBack ("Entry "+(str _entry)+" is not an array, This entry should be an weighted array.") };
    for "_i" from 0 to count _y-2 step 2 do {
        if !(
            (_y#_i) isEqualType ""
            && (_y#(_i+1)) isEqualType 0
        ) exitWith { _invalidReasons pushBack ("Entry "+(str _entry)+" is not in propper weighted array format, expected an array in format [<String> Class, <Scalar> Weight, ...]") };
        ["CfgVehicles", _y#_i, _entry] call _fnc_validClassCaseSensitive;
    };
};

/* 
  Functions: _fnc_genericClassExists
  validates generic classes, looks for the base
  
  Parmas:
        _class - classname of object

  Info:
        this functions hacks the parent scope for the variables; _y, _entry
*/
private _fnc_genericClassExists = {
    params ["_class"];
    if !(_class isEqualType "") exitWith {
        _invalidReasons pushBack ("Entry: "+ (str _entry) + " | Invalid data type: "+ str _class + " | Data type: "+ typeName _class + " | Expected: String");
        false;
    };

    private _cfgs = ["CfgVehicles", "CfgWeapons", "CfgMagazines", "CfgMagazineWells", "CfgAmmo", "CfgWorlds"];
    private _cfgIndex = _cfgs findIf { isClass (configFile/_x/_class) };
    if (_cfgIndex isEqualTo -1) exitWith {
        _invalidReasons pushBack ("Entry: "+ (str _entry) + " | Invalid classname: "+_class)
    };

    private _cfg = _cfgs#_cfgIndex;
    if (configName (configFile/_cfg/_class) isNotEqualTo _class) exitWith {
        _invalidReasons pushBack (
            "Entry: "+ (str _entry) + " | Bad case on classname: "+_class+", expected: "+ configName (configFile/_cfg/_class)
        );
        false;
    };

    true;
};

/* 
  Functions: _fnc_handleUniqueCases
  handles uniques class / hashmap keys / template "objects"
  
  Parmas:
        _class - classname of object

  Info:
        this functions hacks the parent scope for the variables; _y, _entry
*/
private _fnc_handleUniqueCases = { //handles unique name cases that the stored value is...
    switch _entry do {
        //string
        case "name";
        case "spawnMarkerName";
        case "flag";
        case "flagTexture";
        case "flagMarkerType": _fnc_validateString;

        //vehicle class name
        case "ammobox";
        case "surrenderCrate";
        case "equipmentBox": _fnc_validateSingleClass;

        //array of vehicle class names
        case "minefieldAT";
        case "minefieldAPERS";
        case "uavsAttack";
        case "uavsPortable": _fnc_validateArrayOfClasses;

        //magazine class
        case "mineAT";
        case "mineAPERS";
        case "mortarMagazineHE";
        case "mortarMagazineSmoke": _fnc_validateMagazine;

        //array of magazine class names

        //array of weapon class names
        case "headgear";
        case "uniforms";
        case "toolKits";
        case "itemMaps";
        case "firstAidKits";
        case "mediKits": { { ["CfgWeapons",_x,_entry] call _fnc_validClassCaseSensitive } forEach _y };

        //array of generic classnames, or [class, ...]
        case "initialRebelEquipment": {
            private _classes = _y apply { if (_x isEqualType []) then {_x#0} else {_x} };
            { [_x] call _genericClassExists } forEach _classes;
        };
        //bool

        //truly unique cases
        case "magazines": _fnc_validateMagazinesHM;
        case "placeIntel_itemMedium";
        case "placeIntel_itemLarge": {
            if !(_y isEqualTypeArray ["", 0, true]) exitWith {_invalidReasons pushBack ("Entry: "+(str _entry)+" has the wrong data type(s). Expected [<String>Class, <Scalar>Angle, <Bool>isComputer]")};
            ["CfgVehicles",_y#0,_entry] call _fnc_validClassCaseSensitive;
        };
        case "placeIntel_desk": {
            if !(_y isEqualTypeArray ["",0]) exitWith {_invalidReasons pushBack ("Entry: "+(str _entry)+" has the wrong data type(s). Expected [<String>Class, <Scalar>Angle]")};
            ["CfgVehicles",_y#0,_entry] call _fnc_validClassCaseSensitive;
        };
        case "breachingExplosivesAPC";
        case "breachingExplosivesTank": {
            {
                if !(_x isEqualTypeArray ["", 0]) then {_invalidReasons pushBack ("Entry: "+(str _entry)+" -> "+(str _x)+" has the wrong data type(s). Expected [<String>Magazine, <Scalar>quantity]")};
                ["CfgMagazines",(_x#0),_entry] call _fnc_validClassCaseSensitive;
            } forEach _y;
        };
        case "attributesVehicles": {
            if !(_y isEqualType []) exitWith {_invalidReasons pushBack ("Entry "+(str _entry)+" is not an array.")};
            {
                if !(_x isEqualTypeParams ["", []]) then {_invalidReasons pushBack ("Entry: "+(str _entry)+" -> "+(str _x)+" has the wrong data type(s). Expected [<String>Class, <Array>Attribute]"); continue};
                private _veh = _x#0;
                {
                    if (_forEachIndex == 0) then {["CfgVehicles",_x,_entry] call _validClassCaseSensitive; continue};
                    if !(_x isEqualTypeArray ["", 0]) then {_invalidReasons pushBack ("Vehicle attribute "+(str _x)+" for "+_veh+" has the wrong data types(s). Expected [<String>Attribute, <Scalar>Value]")};
                } forEach _x;
            } forEach _y;
        };
        case "diveGear"; //Mixed CFGVehicles and CFGGlasses
        case "flyGear";
        case "voices"; //CfgVoice maybe later
        case "sfVoices";
        case "milVoices";
        case "sfFaces";
        case "milFaces";
        case "sfVoices";
        case "polFaces";
        case "faces": {continue};
        default { Info("Entry: "+(str _entry)+" is lacking validation") };
    };
};

//=======================|
// Process template data |
//=======================|
Info_2("Template validation for side: %1 | Template: %2",_side, _templatePath);
private _invalidReasons = [];
{
    _x params ["_entry"];
    if (_entry in ["loadouts"]) then {continue};
    if (_entry find "group" == 0 or _entry find "unit" == 0) then {continue};       // Could cross-check these later if set in templates

    switch true do {
        case ("Mag" in _entry): _fnc_validateMagazine;
        case ("vehiclesCiv" in _entry): _fnc_validateWeightedArray;
        case ("vehicles" in _entry): _fnc_validateArrayOfClasses;
        case ("vehicle" in _entry): _fnc_validateSingleClass;
        case ("static" in _entry): {
            if (_side in [west, east]) then _fnc_validateArrayOfClasses else _fnc_validateSingleClass;
        };
        default _fnc_handleUniqueCases;
    };
} forEach _faction;
call _fnc_printInvalidReasons;
