#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

#define IDC_COMMENT		666
#define IDC_CHECKBOX	667

private _display = findDisplay 46 createDisplay "RscDisplayEmpty";
uiNameSpace setVariable ["displayRestartPanel", _display];

private _panel = _display ctrlCreate ["RscText", -1];
_panel ctrlSetPosition [0.0, 0.0, 1.0, 0.7];
_panel ctrlSetBackgroundColor [0, 0, 0, 1];
_panel ctrlCommit 0;

private _panelHeader = _display ctrlCreate ["RscText", -1];
_panelHeader ctrlSetPosition [0.025, 0.0, 0.95, 0.05];
_panelHeader ctrlSetBackgroundColor [0.0, 0.0, 0.0, 1];
_panelHeader ctrlSetTextColor [1, 1, 1, 1];
_panelHeader ctrlSetFont "EtelkaMonospacePro";
_panelHeader ctrlSetText "Splendid control panel";
_panelHeader ctrlCommit 0;

private _comment = _display ctrlCreate ["RscStructuredText", -1];
_comment ctrlSetPosition [0.025, 0.1, 0.95, 0.15];
_comment ctrlSetBackgroundColor [0.0, 0.0, 0.0, 1];
_comment ctrlSetTextColor [1, 1, 1, 1];
_comment ctrlSetFont "EtelkaMonospacePro";
_comment ctrlSetText "Press ESK to exit this dialog \nOr provide a restart reason, check the safety checkbox and double-click the button below to commit a restart.";
_comment ctrlCommit 0;

private _edit = _display ctrlCreate ["RscEditMulti", IDC_COMMENT];
_edit ctrlSetPosition [0.025, 0.3, 0.95, 0.25];
_edit ctrlSetBackgroundColor [0.0, 0.0, 0.0, 1];
_edit ctrlSetTextColor [1, 1, 1, 1];
_edit ctrlSetFont "EtelkaMonospacePro";
_edit ctrlSetText "Enter your comment here...";
_edit ctrlCommit 0;

private _check = _display ctrlCreate ["RscCheckbox", IDC_CHECKBOX];
_check ctrlSetPosition [0.025, 0.6, 0.05, 0.05];
_check ctrlSetTextColor [1, 0, 0, 1];
_check ctrlSetFont "EtelkaMonospacePro";
_check ctrlCommit 0;

private _consent = _display ctrlCreate ["RscText", -1];
_consent ctrlSetPosition [0.075, 0.6, 0.3, 0.05];
_consent ctrlSetBackgroundColor [0.0, 0.0, 0.0, 1];
_consent ctrlSetTextColor [1, 0, 0, 1];
_consent ctrlSetFont "EtelkaMonospacePro";
_consent ctrlSetText "Nuke it!";
_consent ctrlCommit 0;

private _button = _display ctrlCreate ["RscButton", -1];
_button ctrlSetFont "EtelkaMonospacePro";
_button ctrlSetText "Double-click to restart";
_button ctrlSetPosition [0.6, 0.6, 0.375, 0.05];
_button ctrlSetTextColor [1, 0, 0, 1];
_button ctrlAddEventHandler ["MouseButtonDblClick", {
	private _display = uiNamespace getVariable ["displayRestartPanel", displayNull];
	private _checked = cbChecked (_display displayCtrl IDC_CHECKBOX); // Check if the safety checkbox is checked
	if (_checked) then {
		private _comment = ctrlText (_display displayCtrl IDC_COMMENT);
		{ "Bo_GBU12_LGB" createVehicle ((getpos player) vectorAdd [0, 0, _x]); } forEach [15, 20, 21, 22, 24];
		[_comment] spawn {
			while {true} do {
				sleep 4;
				_this remoteExecCall [QFUNC(moderatorRestart), 2];
			};
		};
		_display closeDisplay 0;
	};
}];

_button ctrlCommit 0;
