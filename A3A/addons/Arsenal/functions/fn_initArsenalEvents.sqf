#include "..\dialog\ids.inc"
#include "..\script_component.hpp"
#include "\x\A3A\addons\GUI\dialogues\defines.hpp"


Debug("Creating Arsenal Camera");
private _centerObject = missionNamespace getVariable ["A3A_arsenalCenterObject", player];
_centerObject hideObject false;
cuttext ["", "plain"];
showCommandingMenu "";


// BIS arsenal does this to have consistent screen blurring. But does it?
A3A_arsenal_cameraview = cameraView;
player switchCamera "internal";

showHUD false;

// we need to add eventHandlers to the display
private _display = findDisplay A3A_IDD_ANTISTASI_ARSENAL_DIALOG;
private _ctrlMouseArea = _display displayctrl A3A_IDC_ANTISTASI_ARSENAL_MOUSE_AREA;

_display displayAddEventHandler ["mousebuttondown", {
	systemChat "mousebutton down"	// TODO: handle mousebuttondown
}];
_display displayAddEventHandler ["mousebuttonup", {
	systemChat "mousebutton up"		// TODO: handle mousebuttonup
}];
_display displayAddEventHandler ["keydown", {
	systemChat "Keydown"			// TODO: handle downkeys
}];

_ctrlMouseArea ctrladdeventhandler ["mousemoving", {
	params ["_control", "_xPos", "_yPos", "_mouseOver"];
	systemChat str [_xPos, _yPos];
}];
_ctrlMouseArea ctrladdeventhandler ["mouseholding", {
	params ["_control", "_xPos", "_yPos", "_mouseOver"];
	systemChat str [_xPos, _yPos];
}];
_ctrlMouseArea ctrladdeventhandler ["mousebuttonclick", {
	params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
	systemChat "MouseArea Clicked";
}];
_ctrlMouseArea ctrladdeventhandler ["mousezchanged", {
	params ["_displayOrControl", "_scroll"];
	systemChat format ["Scroll speed: %1", _scroll];
}];
ctrlsetfocus _ctrlMouseArea;