if (!isMultiplayer) exitWith {};
if (!(isNil "serverInitDone")) exitWith {};
diag_log "Antistasi MP Server init";
boxX allowDamage false;
flagX allowDamage false;
vehicleBox allowDamage false;
fireX allowDamage false;
mapX allowDamage false;

//Load server id
serverID = profileNameSpace getVariable ["ss_ServerID",nil];
if(isNil "serverID") then
	{
	serverID = str(round((random(100000)) + random 10000));
	profileNameSpace setVariable ["ss_ServerID",serverID];
	};
publicVariable "serverID";
waitUntil {!isNil "serverID"};

//Load server config
loadLastSave = if ("loadSave" call BIS_fnc_getParamValue == 1) then {true} else {false};
gameMode = "gameMode" call BIS_fnc_getParamValue; publicVariable "gameMode";
autoSave = if ("autoSave" call BIS_fnc_getParamValue == 1) then {true} else {false};
membershipEnabled = if ("membership" call BIS_fnc_getParamValue == 1) then {true} else {false};
switchCom = if ("switchComm" call BIS_fnc_getParamValue == 1) then {true} else {false};
tkPunish = if ("tkPunish" call BIS_fnc_getParamValue == 1) then {true} else {false};
distanceMission = "mRadius" call BIS_fnc_getParamValue; publicVariable "distanceMission";
pvpEnabled = if ("allowPvP" call BIS_fnc_getParamValue == 1) then {true} else {false};
skillMult = "AISkill" call BIS_fnc_getParamValue; publicVariable "skillMult";
minWeaps = "unlockItem" call BIS_fnc_getParamValue; publicVariable "minWeaps";
memberOnlyMagLimit = "MemberOnlyMagLimit" call BIS_fnc_getParamValue; publicVariable "memberOnlyMagLimit";
civTraffic = "civTraffic" call BIS_fnc_getParamValue; publicVariable "civTraffic";
memberDistance = "memberDistance" call BIS_fnc_getParamValue; publicVariable "memberDistance";
limitedFT = if ("allowFT" call BIS_fnc_getParamValue == 1) then {true} else {false}; publicVariable "limitedFT";
napalmEnabled = if ("napalmEnabled" call BIS_fnc_getParamValue == 1) then {true} else {false}; publicVariable "napalmEnabled";

//Load Campaign ID if resuming game
if(loadLastSave) then {
	campaignID = profileNameSpace getVariable ["ss_CampaignID",""];
} else {
	campaignID = str(round((random(100000)) + random 10000));
	profileNameSpace setVariable ["ss_CampaignID", campaignID];
};
	
publicVariable "campaignID";

_nul = call compile preprocessFileLineNumbers "initVar.sqf";
initVar = true; publicVariable "initVar";
savingServer = true;
diag_log format ["Antistasi MP. InitVar done. Version: %1",antistasiVersion];
bookedSlots = floor ((("memberSlots" call BIS_fnc_getParamValue)/100) * (playableSlotsNumber teamPlayer)); publicVariable "bookedSlots";
_nul = call compile preprocessFileLineNumbers "initFuncs.sqf";
diag_log "Antistasi MP Server. Funcs init finished";
_nul = call compile preprocessFileLineNumbers "initZones.sqf";
diag_log "Antistasi MP Server. Zones init finished";
if (gameMode != 1) then
    {
    Occupants setFriend [Invaders,1];
    Invaders setFriend [Occupants,1];
    if (gameMode == 3) then {"CSAT_carrier" setMarkerAlpha 0};
    if (gameMode == 4) then {"NATO_carrier" setMarkerAlpha 0};
    };
[] execVM "initPetros.sqf";
["Initialize"] call BIS_fnc_dynamicGroups;//Exec on Server
hcArray = [];
waitUntil {(count playableUnits) > 0};
waitUntil {({(isPlayer _x) and (!isNull _x) and (_x == _x)} count allUnits) == (count playableUnits)};//ya estamos todos
_nul = [] execVM "modBlacklist.sqf";

