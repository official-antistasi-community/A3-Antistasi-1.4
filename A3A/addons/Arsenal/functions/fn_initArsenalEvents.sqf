#include "..\dialog\ids.inc"
#include "..\script_component.hpp"
#include "\x\A3A\addons\GUI\dialogues\defines.hpp"


params ["_display"];

Debug("Creating Arsenal Camera");
A3A_Arsenal_Mouse = [0,0];
disableSerialization;
uiNamespace setVariable ["A3A_Arsenal_Display", _display];
A3A_Arsenal_Buttons = [[],[]];
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
    ["down", _this] call A3A_fnc_arsenalHandleMouseButton;	
}];
_display displayAddEventHandler ["mousebuttonup", {
    ["up", _this] call A3A_fnc_arsenalHandleMouseButton;		
}];
_display displayAddEventHandler ["keydown", {
    call A3A_fnc_arsenalHandleKeyDown;			
}];

_ctrlMouseArea ctrladdeventhandler ["mousemoving", {
    ["mouse", _this] call A3A_fnc_arsenalHandleCtrlMouse;
}];
_ctrlMouseArea ctrladdeventhandler ["mouseholding", {
    ["mouse", _this] call A3A_fnc_arsenalHandleCtrlMouse;
}];
_ctrlMouseArea ctrladdeventhandler ["mousezchanged", {
    ["mousezchanged", _this] call A3A_fnc_arsenalHandleCtrlMouse;
}];
ctrlsetfocus _ctrlMouseArea;

private _camPos = [10,-45,15,[0,0,-1]];

if (isNil { missionnamespace getvariable "A3A_ArsenalCamPos_Init" }) then
{
    missionnamespace setvariable ["A3A_ArsenalCamPos_Init", _camPos];
};

A3A_ArsenalCamPos = +(missionnamespace getvariable "A3A_ArsenalCamPos_Init");

// now we do camera stuff
private _posOfCenter = getPosASLVisual _centerObject;

private _target = createAgent ["Logic", _posOfCenter, [], 0, "none"];
_target attachTo [_centerObject, A3A_ArsenalCamPos select 3, ""];
missionNamespace setVariable ["A3A_Arsenal_target", _target];

//camera time! Yes this was taken from the BIS arsenal code
private _cam = "camera" camCreate _posOfCenter;
_cam cameraEffect ["internal", "back"];
_cam camPrepareFocus [-1, -1];
_cam camPrepareFov 0.35;
_cam camCommitPrepared 0;
showCinemaBorder false;
A3A_Arsenal_Cam = _cam;
["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0,0.5]] call bis_fnc_textTiles;

// init the camera mouse stuff
["mouse", [controlnull, 0, 0]] call A3A_fnc_arsenalHandleCtrlMouse;
A3A_Arsenal_Draw3D_EH = addMissionEventHandler ["draw3D", {call A3A_fnc_arsenalDraw3D }];
