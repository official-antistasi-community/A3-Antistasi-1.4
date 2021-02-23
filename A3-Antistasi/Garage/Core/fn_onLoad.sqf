private _filename = "HR_GRG_fnc_onLoad";
/*
    Author: [Håkon]
    [Description]
        Handels opening the garage

        Builds list in vehicleSelect dialog
        Data structure:
                | Display name      | Class name                    | Locked UID    | Checked out UID
        Cars    | [["Offroad"       |, "C_Offroad_01_F"             |, ""           |, ""
        Armored | [["FV-720 Mora"   |, "I_APC_tracked_03_cannon_F"  |, ""           |, ""
        Air     | [["CH-49 Mohawk"  |, "I_Heli_Transport_02_F"      |, ""           |, ""
        Boats   | [["Assault Boat"  |, "I_Boat_Transport_01_F"      |, ""           |, ""
        Statics | [["Mk6 Mortar"    |, "I_Mortar_01_F"              |, ""           |, ""

        Locked UID: Player UID of player who locked the vehicle in the garage
        Checked out UID: UID of player that is currently selecting the vehicle in the garage

        Note: Should only be called from display onLoad EH

    Arguments:
        <Nil>

    Return Value:
        <Nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [] call HR_GRG_fnc_onLoad;

    License: MIT License
*/
#include "defines.inc"
Trace("Opening Garage");

//if for some reason the server init has not been done, do it now
if (isNil "HR_GRG_Init") then {remoteExecCall ["HR_GRG_fnc_initServer",2]};

//dont allow opening when placing a vehicle
if (isNil "HR_GRG_Placing") then { HR_GRG_Placing = false };
if (HR_GRG_Placing) exitWith { closeDialog 2 };

//define general global variables used by garage
private _disp = findDisplay IDD_Garage;
HR_GRG_PlayerUID = getPlayerUID player;
HR_GRG_SelectedVehicles = [-1, -1, ""];
HR_GRG_SelectedChanged = false;
HR_GRG_previewVeh = objNull;
HR_GRG_Mounts = [];
HR_GRG_usedCapacity = 0;
HR_GRG_LockedSeats = 0;
HR_GRG_ReloadMounts = false;
HR_GRG_CurTexture = [];
HR_GRG_Pylons = [];
HR_GRG_UpdatePylons = false;

//preview cam
HR_GRG_previewCam = "camera" camCreate [10,0,100000];
HR_GRG_previewCam enableSimulation false;
HR_GRG_previewCam cameraEffect ["Internal", "Back"];
HR_GRG_camDist = 1.3;
HR_GRG_camDirX = 30;
HR_GRG_camDirY = 10;

//light source
HR_GRG_previewLight = "#lightpoint" createVehicleLocal [10,0,100000];
HR_GRG_previewLight setLightBrightness 1.1 * HR_GRG_camDist;
HR_GRG_previewLight setLightAmbient [1, 1, 1];
HR_GRG_previewLight setLightColor [1, 1, 1];
HR_GRG_previewLight setLightDayLight false;//only at night
HR_GRG_previewLight lightAttachObject [HR_GRG_previewCam, [0,0,0]];

//preview cam rotation events
HR_GRG_RMouseBtnDown = false;
_disp displayAddEventHandler ["MouseButtonDown", "if ((_this#1) isEqualTo 1) then {HR_GRG_RMouseBtnDown = true};"];
_disp displayAddEventHandler ["MouseButtonUp", "if ((_this#1) isEqualTo 1) then {HR_GRG_RMouseBtnDown = false};"];
_disp displayAddEventHandler ["MouseMoving", "if (HR_GRG_RMouseBtnDown) then {_this call HR_GRG_fnc_updateCamPos};"];
_disp displayAddEventHandler ["MouseZChanged","if !(HR_GRG_RMouseBtnDown) exitWith {}; HR_GRG_camDist = 0.9 max (HR_GRG_camDist - (_this#1)*0.1) min 2; [nil,0,0] call HR_GRG_fnc_updateCamPos; HR_GRG_previewLight setLightBrightness 1.1 * HR_GRG_camDist;"];

