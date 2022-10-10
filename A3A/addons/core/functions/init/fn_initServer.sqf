#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Define and publish logLevel first thing, so we can start logging appropriately.
logLevel = "LogLevel" call BIS_fnc_getParamValue; publicVariable "logLevel"; //Sets a log level for feedback, 1=Errors, 2=Information, 3=DEBUG
A3A_logDebugConsole = "A3A_logDebugConsole" call BIS_fnc_getParamValue; publicVariable "A3A_logDebugConsole";


Info("Server init started");
Info_1("Server version: %1", QUOTE(VERSION));

// ********************** Pre-setup init ****************************************************

if (call A3A_fnc_modBlacklist) exitWith {};

// hide all the HQ objects
{
    _x allowDamage false;
    _x hideObjectGlobal true;
} forEach [boxX, flagX, vehicleBox, fireX, mapX, petros];

if !(toLower worldName == "cam_lao_nam") then { mapX setObjectTexture [0,"Pictures\Mission\whiteboard.jpg"] };

enableSaving [false,false];

//Disable VN music
if (isClass (configFile/"CfgVehicles"/"vn_module_dynamicradiomusic_disable")) then {
    A3A_VN_MusicModule = (createGroup sideLogic) createUnit ["vn_module_dynamicradiomusic_disable", [worldSize, worldSize,0], [],0,"NONE"];
};

// Shouldn't be anything with dependencies in here
call A3A_fnc_initVarCommon;
call A3A_fnc_initZones;					// needed here because new-game setup needs to know where the markers are

// Start up the monitor to handle the setup UI 
[] spawn A3A_fnc_setupMonitor;

// ************************ Background init ***********************************************

Info("Background init started");

// U-interface init. May as well do this here, let players set up their groups?
["Initialize"] call BIS_fnc_dynamicGroups;

// No reason not to do this early
[] execVM QPATHTOFOLDER(Scripts\fn_advancedTowingInit.sqf);

// Nav stuff, should have no parameter/save dependence at all
call A3A_fnc_loadNavGrid;
call A3A_fnc_addNodesNearMarkers;		// Needs data from both the above

// JNA preload, does some item type caching, no param dependence
Info("Server JNA preload started");
["Preload"] call jn_fnc_arsenal;

// UPSMON
Info("UPSMON init started");
[] call compile preprocessFileLineNumbers QPATHTOFOLDER(Scripts\Init_UPSMON.sqf);

Info("Background init completed");
A3A_backgroundInitDone = true;


// **************** Starting game, param-dependent init *******************************

// Wait until we have selected/created save data  
waitUntil {sleep 0.1; !isNil "A3A_saveData"};

["Server Information", "Starting game"] remoteExec ["A3A_fnc_customHint", 0];

// Set global vars directly from params. Call should guarantee 1:1 validity
{
    _x params ["_name", "_val"];
    missionNamespace setVariable [_name, _val, true];           // just publish them all, doesn't really hurt
} forEach (A3A_saveData get "params");

// Might have params dependency at some point
if (A3A_hasACEMedical) then { call A3A_fnc_initACEUnconsciousHandler };

// Need to run this before game load or initial unlocks. Params dependency.
boxX call jn_fnc_arsenal_init;

// This does the actual template loading in the middle somewhere
[A3A_saveData] call A3A_fnc_initVarServer;

// Init that needs factions loaded
call A3A_fnc_logistics_initNodes;

// Parameter-dependent vars. Could be moved to initVarServer...
if (gameMode != 1) then {
    Occupants setFriend [Invaders,1];
    Invaders setFriend [Occupants,1];
    if (gameMode == 3) then {"CSAT_carrier" setMarkerAlpha 0};
    if (gameMode == 4) then {"NATO_carrier" setMarkerAlpha 0};
};
bookedSlots = floor ((memberSlots/100) * (playableSlotsNumber teamPlayer)); publicVariable "bookedSlots";


// ****************** Load save data or create new *********************************

private _startType = A3A_saveData get "startType";
if (_startType != "new") then
{
    // Setup save info
    A3A_saveTarget = [A3A_saveData get "serverID", A3A_saveData get "gameID", worldName];
    // Sanity checks? hmm

    // Do the actual game loading
    call A3A_fnc_loadServer;
}
else
{
    // Fill out garrisons, set sides/names as appropriate
    call A3A_fnc_initGarrisons;

    {
        _x call A3A_fnc_unlockEquipment;
    } foreach FactionGet(reb,"initialRebelEquipment");
    Info("Initial arsenal unlocks completed");
    call A3A_fnc_checkRadiosUnlocked;

    // HQ placement setup
    _posHQ = A3A_saveData get "startPos";
    // Disable all nearby roadblocks/specops
    {
        if (markerPos _x distance _posHQ < distanceSPWN) then {
            sidesX setVariable [_x, teamPlayer, true];
        };
    } forEach controlsX;
    petros setPos _posHQ;
    [_posHQ, true] call A3A_fnc_relocateHQObjects;         // sets all the other vars
    placementDone = true; publicVariable "placementDone";           // do we need this now?
};

