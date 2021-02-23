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

    License: MIT License
*/
#include "defines.inc"
params ["_listCtrl","_index"];
if (_index isEqualTo -1) exitWith {};
private _disp = findDisplay IDD_Garage;

//disable all extras menus
for "_i" from 0 to (lbSize _listCtrl) -1 do {
    private _ctrl = _disp displayCtrl (IDC_ExtraMounts + _i);
    if (ctrlEnabled _ctrl) exitWith { //theres only one active at a time
        _ctrl ctrlSetPosition ctrlDisabled;
        _ctrl ctrlEnable false;
        _ctrl ctrlCommit 0;
    };
};

if (_index isEqualTo -1) exitWith {};

//enable new menu
private _ctrlIDC = _listCtrl lbValue _index;
private _ctrl = _disp displayCtrl _ctrlIDC;
_ctrl ctrlEnable true;
_ctrl ctrlSetPosition ExtraEnabled;
_ctrl ctrlCommit 0;

//update extras text
_textCtrl = _disp displayCtrl IDC_ExtrasText;
_textCtrl ctrlSetStructuredText text (_listCtrl lbData _index);
