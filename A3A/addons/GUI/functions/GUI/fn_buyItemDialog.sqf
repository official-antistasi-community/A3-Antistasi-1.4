/*
Maintainer: DoomMetal, killerswin2
    Handles the initialization and updating of the Buy item dialog.
    This function should only be called from BuyItem onLoad and control activation EHs.

Arguments:
    <STRING> Mode, only possible value for this dialog is "onLoad"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified
Public: No
Dependencies:
    None

Example:
    ["onLoad"] spawn A3A_fnc_buyItemDialog; // initialization
*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[["_mode","onLoad"], ["_params",[]]];

switch (_mode) do
{
    case ("onLoad"):
    {
        Debug("BuyItemDialog onLoad starting...");

        private _display = findDisplay A3A_IDD_BUYITEMDIALOG;

        // Setup Object render
        private _objPreview = _display displayCtrl A3A_IDC_BUYITEMOBJECTRENDER;  // 9303;
        _objPreview ctrlShow false;

        // className, price, function, params, commderOnly?
        private _buyableItemList = [];

		// Add items
		_buyableItemList pushBack [A3A_faction_reb get 'vehicleLightSource', 10, "A3A_fnc_buyItem", [player, A3A_faction_reb get 'vehicleLightSource', 25, [['A3A_fnc_initMovableObject', false]]], false];
		private _fuelDrum = (A3A_faction_reb get 'vehicleFuelDrum');
		_buyableItemList pushBack [_fuelDrum # 0, _fuelDrum # 1,"A3A_fnc_buyItem", [player, _fuelDrum # 0,  _fuelDrum # 1, [['A3A_fnc_initMovableObject', false], ['A3A_fnc_logistics_addLoadAction', false]]], false];
		private _fuelTank = (A3A_faction_reb get 'vehicleFuelTank');
		_buyableItemList pushBack [_fuelTank # 0, _fuelTank # 1,"A3A_fnc_buyItem", [player, _fuelTank # 0,  _fuelTank # 1, [['A3A_fnc_initMovableObject', false], ['A3A_fnc_logistics_addLoadAction', false]]], true];
  
		//LTC
		if (LootToCrateEnabled) then {
			_buyableItemList pushBack [A3A_faction_occ get 'surrenderCrate', 10, "A3A_fnc_spawnCrate", [player], false];
		};



        private _itemControlsGroup = _display displayCtrl A3A_IDC_ITEMGROUP;

        private _added = 0;
        {
            private _className = _x select 0;
            private _price = _x select 1;
			private _func = _x select 2;
			private _params = _x select 3;
			private _commanderOnly = _x select 4;
            private _configClass = configFile >> "CfgVehicles" >> _className;
            private _displayName = getText (_configClass >> "displayName");
            private _editorPreview = getText (_configClass >> "editorPreview");
            //private _vehicleIcon= getText (_configClass >> "Icon");
            private _model = getText (_configClass >> "model");

            private _hasVehiclePreview = fileExists _editorPreview;
            /* Turn on if you want the icons as a midway fallback
            if (!_hasVehiclePreview && fileExists _vehicleIcon) then {
                _editorPreview = _vehicleIcon;
                _hasVehiclePreview = true;
            };
            */
            if (!_hasVehiclePreview) then {
                _editorPreview = A3A_PlaceHolder_NoVehiclePreview;
            };

            // Add some extra padding to the top if there are 2 rows or less
            private _topPadding = if (count _buyableItemList < 7) then {5 * GRID_H} else {0};

            private _itemXpos = 7 * GRID_W + ((7 * GRID_W + 44 * GRID_W) * (_added mod 3));
            private _itemYpos = (floor (_added / 3)) * (44 * GRID_H) + _topPadding;

            private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -1, _itemControlsGroup];
            _itemControlsGroup ctrlSetPosition[_itemXpos, _itemYpos, 44 * GRID_W, 37 * GRID_H];
            _itemControlsGroup ctrlSetFade 1;
            _itemControlsGroup ctrlCommit 0;

            private _previewPicture = _display ctrlCreate ["A3A_Picture", A3A_IDC_BUYITEMPREVIEW, _itemControlsGroup];
            _previewPicture ctrlSetPosition [0, 0, 44 * GRID_W, 25 * GRID_H];
            _previewPicture ctrlSetText _editorPreview;
            _previewPicture ctrlCommit 0;

            private _button = _display ctrlCreate ["A3A_ShortcutButton", -1, _itemControlsGroup];
            _button ctrlSetPosition [0, 25 * GRID_H, 44 * GRID_W, 12 * GRID_H];
            _button ctrlSetText _displayName;
            _button ctrlSetTooltip format [localize "STR_antistasi_dialogs_buy_item_tooltip", _displayName, _price, "€"];
            _button setVariable ["className", _className];
            _button setVariable ["model", _model];
			_button setVariable ["function", _func];
			_button setVariable ["params", _params];
			_button setVariable ["commanderOnly", _commanderOnly];
            _button ctrlAddEventHandler ["ButtonClick", {
                closeDialog 2;
				if ((_this # 0) getVariable "commanderOnly") exitwith {
					[localize "STR_antistasi_dialogs_buy_item_custom_hint_header", localize "STR_antistasi_dialogs_buy_item_custom_hint_commander_only"] call A3A_fnc_customHint;
				};
				private _func_name = (_this # 0) getVariable "function";
				private _params = (_this # 0) getVariable "params";
				_params spawn (missionNamespace getVariable _func_name);
            }];
            _button ctrlCommit 0;

            // Object Render
            _button ctrlAddEventHandler ["MouseEnter", {
                params ["_control"];
                if (true || isNil "Dev_GUI_prevInjectEnter") then {
                    params ["_control"];
                    private _UIScaleAdjustment = (0.55/getResolution#5);  // I tweaked this on UI Small, so that's why the 0.55 is the base size.

                    private _model = _control getVariable "model";
                    private _className = _control getVariable "className";
                    private _display = findDisplay A3A_IDD_BUYITEMDIALOG;  // 9300;
                    private _objPreview = _display displayCtrl A3A_IDC_BUYITEMOBJECTRENDER;  // 9303;
                    _objPreview ctrlSetModel _model;
                    private _boundingDiameter = [_className] call FUNC(sizeOf);
                    _objPreview ctrlSetModelScale (2.25/(_boundingDiameter) * _UIScaleAdjustment);
                    _objPreview ctrlSetModelDirAndUp [[-0.6283,0.3601,0.6896],[-0.0125,-0.5015,0.8651]];  // x y z

                    private _editorPreviewPicture = ctrlParentControlsGroup _control controlsGroupCtrl A3A_IDC_BUYITEMPREVIEW;  // 9304;
                    private _mouseAbsolutePos = getMousePosition;
                    private _mouseRelativePos = ctrlMousePosition _editorPreviewPicture;
                    _mouseAbsolutePos vectorDiff _mouseRelativePos params ["_objPreview_x", "_objPreview_y"];


                    private _yAdjustment = 0.25 * _UIScaleAdjustment;
                    _objPreview ctrlSetPosition [_objPreview_x + 0.5 * (22 * pixelW * pixelGridNoUIScale), 4, _objPreview_y - 0.5 * (12.5 * pixelW * pixelGridNoUIScale) + _yAdjustment];
                    _editorPreviewPicture ctrlShow false;
                    _editorPreviewPicture ctrlCommit 1;

                    _objPreview ctrlShow true;
                    _objPreview ctrlEnable false;  // Prevent the user dragging it.
                } else {
                    _control call Dev_GUI_prevInjectEnter;
                };
            }];
            _button ctrlAddEventHandler ["MouseExit", {
                params ["_control"];
                if (true || isNil "Dev_GUI_prevInjectExit") then {
                    params ["_control"];
                    private _display = findDisplay A3A_IDD_BUYITEMDIALOG;  // 9300;
                    private _objPreview = _display displayCtrl A3A_IDC_BUYITEMOBJECTRENDER;  // 9303;

                    private _editorPreviewPicture = ctrlParentControlsGroup _control controlsGroupCtrl A3A_IDC_BUYITEMPREVIEW;  // 9304;

                    _editorPreviewPicture ctrlShow true;
                    _editorPreviewPicture ctrlCommit 1;

                    _objPreview ctrlShow false;
                } else {
                    _control call Dev_GUI_prevInjectExit;
                };
            }];

            private _priceText = _display ctrlCreate ["A3A_InfoTextRight", -1, _itemControlsGroup];
            _priceText ctrlSetPosition[23 * GRID_W, 21 * GRID_H, 20 * GRID_W, 3 * GRID_H];
            _priceText ctrlSetText format ["%1 €",_price];
            _priceText ctrlCommit 0;

            // Show item
            _itemControlsGroup ctrlSetFade 0;
            _itemControlsGroup ctrlCommit 0.1;

            _added = _added + 1;
        } forEach _buyableItemList;

        Debug("BuyItemDialog onLoad complete.");
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("BuyItemDialog mode does not exist: %1", _mode);
    };
};