//categories list init
private _ctrlCat = _disp displayCtrl IDC_CatList;
private _catInitData = [
    [CarIcon, localize "STR_HR_GRG_Generic_Cars"]
    ,[ArmoredIcon, localize "STR_HR_GRG_Generic_Armored"]
    ,[AirIcon, localize "STR_HR_GRG_Generic_Air"]
    ,[BoatIcon, localize "STR_HR_GRG_Generic_Boat"]
    ,[StaticIcon, localize "STR_HR_GRG_Generic_Static"]
];
{
    private _index = _ctrlCat lbAdd "";
    _ctrlCat lbSetData [_index, _x#1];
    _ctrlCat lbSetTooltip [_index, _x#1];
    _ctrlCat lbSetPicture [_index, _x#0];
    _ctrlCat lbSetPictureColor [_index, [1, 1, 1, 1]];
    _ctrlCat lbSetPictureColorSelected [_index, [0.85, 0.85, 0.55, 1]];
} forEach _catInitData;

//define list of controls coresponding with list index
HR_GRG_Cats = [IDC_CatCar,IDC_CatArmored,IDC_CatAir,IDC_CatBoat,IDC_CatStatic] apply {_disp displayCtrl _x};
{
    _x ctrlSetPosition ctrlDisabled;
    _x ctrlEnable false;
    _x ctrlCommit 0;
} forEach HR_GRG_Cats;
_ctrlCat lbSetCurSel 0;

//add veh pool modified EH
"HR_GRG_Event" addPublicVariableEventHandler { (_this#1) call HR_GRG_fnc_reciveBroadcast };
"HR_GRG_Vehicles" addPublicVariableEventHandler {
    #include "defines.inc"
    private _disp = findDisplay IDD_Garage;
    private _catCtrl = _disp displayCtrl IDC_CatList;
    private _index = lbCurSel _catCtrl;
    private _ctrl = HR_GRG_Cats#_index;
    [_ctrl, _index] call HR_GRG_fnc_reloadCategory;
};

//extras list init
private _ctrlExtraList = _disp displayCtrl IDC_ExtraList;
private _extraInitData = [
    [StaticIcon, localize "STR_HR_GRG_Generic_Mounts",IDC_ExtraMounts]
    ,[TexturesIcon, localize "STR_HR_GRG_Generic_Texture",IDC_ExtraTexture]
    ,[AnimationsIcon, localize "STR_HR_GRG_Generic_Anim",IDC_ExtraAnim]
];
if (
    HR_GRG_Pylons_Enabled //Pylon editing enabled
    && { HR_GRG_hasAmmoSource } //or ammo source registered
) then { _extraInitData pushBack [PylonsIcon, "Pylons",IDC_ExtraPylons] }; //add pylon editing menu

{
    private _index = _ctrlExtraList lbAdd "";
    _ctrlExtraList lbSetData [_index, _x#1];
    _ctrlExtraList lbSetValue [_index, _x#2];
    _ctrlExtraList lbSetTooltip [_index, _x#1];
    _ctrlExtraList lbSetPicture [_index, _x#0];
    _ctrlExtraList lbSetPictureColor [_index, [1, 1, 1, 1]];
    _ctrlExtraList lbSetPictureColorSelected [_index, [0.85, 0.85, 0.55, 1]];
} forEach _extraInitData;
private _h = (lbSize _ctrlExtraList) * 0.03 * safezoneH;
_ctrlExtraList ctrlSetPosition [0.790 * safezoneW + safezoneX, 0.000 * safezoneH + safezoneY, 0.030 * safezoneW, _h];
_ctrlExtraList ctrlCommit 0;

//hide all extras menus and info panel
{
    _ctrl = _disp displayCtrl _x;
    _ctrl ctrlEnable false;
    _ctrl ctrlSetPosition ctrlDisabled;
    _ctrl ctrlCommit 0;
} forEach [IDC_ExtraMounts,IDC_ExtraTexture,IDC_ExtraAnim,IDC_ExtraPylons];
_ctrlExtraList lbSetCurSel 0;
[] call HR_GRG_fnc_reloadPylons;

//add player to broadcast recipient list
[clientOwner] remoteExecCall ["HR_GRG_fnc_addUser", 2]; //add to recipient

HR_GRG_EachFrame = addMissionEventHandler ["EachFrame", {
    if (call HR_GRG_CP_closeCnd) exitWith {closeDialog 2};
    if (HR_GRG_UpdatePylons) then { [] call HR_GRG_fnc_UpdatePylons };
}];

//keyBind hints
_keyBindCtrl = _disp displayCtrl IDC_KeyBindHint;
_keyBindText = composeText [
    image cameraIcon,"",localize "STR_HR_GRG_Feedback_Cam_Controls", lineBreak
    ,"    ",image moveIcon,"",localize "STR_HR_GRG_Feedback_Cam_Rotate",lineBreak
    ,"    ",image zoomIcon,"",localize "STR_HR_GRG_Feedback_Cam_Zoom"
];
_keyBindCtrl ctrlSetStructuredText _keyBindText;
