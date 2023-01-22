/*
    Handles the initialization and tab switching on the setup dialog.
    This function should only be called from setupDialog onLoad and control activation EHs.

Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified

Arguments:
    <STRING> Mode, e.g. "onLoad", "switchTab"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mode", "_params"];

Debug_1("Confirm dialog called with mode %1", _mode);

private _display = findDisplay A3A_IDD_SETUPCONFIRMDIALOG;
private _parent = displayParent _display;           // just in case we want to use this garbage with other dialogs?

switch (_mode) do
{
    case ("onLoad"):
    {
        // fetch text from parent
        private _textCtrl = displayCtrl A3A_IDC_SETUP_CONFIRMTEXT;
        _textCtrl ctrlSetText (_parent getVariable "confirmData" select 0);
    };

    case ("confirm"):
    {
        private _confirmData = _parent getVariable "confirmData";
        [_confirmData#2] spawn (_confirmData#1);            // Needs to be spawn otherwise displayCtrl doesn't always work? wack
        closeDialog 0;
    };
};
