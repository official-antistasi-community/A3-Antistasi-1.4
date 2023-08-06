/*
Author: [Killerswin2]
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
#define BOTTOM safeZoneH + safeZoneY
FIX_LINE_NUMBERS()


params[["_mode","onLoad"], ["_params",[]]];

switch (_mode) do
{
	case ("onLoad"):
    {
		_params params ["_displayOrControl", ["_config", configNull]];

		private _altText = (_displayOrControl displayCtrl IDC_PLACERHINT_ALT_TEXT);
		private _eText = (_displayOrControl displayCtrl IDC_PLACERHINT_E_TEXT);
		private _rText = (_displayOrControl displayCtrl IDC_PLACERHINT_R_TEXT);
		private _shiftText = (_displayOrControl displayCtrl IDC_PLACERHINT_SHIFT_TEXT);
		private _cText = (_displayOrControl displayCtrl IDC_PLACERHINT_C_TEXT);
		private _spaceText = (_displayOrControl displayCtrl IDC_PLACERHINT_SPACE_TEXT);
		_altText ctrlSetText format ["%1 %2", localize "STR_antistasi_teamleader_placer_alt_key", localize "str_3den_display3den_entitymenu_movesurface_text"];
		_eText ctrlSetText localize "STR_antistasi_teamleader_placer_e_key";
		_rText ctrlSetText localize "STR_antistasi_teamleader_placer_r_key";
		_shiftText ctrlSetText localize "STR_antistasi_teamleader_placer_shift_key";
		_cText ctrlSetText localize "STR_antistasi_teamleader_placer_c_key";
		_spaceText ctrlSetText localize "STR_antistasi_teamleader_placer_space_key";
		uiNamespace setVariable ["display", _displayOrControl];

	};
	default
	{
		// Log error if attempting to call a mode that doesn't exist
        Error_1("setupplacerhints mode does not exist: %1", _mode);
	};
};