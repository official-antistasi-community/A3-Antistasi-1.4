/*
    Author: [Håkon]
    [Description]
        Tries to add a vehicle to the garage, with feedback transmited back to the client

    Arguments:
    0. <Object> Vehicle to add
    1. <Int>    ClientID
    2. <String> Lock UID

    Return Value:
    <Bool> Successfully added vehicle

    Scope: Server
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: [cursorObject, clientOwner, getPlayerUID player] remoteExecCall ["HR_GRG_fnc_addVehicle",2];

    License: MIT License
*/
#include "defines.inc"
private _filename = "HR_GRG_fnc_addVehicle";
params [ ["_vehicle", objNull, [objNull]], ["_client", 2, [0]], ["_lockUID", ""], ["_player", objNull, [objNull]] ];
private _class = typeOf _vehicle;
private _cat = [_class] call HR_GRG_fnc_getCatIndex;

//validate input
if (!alive _vehicle) exitWith { [localize "STR_HR_GRG_Feedback_addVehicle_Destroyed"] remoteExec ["Hint", _client]; false };
if (locked _vehicle > 1) exitWith { [localize "STR_HR_GRG_Feedback_addVehicle_Locked"] remoteExec ["Hint", _client]; false };
if (_cat isEqualTo -1) exitWith { [localize "STR_HR_GRG_Feedback_addVehicle_GenericFail"] remoteExec ["Hint", _client]; false };

    //crewed
private _exit = false;
if ( ( {alive _x} count (crew _vehicle) ) > 0) then { _exit = true };
{ if ( ( {alive _x} count (crew _x) ) > 0) exitWith {_exit = true} } forEach attachedObjects _vehicle;
if (_exit) exitWith { [localize "STR_HR_GRG_Feedback_addVehicle_Crewed"] remoteExec ["Hint", _client]; false };

    //cap block
private _capacity = 0;
{ _capacity = _capacity + count _x } forEach HR_GRG_Vehicles;

private _countStatics = {_x isKindOf "StaticWeapon"} count (attachedObjects _vehicle);
if ((call HR_GRG_VehCap - _capacity) < (_countStatics + 1)) exitWith { [localize "STR_HR_GRG_Feedback_addVehicle_Capacity"] remoteExec ["Hint", _client]; false };//HR_GRG_VehCap is defined in config.inc

//add vehicle
private _locking = if (_lockUID isEqualTo "") then {false} else {true};
{
    detach _x;
    if (_x isKindOf "StaticWeapon") then {
        private _stateData = [_x] call HR_GRG_fnc_getState;
        deleteVehicle _x;
        private _vehUID = [] call HR_GRG_fnc_genVehUID;
        (HR_GRG_Vehicles#4) pushBack [cfgDispName(typeOf _x), typeOf _x, _lockUID, "", _vehUID, _stateData];
        LogDebug_5("Vehicle garaged | By: %1 [%2] | Type: %3 | Vehicle ID: %4 | Lock: %5", name _player, getPlayerUID _player, cfgDispName(typeOf _x), _vehUID, _locking );
    };
} forEach attachedObjects _vehicle;

private _source = [
    [_vehicle] call HR_GRG_fnc_isAmmoSource
    ,[_vehicle] call HR_GRG_fnc_isFuelSource
    ,[_vehicle] call HR_GRG_fnc_isRepairSource
];
private _sourceIndex = _source find true;
private _stateData = [_vehicle] call HR_GRG_fnc_getState;

deleteVehicle _vehicle;
private _vehUID = [] call HR_GRG_fnc_genVehUID;
(HR_GRG_Vehicles#_cat) pushBack [cfgDispName(_class), _class, _lockUID, "", _vehUID, _stateData];
if (_sourceIndex != -1) then {
    (HR_GRG_Sources#_sourceIndex) pushBack _vehUID;
    [_sourceIndex] call HR_GRG_fnc_declairSources;
    }; //register vehicle as a source
LogDebug_6("Vehicle garaged | By: %1 [%2] | Type: %3 | Vehicle ID: %4 | Lock: %5 | Source: %6", name _player, getPlayerUID _player, cfgDispName(_class), _vehUID, _locking, _sourceIndex);

//refresh category for active users
private _catToRefresh = if (_countStatics > 0) then {[_cat, 4]} else {[_cat]};
private _refreshCode = {
    #include "defines.inc"
    private _disp = findDisplay IDD_Garage;
    private _cats = _this apply { HR_GRG_Cats#_x };
    {
        if (ctrlEnabled _x) then {
            [_x, _this#_forEachIndex] call HR_GRG_fnc_reloadCategory;
        };
    } forEach _cats;
};
[ _catToRefresh, _refreshCode ] remoteExecCall ["call", HR_GRG_Users];

[format [localize "STR_HR_GRG_Feedback_addVehicle_Success", cfgDispName(_class)]] remoteExec ["Hint", _client];
true;
