/*
Author: Håkon
    Registers/unregisters system that wants to disable the information string at the top of the screen.

Arguments:
    0. <STRING> Name of system that requested information bar visibility change
    1. <BOOLEAN> Include/Exclude system from visibility change participation

Return Value:
    <NIL>

Scope: Client
Environment: Unscheduled
Public: No
Dependencies:
    <FUNCTION> A3A_fnc_updateInfoBarShown

Example:
    ["GARAGE", true] call A3A_fnc_disableInfoBar;
*/

params [["_systemName",""], ["_state",false,[false]]];

if (isNil "A3A_InfoBarRegistre") then {A3A_InfoBarRegistre = createHashMap};
if (_state) then {
    A3A_InfoBarRegistre set [_systemName, _state];
} else {
    A3A_InfoBarRegistre deleteAt _systemName;
};

call A3A_fnc_updateInfoBarShown;