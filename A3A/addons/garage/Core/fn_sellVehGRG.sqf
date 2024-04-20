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
diag_log "Starting script";
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_UID", "_player", "_selectedVehicle"];
diag_log "Definitions done";

if (!isServer) exitWith {"Not server executed"};
if (_player != theBoss) exitWith {["STR_HR_GRG_Feedback_sellVehicle_comOnly"] call HR_GRG_fnc_Hint; diag_log "Not Commander"};
_selectedVehicle params [["_catIndex", -1], ["_vehUID", -1], ["_class", ""]];
if ( (_catIndex isEqualTo -1) || (_vehUID isEqualTo -1) ) exitWith {};
//Trace_2("Attempting to sell vehicle at cat: %1 | Vehicle ID: %2 | Classname: %3", _catIndex, _vehUID, _class);
Info_2("Attempting to sell vehicle at cat: %1 | Vehicle ID: %2 | Classname: %3", _catIndex, _vehUID, _class);

diag_log format["Grabbing sell price for vehicle: %1", _class];
private _refund = [_class,true] call A3A_fnc_getVehicleSellPrice;
diag_log format["Got Refund Price: %1",_refund];
if (_refund == 0) exitWith {["STR_HR_GRG_Feedback_sellVehicle_noPrice"] call HR_GRG_fnc_Hint;};

private _cat = HR_GRG_Vehicles#_catIndex;
private _veh = _cat get _vehUID;
private _lock = _veh#2;
if !(_lock isEqualTo "") exitWith {["STR_HR_GRG_Feedback_sellVehicle_locked"] call HR_GRG_fnc_Hint; diag_log "Locked"};

//[nil,_UID, -1, -1, _player, true] call HR_GRG_fnc_broadcast; // resets selected vehicle
[_UID,_player,true] remoteExecCall ["HR_GRG_fnc_removeFromPool",HR_GRG_Users];
//[_UID, _player, "HR_GRG_fnc_removeFromPool"] call HR_GRG_fnc_execForGarageUsers;
[] remoteExec ["HR_GRG_fnc_sellVehGRGLocal",_player];

diag_log "Removed vehicle from pool";
[0,_refund] spawn A3A_fnc_resourcesFIA;
diag_log "Gave Money";
["STR_A3A_fn_base_sellveh_sold"] call HR_GRG_fnc_Hint;
diag_log "Finished Script";
Info_3("Vehicle UID %1 sold by %2 for %3.", _vehUID, name _player, _refund);
