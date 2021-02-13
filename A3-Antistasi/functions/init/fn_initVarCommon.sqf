/*
 * This is the first initVar that gets called, and it gets called on both the client and the server.
 * Generally, this should only be constants.
 */

scriptName "initVarCommon.sqf";
private _fileName = "initVarCommon.sqf";
[2,"initVarCommon started",_fileName] call A3A_fnc_log;

antistasiVersion = localize "STR_antistasi_credits_generic_version_text";

////////////////////////////////////
// INITIAL SETTING AND VARIABLES ///
////////////////////////////////////
[2,"Setting initial variables",_fileName] call A3A_fnc_log;													//Sets a log level for feedback, 1=Errors, 2=Information, 3=DEBUG
debug = false;
A3A_customHintEnable = false; // Disables custom hints for boot duration. Is set to true in initClient.

////////////////////////////////////
//     BEGIN SIDES AND COLORS    ///
////////////////////////////////////
[2,"Generating sides",_fileName] call A3A_fnc_log;
if (isNil "teamPlayer") then { teamPlayer = side group petros };
if (teamPlayer == independent) then
	{
	Occupants = west;
	colorTeamPlayer = "colorGUER";
	colorOccupants = "colorBLUFOR";
	respawnTeamPlayer = "respawn_guerrila";
	respawnOccupants = "respawn_west"
	}
else
	{
	Occupants = independent;
	colorTeamPlayer = "colorBLUFOR";
	colorOccupants = "colorGUER";
	respawnTeamPlayer = "respawn_west";
	respawnOccupants = "respawn_guerrila";
	};
posHQ = getMarkerPos respawnTeamPlayer;
Invaders = east;
colorInvaders = "colorOPFOR";

////////////////////////////////////////
//     DECLARING ITEM CATEGORIES     ///
////////////////////////////////////////
[2,"Declaring item categories",_fileName] call A3A_fnc_log;

weaponCategories = ["Rifles", "Handguns", "MachineGuns", "MissileLaunchers", "Mortars", "RocketLaunchers", "Shotguns", "SMGs", "SniperRifles"];
itemCategories = ["Gadgets", "Bipods", "MuzzleAttachments", "PointerAttachments", "Optics", "Binoculars", "Compasses", "FirstAidKits", "GPS", "LaserDesignators",
	"Maps", "Medikits", "MineDetectors", "NVGs", "Radios", "Toolkits", "UAVTerminals", "Watches", "Glasses", "Headgear", "Vests", "Uniforms", "Backpacks"];

magazineCategories = ["MagArtillery", "MagBullet", "MagFlare", "Grenades", "MagLaser", "MagMissile", "MagRocket", "MagShell", "MagShotgun", "MagSmokeShell"];
explosiveCategories = ["Mine", "MineBounding", "MineDirectional"];
otherCategories = ["Unknown"];

//************************************************************************************************************
//ALL ITEMS THAT ARE MEMBERS OF CATEGORIES BELOW THIS LINE **MUST** BE A MEMBER OF ONE OF THE ABOVE CATEGORIES.
//************************************************************************************************************

//Categories that consist only of members of other categories, e.g, 'Weapons' contains items of every category from in weaponCategories;
aggregateCategories = ["Weapons", "Items", "Magazines", "Explosives"];

//All items in here *must* also be a member of one of the above categories.
//These are here because it's non-trivial to identify items in them. They might be a very specific subset of items, or the logic that identifies them might not be perfect.
//It's recommended that these categories be used with caution.
specialCategories = ["AA", "AT", "GrenadeLaunchers", "LightAttachments", "LaserAttachments", "Chemlights", "SmokeGrenades", "LaunchedSmokeGrenades", "LaunchedFlares", "HandFlares", "IRGrenades","LaserBatteries",
	"RebelUniforms", "CivilianUniforms", "BackpacksEmpty", "BackpacksTool", "BackpacksStatic", "BackpacksDevice", "BackpacksRadio", "CivilianVests", "ArmoredVests", "ArmoredHeadgear", "CivilianHeadgear",
	"CivilianGlasses"];


