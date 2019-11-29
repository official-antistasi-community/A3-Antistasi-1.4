if (!isMultiplayer) exitWith {};
if (!(isNil "serverInitDone")) exitWith {};
private _fileName = "initServer.sqf";
scriptName "initServer.sqf";
//Define logLevel first thing, so we can start logging appropriately.
logLevel = "LogLevel" call BIS_fnc_getParamValue; publicVariable "logLevel"; //Sets a log level for feedback, 1=Errors, 2=Information, 3=DEBUG
[2,"Dedicated server detected",_fileName] call A3A_fnc_log;
[2,"Server init started",_fileName] call A3A_fnc_log;
boxX allowDamage false;
flagX allowDamage false;
vehicleBox allowDamage false;
fireX allowDamage false;
mapX allowDamage false;

//Load server id
serverID = profileNameSpace getVariable ["ss_ServerID",nil];
if(isNil "serverID") then {
	serverID = str(round((random(100000)) + random 10000));
	profileNameSpace setVariable ["ss_ServerID",serverID];
};
publicVariable "serverID";
waitUntil {!isNil "serverID"};

//Load server parameters
loadLastSave = if ("loadSave" call BIS_fnc_getParamValue == 1) then {true} else {false};
gameMode = "gameMode" call BIS_fnc_getParamValue; publicVariable "gameMode";
autoSave = if ("autoSave" call BIS_fnc_getParamValue == 1) then {true} else {false};
membershipEnabled = if ("membership" call BIS_fnc_getParamValue == 1) then {true} else {false};
switchCom = if ("switchComm" call BIS_fnc_getParamValue == 1) then {true} else {false};
tkPunish = if ("tkPunish" call BIS_fnc_getParamValue == 1) then {true} else {false};
distanceMission = "mRadius" call BIS_fnc_getParamValue; publicVariable "distanceMission";
pvpEnabled = if ("allowPvP" call BIS_fnc_getParamValue == 1) then {true} else {false}; publicVariable "pvpEnabled";
skillMult = "AISkill" call BIS_fnc_getParamValue; publicVariable "skillMult";
minWeaps = "unlockItem" call BIS_fnc_getParamValue; publicVariable "minWeaps";
memberOnlyMagLimit = "MemberOnlyMagLimit" call BIS_fnc_getParamValue; publicVariable "memberOnlyMagLimit";
allowMembersFactionGarageAccess = "allowMembersFactionGarageAccess" call BIS_fnc_getParamValue == 1; publicVariable "allowMembersFactionGarageAccess";
civTraffic = "civTraffic" call BIS_fnc_getParamValue; publicVariable "civTraffic";
memberDistance = "memberDistance" call BIS_fnc_getParamValue; publicVariable "memberDistance";
limitedFT = if ("allowFT" call BIS_fnc_getParamValue == 1) then {true} else {false}; publicVariable "limitedFT";
napalmEnabled = if ("napalmEnabled" call BIS_fnc_getParamValue == 1) then {true} else {false}; publicVariable "napalmEnabled";
teamSwitchDelay = "teamSwitchDelay" call BIS_fnc_getParamValue;
playerMarkersEnabled = ("pMarkers" call BIS_fnc_getParamValue == 1); publicVariable "playerMarkersEnabled";
minPlayersRequiredforPVP = "minPlayersRequiredforPVP" call BIS_fnc_getParamValue; publicVariable "minPlayersRequiredforPVP";

[] call A3A_fnc_crateLootParams;

//Load Campaign ID if resuming game
if(loadLastSave) then {
	campaignID = profileNameSpace getVariable ["ss_CampaignID",""];
}
else {
	campaignID = str(round((random(100000)) + random 10000));
	profileNameSpace setVariable ["ss_CampaignID", campaignID];
};
publicVariable "campaignID";

_nul = call compile preprocessFileLineNumbers "initVar.sqf";
initVar = true; publicVariable "initVar";
savingServer = true;
[2,format ["MP server version: %1",localize "STR_antistasi_credits_generic_version_text"],_fileName] call A3A_fnc_log;
bookedSlots = floor ((("memberSlots" call BIS_fnc_getParamValue)/100) * (playableSlotsNumber teamPlayer)); publicVariable "bookedSlots";
_nul = call compile preprocessFileLineNumbers "initFuncs.sqf";
_nul = call compile preprocessFileLineNumbers "initZones.sqf";
if (gameMode != 1) then {
	Occupants setFriend [Invaders,1];
	Invaders setFriend [Occupants,1];
	if (gameMode == 3) then {"CSAT_carrier" setMarkerAlpha 0};
	if (gameMode == 4) then {"NATO_carrier" setMarkerAlpha 0};
};
[] spawn A3A_fnc_initPetros;
["Initialize"] call BIS_fnc_dynamicGroups;//Exec on Server
hcArray = [];
waitUntil {(count playableUnits) > 0};
waitUntil {({(isPlayer _x) and (!isNull _x) and (_x == _x)} count allUnits) == (count playableUnits)};//ya estamos todos
[] spawn A3A_fnc_modBlacklist;