if (_startType != "load") then {
    // Set blank server ID if we don't have one already. They're pretty pointless
    private _serverID = profileNamespace getVariable ["ss_serverID", ""];
    _serverID = [_serverID, false] select (A3A_saveData get "useNewNamespace");

    // TODO: check collisions or build into UI
    private _newID = str(floor(random(90000) + 10000));

    A3A_saveTarget = [_serverID, _newID, worldName];
};

// ********************** Post-load init ****************************************************

if (isClass (configFile >> "AntistasiServerMembers")) then
{
    Info("Loading external member list");
    membersX = [];                              // don't use saved (temp) members

    // Load data from the array
    private _memberUIDsFromConfig = getArray (configFile >> "AntistasiServerMembers" >> "MembersArray" >> "uidArray");
    {membersX pushBackUnique _x} forEach _memberUIDsFromConfig; 

    // Load data from the classes
    private _memberClasses = "true" configClasses (configFile >> "AntistasiServerMembers" >> "MembersClasses");
    {membersX pushBackUnique (getText (_x >> "uid"))} forEach _memberClasses; 
};

// TODO: Do we need this? maybe...
if (isPlayer A3A_setupPlayer) then {
    // Add current admin (setupPlayer) to members list and make them commander
    membersX pushBackUnique getPlayerUID A3A_setupPlayer;
    theBoss = A3A_setupPlayer; publicVariable "theBoss";
};
publicVariable "membersX";


// Needs params + factions. Might depend on saved data in the future
call A3A_fnc_initSupports;

// Needs saved arsenal data
call A3A_fnc_generateRebelGear;

// Needs A3A_rebelGear for equipping
call A3A_fnc_initPetros;

// Some of these may already be unhidden but we make sure
{ _x hideObjectGlobal false } forEach [boxX, flagX, vehicleBox, fireX, mapX, petros];


//HandleDisconnect doesn't get 'owner' param, so we can't use it to handle headless client disconnects.
addMissionEventHandler ["HandleDisconnect",{_this call A3A_fnc_onPlayerDisconnect;false}];
//PlayerDisconnected doesn't get access to the unit, so we shouldn't use it to handle saving.
addMissionEventHandler ["PlayerDisconnected",{_this call A3A_fnc_onHeadlessClientDisconnect;false}];

addMissionEventHandler ["BuildingChanged", {
    params ["_oldBuilding", "_newBuilding", "_isRuin"];

    if (_isRuin) then {
        _oldBuilding setVariable ["ruins", _newBuilding];
        _newBuilding setVariable ["building", _oldBuilding];

        // Antenna dead/alive status is handled separately
        if !(_oldBuilding in antennas || _oldBuilding in antennasDead) then {
            destroyedBuildings pushBack _oldBuilding;
        };
    };
}];

addMissionEventHandler ["EntityKilled", {
    params ["_victim", "_killer", "_instigator"];
    private _killerSide = side group (if (isNull _instigator) then {_killer} else {_instigator});
    Debug_2("%1 killed by %2", typeof _victim, _killerSide);

    if !(isNil {_victim getVariable "ownerSide"}) then {
        // Antistasi-created vehicle
        [_victim, _killerSide, false] call A3A_fnc_vehKilledOrCaptured;
        [_victim] spawn A3A_fnc_postmortem;
    };
}];


["Server Information", "Server load completed"] remoteExec ["A3A_fnc_customHint", 0];
serverInitDone = true; publicVariable "serverInitDone";
Info("Setting serverInitDone as true");


// ********************* Initialize loops *******************************************

[] spawn A3A_fnc_distance;                          // Marker spawn loop
[] spawn A3A_fnc_resourcecheck;                     // 10-minute loop
[] spawn A3A_fnc_aggressionUpdateLoop;              // 1-minute loop

savingServer = false;           // enable saving

// Autosave loop. Save if there were any players on the server since the last save.
[] spawn {
    private _lastPlayerCount = count (call A3A_fnc_playableUnits);
    while {true} do
    {
        autoSaveTime = time + autoSaveInterval;
        waitUntil { sleep 60; time > autoSaveTime; };
        private _playerCount = count (call A3A_fnc_playableUnits);
        if (autoSave && (_playerCount > 0 || _lastPlayerCount > 0)) then {
            [] remoteExecCall ["A3A_fnc_saveLoop", 2];
        };
        _lastPlayerCount = _playerCount;
    };
};

[] spawn A3A_fnc_spawnDebuggingLoop;

//Enable performance logging
[] spawn {
    private _logPeriod = [30, 10] select (logLevel == 3);
    while {true} do
    {
        //Sleep if no player is online
        if (isMultiplayer && (count (allPlayers - (entities "HeadlessClient_F")) == 0)) then
        {
            waitUntil {sleep 10; (count (allPlayers - (entities "HeadlessClient_F")) > 0)};
        };

        [] call A3A_fnc_logPerformance;
        sleep _logPeriod;
    };
};

Info("initServer completed");
