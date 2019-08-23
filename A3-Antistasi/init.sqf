diag_log format ["%1: [Antistasi] | INFO | Init Started.",servertime];
//Arma 3 - Antistasi - Warlords of the Pacific by Barbolani & The Official AntiStasi Community
//Do whatever you want with this code, but credit me for the thousand hours spent making this.
enableSaving [false,false];
mapX setObjectTexture [0,"pic.jpg"];
if (isServer and (isNil "serverInitDone")) then {skipTime random 24};

if (!isMultiPlayer) then
    {
    //Init server parameters
    gameMode = 1;
    autoSave = false;
    membershipEnabled = false;
    memberOnlyMagLimit = 0;
    switchCom = false;
    tkPunish = false;
    skillMult = 1;
    minWeaps = 24;
    civTraffic = 1;
    limitedFT = false;
    diag_log format ["%1: [Antistasi] | INFO | Singleplayer Starting.",servertime];
    call compile preprocessFileLineNumbers "initVar.sqf";
    diag_log format ["%1: [Antistasi] | INFO | SP Version: %2 loaded.",servertime,antistasiVersion];
    initVar = true;
    respawnOccupants setMarkerAlpha 0;
    "respawn_east" setMarkerAlpha 0;
    [] execVM "briefing.sqf";
    _nul = [] execVM "musica.sqf";
    {if (/*(side _x == teamPlayer) and */(_x != commanderX) and (_x != Petros)) then {_grupete = group _x; deleteVehicle _x; deleteGroup _grupete}} forEach allUnits;          //what the fuck is this?
    _serverHasID = profileNameSpace getVariable ["ss_ServerID",nil];
    if(isNil "_serverHasID") then
        {
        _serverID = str(round((random(100000)) + random 10000));
        profileNameSpace setVariable ["SS_ServerID",_serverID];
        };
    serverID = profileNameSpace getVariable "ss_ServerID";
		publicVariable "serverID";

		//Load Campaign ID
		campaignID = profileNameSpace getVariable ["ss_CampaignID",nil];
		if(isNil "campaignID") then
			{
			campaignID = str(round((random(100000)) + random 10000));
			profileNameSpace setVariable ["ss_CampaignID", campaignID];
			};
		publicVariable "campaignID";


    call compile preprocessFileLineNumbers "initFuncs.sqf";
    //diag_log "Antistasi SP. Funcs init finished";
    call compile preprocessFileLineNumbers "initZones.sqf";//this is the file where you can transport Antistasi to another island
    //diag_log "Antistasi SP. Zones init finished";
    [] execVM "initPetros.sqf";

    hcArray = [];
    serverInitDone = true;
    diag_log format ["%1: [Antistasi] | INFO | Arsenal Loaded.",servertime];
    _nul = [] execVM "modBlacklist.sqf";

    distanceMission = if (hasIFA) then {2000} else {4000};

    {
    private _index = _x call jn_fnc_arsenal_itemType;
    [_index,_x,-1] call jn_fnc_arsenal_addItem;
    }foreach (unlockeditems + unlockedweapons + unlockedMagazines + unlockedBackpacks);
    [] call A3A_fnc_arsenalManage; //By PBP - to ensure case issues are resolved on mission start
    [] execVM "Ammunition\boxAAF.sqf";
    waitUntil {sleep 1;!(isNil "placementDone")};
    distanceXs = [] spawn A3A_fnc_distances4;
    resourcecheck = [] execVM "resourcecheck.sqf";
    [] execVM "Scripts\fn_advancedTowingInit.sqf";
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
    deleteMarker "respawn_east";
    if (teamPlayer == independent) then {deleteMarker "respawn_west"} else {deleteMarker "respawn_guerrila"};
    };
    diag_log format ["%1: [Antistasi] | INFO | Init finished.",servertime];
