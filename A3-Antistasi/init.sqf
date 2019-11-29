diag_log format ["%1: [Antistasi] | INFO | Init Started.",servertime];
//Arma 3 - Antistasi - Warlords of the Pacific by Barbolani & The Official AntiStasi Community
//Do whatever you want with this code, but credit me for the thousand hours spent making this.
private _fileName = "init.sqf";
scriptName "init.sqf";
if (isNil "logLevel") then {logLevel = 2};
[2,"Init SQF started",_fileName] call A3A_fnc_log;
enableSaving [false,false];
mapX setObjectTexture [0,"pic.jpg"];
     
if (!isMultiPlayer) then {
     //Init server parameters
     gameMode = 1;
     autoSave = false;
     membershipEnabled = false;
     memberOnlyMagLimit = 0;
     switchCom = false;
     tkPunish = false;
     skillMult = 2;
     minWeaps = 25;
     civTraffic = 1;
     limitedFT = false;
     call compile preprocessFileLineNumbers "initVar.sqf";
     [2,format ["SP version: %1 loaded",localize "STR_antistasi_credits_generic_version_text"],_fileName] call A3A_fnc_log;
     initVar = true;
     respawnOccupants setMarkerAlpha 0;
     "respawn_east" setMarkerAlpha 0;
     [] execVM "briefing.sqf";
     [] execVM "musica.sqf";
     {if (/*(side _x == teamPlayer) and */(_x != commanderX) and (_x != Petros)) then {_grupete = group _x; deleteVehicle _x; deleteGroup _grupete}} forEach allUnits;
     _serverHasID = profileNameSpace getVariable ["ss_ServerID",nil];
     if(isNil "_serverHasID") then {
          _serverID = str(round((random(100000)) + random 10000));
          profileNameSpace setVariable ["SS_ServerID",_serverID];
     };
     serverID = profileNameSpace getVariable "ss_ServerID";
     publicVariable "serverID";
     
     //Load Campaign ID
     campaignID = profileNameSpace getVariable ["ss_CampaignID",nil];
     if(isNil "campaignID") then {
               campaignID = str(round((random(100000)) + random 10000));
               profileNameSpace setVariable ["ss_CampaignID", campaignID];
     };
     publicVariable "campaignID";
     
     
     call compile preprocessFileLineNumbers "initFuncs.sqf";
     //diag_log "Antistasi SP. Funcs init finished";
     call compile preprocessFileLineNumbers "initZones.sqf";//this is the file where you can transport Antistasi to another island
     //diag_log "Antistasi SP. Zones init finished";
     [] spawn A3A_fnc_initPetros;
     
     hcArray = [];
     serverInitDone = true;
     [] spawn A3A_fnc_modBlacklist;
     
     distanceMission = if (hasIFA) then {2000} else {4000};
     
     {
          _x call A3A_fnc_unlockEquipment;
     } foreach initialRebelEquipment;
     [2,"Arsenal Loaded",_fileName] call A3A_fnc_log;
     
     waitUntil {sleep 1;!(isNil "placementDone")};
     distanceXs = [] spawn A3A_fnc_distance;
     [] spawn A3A_fnc_resourcecheck;
     [] execVM "Scripts\fn_advancedTowingInit.sqf";
     addMissionEventHandler ["BuildingChanged", {
          params ["_oldBuilding", "_newBuilding", "_isRuin"];

          if (_isRuin) then {
               _oldBuilding setVariable ["ruins", _newBuilding];
               _newBuilding setVariable ["building", _oldBuilding];

               destroyedBuildings pushBack (getPosATL _oldBuilding);
          };
     }];
     deleteMarker "respawn_east";
     if (teamPlayer == independent) then {deleteMarker "respawn_west"} else {deleteMarker "respawn_guerrila"};
};
[2,"Init finished",_fileName] call A3A_fnc_log;