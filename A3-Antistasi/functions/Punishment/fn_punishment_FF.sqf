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
    <UNSCHEDULED>

Parameters 1:
    <OBJECT> Player that is being verified for FF.
    <NUMBER> The amount of time to add to the players total sentence time.
    <NUMBER> Raise the player's total offence level by this percentage. (100% total = Ocean Gulag).
    <OBJECT> [OPTIONAL=objNull] The victim of the player's FF.
    <STRING> [OPTIONAL] Custom message to be displayed to FFer

Parameters 2:
    <ARRAY<OBJECT,OBJECT>> Suspected instigator and source/killer returned from EH. The unit that caused the damage is collisions is the source/killer.
    <NUMBER> The amount of time to add to the players total sentence time.
    <NUMBER> Raise the player's total offence level by this percentage. (100% total = Ocean Gulag).
    <OBJECT> [OPTIONAL=objNull] The victim of the player's FF.
    <STRING> [OPTIONAL] Custom message to be displayed to FFer

Returns:
    <STRING> Either a exemption type or return from fn_punishment.sqf.

Examples 1:
    [_instigator, 60, 0.4, _unit] remoteExec ["A3A_fnc_punishment_FF",_instigator,false]; // How it should be called from another function.
    // Unit Tests:
    [player, 0, 0, objNull] call A3A_fnc_punishment_FF;             // Test self with no victim
    [player, 0, 0, cursorObject] call A3A_fnc_punishment_FF;        // Test self with victim
    [player,"forgive"] remoteExec ["A3A_fnc_punishment_release",2]; // Self forgive all sins

Examples 2:
    [[_instigator,_source], 60, 0.4, _unit] remoteExec ["A3A_fnc_punishment_FF",[_source,_instigator] select (isPlayer _instigator),false]; // How it should be called from an EH.
    // Unit Tests:
    [[objNull,player], 0, 0, objNull] call A3A_fnc_punishment_FF;      // Test self with no victim
    [[objNull,player], 0, 0, cursorObject] call A3A_fnc_punishment_FF; // Test self with victim

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [
    ["_instigator",objNull, [objNull,[]], [] ],
    ["_timeAdded",0, [0]],
    ["_offenceAdded",0, [0]],
    ["_victim",objNull, [objNull]],
    ["_customMessage","", [""], [] ]
];
private _filename = "fn_punishment_FF.sqf";
///////////////Checks if is Collision//////////////
private _isCollision = false;
if (_instigator isEqualType []) then {
    _isCollision = !(((_instigator#0) isEqualType objNull) && {isPlayer (_instigator#0)});
    _instigator = _instigator select _isCollision;      // First one in EH will be unit by default, if its a collision the eh returns the instigator in "source" or "killer"
};
private _vehicle = typeOf vehicle _instigator;

/////Log Instigator Pos on every damage/////
private _victimCoordsStats = "";
if (_victim isKindOf "Man") then {
    _victimCoordsStats = [" damaged ",name _victim," [",["AI",getPlayerUID _victim] select (isPlayer _victim),"] (grid: ",mapGridPosition _victim,"; ",(_victim distance2D posHQ) toFixed 0,"m from HQ; ",(_instigator distance2D _victim) toFixed 0,"m from Instigator)"] joinString "";
};
private _instigatorCoordsStats = [name _instigator," [",getPlayerUID _instigator,"] (grid: ",mapGridPosition _instigator,"; ",(_instigator distance2D posHQ) toFixed 0,"m from HQ; customMessage:'",_customMessage,"')"] joinString "";
[2, ["DAMAGE | ", _instigatorCoordsStats, _victimCoordsStats] joinString "", _filename] remoteExecCall ["A3A_fnc_log",2,false];

//////Cool down prevents multi-hit spam/////
    // Doesn't log to avoid RPT spam.
    // Doesn't use hash table to be as quick as possible.
if (_instigator getVariable ["punishment_coolDown", 0] > servertime) exitWith {"PUNISHMENT COOL-DOWN ACTIVE"};
_instigator setVariable ["punishment_coolDown", servertime + 1, false]; // Local Exec faster

/////////////////Definitions////////////////
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
    [2, format ["%1 | %2", _exemptionDetails, _playerStats], _filename] remoteExecCall ["A3A_fnc_log",2,false];
    _exemptionDetails;
};
private _logPvPHurt = {
    if (!(_victim isKindOf "Man")) exitWith {};
    private _killStats = format ["PVPHURT | Rebel %1 [%2]%3", name _instigator, getPlayerUID _instigator, _victimStats];
    [2,_killStats,_filename] remoteExecCall ["A3A_fnc_log",2,false];
};
private _logPvPAttack = {
    if (!(_victim isKindOf "Man")) exitWith {};
    private _killStats = format ["PVPATTACK | PvP %1 [%2]%3", name _instigator, getPlayerUID _instigator, _victimStats];
    [2,_killStats,_filename] remoteExecCall ["A3A_fnc_log",2,false];
};

///////////////Checks if is FF//////////////
private _exemption = switch (true) do {
    case (!tkPunish):                                  {"FF PUNISH IS DISABLED"};
    case (!isMultiplayer):                             {"IS NOT MULTIPLAYER"};
    case (!hasInterface):                              {"FF BY SERVER/HC"};
    case (!(player isEqualTo _instigator)):            {"NOT EXEC ON INSTIGATOR"}; // Must be local for 'BIS_fnc_admin'
    case (_victim isEqualTo _instigator):              {"SUICIDE"}; // Local AI victims will be different.
    case (!(side group _victim isEqualTo teamPlayer)):      {call _logPvPHurt; "VICTIM NOT REBEL"};
    case (!(side group _instigator isEqualTo teamPlayer)):  {call _logPvPAttack; "INSTIGATOR NOT REBEL"};
    default                                            {""};
};

////////////////Logs if is FF///////////////
if (_exemption !=  "") exitWith {
    format["NOT FF, %1", _exemption];
};

/////////////Acts on Collision//////////////
if (_isCollision) then {
    _customMessage = [_customMessage,"You damaged a friendly as a driver."] joinString "<br/>";
    _timeAdded = 27;
    _offenceAdded = 0.15;
    [2, format ["COLLISION | %1 [%2]'s %3%4", name _instigator, getPlayerUID _instigator, _vehicle, _victimStats], _filename] remoteExecCall ["A3A_fnc_log",2,false];
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
        // For the meantime do either one of the following: login for Zeus, use the memberList addon;
        // Or change your player side to enemy faction
        // Without above: your controls will be free, and you won't die or lose inventory. If you have debug consol you can self forgive.
    default {""};
};

if (_exemption != "") exitWith {
    [_exemption] call _gotoExemption;
};

///////////////Drop The Hammer//////////////
[_instigator,_timeAdded,_offenceAdded,_victim,_customMessage] remoteExecCall ["A3A_fnc_punishment",2,false];
"PROSECUTED";


