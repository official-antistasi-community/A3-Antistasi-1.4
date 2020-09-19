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
	"RebelUniforms", "CivilianUniforms", "BackpacksEmpty", "BackpacksTool", "BackpacksStatic", "BackpacksDevice", "CivilianVests", "ArmoredVests", "ArmoredHeadgear", "CivilianHeadgear",
	"CivilianGlasses"];


allCategoriesExceptSpecial = weaponCategories + itemCategories + magazineCategories + explosiveCategories + otherCategories + aggregateCategories;
allCategories = allCategoriesExceptSpecial + specialCategories;

////////////////////////////////////
//     BEGIN MOD DETECTION       ///
////////////////////////////////////
[2,"Starting mod detection",_fileName] call A3A_fnc_log;
allDLCMods = ["kart", "mark", "heli", "expansion", "jets", "orange", "tank", "globmob", "enoch", "officialmod", "tacops", "argo", "warlords"];

//Mod detection is done locally to each client, in case some clients have different modsets for some reason.
hasRHS = false;
activeAFRF = false;
activeUSAF = false;
activeGREF = false;
hasFFAA = false;
hasIFA = false;
has3CB = false;
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
//IFA Detection
//Deactivated for now, as IFA is having some IP problems (08.05.2020 european format)
if isClass (configFile >> "CfgPatches" >> "LIB_Core") then
{
    //hasIFA = true;
    //[2, "IFA Detected", _fileName] call A3A_fnc_log;
    [1, "IFA detected, but it is no longer supported, please remove this mod", _fileName] call A3A_fnc_log;
    ["modUnautorized",false,1,false,false] call BIS_fnc_endMission;
};
//RHS AFRF Detection
if isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_vdv") then {activeAFRF = true; hasRHS = true; diag_log format ["%1: [Antistasi] | INFO | initVar | RHS AFRF Detected.",servertime];};
if isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_usarmy") then {activeUSAF = true; hasRHS = true; diag_log format ["%1: [Antistasi] | INFO | initVar | RHS USAF Detected.",servertime];};
if (activeAFRF && activeUSAF && isClass (configFile >> "CfgFactionClasses" >> "rhsgref_faction_tla")) then {activeGREF = true; diag_log format ["%1: [Antistasi] | INFO | initVar | RHS GREF Detected.",servertime];};
//3CB Detection
if (activeAFRF && activeUSAF && activeGREF && isClass (configfile >> "CfgPatches" >> "UK3CB_BAF_Weapons")) then {has3CB = true; diag_log format ["%1: [Antistasi] | INFO | initVar | 3CB Detected.",servertime];};
//FFAA Detection
if (isClass (configfile >> "CfgPatches" >> "ffaa_armas")) then {hasFFAA = true; diag_log format ["%1: [Antistasi] | INFO | initVar | FFAA Detected.",servertime];};

////////////////////////////////////
//        BUILDINGS LISTS        ///
////////////////////////////////////
[2,"Creating building arrays",_fileName] call A3A_fnc_log;

listbld = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F", "Land_Cargo_Tower_V4_F"];
listMilBld = listbld + ["Land_Radar_01_HQ_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_HQ_V4_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F", "Land_Cargo_Patrol_V4_F","Land_HelipadSquare_F","Land_Posed","Land_Hlaska","Land_fortified_nest_small_EP1","Land_fortified_nest_small","Fort_Nest","Fortress1","Land_GuardShed","Land_BagBunker_Small_F","Land_BagBunker_01_small_green_F"];
UPSMON_Bld_remove = ["Bridge_PathLod_base_F","Land_Slum_House03_F","Land_Bridge_01_PathLod_F","Land_Bridge_Asphalt_PathLod_F","Land_Bridge_Concrete_PathLod_F","Land_Bridge_HighWay_PathLod_F","Land_Bridge_01_F","Land_Bridge_Asphalt_F","Land_Bridge_Concrete_F","Land_Bridge_HighWay_F","Land_Canal_Wall_Stairs_F","warehouse_02_f","cliff_wall_tall_f","cliff_wall_round_f","containerline_02_f","containerline_01_f","warehouse_01_f","quayconcrete_01_20m_f","airstripplatform_01_f","airport_02_terminal_f","cliff_wall_long_f","shop_town_05_f","Land_ContainerLine_01_F"];
//Lights and Lamps array used for 'Blackout'
lamptypes = ["Lamps_Base_F", "PowerLines_base_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampHarbour_F","Land_LampShabby_F","Land_NavigLight","Land_runway_edgelight","Land_PowerPoleWooden_L_F"];

