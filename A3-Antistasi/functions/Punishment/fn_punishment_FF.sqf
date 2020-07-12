/*
Function:
    A3A_fnc_punishment_FF

Description:
    Checks if incident reported is indeed a rebel Friendly Fire event.
    Refer to A3A_fnc_punishment.sqf for actual punishment logic.
    NOTE: Collisions are a guaranteed exemption, logged but with no notification for the victim.
    NOTE: When called from an Hit type of EH, use Example 2 in order to detect collisions.

Scope:
    <LOCAL> Execute on player you wish to verify for FF. (For 'BIS_fnc_admin' and 'isServer').

Environment:
    <ANY>

Parameters 1:
    <OBJECT> Player that is being verified for FF.
    <NUMBER> The amount of time to add to the players total sentence time.
    <NUMBER> Raise the player's total offence level by this percentage. (100% total = Ocean Gulag).
    <OBJECT> [OPTIONAL] The victim of the player's FF.

Parameters 2:
    <ARRAY<OBJECT,OBJECT>> Suspected instigator and source/killer returned from EH. The unit that caused the damage is collisions is the source/killer.
    <NUMBER> The amount of time to add to the players total sentence time.
    <NUMBER> Raise the player's total offence level by this percentage. (100% total = Ocean Gulag).
    <OBJECT> [OPTIONAL] The victim of the player's FF.

Returns:
    <STRING> Either a exemption type or return from fn_punishment.sqf.

Examples 1:
    [_instigator, 20, 0.34, _unit] remoteExec ["A3A_fnc_punishment_FF",_instigator,false]; // How it should be called from another function.
    // Unit Tests:
    [player, 0, 0, objNull] call A3A_fnc_punishment_FF;             // Test self with no victim
    [player, 0, 0, cursorObject] call A3A_fnc_punishment_FF;        // Test self with victim
    [player,"forgive"] remoteExec ["A3A_fnc_punishment_release",2]; // Self forgive all sins

Examples 2:
    [[_instigator,_source], 20, 0.34, _unit] remoteExec ["A3A_fnc_punishment_FF",[_source,_instigator] select (isPlayer _instigator),false]; // How it should be called from an EH.
    // Unit Tests:
    [[objNull,player], 0, 0, objNull] call A3A_fnc_punishment_FF;      // Test self with no victim
    [[objNull,player], 0, 0, cursorObject] call A3A_fnc_punishment_FF; // Test self with victim

Author: Caleb Serafin
Date Updated: 14 June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [
    ["_instigator",objNull, [objNull,[]], [] ],
    "_timeAdded",
    "_offenceAdded",
    ["_victim",objNull]
];
private _filename = "fn_punishment_FF.sqf";

///////////////Checks if is Collision//////////////
if (_instigator isEqualType []) then {
    if (isPlayer (_instigator#0)) then {
        _instigator = _instigator#0;
    } else {
        _isCollision = true;
        _instigator = _instigator#1;
    };
};

//////Cool down prevents multi-hit spam/////
    // Doesn't log to avoid RPT spam.
    // Doesn't use hash table to be as quick as possible.
if (_instigator getVariable ["punishment_coolDown", 0] > servertime) exitWith {"PUNISHMENT COOL-DOWN ACTIVE"};
_instigator setVariable ["punishment_coolDown", servertime + 1, false]; // Local Exec faster

/////////////////Definitions////////////////
private _notifyVictim = {
    if (isPlayer _victim) then {["FF Notification", format["%1 hurt you!",name _instigator]] remoteExec ["A3A_fnc_customHint", _victim, false];};
};
private _notifyInstigator = {
    params ["_message"];
    private _victimStats = "";
    if (isPlayer _victim) then { _victimStats = format ["<br/><br/>Injured comrade: %1",name _victim]; };
    ["FF Notification", _message + _victimStats] remoteExec ["A3A_fnc_customHint", _instigator, false];
};
private _gotoExemption = {
    params [ ["_exemptionDetails", "" ,[""]] ];
    private _playerStats = format["Player: %1 [%2], _timeAdded: %3, _offenceAdded: %4", name _instigator, getPlayerUID _instigator,str _timeAdded, str _offenceAdded];
    [2, format ["%1 | %2", _exemptionDetails, _playerStats], _filename] remoteExecCall ["A3A_fnc_log",2,false];
    if (isPlayer _victim) then {
        ["FF Notification", format["%1 hurt you!",name _instigator]] remoteExec ["A3A_fnc_customHint", _victim, false];
        private _victimStats = format ["VICTIM | Found Collateral: %1 [%2], hurt by %3 [%4]", name _victim, getPlayerUID _victim, name _instigator, getPlayerUID _instigator];
        [2, format ["%1 | %2", _exemptionDetails, _victimStats], _filename] remoteExecCall ["A3A_fnc_log",2,false];
    };
    _exemptionDetails;
};
private _logPvPKill = {
    if (!(_victim isKindOf "Man")) exitWith {};
    private _killStats = format ["PVPKILL | %1 Hurt by PvP: %2 [%3]", name _victim, name _instigator, getPlayerUID _instigator];
    [2,_killStats,_filename] remoteExecCall ["A3A_fnc_log",2,false];
};
private _isCollision = false;

///////////////Checks if is FF//////////////
private _exemption = switch (true) do {
    case (!tkPunish):                                  {"FF PUNISH IS DISABLED"};
    case (isDedicated || isServer):                    {"FF BY SERVER"};
    case (!isMultiplayer):                             {"IS NOT MULTIPLAYER"};
    case (!isPlayer _instigator):                      {"NOT A PLAYER"};
    case (player != _instigator):                      {"NOT INSTIGATOR"}; // Must be local for 'BIS_fnc_admin'
    case (side _instigator in [Invaders, Occupants]):  {call _logPvPKill; "NOT REBEL"};
    case (_victim == _instigator):                     {"SUICIDE"};
    default                                            {""};
};

////////////////Logs if is FF///////////////
if (_exemption !=  "") exitWith {
    format["NOT FF, %1", _exemption];
};

/////////Checks for important roles/////////
private _vehicle = typeOf vehicle _instigator;
_exemption = switch (true) do {
    case (_isCollision) : {
        ["You damaged a friendly as a driver."] call _notifyInstigator;
        format ["COLLISION, %1", _vehicle]; // Just logged
    };
    case (call BIS_fnc_admin != 0): {
        ["You damaged a friendly as admin."] call _notifyInstigator; // Admin not reported for Zeus remote control.
        format ["ADMIN, %1", ["Not","Voted","Logged"] select (call BIS_fnc_admin)];
    };
    case (vehicle _instigator isKindOf "Air"): {
        call _notifyVictim;
        ["You damaged a friendly as CAS support."] call _notifyInstigator;
        format["AIRCRAFT, %1", _vehicle];
    };
    case (
        isNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner") &&
        getNumber (configFile >> "CfgVehicles" >> _vehicle >> "artilleryScanner") != 0
    ): {
        call _notifyVictim;
        ["You damaged a friendly as arty support."] call _notifyInstigator;
        format ["ARTY, %1", _vehicle];
    };
    // TODO: if( remoteControlling(_instigator) ) exitWith
        // For the meantime do either one of the following: login for Zeus, use the memberList addon;
        // Or change your player side to enemy faction
        // Without above: your controls will be free, and you won't die or lose inventory. If you have debug consol you can self forgive.
    default {""};
};

if (_exemption != "") exitWith {
    [_exemption] call _gotoExemption;
};

///////////////Drop The Hammer//////////////
[_instigator,_timeAdded,_offenceAdded,_victim] remoteExec ["A3A_fnc_punishment",2,false];
"PROSECUTED";


