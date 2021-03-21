/*
    Author: [654wak654, Håkon]
    [Description]
        Toggles mirroring of pylons

        modified from ace pylons by: 654wak654

    Arguments:
    0. <Bool> Enable mirroring of pylons

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [(_this select 1) == 1] call HR_GRG_fnc_pylonToggleMirror;

    License: GNU General Public License
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_checked"];
Trace_1("Toggeling mirror functionaity: %1",_checked);
if (_checked) then {
    {
        _x params ["_combo", "_mirroredIndex", "_button"];

        if (_mirroredIndex != -1) then {
            private _selection = lbCurSel ((HR_GRG_PylonData select _mirroredIndex) select 0);
            _combo lbSetCurSel _selection;
            _combo ctrlEnable false;

            private _mirroredButton = (HR_GRG_PylonData select _mirroredIndex) select 2;
            private _turret = _mirroredButton getVariable ["HR_GRG_turret", []];
            [_button, false, _turret] call HR_GRG_fnc_PylonsTurretToggle;
            _button ctrlEnable false;
        };
    } forEach HR_GRG_PylonData;
} else {
    {
        (_x select 0) ctrlEnable true;
        (_x select 2) ctrlEnable true;
    } forEach HR_GRG_PylonData;
};
