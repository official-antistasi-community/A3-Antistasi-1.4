/*
Author: [Killerswin2, Hakon (Stole his bb code)]
	creates the controls for the dialog. Picture and Button are created. Data Saved to buttons. 
Arguments:
1. <string> string for initilizer
Return Value:
NONE
Scope: Client
Environment: scheduled
Public: 
no
Example:
["onLoad"] spawn A3A_fnc_teamLeaderRTSPlacerDialog
*/




#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
#include "\x\A3A\addons\core\functions\Builder\placerDefines.hpp"
#define BOTTOM safeZoneH + safeZoneY
FIX_LINE_NUMBERS()

params[["_mode","onLoad"], ["_params",[]]];

switch (_mode) do
{
	case ("updateMoney"):
	{
		private _display = findDisplay A3A_IDD_TEAMLEADERDIALOG;
		private _moneyCtrl = _display displayCtrl A3A_IDC_TEAMLEADERBUILDERMONEY;

		_moneyCtrl ctrlSetText format ["%1 €", A3A_building_EHDB # AVAILABLE_MONEY];
	};
	case ("onLoad"):
    {
		private _display = findDisplay A3A_IDD_TEAMLEADERDIALOG;
		private _parent = (_display displayCtrl A3A_IDC_TEAMLEADERBUILDERMAIN);
		private _buildControlsGroup = _parent controlsGroupCtrl A3A_IDC_TEAMLEADERBUILDINGGROUP;

		private _moneyCtrl = _display displayCtrl A3A_IDC_TEAMLEADERBUILDERMONEY;
		_moneyCtrl ctrlSetText format ["%1 €", A3A_building_EHDB # AVAILABLE_MONEY];

		private _buildableObjects = A3A_buildableObjects;
		

		{
			_x params [
				["_className", "Land_Tyres_F"],
				["_price", 0],
				["_holdTime", 15]
			];

			private _configClass = configFile >> "CfgVehicles" >> _className;
			private _displayName = getText (_configClass >> "displayName");
			private _editorPreview = getText (_configClass >> "editorPreview");
			private _model = getText (_configClass >> "model");
	
			private _hasVehiclePreview = fileExists _editorPreview;

            if (!_hasVehiclePreview) then {
                _editorPreview = A3A_PlaceHolder_NoVehiclePreview;
            };
	
			private _itemXpos = 7 * GRID_W + ((7 * GRID_W + 44 * GRID_W) * (_forEachIndex % 3));
			private _itemYpos = (floor (_forEachIndex / 3)) * (44 * GRID_H);

			private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", A3A_IDC_TEAMLEADERBUILDITEMGROUP, _buildControlsGroup];
			_itemControlsGroup ctrlSetPosition[_itemXpos, _itemYpos, 44 * GRID_W, 36 * GRID_H];
			_itemControlsGroup ctrlSetFade 1;
			_itemControlsGroup ctrlCommit 0;

			private _previewPicture = _display ctrlCreate ["A3A_Picture", A3A_IDC_TEAMLEADERBUILDIMAGEPREVIEW, _itemControlsGroup];
			_previewPicture ctrlSetPosition [0, 0, 44 * GRID_W, 25 * GRID_H];
			_previewPicture ctrlSetText _editorPreview;
			_previewPicture ctrlCommit 0;
	
			private _button = _display ctrlCreate ["A3A_ShortcutButton", A3A_IDC_TEAMLEADERBUILDBUTTON, _itemControlsGroup];
			_button ctrlSetPosition [0, 25 * GRID_H, 44 * GRID_W, 8 * GRID_H];
			_button ctrlSetText _displayName;
			_button setVariable ["className", _className];
			_button setVariable ["model", _model];
			_button setVariable ["price", _price];
			_button setVariable ["holdTime", _holdTime];
			_button ctrlCommit 0;

			_button ctrlAddEventHandler ["ButtonDown", {
				params ["_control"];

				if(isNil "A3A_building_EHDB") then {
					// how the fuck did you do this? No databases?
					call A3A_initBuildingDB;
				};

				private _object = (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
				private _className = _control getVariable ["className", "Land_Tyres_F"];
				if (_className == typeof _object) exitWith {};			// refire, potentially caused by hitting space

				private _price = _control getVariable ["price", 0];
				private _supply = A3A_building_EHDB # AVAILABLE_MONEY;
				if (_price > _supply) exitWith {};			// TODO: Should disable buttons based on available money?

				A3A_building_EHDB set [BUILD_OBJECT_SELECTED_STRING, _className];		// why does this exist?
				A3A_building_EHDB set [OBJECT_PRICE, _price];

				private _vehPos =  getPosATL _object;
				private _vehDir = getDir _object;
				deleteVehicle _object;

				_object = _className createVehicleLocal [0,0,0];
				_object enableSimulation false;
				_object hideObject true;			// Otherwise it might not get checked, with some weird input combo
				_object setPos _vehPos;
				_object setDir _vehDir;
				A3A_building_EHDB set [BUILD_OBJECT_TEMP_OBJECT, _object];
				call (A3A_building_EHDB # UPDATE_BB);
			}];

			if (_price isNotEqualTo 0) then {
				private _priceText = _display ctrlCreate ["A3A_InfoTextRight", -1, _itemControlsGroup];
				_priceText ctrlSetPosition[23 * GRID_W, 21 * GRID_H, 20 * GRID_W, 3 * GRID_H];
				_priceText ctrlSetText format ["%1 €",_price];
				_priceText ctrlCommit 0;
			};

			private _buildTime = _display ctrlCreate ["A3A_PictureStroke", -1, _itemControlsGroup];
			_buildTime ctrlSetPosition[1 * GRID_W, 21 * GRID_H, 4 * GRID_W, 4 * GRID_H];
			_buildTime ctrlSetText A3A_Icon_Construct;
			_buildTime ctrlSetTooltip format [localize "STR_antistasi_teamleader_placer_holdtime", _displayName, _holdTime];
			_buildTime ctrlCommit 0;
	
			// show stuff
			_itemControlsGroup ctrlSetFade 0;
            _itemControlsGroup ctrlCommit 0.1;

		} forEach _buildableObjects;

		_display setVariable ["displayCordinates", [CENTER_X(160), BOTTOM - PX_H(36), (PX_W(160)) / 2, (PX_H(36)) / 2]];

		_display displayAddEventHandler ["MouseMoving", {

			params[ "_display" ];

			private _paramsArray = _display getVariable ["displayCordinates", [1,1,1,1]];
			_paramsArray params ["_xPos", "_yPos", "_wPos", "_hPos"];
			

			private _isMouseInArea = getMousePosition inArea[[ _xPos + _wPos, _yPos + _hPos ], _wPos, _hPos, 0, true];

			if (_isMouseInArea) then {
				A3A_cam camCommand "manual off";
			} else {
				A3A_cam camCommand "manual on";
			};
			
		}];

		// _txt = _display ctrlCreate[ "A3A_StructuredText", -1];
		// _txt ctrlSetPosition[ (1.4 * safeZoneX) + safeZoneW, -0.65 * safeZoneY, 0.5, 0.3];			// funkiness because I don't want to deal with dialogs anymore tonight
		// _txt ctrlCommit 0;
		// _txt ctrlSetStructuredText parseText localize "STR_antistasi_teamleader_placer_placer_info";
	};
	default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("BuyVehicleDialog mode does not exist: %1", _mode);
    };
};