allCategoriesExceptSpecial = weaponCategories + itemCategories + magazineCategories + explosiveCategories + otherCategories + aggregateCategories;
allCategories = allCategoriesExceptSpecial + specialCategories;

////////////////////////////////////
//     BEGIN MOD DETECTION       ///
////////////////////////////////////
[2,"Starting mod detection",_fileName] call A3A_fnc_log;
allDLCMods = ["kart", "mark", "heli", "expansion", "jets", "orange", "tank", "globmob", "enoch", "officialmod", "tacops", "argo", "warlords"];

// Short Info of loaded mods needs to be added to this array. eg: `A3A_loadedTemplateInfoXML pushBack ["RHS","All factions will be replaced by RHS (AFRF &amp; USAF &amp; GREF)."];`
A3A_loadedTemplateInfoXML = [];

//Mod detection is done locally to each client, in case some clients have different modsets for some reason.
//Systems Mods
hasACE = false;
hasACEHearing = false;
hasACEMedical = false;
//Radio Mods
hasACRE = false;
hasTFAR = false;

//Radio Detection
hasTFAR = isClass (configFile >> "CfgPatches" >> "task_force_radio");
hasACRE = isClass (configFile >> "cfgPatches" >> "acre_main");
//ACE Detection
hasACE = (!isNil "ace_common_fnc_isModLoaded");
hasACEHearing = isClass (configFile >> "CfgSounds" >> "ACE_EarRinging_Weak");
hasACEMedical = isClass (configFile >> "CfgSounds" >> "ACE_heartbeat_fast_3");
//Content Mods (Units, Vehicles, Weapons, Clothes etc.)
//These are handled by a script in the Templates folder to keep integrators away from critical code.
call compile preProcessFileLineNumbers "Templates\detector.sqf";

////////////////////////////////////
//        BUILDINGS LISTS        ///
////////////////////////////////////
[2,"Creating building arrays",_fileName] call A3A_fnc_log;

listbld = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F", "Land_Cargo_Tower_V4_F"];
listMilBld = listbld + ["Land_Radar_01_HQ_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_HQ_V4_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F", "Land_Cargo_Patrol_V4_F","Land_HelipadSquare_F","Land_Posed","Land_Hlaska","Land_fortified_nest_small_EP1","Land_fortified_nest_small","Fort_Nest","Fortress1","Land_GuardShed","Land_BagBunker_Small_F","Land_BagBunker_01_small_green_F"];
UPSMON_Bld_remove = ["Bridge_PathLod_base_F","Land_Slum_House03_F","Land_Bridge_01_PathLod_F","Land_Bridge_Asphalt_PathLod_F","Land_Bridge_Concrete_PathLod_F","Land_Bridge_HighWay_PathLod_F","Land_Bridge_01_F","Land_Bridge_Asphalt_F","Land_Bridge_Concrete_F","Land_Bridge_HighWay_F","Land_Canal_Wall_Stairs_F","warehouse_02_f","cliff_wall_tall_f","cliff_wall_round_f","containerline_02_f","containerline_01_f","warehouse_01_f","quayconcrete_01_20m_f","airstripplatform_01_f","airport_02_terminal_f","cliff_wall_long_f","shop_town_05_f","Land_ContainerLine_01_F","Land_MilOffices_V1_F"];
//Lights and Lamps array used for 'Blackout'
lamptypes = ["Lamps_Base_F", "PowerLines_base_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampHarbour_F","Land_LampShabby_F","Land_NavigLight","Land_runway_edgelight","Land_PowerPoleWooden_L_F"];

////////////////////////////////////
//     SOUNDS AND ANIMATIONS     ///
////////////////////////////////////
[2,"Compiling sounds and animations",_fileName] call A3A_fnc_log;

