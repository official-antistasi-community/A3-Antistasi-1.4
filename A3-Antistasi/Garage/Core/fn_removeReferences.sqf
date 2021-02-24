/*
    Author: [Håkon]
    Description:
        Recursive function to remove references in nested arrays, works with anything not just arrays

    Arguments:
    <Any>

    Return Value:
    <Any>

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [1, [1]] call HR_GRG_fnc_removeReferences; // returns [1, [1]] without references

    License: MIT License
*/
private _fnc_removeReferences = {
    if (_this isEqualType []) exitWith {
        +_this apply { _x call _fnc_removeReferences };
    };
    _this
};

_this call _fnc_removeReferences;
