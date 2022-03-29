/*
    Handles the initialization and updating of the arsenal guest limits dialog.

Arguments:
    0. <STRING> Mode, currently "typeSelect", "listButton", "resetButton" and "stepButton"
    1. <ARRAY<ANY>> Array of params for the mode when applicable.

Returns:
    Nothing

Environment: 
    Should not be called by onLoad because findDisplay and ctrlParent do not work in that context.
*/

#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mode", "_params"];

private _fnc_defaultLimit = { [A3A_guestItemLimit, 3*A3A_guestItemLimit] select (_this == 26) };

private _display = findDisplay A3A_IDD_ARSENALLIMITSDIALOG;
private _listBox = _display displayCtrl A3A_IDC_ARSLIMLISTBOX;

switch (_mode) do
{
    case ("typeSelect"):
    {
        private _typeIndex = if (isNil "_params") then { 0 } else { (_params#0) - A3A_IDC_ARSLIMTYPESBASE };
        _display setVariable ["typeIndex", _typeIndex];
        private _defaultLimit = _typeIndex call _fnc_defaultLimit;

        private _cfgCat = switch (_typeIndex) do {
            case 5: { configFile / "cfgVehicles" };
            case 22; case 23; case 26: { configFile / "cfgMagazines" };
            default { configFile / "cfgWeapons" };
        };

        lnbClear _listBox;
        {
            _x params ["_class", "_count"];
            if (_count == -1) then { continue };
            private _itemName = getText (_cfgCat / _class / "displayName");
            private _limit = A3A_arsenalLimits getOrDefault [_class, _defaultLimit];
            if (_typeIndex == 26) then {
                private _capacity = 1 max getNumber (_cfgCat / _class / "count");
                _count = round (_count / _capacity);
            };
            private _rowIndex = _listBox lnbAddRow [_itemName, str _count, str _limit];
            _listBox lnbSetValue [[_rowIndex, 2], _limit];
            _listBox lnbSetData [[_rowIndex, 0], _class];           // store original classname for updating
        } forEach (jna_datalist#_typeIndex);

        // color-invert the selected button, restore the others 
        {
            private _ctrl = _display displayctrl (A3A_IDC_ARSLIMTYPESBASE + _x);
            _ctrl ctrlEnable ([true, false] select (_x == _typeIndex));
        } forEach [0,1,2,3,4,5,6,8,9,11,12,18,19,20,22,23,24,25,26];
    };

    case ("listButton"):
    {
        if (isNil {_display getVariable "stepSize"}) exitWith {};
        private _stepSize = _display getVariable "stepSize";
        private _curRow = lnbCurSelRow _listBox;
        private _class = _listBox lnbData [_curRow, 0];

        private _curVal = _listBox lnbValue [_curRow, 2];
        private _newVal = 0 max (_curVal + _stepSize*(_params#0));
        _listBox lnbSetText [[_curRow, 2], str _newVal];
        _listBox lnbSetValue [[_curRow, 2], _newVal];
        A3A_arsenalLimits set [_class, _newVal];
    };

    case ("resetButton"):
    {
        if (isNil {_display getVariable "typeIndex"}) exitWith {};
        private _defaultLimit = (_display getVariable "typeIndex") call _fnc_defaultLimit;

        private _rowCount = lnbSize _listBox select 0;
        for "_row" from 0 to (_rowCount-1) do {
            _listBox lnbSetText [[_row, 2], str _defaultLimit];
            _listBox lnbSetValue [[_row, 2], _defaultLimit];
            A3A_arsenalLimits deleteAt (_listBox lnbData [_row, 0]);
        };
    };

    case ("stepButton"):
    {
        private _stepSize = _display getVariable ["stepSize", 1];
        private _newstepSize = [1, 5] select (_stepSize == 1);
        _display setVariable ["stepSize", _newstepSize];
        private _newText = localize "STR_antistasi_arsenal_limits_dialog_step" + " ±" + str _newStepSize;
        ctrlSetText [A3A_IDC_ARSLIMSTEPBUTTON, _newText];
    };
};
