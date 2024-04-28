/*
    Author: Tiny
    [Description]
        A helper script to fn_sellvehGRG, runs on the client to reset displays

    Arguments:
    1. The category to change selection to (default = -1)
	2. The vehicle UID to change selection to (default = -1)
	3. The classname of the selected vehicle (default = "")


    Return Value:
    <nil>

    Scope: Client
    Environment: Any
    Public: [No]

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()

if (isNull player) exitWith {Error("fn_sellVehGRGLocal was not executed by a client")};
params [["_catIndex",-1],["_vehUID",-1],["_class",""]];
HR_GRG_SelectedVehicles = [_catIndex, _vehUID,_class];
[] call HR_GRG_fnc_reloadPreview;
[] call HR_GRG_fnc_reloadExtras;
private _disp = findDisplay HR_GRG_IDD_Garage;

{
    _ctrl = _disp displayCtrl _x;
    _ctrl ctrlEnable false;
    _ctrl ctrlShow false;
} forEach [HR_GRG_IDC_ExtraMounts,HR_GRG_IDC_ExtraTexture,HR_GRG_IDC_ExtraAnim,HR_GRG_IDC_ExtraPylonsContainer];

[0] call HR_GRG_fnc_switchExtrasMenu;
[] call HR_GRG_fnc_reloadPylons;
[] call HR_GRG_fnc_updateVehicleCount;