////////////////////////////////////
//     SOUNDS AND ANIMATIONS     ///
////////////////////////////////////
[2,"Compiling sounds and animations",_fileName] call A3A_fnc_log;
ladridos = ["Music\dog_bark01.wss", "Music\dog_bark02.wss", "Music\dog_bark04.wss", "Music\dog_bark05.wss", "Music\dog_maul01.wss", "Music\dog_yelp02.wss"];
injuredSounds =
[
	"a3\sounds_f\characters\human-sfx\Person0\P0_moan_13_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_14_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_15_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_16_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_17_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_18_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_20_words.wss",
	"a3\sounds_f\characters\human-sfx\Person1\P1_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_20_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_21_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_22_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_23_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_24_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_25_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_26_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_27_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_28_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_29_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_30_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_31_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_32_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_33_words.wss",
	"a3\sounds_f\characters\human-sfx\Person2\P2_moan_19_words.wss"
];
medicAnims = ["AinvPknlMstpSnonWnonDnon_medic_1","AinvPknlMstpSnonWnonDnon_medic0","AinvPknlMstpSnonWnonDnon_medic1","AinvPknlMstpSnonWnonDnon_medic2"];

////////////////////////////////////
//     ID LIST FOR UNIT NAMES    ///
////////////////////////////////////
[2,"Creating unit identities",_fileName] call A3A_fnc_log;
if !(hasIFA) then {
	arrayids = ["Anthis","Costa","Dimitirou","Elias","Gekas","Kouris","Leventis","Markos","Nikas","Nicolo","Panas","Rosi","Samaras","Thanos","Vega"];
	if (isMultiplayer) then {arrayids = arrayids + ["protagonista"]};
};

////////////////////////////////////
//     MISSION PATH WARNING      ///
////////////////////////////////////
[2,"Checking mission path",_fileName] call A3A_fnc_log;
private _getMissionPath = [] spawn A3A_fnc_initGetMissionPath;
waitUntil
{
	if (scriptDone _getMissionPath) exitWith {true};
	if (hasInterface) then {
		["ERROR", "Stuck on compiling missionPath, re-launch the mission."] call A3A_fnc_customHint;
	};
	[1,"Stuck on compiling missionPath, re-launch the mission.",_fileName] call A3A_fnc_log;
	false;
};