private _missionRootPathNodes = str missionConfigFile splitString "\";
A3A_missionRootPath = (_missionRootPathNodes select [0,count _missionRootPathNodes -1] joinString "\") + "\";

A3A_sounds_dogBark = ["Music\dog_bark01.wss", "Music\dog_bark02.wss", "Music\dog_bark04.wss", "Music\dog_bark05.wss", "Music\dog_maul01.wss", "Music\dog_yelp02.wss"] apply {A3A_missionRootPath + _x};
injuredSounds =  // Todo: migrate functions to A3A_sounds_callMedic
[
	"a3\sounds_f\characters\human-sfx\Person0\P0_moan_13_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_14_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_15_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_16_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_17_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_18_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_20_words.wss",
	"a3\sounds_f\characters\human-sfx\Person1\P1_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_20_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_21_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_22_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_23_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_24_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_25_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_26_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_27_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_28_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_29_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_30_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_31_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_32_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_33_words.wss",
	"a3\sounds_f\characters\human-sfx\Person2\P2_moan_19_words.wss"
];
A3A_sounds_moan = injuredSounds;

A3A_sounds_soundInjured_low = [];
A3A_sounds_soundInjured_mid = [];
A3A_sounds_soundInjured_max = [];

private _soundPersonParent = "a3\sounds_f\characters\human-sfx\";
for "_person" from 1 to 18 do {
	private _personFolder = str _person;
	if (_person < 10) then { _personFolder = "0" + _personFolder; };
	private _personFolder = "P" + _personFolder + "\";
	{
		private _soundList = missionNamespace getVariable ["A3A_sounds_soundInjured_" + _x, []];
		for "_level" from 1 to 5 do {
			_soundList pushBack (_soundPersonParent + _personFolder + "Soundinjured_"+_x+"_"+str _level+".wss");
		};
	} forEach ["Low","Mid","Max"];

};

medicAnims = ["AinvPknlMstpSnonWnonDnon_medic_1","AinvPknlMstpSnonWnonDnon_medic0","AinvPknlMstpSnonWnonDnon_medic1","AinvPknlMstpSnonWnonDnon_medic2"];

////////////////////////////////////
//     ID LIST FOR UNIT NAMES    ///
////////////////////////////////////
[2,"Creating unit identities",_fileName] call A3A_fnc_log;
if !(A3A_hasIFA) then {
	arrayids = ["Anthis","Costa","Dimitirou","Elias","Gekas","Kouris","Leventis","Markos","Nikas","Nicolo","Panas","Rosi","Samaras","Thanos","Vega"];
	if (isMultiplayer) then {arrayids = arrayids + ["protagonista"]};
};

////////////////////////////////////
//   MAP SETTINGS AND MARKERS    ///
////////////////////////////////////
[2,"Setting map configuration",_fileName] call A3A_fnc_log;
switch (toLower worldName) do {
	case "tanoa":
	{
		roadsCentral = ["road","road_1","road_2","road_3","road_4"];
		roadsCE = ["road_5","road_6"];
		roadsCSE = ["road_7"];
		roadsSE = ["road_8","road_9","road_10","road_11"];
		roadsSW = ["road_12"];
		roadsCW = ["road_13","road_14"];
		roadsNW = ["road_15"];
		roadsNE = ["road_16"];
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBTanoa.sqf";
	};
	case "altis":
	{
		
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBAltis.sqf";
	};
	case "chernarus_summer":
	{

		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBcherna.sqf";
	};
	case "chernarus_winter":
	{
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBcherna.sqf";
	};
	case "malden":
	{
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBmalden.sqf";
	};
	case "enoch":
	{
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBLivonia.sqf";
	};
	case "kunduz":
	{
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBKunduz.sqf";
	};
	case "tembelan":
	{
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBTembelan.sqf";
	};
	case "tem_anizay":
	{
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBanizay.sqf";
	};
	case "tem_kujari":
	{
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBkujari.sqf";
	};
	case "vt7":
	{
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBvirolahti.sqf";
	};
	case "stratis":
	{
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBstratis.sqf";
	};
	case "takistan":
	{
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBtakistan.sqf";
	};
	case "sara":
	{
	//Roads DB
	call compile preprocessFileLineNumbers "Navigation\roadsDBsara.sqf";
	};
};

[2,"initVarCommon completed",_fileName] call A3A_fnc_log;