if (loadLastSave) then {
	[2,"Loading saved data",_fileName] call A3A_fnc_log;
	["membersX"] call fn_LoadStat;
	if (isNil "membersX") then {
		loadLastSave = false;
		[2,"No member data found, skipping load",_fileName] call A3A_fnc_log;
	};
};
publicVariable "loadLastSave";

call A3A_fnc_initGarrisons;

if (loadLastSave) then {
	[] spawn A3A_fnc_loadServer;
	waitUntil {!isNil"statsLoaded"};
	if (!isNil "as_fnc_getExternalMemberListUIDs") then {
		membersX = [];
		{membersX pushBackUnique _x} forEach (call as_fnc_getExternalMemberListUIDs);
		publicVariable "membersX";
	};
	if (membershipEnabled and (membersX isEqualTo [])) then {
		[petros,"hint","Membership is enabled but members list is empty. Current players will be added to the member list"] remoteExec ["A3A_fnc_commsMP"];
		[2,"Previous data loaded",_fileName] call A3A_fnc_log;
		[2,"Membership enabled, adding current players to list",_fileName] call A3A_fnc_log;
		membersX = [];
		{
			membersX pushBack (getPlayerUID _x);
		} forEach playableUnits;
		publicVariable "membersX";
	};
	theBoss = objNull;
	{
		if (([_x] call A3A_fnc_isMember) and (side _x == teamPlayer)) exitWith {
			theBoss = _x;
			//_x setRank "CORPORAL";
			//[_x,"CORPORAL"] remoteExec ["A3A_fnc_ranksMP"];
			//_x setVariable ["score", 25,true];
		};
	} forEach playableUnits;
	publicVariable "theBoss";
}
else {
	theBoss = objNull;
	membersX = [];
	if (!isNil "as_fnc_getExternalMemberListUIDs") then {
		{membersX pushBackUnique _x} forEach (call as_fnc_getExternalMemberListUIDs);
			{
				if (([_x] call A3A_fnc_isMember) and (side _x == teamPlayer)) exitWith {theBoss = _x};
			} forEach playableUnits;
	}
	else {
		[2,"New session selected",_fileName] call A3A_fnc_log;
		if (isNil "commanderX") then {commanderX = (playableUnits select 0)};
		if (isNull commanderX) then {commanderX = (playableUnits select 0)};
		theBoss = commanderX;
		theBoss setRank "CORPORAL";
		[theBoss,"CORPORAL"] remoteExec ["A3A_fnc_ranksMP"];
		waitUntil {(getPlayerUID theBoss) != ""};
		if (membershipEnabled) then {membersX pushBackUnique (getPlayerUID theBoss)};
	};
	publicVariable "theBoss";
	publicVariable "membersX";
};

[2,"Accepting players",_fileName] call A3A_fnc_log;
if !(loadLastSave) then {
	{
		_x call A3A_fnc_unlockEquipment;
	} foreach initialRebelEquipment;
	[2,"Initial arsenal unlocks completed",_fileName] call A3A_fnc_log;
};

[[petros,"hint","Server load finished"],"A3A_fnc_commsMP"] call BIS_fnc_MP;

//HandleDisconnect doesn't get 'owner' param, so we can't use it to handle headless client disconnects.
addMissionEventHandler ["HandleDisconnect",{_this call A3A_fnc_onPlayerDisconnect;false}];
//PlayerDisconnected doesn't get access to the unit, so we shouldn't use it to handle saving.
addMissionEventHandler ["PlayerDisconnected",{_this call A3A_fnc_onHeadlessClientDisconnect;false}];

addMissionEventHandler ["BuildingChanged", {
	params ["_oldBuilding", "_newBuilding", "_isRuin"];

	if (_isRuin) then {
		_oldBuilding setVariable ["ruins", _newBuilding];
		_newBuilding setVariable ["building", _oldBuilding];

		destroyedBuildings pushBack (getPosATL _oldBuilding);
	};
}];

serverInitDone = true; publicVariable "serverInitDone";
[2,"Setting serverInitDone as true",_fileName] call A3A_fnc_log;

waitUntil {sleep 1;!(isNil "placementDone")};
distanceXs = [] spawn A3A_fnc_distance;
[] spawn A3A_fnc_resourcecheck;
[] execVM "Scripts\fn_advancedTowingInit.sqf";
savingServer = false;

[] spawn A3A_fnc_spawnDebuggingLoop;

//Enable performance logging
[] spawn {
	while {true} do {
		[] call A3A_fnc_logPerformance;
		sleep 30;
	};
};
[2,"initServer completed",_fileName] call A3A_fnc_log;
