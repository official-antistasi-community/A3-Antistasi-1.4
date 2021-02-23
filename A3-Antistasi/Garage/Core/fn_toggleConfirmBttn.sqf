/*
    Author: [Håkon]
    [Description]
        Toggles the buttons Confirm and [Un]Lock on/off

    Arguments:
    0. <Bool> Enable controls

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [false] call HR_GRG_fnc_toggleConfirmBttn;

    License: MIT License
*/
#include "defines.inc"
params ["_enable"];

private _disp = findDisplay IDD_Garage;
private _ctrlCnfrm = _disp displayCtrl IDC_Confirm;
private _ctrlLock = _disp displayCtrl IDC_tLock;

_ctrlCnfrm ctrlEnable _enable;
_ctrlLock ctrlEnable _enable;
