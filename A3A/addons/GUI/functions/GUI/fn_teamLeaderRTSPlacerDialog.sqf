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
#include "\x\A3A\addons\core\functions\UtilityItems\placerDefines.hpp"
FIX_LINE_NUMBERS()

params[["_mode","onLoad"], ["_params",[]]];

switch (_mode) do
{
	case ("onLoad"):
    {
		private _display = findDisplay A3A_IDD_TEAMLEADERDIALOG;
		private _parent = (_display displayCtrl A3A_IDC_TEAMLEADERBUILDERMAIN);
		private _buildControlsGroup = _parent controlsGroupCtrl A3A_IDC_TEAMLEADERBUILDINGGROUP;


		private _mapInfo = missionConfigFile/"A3A"/"mapInfo"/toLower worldName;
		if (!isClass _mapInfo) then {_mapInfo = configFile/"A3A"/"mapInfo"/toLower worldName};
		private _buildableObjects = getArray (_mapInfo/"buildObjects");
		

		{
			private _className = _x;
			private _configClass = configFile >> "CfgVehicles" >> _className;
			private _displayName = getText (_configClass >> "displayName");
			private _editorPreview = getText (_configClass >> "editorPreview");
	
			//prevent bad editor previews
			if (!fileExists _editorPreview) then {};
	
	
			private _itemXpos = 7 * GRID_W + ((7 * GRID_W + 44 * GRID_W) * (_forEachIndex % 3));
			private _itemYpos = (floor (_forEachIndex / 3)) * (44 * GRID_H);

			private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", A3A_IDC_TEAMLEADERBUILDITEMGROUP, _buildControlsGroup];
			_itemControlsGroup ctrlSetPosition[_itemXpos, _itemYpos, 44 * GRID_W, 36 * GRID_H];
			_itemControlsGroup ctrlSetFade 0;
			_itemControlsGroup ctrlCommit 0;

			private _previewPicture = _display ctrlCreate ["A3A_Picture", A3A_IDC_TEAMLEADERBUILDIMAGEPREVIEW, _itemControlsGroup];
			_previewPicture ctrlSetPosition [0, 0, 44 * GRID_W, 25 * GRID_H];
			_previewPicture ctrlSetText _editorPreview;
			_previewPicture ctrlCommit 0;
	
			private _button = _display ctrlCreate ["A3A_ShortcutButton", A3A_IDC_TEAMLEADERBUILDBUTTON, _itemControlsGroup];
			_button ctrlSetPosition [0, 25 * GRID_H, 44 * GRID_W, 8 * GRID_H];
			_button ctrlSetText _displayName;
			_button setVariable ["className", _className];
			_button ctrlCommit 0;

			_button ctrlAddEventHandler ["ButtonDown", {
				params ["_control"];

				if(isNil "A3A_building_EHDB") then {
					// how the fuck did you do this? No databases?
					call A3A_initBuildingDB;
				};

				private _className = _control getVariable ["className", "Land_Tyres_F"];

				A3A_building_EHDB set [BUILD_OBJECT_SELECTED_STRING, _className];
				private _vehPos =  getPos (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
				deleteVehicle (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
				A3A_building_EHDB set [BUILD_OBJECT_TEMP_OBJECT, _className createVehicleLocal [0,0,0]];
				(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) enableSimulationGlobal false;
				(A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT) setPos _vehPos; 
				call (A3A_building_EHDB # UPDATE_BB);
			}];
			
	
	
		} forEach _buildableObjects;
	};

	default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("BuyVehicleDialog mode does not exist: %1", _mode);
    };
};
