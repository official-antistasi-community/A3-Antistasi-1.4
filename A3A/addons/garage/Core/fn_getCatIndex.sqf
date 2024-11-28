/*
    Author: [Håkon]
    [Description]
        Returns the category index of a class

    Arguments:
    0. <String> Class you want to know the category index of

    Return Value:
    <Int> category index; -1 if it has no category, and -2 if it is found on the blacklist. Used for deleting the vehicle after being found on the blacklist.

    Scope: Any
    Environment: unscheduled
    Public: [Yes]
    Dependencies:

    Example: [_class] call HR_GRG_fnc_getCatIndex;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params [["_class", "_vehicle", [""]]];
if ( !isClass (configFile >> "CfgVehicles" >> _class) ) exitWith { Error_1("Invalid Input: %1", _class); -1 };

/* _vtol = "getNumber (_x >> 'vtol') >= 0" configClasses (configFile >> "CfgVehicles");
_class in [_vtol]; */ 
//&& (getNumber (configOf _vehicle >> "isUav") == 0)
//case (getNumber (configOf _vehicle >> "isUav") > 0): { 2 };
private _editorCat = cfgEditorCat(_class);
switch (true) do {
    //filter blacklist first
    case (_class in HR_GRG_blacklistVehicles): { -2 };
    //vanilla
    case (_editorCat isEqualTo "EdSubcat_Cars") and (_class in undercoverVehicles): { 0 }; ///undercover
    case (_editorCat isEqualTo "EdSubcat_Cars") and !(_class in undercoverVehicles): { 1 }; 
    case (_editorCat isEqualTo "EdSubcat_APCs"): { 2 };
    case (_editorCat in ["EdSubcat_Tanks","EdSubcat_AAs","EdSubcat_Artillery"]): { 3 };
    case (_editorCat in ["EdSubcat_Helicopters"] || getNumber (configOf _vehicle >> "vtol") > 0): { 4 };
    //case (getNumber (configOf _vehicle >> "vtol") > 0): { 5 };
    case (_editorCat in ["EdSubcat_Planes"] && (getNumber (configOf _vehicle >> "vtol") == 0)): { 5 };
    case (_editorCat isEqualTo "EdSubcat_Boats" || _editorCat isEqualTo "EdSubcat_Submersibles"): { 6 };
    case (_editorCat isEqualTo "EdSubcat_Turrets"): { 7 };

    //rhs
    case (_editorCat in ["rhs_EdSubcat_car","rhs_EdSubcat_truck","rhs_EdSubcat_mrap"]) and (_class in undercoverVehicles): {0}; ///undercover
    case (_editorCat in ["rhs_EdSubcat_car","rhs_EdSubcat_truck","rhs_EdSubcat_mrap"]) and !(_class in undercoverVehicles): {1};
    case (_editorCat in ["rhs_EdSubcat_apc","rhs_EdSubcat_ifv"]): {2};
    case (_editorCat in ["rhs_EdSubcat_tank","rhs_EdSubcat_aa","rhs_EdSubcat_artillery"]): {3};
    case (_editorCat in ["rhs_EdSubcat_helicopter","rhs_EdSubcat_helicopter_d","rhs_EdSubcat_helicopter_wd"]): { 4 };
    case (_editorCat in ["rhs_EdSubcat_aircraft"]): { 5 };
    case (_editorCat isEqualTo "rhs_EdSubcat_boat"): { 6 };

    //cup
    case (_editorCat in ["CUP_EdSubcat_Bikes","CUP_EdSubCat_Cars_Woodland","CUP_EdSubCat_UpHMMWV_Cars_Desert","CUP_EdSubCat_Cars_Winter"]) and (_class in undercoverVehicles): { 0 }; ///undercover
    case (_editorCat in ["CUP_EdSubcat_Bikes","CUP_EdSubCat_Cars_Woodland","CUP_EdSubCat_UpHMMWV_Cars_Desert","CUP_EdSubCat_Cars_Winter"]) and !(_class in undercoverVehicles): { 1 };

    //Fallback
    case (_class isKindOf "Car") and (_class in undercoverVehicles): { 0 }; ///undercover
    case (_class isKindOf "Car") and !(_class in undercoverVehicles): { 1 };
    case (_class isKindOf "Tracked_APC"): { 2 }; //?
    case (_class isKindOf "Tank"): { 3 };
    case (_class isKindOf "Helicopter"): { 4 };
    case (_class isKindOf "Plane"): { 5 };
    case (_class isKindOf "Ship"): { 6 };
    case (_class isKindOf "staticWeapon"): { 7 }; //some non-vanilla artillery is statics

    default { -1 };
};

/// isKindOf you can check here: https://community.bistudio.com/wiki/Arma_2:_CfgVehicles#Land_Class_Vehicles

/* 
List of editor categories:
EdSubcat_AAs
EdSubcat_APCs
EdSubcat_Artillery
EdSubcat_Boats
EdSubcat_Cars
EdSubcat_Drones
EdSubcat_Helicopters
EdSubcat_Planes
EdSubcat_Submersibles
EdSubcat_Tanks
EdSubcat_Turrets 
Link to check https://community.bistudio.com/wiki/Eden_Editor:_Object_Categorization
*/
