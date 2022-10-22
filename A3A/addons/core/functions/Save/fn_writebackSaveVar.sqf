/*
    Write a single variable to an Antistasi save and writeback.
    Will be slow, only use for one-off operations that need to be ensured

Scope: Server
Environment: Scheduled or unscheduled

Arguments:
    <STRING> Variable name to write
    <ANY> Variable value to write
    <ARRAY> Optional: Save target if not the current save. Current save target will be preserved.
        <STRING or false> server ID, or false for mission profile namespace
        <STRING> campaign ID
        <STRING> worldname
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_varName", "_varValue", "_saveTarget"];

Info_1("Writing back save var with params %1", _this);

isNil {
    private _oldTarget = if (!isNil "A3A_saveTarget") then { A3A_saveTarget };
    if (!isNil "_saveTarget") then { A3A_saveTarget = _saveTarget };

    [_varname, _varValue] call A3A_fnc_setStatVariable;

    if (A3A_saveTarget#0 isEqualType false) then { saveMissionProfileNamespace } else { saveProfileNamespace };

    if (!isNil "_oldTarget") then { A3A_saveTarget = _oldTarget };
};