{
private _index = _x call jn_fnc_arsenal_itemType;
[_index,_x,-1] call jn_fnc_arsenal_addItem;
}foreach (unlockeditems + unlockedweapons + unlockedMagazines + unlockedBackpacks);
//["buttonInvToJNA"] call jn_fnc_arsenal;
//waitUntil {!isNil "bis_fnc_preload_init"};
//waitUntil {!isNil "BIS_fnc_preload_server"};
_nul = call compile preprocessFileLineNumbers "initGarrisons.sqf";
diag_log "Antistasi MP Server. Garrisons init finished";
if (loadLastSave) then
    {

    diag_log "Antistasi: Persitent Load selected";
    ["membersX"] call fn_LoadStat;
    if (isNil "membersX") then
        {
        loadLastSave = false;
        diag_log "Antistasi: Persitent Load selected but there is no older session";
        };
    };
publicVariable "loadLastSave";
if (loadLastSave) then
    {
    _nul = [] execVM "statSave\loadServer.sqf";
    waitUntil {!isNil"statsLoaded"};
    if (!isNil "as_fnc_getExternalMemberListUIDs") then
        {
        membersX = [];
        {membersX pushBackUnique _x} forEach (call as_fnc_getExternalMemberListUIDs);
        publicVariable "membersX";
        };
    if (membershipEnabled and (membersX isEqualTo [])) then
        {
        [petros,"hint","Membership is enabled but members list is empty. Current players will be added to the member list"] remoteExec ["A3A_fnc_commsMP"];
        diag_log "Antistasi: Persitent Load done but membership enabled with members array empty";
        membersX = [];
        {
        membersX pushBack (getPlayerUID _x);
        } forEach playableUnits;
        publicVariable "membersX";
        };
    theBoss = objNull;
    {
    if (([_x] call A3A_fnc_isMember) and (side _x == teamPlayer)) exitWith
        {
        theBoss = _x;
        //_x setRank "CORPORAL";
        //[_x,"CORPORAL"] remoteExec ["A3A_fnc_ranksMP"];
        //_x setVariable ["score", 25,true];
        };
    } forEach playableUnits;
    publicVariable "theBoss";
    }
else
    {
    theBoss = objNull;
    membersX = [];
    if (!isNil "as_fnc_getExternalMemberListUIDs") then
        {
        {membersX pushBackUnique _x} forEach (call as_fnc_getExternalMemberListUIDs);
        {
        if (([_x] call A3A_fnc_isMember) and (side _x == teamPlayer)) exitWith {theBoss = _x};
        } forEach playableUnits;
       }
    else
        {
        diag_log "Antistasi: New Game selected";
        if (isNil "commanderX") then {commanderX = (playableUnits select 0)};
        if (isNull commanderX) then {commanderX = (playableUnits select 0)};
        theBoss = commanderX;
        theBoss setRank "CORPORAL";
        [theBoss,"CORPORAL"] remoteExec ["A3A_fnc_ranksMP"];
        if (membershipEnabled) then {membersX = [getPlayerUID theBoss]} else {membersX = []};
        };
    publicVariable "theBoss";
    publicVariable "membersX";
    [] execVM "Ammunition\boxAAF.sqf";
    };
diag_log "Antistasi MP Server. Players are in";

{
private _index = _x call jn_fnc_arsenal_itemType;
[_index,_x,-1] call jn_fnc_arsenal_addItem;
}foreach (unlockeditems + unlockedweapons + unlockedMagazines + unlockedBackpacks);


diag_log "Antistasi MP Server. Arsenal config finished";
[[petros,"hint","Server Init Completed"],"A3A_fnc_commsMP"] call BIS_fnc_MP;

addMissionEventHandler ["HandleDisconnect",{_this call A3A_fnc_onPlayerDisconnect;false}];
addMissionEventHandler ["BuildingChanged",
        {
        _building = _this select 0;
        if !(_building in antennas) then
            {
            if (_this select 2) then
                {
                destroyedBuildings pushBack (getPosATL _building);
                };
            };
        }];

serverInitDone = true; publicVariable "serverInitDone";
diag_log "Antistasi MP Server. serverInitDone set to true.";

waitUntil {sleep 1;!(isNil "placementDone")};
distanceXs = [] spawn A3A_fnc_distances4;
resourcecheck = [] execVM "resourcecheck.sqf";
[] execVM "Scripts\fn_advancedTowingInit.sqf";
savingServer = false;

[] spawn A3A_fnc_spawnDebuggingLoop;

//Enable performance logging
[] spawn {
	while {true} do
		{
			[] call A3A_fnc_logPerformance;
			sleep 30;
		};
};
