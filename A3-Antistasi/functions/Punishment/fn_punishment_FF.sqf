/*
Function:
    A3A_fnc_punishment_FF

Description:
    Checks if incident reported is indeed a rebel Friendly Fire event.
    Refer to A3A_fnc_punishment.sqf for actual punishment logic.
    NOTE: When called from an Hit type of EH, use Example 2 in order to detect collisions.

Scope:
    <LOCAL> Execute on player you wish to verify for FF. (For 'BIS_fnc_admin' and 'isServer').

Environment:
    <UNSCHEDULED> Suspension may cause undefined behaviour.

Parameters:
    <OBJECT> Player that is being verified for FF. | <ARRAY<OBJECT,OBJECT>> Suspected instigator and source/killer returned from EH. The unit that caused the damage is collisions is the source/killer.
    <NUMBER> The amount of time to add to the players total sentence time.
    <NUMBER> Raise the player's total offence level by this percentage. (100% total = Ocean Gulag).
    <OBJECT> The victim of the player's FF. [DEFAULT=objNull]
    <STRING> Custom message to be displayed to FFer [DEFAULT=""]

Returns:
    <STRING> Either a exemption type or return from fn_punishment.sqf.

Examples <OBJECT>:
    [_instigator, 60, 0.4, _unit] remoteExec ["A3A_fnc_punishment_FF",_instigator,false]; // How it should be called from another object.
    // Unit Tests:
    [player, 0, 0, objNull] call A3A_fnc_punishment_FF;             // Test self with no victim
    [player, 0, 0, cursorObject] call A3A_fnc_punishment_FF;        // Test self with victim
    [getPlayerUID player,"forgive"] remoteExec ["A3A_fnc_punishment_release",2]; // Self forgive all sins

Examples <ARRAY<OBJECT,OBJECT>>:
    [[_instigator,_source], 60, 0.4, _unit] remoteExec ["A3A_fnc_punishment_FF",[_source,_instigator] select (isPlayer _instigator),false]; // How it should be called from an EH.

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [
    ["_instigator",objNull, [objNull,[],""], [] ],
    ["_timeAdded",0, [0]],
    ["_offenceAdded",0, [0]],
    ["_victim",objNull, [objNull]],
    ["_customMessage","", [""], [] ]
];
private _filename = "fn_punishment_FF.sqf";
///////////////Load Event from Queue///////////////
private _skipCoolDownCheck = false;
private _queueEmpty = false;
if (_instigator isEqualType "" && {_instigator isEqualTo "loadQueue"}) then {
    if ((count A3A_FFPunish_Q) isEqualTo 0) exitWith {
        A3A_FFPunish_CD = servertime + 0.5;
        _queueEmpty = true;
    };
     _instigator = A3A_FFPunish_Q #0#0; // Cannot use params, it will be limited to this scope.
     _timeAdded = A3A_FFPunish_Q #0#1;
     _offenceAdded = A3A_FFPunish_Q #0#2;
     _victim = A3A_FFPunish_Q #0#3;
     _customMessage = A3A_FFPunish_Q #0#4;
     A3A_FFPunish_Q deleteAt 0;
     _skipCoolDownCheck = true;
};
if (_queueEmpty) exitWith {"PUNISHMENT QUEUE EMPTY"};

///////////////Checks if is Collision//////////////
private _isCollision = false;
if (_instigator isEqualType []) then {
    _isCollision = !(((_instigator#0) isEqualType objNull) && {isPlayer (_instigator#0)});
    _instigator = _instigator select _isCollision;      // First one in EH will be unit by default, if its a collision the eh returns the instigator in "source" or "killer"
};
private _vehicle = typeOf vehicle _instigator;

//////Cool down prevents multi-hit spam/////
    // Doesn't log to avoid RPT spam.
    // Doesn't use punish data to be as quick as possible.
if ((!_skipCoolDownCheck) && A3A_FFPunish_CD > servertime) exitWith {
    A3A_FFPunish_Q pushBack [_instigator,_timeAdded,_offenceAdded,_victim,_customMessage];
    "PUNISHMENT COOL-DOWN ACTIVE";
};
if (!_skipCoolDownCheck) then {
    A3A_FFPunish_Q = []; // If the cool down period had concluded, what ever might of been shoved into the queue is from previous EH trigger.
};
A3A_FFPunish_CD = servertime + 0.5;

/////////////////Definitions////////////////
private _onExitExemption = {
    [_instigator] spawn {
        params ["_instigator"];
        A3A_FFPunish_CD = servertime + 5; // Large if there is a scheduler delay. Finite to allow a time-out if there is an unknown crash during execution.
        uiSleep 0.01;
        isNil {["loadQueue",nil,nil,nil,nil] call A3A_fnc_punishment_FF}; // Unscheduled execution
    };
};
private _victimStats = ["",format [" damaged %1 ", name _victim]] select (_victim isKindOf "Man");
_victimStats = _victimStats + (["[AI]",format ["[%1]", getPlayerUID _victim]] select (isPlayer _victim));
private _notifyVictim = {
    if (isPlayer _victim) then {["FF Notification", format["%1 hurt you!",name _instigator]] remoteExec ["A3A_fnc_customHint", _victim, false];};
};
private _notifyInstigator = {
    params ["_exempMessage"];
    private _comradeStats = ["<br/>",format ["<br/>Injured comrade: %1<br/>",name _victim]] select (_victim isKindOf "Man");
    ["FF Notification", _exempMessage+ _comradeStats + _customMessage] remoteExec ["A3A_fnc_customHint", _instigator, false];
};
private _gotoExemption = {
    params [ ["_exemptionDetails", "" ,[""]] ];
    private _playerStats = format["%1 [%2]%3, Avoided-time: %4, Avoided-offence: %5", name _instigator, getPlayerUID _instigator, _victimStats,str _timeAdded, str _offenceAdded];
    [2, format ["%1 | %2", _exemptionDetails, _playerStats], _filename,true] remoteExecCall ["A3A_fnc_log",2,false];
    _exemptionDetails;
};
private _logPvPHurt = {
    if (!(_victim isKindOf "Man")) exitWith {};
    private _killStats = format ["PVPHURT | Rebel %1 [%2]%3", name _instigator, getPlayerUID _instigator, _victimStats];
    [2,_killStats,_filename,true] remoteExecCall ["A3A_fnc_log",2,false];
};
private _logPvPAttack = {
    if (!(_victim isKindOf "Man")) exitWith {};
    private _killStats = format ["PVPATTACK | PvP %1 [%2]%3", name _instigator, getPlayerUID _instigator, _victimStats];
    [2,_killStats,_filename,true] remoteExecCall ["A3A_fnc_log",2,false];
};

///////////////Checks if is FF//////////////
private _exemption = switch (true) do {
    case (!tkPunish):                                  {"FF PUNISH IS DISABLED"};
    case (!isMultiplayer):                             {"IS NOT MULTIPLAYER"};
    case (!hasInterface):                              {"FF BY SERVER/HC"};
    case (!(player isEqualTo _instigator)):            {"NOT EXEC ON INSTIGATOR"}; // Must be local for 'BIS_fnc_admin'
    case (_victim isEqualTo _instigator):              {"SUICIDE"}; // Local AI victims will be different.
    case (_victim getVariable ["pvp",false]):          {call _logPvPHurt; "VICTIM NOT REBEL"};
    case (_instigator getVariable ["pvp",false]):      {call _logPvPAttack; "INSTIGATOR NOT REBEL"};
    default                                            {""};
};

////////////////Logs if is FF///////////////
if (_exemption !=  "") exitWith {
    call _onExitExemption;
    format["NOT FF, %1", _exemption];
};

/////////////Acts on Collision//////////////
if (_isCollision) then {
    _customMessage = [_customMessage,"You damaged a friendly as a driver."] joinString "<br/>";
    _timeAdded = 27;
    _offenceAdded = 0.15;
    [2, format ["COLLISION | %1 [%2]'s %3%4", name _instigator, getPlayerUID _instigator, _vehicle, _victimStats], _filename,true] remoteExecCall ["A3A_fnc_log",2,false];
};

/////////Checks for important roles/////////
_exemption = switch (true) do {
    case (call BIS_fnc_admin != 0 || isServer): {
        ["You damaged a friendly as admin."] call _notifyInstigator; // Admin not reported to victim for Zeus remote control.
        format ["ADMIN, %1", ["Local Host","Voted","Logged"] select (call BIS_fnc_admin)];
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
        // For the meantime do either one of the following: login as admin for Zeus, or "player setVariable ["PvP",true,true];
        // Without above: Your AI will be prosecuted for FF. Upon leaving UAV you will be punished. If you have debug consol you can self forgive.
    default {""};
};

if (_exemption != "") exitWith {
    call _onExitExemption;
    [_exemption] call _gotoExemption;
};

///////////////Drop The Hammer//////////////
A3A_FFPunish_Q = []; // Clear queue as it only exists to mitigate zero-frame incorrect calls from Event Handlers.
[_instigator,_timeAdded,_offenceAdded,_victim,_customMessage] remoteExecCall ["A3A_fnc_punishment",2,false];
"PROSECUTED";
