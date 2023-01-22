/*
Maintainer: DoomMetal
    Handles updating and controls on the Donate tab of the Main dialog.

Arguments:
    <STRING> Mode
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for control changes / Unscheduled for update
Public: No
Dependencies:
    None

Example:
    ["update"] call A3A_fnc_donateTab;
*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[["_mode","onLoad"], ["_params",[]]];

switch (_mode) do
{
    case ("update"):
    {
        Trace("Updating Donate tab");
        // Show back button
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _backButton = _display displayCtrl A3A_IDC_MAINDIALOGBACKBUTTON;
        _backButton ctrlRemoveAllEventHandlers "MouseButtonClick";
        _backButton ctrlAddEventHandler ["MouseButtonClick", {
            ["switchTab", ["player"]] call A3A_fnc_mainDialog;
        }];
        _backButton ctrlShow true;

        // Money section setup
        private _money = player getVariable "moneyX";
        private _moneySlider = _display displayCtrl A3A_IDC_MONEYSLIDER;
        _moneySlider sliderSetRange [0,_money];
        _moneySlider sliderSetSpeed [10, 10];
        _moneySlider sliderSetPosition 0;
        private _target = cursorTarget;

        private _moneyText = _display displayCtrl A3A_IDC_DONATIONMONEYTEXT;
        _moneyText ctrlSetText format ["%1 €", _money];

        private _playerList = _display displayCtrl A3A_IDC_DONATEPLAYERLIST;
        {
            if !(_x == player) then
            {
                _playerList lbAdd name _x;
                if !(_target == objNull) then
                {
                    if (_target == _x) then
                    {
                        _playerList lbSetCurSel _forEachIndex;
                    };
                };
            };
        } forEach fakePlayers;
    };

    // Donation Menu
    case ("moneySliderChanged"):
    {
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _moneySlider = _display displayCtrl A3A_IDC_MONEYSLIDER;
        private _moneyEditBox = _display displayCtrl A3A_IDC_MONEYEDITBOX;
        _sliderValue = sliderPosition _moneySlider;
        _moneyEditBox ctrlSetText str floor _sliderValue;
    };

    case ("moneyEditBoxChanged"):
    {
        private _money = player getVariable "moneyX";
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _moneyEditBox = _display displayCtrl A3A_IDC_MONEYEDITBOX;
        private _moneySlider = _display displayCtrl A3A_IDC_MONEYSLIDER;
        _moneyEditBoxValue = floor parseNumber ctrlText _moneyEditBox;
        _moneyEditBox ctrlSetText str _moneyEditBoxValue; // Strips non-numeric characters
        if (_moneyEditBoxValue < 0) then {_moneyEditBox ctrlSetText str 0};
        if (_moneyEditBoxValue > _money) then {_moneyEditBox ctrlSetText str _money};
        _moneySlider sliderSetPosition _moneyEditBoxValue;
    };

    case ("donationAdd"):
    {
        private _moneyToAdd = _params select 0;
        private _money = player getVariable "moneyX";
        private _display = findDisplay A3A_IDD_MAINDIALOG;
        private _moneyEditBox = _display displayCtrl A3A_IDC_MONEYEDITBOX;
        private _moneySlider = _display displayCtrl A3A_IDC_MONEYSLIDER;
        private _moneyEditBoxValue = floor parseNumber ctrlText _moneyEditBox;
        _newValue = _moneyEditBoxValue + _moneyToAdd;
        if (_newValue < 0) then {_newValue = 0};
        if (_newValue > _money) then {_newValue = _money};
        _moneyEditBox ctrlSetText str _newValue;
        _moneySlider sliderSetPosition _newValue;
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Donation tab mode does not exist: %1", _mode);
    };
};
