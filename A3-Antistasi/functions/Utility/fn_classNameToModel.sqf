/*
    Author: [Håkon]
    Description:
        gets the model from a class

        exist soley to make it easier for inexperienced users to manually add entries to the logistics system

    Arguments:
    0. <String> Classname

    Return Value:
    <String> Model path

    Scope: Any
    Environment: Any
    Public: Yes

    Example: [typeOf _vehicle] call A3A_fnc_classNameToModel

    License: MIT License
*/

params [["_className", "", [""]]];
if !(isClass (configFile/"CfgVehicles"/_className)) exitWith { [1, "Invalid classname: " + _classname, "fn_classNameToModel.sqf"] call A3A_fnc_log; "N/A" };
getText (configFile >> "CfgVehicles" >> _className >> "model");
