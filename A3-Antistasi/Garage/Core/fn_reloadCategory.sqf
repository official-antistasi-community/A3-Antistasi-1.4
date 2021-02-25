/*
    Author: [Håkon]
    [Description]
        Rebuilds category list from local garage pool data

    Arguments:
    0. <Control>    List control
    1. <Int>        Index of list to rebuild (same as control IDD last number)

    Return Value:
    <nil>

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies: [_ctrl, _index] call HR_GRG_fnc_reloadCategory;

    Example:

    License: MIT License
*/
#include "defines.inc"
params ["_ctrl", "_catIndex"];
Trace("Reloading category");

lbClear _ctrl;
private _selected = -1;
private _HR_GRG_SelectedVehicles = [-1,-1,""];
{
    private _veh = (HR_GRG_Vehicles#_catIndex) get _x;
    _veh params ["_displayName", "_class", "_lockedUID", "_checkedOut"];
    private _index = _ctrl lbAdd _displayName;
    _ctrl lbSetData [_index, str _x];
    _ctrl lbSetValue [_index, _x];
    _ctrl lbSetPicture [_index, cfgIcon(_class)];
    _ctrl lbSetPictureColor [_index, [1, 1, 1, 1]];
    _ctrl lbSetPictureColorSelected [_index, [0.85, 0.85, 0.55, 1]];

    if !( _checkedOut isEqualTo "" ) then {
        private _color = [1,0.1,0.1,1];
        if ( (HR_GRG_SelectedVehicles#1) isEqualTo _x ) then {
            _selected = _index;
            _color = [1,1,1,1];
        };
        _ctrl lbSetPictureRight [_index, CheckOutIcon];
        _ctrl lbSetPictureRightColor [_index, _color];
    };

    if !( _lockedUID isEqualTo "" ) then {
        private _color = if ( _lockedUID isEqualTo HR_GRG_PlayerUID ) then { [1,1,1,1] } else { [1,0.1,0.1,1] }; //white, red
        private _toolTip = if ( _lockedUID isEqualTo HR_GRG_PlayerUID ) then { "" } else { localize "STR_HR_GRG_Feedback_LockedToolTip" };
        _ctrl lbSetPictureRight [_index, LockIcon];
        _ctrl lbSetPictureRightColor [_index, _color];
        _ctrl lbSetTooltip [_index, _toolTip]; //for some reason dosnt apply
    };
    _ctrl lbSetPictureRightColorSelected [_index, [0.85,0.85,0.55,1]];

} forEach (keys (HR_GRG_Vehicles#_catIndex));
_ctrl lbSetCurSel _selected;
