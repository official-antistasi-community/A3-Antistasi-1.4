/*
    Author: Tiny, parts of code ethically sourced from Håkon
    [Description]
        Attempts to sell currently selected vehicle

    Arguments:
    0. <String> player UID
    1. <Object> Player
    2. <Array>  vehicle to sell (intended use with HR_GRG_SelectedVehicles)

    Return Value:
    n/A

    Scope: Server
    Environment: Unscheduled
    Public: [No]
    Dependencies:

    Example: [HR_GRG_PlayerUID, player, HR_GRG_SelectedVehicles] remoteExecCall ["HR_GRG_fnc_sellVehGRG",2];

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_UID", "_player", "_selectedVehicle"];

private _fnc_hint = {
    params ["_bodyText"];
    private _titleStr = localize "STR_A3A_fn_base_sellveh_sell";
    [_titleStr, localize _bodyText] remoteExecCall ["A3A_fnc_customHint",_player];
};

if (!isServer) exitWith {};
if (_player != theBoss) then {["STR_HR_GRG_Feedback_sellVehicle_comOnly"] call _fnc_hint};
_selectedVehicle params [["_catIndex", -1], ["_vehUID", -1], ["_veh",""]];
if ( (_catIndex isEqualTo -1) || (_vehUID isEqualTo -1) ) exitWith {};
Trace_2("Attempting to sell vehicle at cat: %1 | Vehicle ID: %2", _catIndex, _vehUID);

if (_veh#2 isNotEqualTo "") exitWith {["STR_HR_GRG_Feedback_sellVehicle_locked"]};

private _refund = [_veh,true] call A3A_fnc_getVehicleSellPrice;

[_UID] remoteExecCall ["HR_GRG_fnc_removeFromPool",2];

[0,_refund] spawn A3A_fnc_resourcesFIA;

["STR_A3A_fn_base_sellveh_sell"] call _fnc_hint;

Info_2("Vehicle UID %1 sold by %2.", _vehUID, name _player);
