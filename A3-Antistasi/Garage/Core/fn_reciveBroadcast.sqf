#include "defines.inc"
Trace_1("Reciving broadcast: %1",_this);
params ["_lockUID", "_checkoutUID", "_catIndex", "_vehUID", "_player", "_switch"];

private _cat = HR_GRG_Vehicles#_catIndex;
private _index = _cat findIf { (_x#4) isEqualTo _vehUID };
private _vehicle = _cat#_index;

//set the new data
if (_switch) then { [getPlayerUID _player] call HR_GRG_fnc_releaseAllVehicles };
if (!isNil "_lockUID") then {
    _vehicle set [2, _lockUID];
};
if (!isNil "_checkoutUID") then {
    _vehicle set [3, _checkoutUID];
};

private _isPlayer = _player isEqualTo player;

//handle refreshing preview and extras
if (_isPlayer) then {
    if (_switch) then {
        HR_GRG_SelectedVehicles = [_catIndex, _vehUID, _vehicle#1];
        [] call HR_GRG_fnc_reloadPreview;
        if (HR_GRG_hasAmmoSource) then {
            [] call HR_GRG_fnc_reloadPylons;
        } else {
            [HR_GRG_previewVeh, HR_GRG_previewVehState] call HR_GRG_fnc_setState;
        };
    };
    [true] call HR_GRG_fnc_toggleConfirmBttn;
};
[_isPlayer] call HR_GRG_fnc_reloadExtras;

//refresh the category display
private _disp = findDisplay IDD_Garage;
private _catCtrl = _disp displayCtrl IDC_CatList;
private _ctrl = HR_GRG_Cats#_catIndex;
Trace_2("r.Broadcast - Ctrl: %1 | Active: %2" , _ctrl, ctrlEnabled _ctrl);
if (ctrlEnabled _ctrl) then {
    [_ctrl, _catIndex] call HR_GRG_fnc_reloadCategory;
};