if (hasInterface) then {
	["Server Information", "Done compiling missionPath"] call A3A_fnc_customHint;
};
[2,"Done compiling missionPath",_fileName] call A3A_fnc_log;


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
		roadsX setVariable ["airport",[[[6988.38,7135.59,10.0673],17.0361,"MG"],[[6873.83,7472,3.19066],262.634,"MG"],[[6902.09,7427.71,13.0559],359.999,"MG"],[[6886.75,7445.52,0.0368803],360,"Mort"],[[6888.47,7440.31,0.0368826],0.000531628,"Mort"],[[6882.14,7445.42,0.0368817],360,"Mort"],[[6886.49,7436.58,0.0368807],360,"Mort"],[[6970.32,7188.49,-0.0339937],359.999,"Tank"],[[6960.98,7188.49,-0.0339937],359.999,"Tank"],[[6950.71,7187.42,-0.033505],359.999,"Tank"]]];
		roadsX setVariable ["airport_1",[[[2175.14,13402.4,-0.01863],138.861,"Tank"],[[2183.31,13409.7,-0.0184679],139.687,"Tank"],[[2211.39,13434.4,0.0164337],141.512,"Tank"],[[2221.62,13440.6,0.016408],142.886,"Tank"],[[2221.31,13195,0.0368757],0.000337857,"Mort"],[[2224.09,13197.6,0.038271],1.30051e-005,"Mort"],[[2218.96,13199.1,0.0382385],0.00923795,"Mort"],[[2071.1,13308.5,14.4943],133.738,"MG"]]];
		roadsX setVariable ["airport_2",[[[11803,13051.6,0.0368805],360,"Mort"],[[11813.5,13049.2,0.0368915],0.000145629,"Mort"],[[11799.5,13043.2,0.0368919],360,"Mort"],[[11723,13115,18.2],300.703,"MG"],[[11782.3,13058.1,0.0307827],19.6564,"Tank"],[[11810.6,13040.2,0.0368905],360,"Tank"],[[11832.9,13042.1,0.0283785],16.3683,"Tank"]]];
		roadsX setVariable ["airport_3",[[[11658,3055.02,0.036881],360,"Mort"],[[11662.6,3060.14,0.0368819],0.000294881,"Mort"],[[11664.8,3049.94,0.0368805],360,"Mort"],[[11668.9,3055.64,0.0368805],2.08056e-005,"Mort"],[[11748,2983,18.2],249.505,"MG"],[[11784.1,3132.77,0.183631],214.7,"Tank"],[[11720.3,3176.15,0.112019],215.055,"Tank"]]];
		roadsX setVariable ["airport_4",[[[2092.87,3412.98,0.0372648],0.00414928,"Mort"],[[2091.5,3420.69,0.0369596],360,"Mort"],[[2099.93,3422.53,0.0373936],0.00215797,"Mort"],[[2100.13,3416.28,0.0394554],0.0043371,"Mort"],[[2199.5,3472,18.14],0.00187816,"MG"],[[2133.01,3405.88,-0.0156536],315.528,"Tank"],[[2145.82,3416.83,-0.00544548],316.441,"Tank"],[[2163.9,3432.18,-0.0256157],318.777,"Tank"]]];
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBTanoa.sqf";
	};
	case "altis":
	{
		roadsX setVariable ["airport",[[[21175.06,7369.336,0],62.362,"Tank"],[[21178.89,7361.573,0.421],62.36,"Tank"],[[20961.332,7295.678,0],0,"Mort"],[[20956.143,7295.142,0],0,"Mort"],[[20961.1,7290.02,0.262632],0,"Mort"]]];
		roadsX setVariable ["airport_1",[[[23044.8,18745.7,0.0810001],88.275,"Tank"],[[23046.8,18756.8,0.0807302],88.275,"Tank"],[[23214.8,18859.5,0],267.943,"Tank"],[[22981.2,18903.9,0],0,"Mort"],[[22980.1,18907.5,0.553066],0,"Mort"]]];
		roadsX setVariable ["airport_2",[[[26803.1,24727.7,0.0629988],359.958,"Mort"],[[26809,24728.2,0.03755],359.986,"Mort"],[[26815.2,24729,0.0384922],359.972,"Mort"],[[26821.3,24729.1,0.0407047],359.965,"Mort"],[[26769.1,24638.7,0.290344],131.324,"Tank"],[[26774.2,24643.9,0.282555],134.931,"Tank"]]];
		roadsX setVariable ["airport_3",[[[14414.9,16327.8,-0.000991821],207.397,"Tank"],[[14471.9,16383.2,0.0378571],359.939,"Mort"],[[14443,16379.2,0.0369205],359.997,"Mort"],[[14449.4,16376.9,0.0369892],359.996,"Mort"],[[14458,16375.9,0.0369167],359.997,"Mort"],[[14447.2,16397.1,3.71081],269.525,"MG"],[[14472.3,16312,12.1993],317.315,"MG"],[[14411,16229,0.000303268],40.6607,"Tank"],[[14404.4,16235,-0.0169964],50.5741,"Tank"],[[14407.2,16331.7,0.0305004],204.588,"Tank"]]];
		roadsX setVariable ["airport_4",[[[11577.4,11953.6,0.241838],122.274,"Tank"],[[11577.8,11964.3,0.258125],124.324,"Tank"],[[11633.3,11762,0.0372791],359.996,"Mort"],[[11637.3,11768.1,0.043232],0.0110098,"Mort"],[[11637.1,11763.1,0.0394402],0.00529677,"Mort"]],true];
		roadsX setVariable ["airport_5",[[[9064.02,21531.3,0.00117016],138.075,"Tank"],[[9095.12,21552.8,0.614614],157.935,"Tank"],[[9030.28,21531.1,0.261349],157.935,"Mort"],[[9033.91,21534.7,0.295588],157.935,"Mort"]]];
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBAltis.sqf";
	};
	case "chernarus_summer":
	{
		roadsX setVariable ["airport",[[[12190.479,12604.712,9.432],0,"MG"],[[12194.2,12599.4,13.3954],0,"AA"],[[12141,12609,0.00088501],0,"Mort"],[[12144.3,12615.9,0],0,"Mort"],[[12156.5,12614.3,0],0,"Mort"],[[12170,12595.9,0.000305176],250.234,"AT"],[[12070.4,12656,0.0098114],23.5329,"Tank"],[[12022.5,12670.9,0.0098114],18.9519,"Tank"]]];
		roadsX setVariable ["airport_1",[[[4782.75,10251.4,18],0,"AA"],[[4716.17,10215.3,13.1149],278.308,"AA"],[[4714.530,10210.043,9.122],238.755,"MG"],[[4787.34,10248.9,4.99982],188.303,"MG"],[[4741.488,10333.261,20.4],238.946,"MG"],[[4818.39,10200.1,0.00982666],239.625,"Tank"],[[4765.22,10330.8,0],0,"Mort"],[[4758.21,10328.1,0],0,"Mort"],[[4751.45,10324.4,0],0,"Mort"],[[4745.39,10320.6,0],0,"Mort"],[[4739.97,10283.2,0.00567627],291.41,"AT"],[[4814.19,10245.1,0.00567627],211.414,"AT"],[[4841.34,10158.9,0.0102844],240.137,"Tank"],[[4865.7,10116.7,0.00970459],239.499,"Tank"],[[4888.33,10074.2,0.00982666],235.077,"Tank"]]];
		roadsX setVariable ["airport_2",[[[4717.95,2595.24,12.9766],0,"AA"],[[4714.134,2591.637,8.97349],227.835,"MG"],[[4743.55,2567.69,0.0130215],207.155,"Tank"],[[4775.62,2547.37,0.00691605],210.579,"Tank"],[[4719.88,2582.34,0.00566483],261.79,"AT"],[[4826.5,2558.35,0.00150108],0,"Mort"],[[4821.12,2550.32,0.00147152],0,"Mort"],[[4816.59,2543.65,0.00147247],0,"Mort"],[[4812.77,2518.77,0.00566483],150.397,"AT"]]];
		//Roads DB
		call compile preprocessFileLineNumbers "Navigation\roadsDBcherna.sqf";
	};
	case "chernarus_winter":
	{
		roadsX setVariable ["airport",[[[12190.479,12604.712,9.432],0,"MG"],[[12194.2,12599.4,13.3954],0,"AA"],[[12141,12609,0.00088501],0,"Mort"],[[12144.3,12615.9,0],0,"Mort"],[[12156.5,12614.3,0],0,"Mort"],[[12170,12595.9,0.000305176],250.234,"AT"],[[12070.4,12656,0.0098114],23.5329,"Tank"],[[12022.5,12670.9,0.0098114],18.9519,"Tank"]]];
		roadsX setVariable ["airport_1",[[[4782.75,10251.4,18],0,"AA"],[[4716.17,10215.3,13.1149],278.308,"AA"],[[4714.530,10210.043,9.122],238.755,"MG"],[[4787.34,10248.9,4.99982],188.303,"MG"],[[4740.75,10333.2,20.3206],232.414,"MG"],[[4818.39,10200.1,0.00982666],239.625,"Tank"],[[4765.22,10330.8,0],0,"Mort"],[[4758.21,10328.1,0],0,"Mort"],[[4751.45,10324.4,0],0,"Mort"],[[4745.39,10320.6,0],0,"Mort"],[[4739.97,10283.2,0.00567627],291.41,"AT"],[[4814.19,10245.1,0.00567627],211.414,"AT"],[[4841.34,10158.9,0.0102844],240.137,"Tank"],[[4865.7,10116.7,0.00970459],239.499,"Tank"],[[4888.33,10074.2,0.00982666],235.077,"Tank"]]];
		roadsX setVariable ["airport_2",[[[4717.95,2595.24,12.9766],0,"AA"],[[4714.134,2591.637,8.97349],227.835,"MG"],[[4743.55,2567.69,0.0130215],207.155,"Tank"],[[4775.62,2547.37,0.00691605],210.579,"Tank"],[[4719.88,2582.34,0.00566483],261.79,"AT"],[[4826.5,2558.35,0.00150108],0,"Mort"],[[4821.12,2550.32,0.00147152],0,"Mort"],[[4816.59,2543.65,0.00147247],0,"Mort"],[[4812.77,2518.77,0.00566483],150.397,"AT"]]];
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
};

[2,"initVarCommon completed",_fileName] call A3A_fnc_log;
