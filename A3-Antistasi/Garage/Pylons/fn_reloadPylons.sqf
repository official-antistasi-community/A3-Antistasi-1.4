/*
    Author: [Håkon]
    [Description]
        Reloads the pylons menu for a new vehicle selection

    Arguments:
    0. <nil>

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [] call HR_GRG_fnc_reloadPylons;

    License: MIT License
*/
#include "defines.inc"
Trace("Reloading pylons menu");
private _disp = findDisplay IDD_Garage;
private _ctrlGroup = _disp displayCtrl IDC_ExtraPylons;

////////////////////
//clear old ctrls //
////////////////////
Trace("Clearing old pylon controls");
{ //ToDo: find a better way to clear the controls under this control group
    if (_ctrlGroup isEqualTo ctrlParentControlsGroup _x) then {ctrlDelete _x};
} forEach allControls _disp;

///////////////
// Base menu //
///////////////
Trace("Prepping base info");
//define adjustments for x and y
private _bgCtrl = _disp ctrlCreate ["HR_GRG_RscBox", IDC_PylonsFirstIDC, _ctrlGroup];
private _xAdjust = safeZoneX + safeZoneW;
private _yAdjust = safeZoneY + safeZoneH;
private _baseOffset = 0.01;
private _IDCCount = 1;
private _pylonsCfg = (configFile >> "CfgVehicles" >> typeOf HR_GRG_previewVeh >> "Components" >> "TransportPylonsComponent");
HR_GRG_PylonData = [];
HR_GRG_Turrets = [];
private _fullCrew = fullCrew [HR_GRG_previewVeh,"",true];
{
    if (
        ((_x#2) isEqualTo -1) //not cargo turret
        && !((_x#3) isEqualTo [])
    ) then { HR_GRG_Turrets pushBack (_x#3) };
} forEach _fullCrew;

//////////////////
//mirror button //
//////////////////
Trace("Creating mirror functionality");
private _cbCtrl = _disp ctrlCreate ["HR_GRG_RscCheckBox", IDC_PylonsFirstIDC + _IDCCount, _ctrlGroup];
_IDCCount = _IDCCount +1;
_cbCtrl ctrlSetPosition [
    0.01 * _xAdjust
    , _baseOffset + 0 * _yAdjust
    , 0.01 * safeZoneW
    , 0.02 * safeZoneH
];
_cbCtrl ctrlAddEventHandler ["CheckedChanged", {[(_this select 1) == 1] call HR_GRG_fnc_pylonToggleMirror}];
_cbCtrl ctrlCommit 0;

private _cbTextCtrl = _disp ctrlCreate ["HR_GRG_RscText", IDC_PylonsFirstIDC + _IDCCount, _ctrlGroup];
_IDCCount = _IDCCount +1;
_cbTextCtrl ctrlSetPosition [
    0.025 * _xAdjust
    , _baseOffset + 0 * _yAdjust
    , 0.05 * safeZoneW
    , 0.02 * safeZoneH
];
_cbTextCtrl ctrlSetText localize "STR_HR_GRG_Pylons_Mirror";
_cbTextCtrl ctrlCommit 0;

////////////////////
//preset loudouts //
////////////////////
Trace("Getting preset data, and creating preset control");
private _presetComboCtrl = _disp ctrlCreate ["HR_GRG_RscCombo", IDC_PylonsFirstIDC + _IDCCount, _ctrlGroup];
_IDCCount = _IDCCount +1;
_presetComboCtrl ctrlSetPosition [
    0.14 * _xAdjust
    , _baseOffset + 0.001 * _yAdjust
    , 0.08 * safeZoneW
    , 0.02 * safeZoneH
];
_baseOffset = _baseOffset + 0.05;

private _index = _presetComboCtrl lbAdd localize "STR_HR_GRG_Pylons_CustomPreset";
_presetComboCtrl lbSetData [_index, "[]"];
HR_GRG_DefaultMags = [];
{
    private _displayName = getText (_x >> "displayName");
    private _attachement = getArray (_x >> "attachment");
    private _index = _presetComboCtrl lbAdd _displayName;
    _presetComboCtrl lbSetData [_index, str _attachement];

    //get all mags used by default presets
    _loadoutMags = _attachement apply { getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") };
    {HR_GRG_DefaultMags pushBackUnique _x} forEach _loadoutMags;

} forEach (configProperties [(_pylonsCfg >> "Presets")]);

_presetComboCtrl lbSetCurSel 0;
_presetComboCtrl ctrlAddEventHandler ["LBSelChanged", {_this call HR_GRG_fnc_PylonsPresetChanged}];
_presetComboCtrl ctrlCommit 0;

HR_GRG_Pylon_GeneralCtrls = [_cbCtrl, _presetComboCtrl];

////////////////////
// Dynamic pylons //
////////////////////
Trace("Starting to add pylons controls, consists of controls for text, turret button and pylon mag combo box");
private _curPylons = getPylonMagazines HR_GRG_previewVeh;
{
    Trace_1("Adding pylon controls for pylon: %1", configName _x);
    //general info
    private _mags = HR_GRG_previewVeh getCompatiblePylonMagazines (_forEachIndex + 1);
    private _pylonMag = _curPylons#_forEachIndex;

    //Header text
    private _textCtrl = _disp ctrlCreate ["HR_GRG_RscText", -1, _ctrlGroup];
    _textCtrl ctrlSetPosition [
        0.01 * _xAdjust
        , _baseOffset + 0.01 * _yAdjust
        , 0.14 * safeZoneW
        , 0.02 * safeZoneH
    ];
    _textCtrl ctrlSetText format [localize "STR_HR_GRG_Pylons_PylonText", _forEachIndex + 1];
    _textCtrl ctrlCommit 0;

    //Turret button
    private _btnCtrl = _disp ctrlCreate ["HR_GRG_ctrlButtonPictureKeepAspect", IDC_PylonsFirstIDC + _IDCCount, _ctrlGroup];
    _IDCCount = _IDCCount +1;
    _btnCtrl ctrlSetPosition [
        0.02 * _xAdjust
        , _baseOffset + 0.05 * _yAdjust
        , 0.01 * safeZoneW
        , 0.02 * safeZoneH
    ];
    private _turret = [HR_GRG_previewVeh, _forEachIndex] call HR_GRG_fnc_getPylonTurret;
    [_btnCtrl, false, _turret] call HR_GRG_fnc_PylonsTurretToggle;
    _btnCtrl ctrlAddEventHandler ["ButtonClick", {[_this#0, true, []] call HR_GRG_fnc_PylonsTurretToggle}];
    _btnCtrl ctrlCommit 0;

    //Pylon magazine selection
    private _comboCtrl = _disp ctrlCreate ["HR_GRG_RscCombo", IDC_PylonsFirstIDC + _IDCCount, _ctrlGroup];
    _IDCCount = _IDCCount +1;
    _comboCtrl ctrlSetPosition [
        0.05 * _xAdjust
        , _baseOffset + 0.05 * _yAdjust
        , 0.14 * safeZoneW
        , 0.02 * safeZoneH
    ];
    private _index = _comboCtrl lbAdd localize "STR_HR_GRG_Pylons_Empty";
    private _selected = 0;
    {
        private _index = _comboCtrl lbAdd getText (configFile >> "CfgMagazines" >> _x >> "displayName");
        _comboCtrl lbSetTooltip [_index, getText (configFile >> "CfgMagazines" >> _x >> "descriptionShort")];
        _comboCtrl lbSetData [_index, _x];
        if (_pylonMag isEqualTo _x) then {_selected = _index};
    } forEach _mags;
    _comboCtrl lbSetCurSel _selected;
    _comboCtrl ctrlAddEventHandler ["LBSelChanged", {_this call HR_GRG_fnc_PylonsChanged}];
    _comboCtrl ctrlCommit 0;

    //Add to data array
    private _mirroredIndex = getNumber (_x >> "mirroredMissilePos");
    HR_GRG_PylonData pushBack [_comboCtrl, _mirroredIndex - 1, _btnCtrl, _selected];
    _baseOffset = _baseOffset + 0.12;
} forEach ("true" configClasses (_pylonsCfg >> "Pylons"));
Trace("Done adding pylons controls");
///////////////////////////
// Handle no pylons case //
///////////////////////////
if (_IDCCount isEqualTo 4) then {
    Trace("No pylons were found, creating hint text");
    private _textCtrl = _disp ctrlCreate ["HR_GRG_RscStructuredTextNoBG", -1, _ctrlGroup];
    _textCtrl ctrlSetPosition [
        0.01 * _xAdjust
        , _baseOffset + 0.01 * _yAdjust
        , 0.14 * safeZoneW
        , 0.1 * safeZoneH
    ];
    _textCtrl ctrlSetStructuredText composeText [localize "STR_HR_GRG_Pylons_noPylons", lineBreak,"    ", cfgDispName(typeOf HR_GRG_previewVeh)];
    _textCtrl ctrlCommit 0;
};

///////////////////////////////////////
//set background position and height //
///////////////////////////////////////
Trace("Setting background position and height");
_bgCtrl ctrlSetPosition [0, 0, 0.180 * safeZoneW, (0.590 * safeZoneH) max (_baseOffset + 0.01 * _yAdjust)];
_bgCtrl ctrlCommit 0;

HR_GRG_UpdatePylons = true;
Trace("Pylons menu reloaded");
