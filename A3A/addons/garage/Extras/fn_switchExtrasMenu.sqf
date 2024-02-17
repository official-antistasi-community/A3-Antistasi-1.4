/*
    Author: [Håkon]
    [Description]
        Swich active extras menu, can deselect all menues with index -1

    Arguments:
    0. <Control>    ExtrasList control
    1. <Int>        Index of new extras menu

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: _this call HR_GRG_fnc_switchExtrasMenu;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_index"];
if (_index isEqualTo -1) exitWith {};
private _disp = findDisplay HR_GRG_IDD_Garage;

//disable all extras menus
for "_i" from 0 to 3 do {
    private _ctrl = _disp displayCtrl (HR_GRG_IDC_ExtraMounts + _i);
    if (ctrlEnabled _ctrl) exitWith { //theres only one active at a time
        _ctrl ctrlShow false;
        _ctrl ctrlEnable false;
    };
};

if (_index isEqualTo -1) exitWith {};

//enable new menu
private _ctrl = _disp displayCtrl (HR_GRG_IDC_ExtraMounts + _index);
_ctrl ctrlEnable true;
_ctrl ctrlShow true;

//update extras text
private _text = switch _index do {
    case 0: {localize "STR_HR_GRG_Generic_Mounts"};
    case 1: {localize "STR_HR_GRG_Generic_Texture"};
    case 2: {localize "STR_HR_GRG_Generic_Anim"};
    case 3: {localize "STR_HR_GRG_Generic_Pylons"};
    default {""};
};
_textCtrl = _disp displayCtrl HR_GRG_IDC_ExtrasText;
_textCtrl ctrlSetStructuredText text _text;
