/*
Author: Håkon
Description:
    Runs the post init functions compiled by prepFunctions

Arguments:Nil

Return Value: <Bool> done

Scope: Any
Environment: Any
Public: No
Dependencies: A3A_postInitFuncs

Example:

License: MIT License
*/
if !( isClass (missionConfigFile/"A3A") ) exitWith { false }; //dont run code unless we are in a A3A mission
if (isNil "A3A_postInitFuncs" || { !(A3A_postInitFuncs isEqualType []) }) exitWith { false }; //if someone messed with postInitFuncs list or it wasnt created abort

{ call (missionNamespace getVariable _x) } forEach A3A_postInitFuncs; //run postInit funcs

true
