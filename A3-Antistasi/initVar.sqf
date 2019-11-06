//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team
diag_log format ["%1: [Antistasi] | INFO | initVar Started.",servertime];
antistasiVersion = localize "STR_antistasi_credits_generic_version_text";

////////////////////////////////////
// INITIAL SETTING AND VARIABLES ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Setting Initial Variables",servertime];
logLevel = 2;												//Sets a log level for feedback, 1=Errors, 2=Information, 3=DEBUG
debug = false;													//debug variable, useful for something..
diagOn = false;												//Turn on Diag_log messaging (unused - PBP)
cleantime = 3600;												//time to delete dead bodies, vehicles etc..
distanceSPWN = 1000;											//initial spawn distance. Less than 1Km makes parked vehicles spawn in your nose while you approach.
distanceSPWN1 = 1300;											//
distanceSPWN2 = 500;											//
musicON = false;												//Extra BGM
if (isServer and isDedicated) then {civPerc = 70;} else {civPerc = 35};	//
autoHeal = false;												//
recruitCooldown = 0;											//
savingClient = false;											//
incomeRep = false;												//
maxUnits = 140;												//

////////////////////////////////////
//     BEGIN SIDES AND COLORS    ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Generating Sides.",servertime];
teamPlayer = side group petros;
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

////////////////////////////////////
//     DECLARING ITEM ARRAYS     ///
////////////////////////////////////
if (isServer) then {
diag_log format ["%1: [Antistasi] | INFO | initVar | Declaring Empty Arrays",servertime];

weaponCategories = ["Rifles", "Handguns", "MachineGuns", "MissileLaunchers", "Mortars", "RocketLaunchers", "Shotguns", "SMGs", "SniperRifles"];
itemCategories = ["Bipods", "MuzzleAttachments", "PointerAttachments", "Optics", "Binoculars", "Compasses", "FirstAidKits", "GPS", "LaserDesignators",
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

{
	//Initialise 'allX' variables, such as 'allWeapons'
	missionNamespace setVariable ["all" + _x, []];
} forEach allCategories;

{
	//Initialise 'unlocked' variables, which contain all of the items the players have unlocked.
	missionNamespace setVariable ["unlocked" + _x, []];
} forEach allCategoriesExceptSpecial + ["AA", "AT", "GrenadeLaunchers"]; //TODO: Implement all of the special categories.

//Used for initial unlocks.
initialRebelEquipment = [];

//Loot Items
lootBasicItem = [];
lootNVG = [];
lootItem = [];
lootWeapon = [];
lootAttachment = [];
lootMagazine = [];
lootGrenade = [];
lootExplosive = [];
lootBackpack = [];
lootHelmet = [];
lootVest = [];
lootDevice = [];
//Vehicles Arrays
invaderStaticWeapon = [];
occupantStaticWeapon = [];
rebelStaticWeapon = [];
invaderBackpackDevice = [];
occupantBackpackDevice = [];
rebelBackpackDevice = [];
civilianBackpackDevice = [];
};

////////////////////////////////////
//     BEGIN MOD DETECTION       ///
////////////////////////////////////
call A3A_fnc_initDisabledMods;
diag_log format ["%1: [Antistasi] | INFO | initVar | Starting Mod Detection",servertime];
//Faction MODs
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
hasADVCPR = false;
hasADVSplint = false;
//Radio Mods
hasACRE = false;
hasTFAR = false;

//Radio Detection
hasTFAR = isClass (configFile >> "CfgPatches" >> "task_force_radio");
hasACRE = isClass (configFile >> "cfgPatches" >> "acre_main");
haveRadio = hasTFAR || hasACRE;
//ACE Detection
hasACE = (!isNil "ace_common_fnc_isModLoaded");
hasACEHearing = isClass (configFile >> "CfgSounds" >> "ACE_EarRinging_Weak");
hasACEMedical = isClass (configFile >> "CfgSounds" >> "ACE_heartbeat_fast_3");
hasADVCPR = isClass (configFile >> "CfgPatches" >> "adv_aceCPR");
hasADVSplint = isClass (configFile >> "CfgPatches" >> "adv_aceSplint");
//IFA Detection
if isClass (configFile >> "CfgPatches" >> "LIB_Core") then {hasIFA = true; diag_log format ["%1: [Antistasi] | INFO | initVar | IFA Detected.",servertime];};
//RHS AFRF Detection
if isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_vdv") then {activeAFRF = true; hasRHS = true; diag_log format ["%1: [Antistasi] | INFO | initVar | RHS AFRF Detected.",servertime];};
if isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_usarmy") then {activeUSAF = true; hasRHS = true; diag_log format ["%1: [Antistasi] | INFO | initVar | RHS USAF Detected.",servertime];};
if (activeAFRF && activeUSAF && isClass (configFile >> "CfgFactionClasses" >> "rhsgref_faction_tla")) then {activeGREF = true; diag_log format ["%1: [Antistasi] | INFO | initVar | RHS GREF Detected.",servertime];};
//3CB Detection
if (activeAFRF && activeUSAF && activeGREF && isClass (configfile >> "CfgPatches" >> "UK3CB_BAF_Weapons")) then {has3CB = true; diag_log format ["%1: [Antistasi] | INFO | initVar | 3CB Detected.",servertime];};
//FFAA Detection
if (isClass (configfile >> "CfgPatches" >> "ffaa_armas")) then {hasFFAA = true; diag_log format ["%1: [Antistasi] | INFO | initVar | FFAA Detected.",servertime];};
////////////////////////////////////
//          MOD CONFIG           ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Setting Mod Configs",servertime];

//TFAR config
startLR = false;
if (hasTFAR) then
	{
	startLR = true;																			//set to true to start with LR radios unlocked.
	if (isServer) then
		{
		[] spawn {
				waitUntil {sleep 1; !isNil "TF_server_addon_version"};
				diag_log format ["%1: [Antistasi] | INFO | initVar | Initialising TFAR settings.",servertime];
				["TF_no_auto_long_range_radio", true, true,"mission"] call CBA_settings_fnc_set;						//set to false and players will spawn with LR radio.
				if (hasIFA) then
					{
	  				["TF_give_personal_radio_to_regular_soldier", false, true,"mission"] call CBA_settings_fnc_set;
	  				["TF_give_microdagr_to_soldier", false, true,"mission"] call CBA_settings_fnc_set;
					};
				//tf_teamPlayer_radio_code = "";publicVariable "tf_teamPlayer_radio_code";								//to make enemy vehicles usable as LR radio
				//tf_east_radio_code = tf_teamPlayer_radio_code; publicVariable "tf_east_radio_code";					//to make enemy vehicles usable as LR radio
				//tf_guer_radio_code = tf_teamPlayer_radio_code; publicVariable "tf_guer_radio_code";					//to make enemy vehicles usable as LR radio
				["TF_same_sw_frequencies_for_side", true, true,"mission"] call CBA_settings_fnc_set;						//synchronize SR default frequencies
				["TF_same_lr_frequencies_for_side", true, true,"mission"] call CBA_settings_fnc_set;						//synchronize LR default frequencies
				};
		};
	};

////////////////////////////////////
//        BUILDINGS LISTS        ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Building Arrays",servertime];
listMilBld = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_HelipadSquare_F"];
listbld = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F"];
UPSMON_Bld_remove = ["Bridge_PathLod_base_F","Land_Slum_House03_F","Land_Bridge_01_PathLod_F","Land_Bridge_Asphalt_PathLod_F","Land_Bridge_Concrete_PathLod_F","Land_Bridge_HighWay_PathLod_F","Land_Bridge_01_F","Land_Bridge_Asphalt_F","Land_Bridge_Concrete_F","Land_Bridge_HighWay_F","Land_Canal_Wall_Stairs_F","warehouse_02_f","cliff_wall_tall_f","cliff_wall_round_f","containerline_02_f","containerline_01_f","warehouse_01_f","quayconcrete_01_20m_f","airstripplatform_01_f","airport_02_terminal_f","cliff_wall_long_f","shop_town_05_f","Land_ContainerLine_01_F"];
//Lights and Lamps array used for 'Blackout'
lamptypes = ["Lamps_Base_F", "PowerLines_base_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampHarbour_F","Land_LampShabby_F","Land_NavigLight","Land_runway_edgelight","Land_PowerPoleWooden_L_F"];

////////////////////////////////////
//     SOUNDS AND ANIMATIONS     ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Building Sounds and Animations",servertime];
ladridos = ["Music\dog_bark01.wss", "Music\dog_bark02.wss", "Music\dog_bark03.wss", "Music\dog_bark04.wss", "Music\dog_bark05.wss","Music\dog_maul01.wss","Music\dog_yelp01.wss","Music\dog_yelp02.wss","Music\dog_yelp03.wss"];
injuredSounds =
[
	"a3\sounds_f\characters\human-sfx\Person0\P0_moan_13_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_14_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_15_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_16_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_17_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_18_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_20_words.wss",
	"a3\sounds_f\characters\human-sfx\Person1\P1_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_20_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_21_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_22_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_23_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_24_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_25_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_26_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_27_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_28_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_29_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_30_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_31_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_32_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_33_words.wss",
	"a3\sounds_f\characters\human-sfx\Person2\P2_moan_19_words.wss"
];
medicAnims = ["AinvPknlMstpSnonWnonDnon_medic_1","AinvPknlMstpSnonWnonDnon_medic0","AinvPknlMstpSnonWnonDnon_medic1","AinvPknlMstpSnonWnonDnon_medic2"];

//////////////////////////////////////
//         TEMPLATE SELECTION      ///
//////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Reading Templates",servertime];
if !(hasIFA) then {
	//Rebel Templates
	switch (true) do {
		case (!activeGREF): {call compile preProcessFileLineNumbers "Templates\Vanilla_Reb_FIA_Altis.sqf"};
		case (has3CB): {call compile preProcessFileLineNumbers "Templates\3CB_Reb_TTF_Arid.sqf"};
		case (activeGREF): {call compile preProcessFileLineNumbers "Templates\RHS_Reb_NAPA_Arid.sqf"};
		case (teamPlayer != independent): {call compile preProcessFileLineNumbers "Templates\RHS_Reb_CDF_Arid.sqf"};
	};
	//Occupant Templates
	switch (true) do {
		case (!activeUSAF): {call compile preProcessFileLineNumbers "Templates\Vanilla_Occ_NATO_Altis.sqf"};
		case (has3CB): {call compile preProcessFileLineNumbers "Templates\BAF_Occ_BAF_Arid.sqf"};
		case (activeUSAF): {call compile preProcessFileLineNumbers "Templates\RHS_Occ_USAF_Arid.sqf"};
		case (teamPlayer != independent): {call compile preProcessFileLineNumbers "Templates\RHS_Occ_CDF_Arid.sqf"};
	};
	//Invader Templates
	switch (true) do {
		case (!activeAFRF): {call compile preProcessFileLineNumbers "Templates\Vanilla_Inv_CSAT_Altis.sqf";};
		case (has3CB): {call compile preProcessFileLineNumbers "Templates\3CB_Inv_TKM_Arid.sqf"};
		case (activeAFRF): {call compile preProcessFileLineNumbers "Templates\RHS_Inv_AFRF_Arid.sqf"};
	};
}
else {
//IFA Templates
call compile preProcessFileLineNumbers "Templates\IFA_Reb_POL_Temp.sqf";
call compile preProcessFileLineNumbers "Templates\IFA_Inv_SOV_Temp.sqf";
call compile preProcessFileLineNumbers "Templates\IFA_Occ_WEH_Temp.sqf";
};

////////////////////////////////////
//      CIVILIAN UNITS LIST      ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Civillians",servertime];
arrayCivs = ["C_man_polo_1_F","C_man_polo_1_F_afro","C_man_polo_1_F_asia","C_man_polo_1_F_euro","C_man_sport_1_F_tanoan"];

////////////////////////////////////
//      CIVILIAN VEHICLES       ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Vehicle list.",servertime];
private _civVehConfigs = "(
	getNumber (_x >> 'scope') isEqualTo 2 && {
		getNumber (_x >> 'side') isEqualTo 3 && {
			getText (_x >> 'vehicleClass') in ['Car','Support'] && {
				getText (_x >> 'simulation') isEqualTo 'carx'
			}
		}
	}
)" configClasses (configFile >> "CfgVehicles");

arrayCivVeh = (_civVehConfigs select {!(_x call A3A_fnc_getModOfConfigClass in disabledMods)} apply {configName _x});


//Civilian Boats
_civBoatConfigs = "(
	getNumber (_x >> 'scope') isEqualTo 2 && {
		getNumber (_x >> 'side') isEqualTo 3 && {
			getText (_x >> 'vehicleClass') isEqualTo 'Ship'
		}
	}
)" configClasses (configFile >> "CfgVehicles");

CivBoats = (_civBoatConfigs select {!(_x call A3A_fnc_getModOfConfigClass in disabledMods)} apply {configName _x});

////////////////////////////////////
//     ID LIST FOR UNIT NAMES    ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Unit ID's",servertime];
if !(hasIFA) then
	{
	arrayids = ["Anthis","Costa","Dimitirou","Elias","Gekas","Kouris","Leventis","Markos","Nikas","Nicolo","Panas","Rosi","Samaras","Thanos","Vega"];
	if (isMultiplayer) then {arrayids = arrayids + ["protagonista"]};
	};

//////////////////////////////////////
//      GROUPS CLASSIFICATION      ///
//////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Assigning Squad Types.",servertime];
//Identify Squad Leader Units
squadLeaders = SDKSL + [(NATOSquad select 0),(NATOSpecOp select 0),(CSATSquad select 0),(CSATSpecOp select 0),(FIASquad select 0)];
//Identify Medic Units
medics = SDKMedic + [(FIAsquad select ((count FIAsquad)-1)),(NATOSquad select ((count NATOSquad)-1)),(NATOSpecOp select ((count NATOSpecOp)-1)),(CSATSquad select ((count CSATSquad)-1)),(CSATSpecOp select ((count CSATSpecOp)-1))];
//Define Sniper Groups and Units
sniperGroups = [groupsNATOSniper,groupsCSATSniper];

////////////////////////////////////
//   CLASSING TEMPLATE VEHICLES  ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Assigning vehicle Types",servertime];
vehNormal = vehNATONormal + vehCSATNormal + [vehFIATruck,vehSDKTruck,vehSDKLightArmed,vehSDKBike,vehSDKRepair];
vehBoats = [vehNATOBoat,vehCSATBoat,vehSDKBoat];
vehAttack = vehNATOAttack + vehCSATAttack;
vehPlanes = vehNATOAir + vehCSATAir + [vehSDKPlane];
vehAttackHelis = vehCSATAttackHelis + vehNATOAttackHelis;
vehFixedWing = [vehNATOPlane,vehNATOPlaneAA,vehCSATPlane,vehCSATPlaneAA,vehSDKPlane] + vehNATOTransportPlanes + vehCSATTransportPlanes;
vehUAVs = [vehNATOUAV,vehCSATUAV];
vehAmmoTrucks = [vehNATOAmmoTruck,vehCSATAmmoTruck];
vehAPCs = vehNATOAPC + vehCSATAPC;
vehTanks = [vehNATOTank,vehCSATTank];
vehTrucks = vehNATOTrucks + vehCSATTrucks + [vehSDKTruck,vehFIATruck];
vehAA = [vehNATOAA,vehCSATAA];
vehMRLS = [vehCSATMRLS, vehNATOMRLS];
vehTransportAir = vehNATOTransportHelis + vehCSATTransportHelis + vehNATOTransportPlanes + vehCSATTransportPlanes;
vehFastRope = ["O_Heli_Light_02_unarmed_F","B_Heli_Transport_01_camo_F","RHS_UH60M_d","RHS_Mi8mt_vdv","RHS_Mi8mt_vv","RHS_Mi8mt_Cargo_vv"];
vehUnlimited = vehNATONormal + vehCSATNormal + [vehNATORBoat,vehNATOPatrolHeli,vehCSATRBoat,vehCSATPatrolHeli,vehNATOUAV,vehNATOUAVSmall,NATOMG,NATOMortar,vehCSATUAV,vehCSATUAVSmall,CSATMG,CSATMortar];
vehFIA = [vehSDKBike,vehSDKLightArmed,SDKMGStatic,vehSDKLightUnarmed,vehSDKTruck,vehSDKBoat,SDKMortar,staticATteamPlayer,staticAAteamPlayer,vehSDKRepair];

if (isServer) then {
////////////////////////////////////
//        CRATE LOOT ITEMS       ///
////////////////////////////////////
private _equipmentFilter = {
	params ["_configClass", "_categories"];

	private _remove = false;

	private _itemIsVanilla = (_configClass call A3A_fnc_getModOfConfigClass) isEqualTo "";

	if (_itemIsVanilla && {hasIFA || has3CB || {activeAFRF && activeGREF && activeUSAF}}) then {
		switch (_categories select 0) do {
			case "Item": {
				if (hasIFA) then {
					switch (_categories select 1) do {
						case "AccessoryMuzzle";
						case "AccessoryPointer";
						case "AccessorySights";
						case "AccessoryBipod";
						case "Binocular";
						case "Compass";
						case "GPS";
						case "LaserDesignator";
						case "NVGoggles";
						case "UAVTerminal";
						case "Watch": {
							_remove = true;
						};
					};
				}
				else {
					switch (_categories select 1) do {
						case "AccessoryMuzzle";
						case "AccessoryPointer";
						case "AccessorySights";
						case "AccessoryBipod";
						case "NVGoggles": {
							_remove = true;
						};
					};
				};
			};
			case "Weapon": {
				_remove = true;
			};
			case "Equipment": {
				switch (_categories select 1) do {
					case "Backpack": {
						if (hasIFA) then {
							_remove = true;
						};
					};
					case "Glasses": {
						if (hasIFA) then {
							_remove = true;
						};
					};
					case "Headgear": {
						if (hasIFA) then {
							_remove = true;
						}
						else {
							if (getNumber (_configClass >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 0) then {
								_remove = true;
							};
						};
					};
					case "Uniform": {
						if (hasIFA || has3CB) then {
							_remove = true;
						};
					};
					case "Vest": {
						if (getNumber (_configClass >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") > 5) then {
							_remove = true;
						};
					};
				};

			};
		};
	};

	_remove;
};


diag_log format ["%1: [Antistasi] | INFO | initVar | Scanning config files",servertime];
[_equipmentFilter] call A3A_fnc_configSort;
diag_log format ["%1: [Antistasi] | INFO | initVar | Categorizing Vehicle Classes",servertime];
[] call A3A_fnc_vehicleSort;
diag_log format ["%1: [Antistasi] | INFO | initVar | Categorizing Equipment Classes",servertime];
[] call A3A_fnc_equipmentSort;
diag_log format ["%1: [Antistasi] | INFO | initVar | Identifying Objects for Mission Scripts",servertime];
[] call A3A_fnc_itemSort;
diag_log format ["%1: [Antistasi] | INFO | initVar | Building Loot Lists",servertime];
[] call A3A_fnc_loot;

///////////////////////////
//     MOD TEMPLATES    ///
///////////////////////////
//Please respect the order in which these are called,
//and add new entries to the bottom of the list.
if (hasACE) then
	{
	[] call A3A_fnc_aceModCompat;
	};
if (hasRHS) then
	{
	[] call A3A_fnc_rhsModCompat;
	};
if (hasIFA) then
	{
	[] call A3A_fnc_ifaModCompat;
	};

////////////////////////////////////
//     ACRE ITEM MODIFICATIONS   ///
////////////////////////////////////
if (hasACRE) then {initialRebelEquipment append ["ACRE_PRC343","ACRE_PRC148","ACRE_PRC152","ACRE_PRC77","ACRE_PRC117F"];};
};

////////////////////////////////////
//     MISSION PATH WARNING      ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Checking Mission Path",servertime];
private _getMissionPath = [] spawn A3A_fnc_initGetMissionPath;
waitUntil
{
	if (scriptDone _getMissionPath) exitWith {true};
	hint "Stuck on compiling missionPath, re-launch the mission.";
	false;
};
hint "Done compiling missionPath";

////////////////////////////////////
// SERVER AND HEADLESS VARIABLES ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Server/Host Variables",servertime];
if (!isServer and hasInterface) exitWith {};
difficultyCoef = if !(isMultiplayer) then {0} else {floor ((({side group _x == teamPlayer} count playableUnits) - ({side group _x != teamPlayer} count playableUnits)) / 5)};
AAFpatrols = 0;
reinfPatrols = 0;
smallCAmrk = [];
smallCApos = [];

attackPos = [];
attackMrk = [];
airstrike = [];
convoyMarker = [];

bigAttackInProgress = false;
chopForest = false;
distanceForAirAttack = 10000;
distanceForLandAttack = if (hasIFA) then {5000} else {3000};

////////////////////////////////////
//   MAP SETTINGS AND MARKERS    ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Setting Map Details.",servertime];
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
    	roadsX setVariable ["airport_2",[[[11803,13051.6,0.0368805],360,"Mort"],[[11813.5,13049.2,0.0368915],0.000145629,"Mort"],[[11799.5,13043.2,0.0368919],360,"Mort"],[[11723.3,13114.6,18.1545],300.703,"MG"],[[11782.3,13058.1,0.0307827],19.6564,"Tank"],[[11810.6,13040.2,0.0368905],360,"Tank"],[[11832.9,13042.1,0.0283785],16.3683,"Tank"]]];
    	roadsX setVariable ["airport_3",[[[11658,3055.02,0.036881],360,"Mort"],[[11662.6,3060.14,0.0368819],0.000294881,"Mort"],[[11664.8,3049.94,0.0368805],360,"Mort"],[[11668.9,3055.64,0.0368805],2.08056e-005,"Mort"],[[11747.8,2982.95,18.1513],249.505,"MG"],[[11784.1,3132.77,0.183631],214.7,"Tank"],[[11720.3,3176.15,0.112019],215.055,"Tank"]]];
    	roadsX setVariable ["airport_4",[[[2092.87,3412.98,0.0372648],0.00414928,"Mort"],[[2091.5,3420.69,0.0369596],360,"Mort"],[[2099.93,3422.53,0.0373936],0.00215797,"Mort"],[[2100.13,3416.28,0.0394554],0.0043371,"Mort"],[[2198.24,3471.03,18.0123],0.00187816,"MG"],[[2133.01,3405.88,-0.0156536],315.528,"Tank"],[[2145.82,3416.83,-0.00544548],316.441,"Tank"],[[2163.9,3432.18,-0.0256157],318.777,"Tank"]]];
	//Map Markers
	{server setVariable [_x select 0,_x select 1]} forEach [["Lami01",277],["Lifou01",350],["Lobaka01",64],["LaFoa01",38],["Savaka01",33],["Regina01",303],["Katkoula01",413],["Moddergat01",195],["Losi01",83],["Tanouka01",380],["Tobakoro01",45],["Georgetown01",347],["Kotomo01",160],["Rautake01",113],["Harcourt01",325],["Buawa01",44],["SaintJulien01",353],["Balavu01",189],["Namuvaka01",45],["Vagalala01",174],["Imone01",31],["Leqa01",45],["Blerick01",71],["Yanukka01",189],["OuaOue01",200],["Cerebu01",22],["Laikoro01",29],["Saioko01",46],["Belfort01",240],["Oumere01",333],["Muaceba01",18],["Nicolet01",224],["Lailai01",23],["Doodstil01",101],["Tavu01",178],["Lijnhaven01",610],["Nani01",19],["PetitNicolet01",135],["PortBoise01",28],["SaintPaul01",136],["Nasua01",60],["Savu01",184],["Murarua01",258],["Momea01",159],["LaRochelle01",532],["Koumac01",51],["Taga01",31],["Buabua01",27],["Penelo01",189],["Vatukoula01",15],["Nandai01",130],["Tuvanaka01",303],["Rereki01",43],["Ovau01",226],["IndPort01",420],["Ba01",106]];
	//Roads DB
	call compile preprocessFileLineNumbers "roadsDB.sqf";
	};
case "altis":
		{
		roadsX setVariable ["airport",[[[21175.06,7369.336,0],62.362,"Tank"],[[21178.89,7361.573,0.421],62.36,"Tank"],[[20961.332,7295.678,0],0,"Mort"],[[20956.143,7295.142,0],0,"Mort"],[[20961.1,7290.02,0.262632],0,"Mort"]]];
        	roadsX setVariable ["airport_1",[[[23044.8,18745.7,0.0810001],88.275,"Tank"],[[23046.8,18756.8,0.0807302],88.275,"Tank"],[[23214.8,18859.5,0],267.943,"Tank"],[[22981.2,18903.9,0],0,"Mort"],[[22980.1,18907.5,0.553066],0,"Mort"]]];
        	roadsX setVariable ["airport_2",[[[26803.1,24727.7,0.0629988],359.958,"Mort"],[[26809,24728.2,0.03755],359.986,"Mort"],[[26815.2,24729,0.0384922],359.972,"Mort"],[[26821.3,24729.1,0.0407047],359.965,"Mort"],[[26769.1,24638.7,0.290344],131.324,"Tank"],[[26774.2,24643.9,0.282555],134.931,"Tank"]]];
        	roadsX setVariable ["airport_3",[[[14414.9,16327.8,-0.000991821],207.397,"Tank"],[[14471.9,16383.2,0.0378571],359.939,"Mort"],[[14443,16379.2,0.0369205],359.997,"Mort"],[[14449.4,16376.9,0.0369892],359.996,"Mort"],[[14458,16375.9,0.0369167],359.997,"Mort"],[[14447.2,16397.1,3.71081],269.525,"MG"],[[14472.3,16312,12.1993],317.315,"MG"],[[14411,16229,0.000303268],40.6607,"Tank"],[[14404.4,16235,-0.0169964],50.5741,"Tank"],[[14407.2,16331.7,0.0305004],204.588,"Tank"]]];
        	roadsX setVariable ["airport_4",[[[11577.4,11953.6,0.241838],122.274,"Tank"],[[11577.8,11964.3,0.258125],124.324,"Tank"],[[11633.3,11762,0.0372791],359.996,"Mort"],[[11637.3,11768.1,0.043232],0.0110098,"Mort"],[[11637.1,11763.1,0.0394402],0.00529677,"Mort"]],true];
        	roadsX setVariable ["airport_5",[[[9064.02,21531.3,0.00117016],138.075,"Tank"],[[9095.12,21552.8,0.614614],157.935,"Tank"],[[9030.28,21531.1,0.261349],157.935,"Mort"],[[9033.91,21534.7,0.295588],157.935,"Mort"]]];
		//Map Markers
		{server setVariable [_x select 0,_x select 1]} forEach [["Therisa",154],["Zaros",371],["Poliakko",136],["Katalaki",95],["Alikampos",115],["Neochori",309],["Stavros",122],["Lakka",173],["AgiosDionysios",84],["Panochori",264],["Topolia",33],["Ekali",9],["Pyrgos",531],["Orino",45],["Neri",242],["Kore",133],["Kavala",660],["Aggelochori",395],["Koroni",32],["Gravia",291],["Anthrakia",143],["Syrta",151],["Negades",120],["Galati",151],["Telos",84],["Charkia",246],["Athira",342],["Dorida",168],["Ifestiona",48],["Chalkeia",214],["AgiosKonstantinos",39],["Abdera",89],["Panagia",91],["Nifi",24],["Rodopoli",212],["Kalithea",36],["Selakano",120],["Frini",69],["AgiosPetros",11],["Feres",92],["AgiaTriada",8],["Paros",396],["Kalochori",189],["Oreokastro",63],["Ioannina",48],["Delfinaki",29],["Sofia",179],["Molos",188]];
		//Roads DB
		call compile preprocessFileLineNumbers "roadsDBAltis.sqf";
		};
case "chernarus_summer":
		{
		roadsX setVariable ["airport",[[[12191.2,12605.8,9.43077],0,"MG"],[[12194.2,12599.4,13.3954],0,"AA"],[[12141,12609,0.00088501],0,"Mort"],[[12144.3,12615.9,0],0,"Mort"],[[12156.5,12614.3,0],0,"Mort"],[[12170,12595.9,0.000305176],250.234,"AT"],[[12070.4,12656,0.0098114],23.5329,"Tank"],[[12022.5,12670.9,0.0098114],18.9519,"Tank"]]];
        	roadsX setVariable ["airport_1",[[[4782.75,10251.4,18],0,"AA"],[[4716.17,10215.3,13.1149],278.308,"AA"],[[4713.94,10209.3,9.12177],188.973,"MG"],[[4787.34,10248.9,4.99982],188.303,"MG"],[[4740.75,10333.2,20.3206],232.414,"MG"],[[4818.39,10200.1,0.00982666],239.625,"Tank"],[[4765.22,10330.8,0],0,"Mort"],[[4758.21,10328.1,0],0,"Mort"],[[4751.45,10324.4,0],0,"Mort"],[[4745.39,10320.6,0],0,"Mort"],[[4739.97,10283.2,0.00567627],291.41,"AT"],[[4814.19,10245.1,0.00567627],211.414,"AT"],[[4841.34,10158.9,0.0102844],240.137,"Tank"],[[4865.7,10116.7,0.00970459],239.499,"Tank"],[[4888.33,10074.2,0.00982666],235.077,"Tank"]]];
        	roadsX setVariable ["airport_2",[[[4717.95,2595.24,12.9766],0,"AA"],[[4714.27,2590.97,8.97349],176.197,"MG"],[[4743.55,2567.69,0.0130215],207.155,"Tank"],[[4775.62,2547.37,0.00691605],210.579,"Tank"],[[4719.88,2582.34,0.00566483],261.79,"AT"],[[4826.5,2558.35,0.00150108],0,"Mort"],[[4821.12,2550.32,0.00147152],0,"Mort"],[[4816.59,2543.65,0.00147247],0,"Mort"],[[4812.77,2518.77,0.00566483],150.397,"AT"]]];
		//Map Markers
		{server setVariable [_x select 0,_x select 1]} forEach [["vill_NovySobor",129],["city_StarySobor",149],["vill_Guglovo",26],["vill_Vyshnoye",41],["vill_Kabanino",86],["vill_Rogovo",66],["vill_Mogilevka",104],["city_Gorka",115],["vill_Grishino",168],["vill_Shakhovka",55],["vill_Pogorevka",57],["vill_Pulkovo",26],["vill_Nadezhdino",109],["city_Vybor",180],["vill_Polana",118],["vill_Staroye",115],["vill_Dubrovka",86],["vill_Pustoshka",163],["vill_Kozlovka",100],["vill_Pusta",52],["vill_Dolina",83],["vill_Gvozdno",78],["vill_Prigorodki",145],["vill_Drozhino",58],["vill_Sosnovka",54],["vill_Msta",96],["vill_Lopatino",159],["city_Zelenogorsk",280],["vill_Orlovets",65],["city_Berezino",340],["vill_Myshkino",49],["vill_Petrovka",45],["city_Chernogorsk",761],["vill_Bor",46],["vill_Nizhnoye",146],["vill_Balota",147],["vill_Khelm",110],["city_Krasnostav",194],["vill_Komarovo",127],["city_Elektrozavodsk",745],["city_Solnychniy",224],["vill_Kamyshovo",196],["vill_Tulga",35],["vill_Pavlovo",99],["vill_Kamenka",127],["hill_Olsha",20]];
		//Roads DB
		call compile preprocessFileLineNumbers "roadsDBcherna.sqf";
		};
case "malden":
		{
		//Roads DB
		call compile preprocessFileLineNumbers "roadsDBmalden.sqf";
		};
case "enoch":
		{
		//Roads DB
		call compile preprocessFileLineNumbers "roadsDBLivonia.sqf";
		};
case "kunduz":
		{
		//Roads DB
		call compile preprocessFileLineNumbers "roadsDBKunduz.sqf";
		};
case "tembelan":
		{
		//Roads DB
		call compile preprocessFileLineNumbers "roadsDBTembelan.sqf";
		};
	};

////////////////////////////////////
//    UNIT AND VEHICLE PRICES    ///
////////////////////////////////////
if (!isServer) exitWith {};
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Pricelist.",servertime];
{server setVariable [_x,50,true]} forEach SDKMil;
{server setVariable [_x,75,true]} forEach (sdkTier1 - SDKMil);
{server setVariable [_x,100,true]} forEach  sdkTier2;
{server setVariable [_x,150,true]} forEach sdkTier3;
//{timer setVariable [_x,0,true]} forEach (vehAttack + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA,vehCSATPlane,vehCSATPlaneAA] + vehCSATAttackHelis + vehAA + vehMRLS);
{timer setVariable [_x,3,true]} forEach [staticATOccupants,staticAAOccupants];
{timer setVariable [_x,6,true]} forEach [staticATInvaders,staticAAInvaders];
{timer setVariable [_x,0,true]} forEach vehNATOAPC;
{timer setVariable [_x,10,true]} forEach vehCSATAPC;
timer setVariable [vehNATOTank,0,true];
timer setVariable [vehCSATTank,10,true];
timer setVariable [vehNATOAA,0,true];
timer setVariable [vehCSATAA,3,true];
timer setVariable [vehNATOBoat,3,true];
timer setVariable [vehCSATBoat,3,true];
timer setVariable [vehNATOPlane,0,true];
timer setVariable [vehCSATPlane,10,true];
timer setVariable [vehNATOPlaneAA,0,true];
timer setVariable [vehCSATPlaneAA,10,true];
{timer setVariable [_x,1,true]} forEach vehNATOTransportPlanes;
{timer setVariable [_x,1,true]} forEach vehNATOTransportHelis - [vehNATOPatrolHeli];
{timer setVariable [_x,1,true]} forEach vehCSATTransportPlanes;
{timer setVariable [_x,10,true]} forEach vehCSATTransportHelis - [vehCSATPatrolHeli];
{timer setVariable [_x,0,true]} forEach vehNATOAttackHelis;
{timer setVariable [_x,10,true]} forEach vehCSATAttackHelis;
timer setVariable [vehNATOMRLS,0,true];
timer setVariable [vehCSATMRLS,5,true];

server setVariable [civCar,200,true];													//200
server setVariable [civTruck,600,true];													//600
server setVariable [civHeli,5000,true];													//5000
server setVariable [civBoat,200,true];													//200
server setVariable [vehSDKBike ,50,true];												//50
server setVariable [vehSDKLightUnarmed,200,true];										//200
server setVariable [vehSDKTruck,300,true];											//300
{server setVariable [_x,700,true]} forEach [vehSDKLightArmed,vehSDKAT];
{server setVariable [_x,400,true]} forEach [SDKMGStatic,vehSDKBoat,vehSDKRepair];			//400
{server setVariable [_x,800,true]} forEach [SDKMortar,staticATteamPlayer,staticAAteamPlayer];			//800

////////////////////////////////////
//     SERVER ONLY VARIABLES     ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Setting Server Only Variables.",servertime];
server setVariable ["hr",8,true];														//initial HR value
server setVariable ["resourcesFIA",1000,true];											//Initial FIA money pool value
skillFIA = 1;																		//Initial skill level for FIA soldiers
prestigeNATO = 5;																	//Initial Prestige NATO
prestigeCSAT = 5;																	//Initial Prestige CSAT
prestigeOPFOR = [75, 50] select cadetMode;												//Initial % support for NATO on each city
prestigeBLUFOR = 0;																	//Initial % FIA support on each city
countCA = 600;																		//600
bombRuns = 0;
cityIsSupportChanging = false;
resourcesIsChanging = false;
savingServer = false;
revealX = false;
prestigeIsChanging = false;
napalmCurrent = false;
tierWar = 1;

haveNV = false;
zoneCheckInProgress = false;
garrisonIsChanging = false;
movingMarker = false;
garageIsUsed = false;
missionsX = [];
markersChanging = [];
staticsToSave = [];
vehInGarage = [];
destroyedBuildings = [];
reportedVehs = [];
playerHasBeenPvP = [];

//Reinforcement logic
reinforceMarkerOccupants = [];
reinforceMarkerInvader = [];
canReinforceOccupants = [];
canReinforceInvader = [];

//Garrison logic
tierPreference = 1;
cityUpdateTiers = [4, 8];
cityStaticsTiers = [0.2, 1];
airportUpdateTiers = [3, 6, 8];
airportStaticsTiers = [0.5, 0.75, 1];
outpostUpdateTiers = [4, 7, 9];
outpostStaticsTiers = [0.4, 0.7, 1];
otherUpdateTiers = [3, 7];
otherStaticsTiers = [0.3, 1];
[] call A3A_fnc_initPreference;

////////////////////////////////////
// DECLARE VARIBALES FOR CLIENTS ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Declaring Variables For Clients.",servertime];

publicVariable "hasACE";
publicVariable "hasTFAR";
publicVariable "hasACRE";
publicVariable "hasACEHearing";
publicVariable "hasACEMedical";
publicVariable "hasADVCPR";
publicVariable "hasADVSplint";

publicVariable "unlockedWeapons";
publicVariable "unlockedItems";
publicVariable "unlockedOptics";
publicVariable "unlockedBackpacks";
publicVariable "unlockedMagazines";
publicVariable "unlockedNVGs";
publicVariable "unlockedHeadgear";
publicVariable "unlockedVests";
publicVariable "unlockedRifles";
publicVariable "unlockedSMGs";
publicVariable "unlockedMachineGuns";
publicVariable "unlockedGrenadeLaunchers";
publicVariable "unlockedSniperRifles";
publicVariable "unlockedAT";
publicVariable "unlockedAA";
publicVariable "initialRebelEquipment";

publicVariable "allRifles";
publicVariable "allHandguns";
publicVariable "allMachineGuns";
publicVariable "allMissileLaunchers";
publicVariable "allRocketLaunchers";
publicVariable "allShotguns";
publicVariable "allSMGs";
publicVariable "allSniperRifles";

publicVariable "allCivilianUniforms";
publicVariable "allCivilianHeadgear";
publicVariable "allRebelUniforms";
publicVariable "allArmoredHeadgear";
publicVariable "allSmokeGrenades";

publicVariable "teamPlayer";
publicVariable "civPerc";
publicVariable "garageIsUsed";
publicVariable "vehInGarage";
publicVariable "reportedVehs";
publicVariable "revealX";
publicVariable "prestigeNATO";
publicVariable "prestigeCSAT";
publicVariable "skillFIA";
publicVariable "staticsToSave";
publicVariable "bombRuns";
publicVariable "chopForest";
publicVariable "napalmCurrent";
publicVariable "tierWar";
publicVariable "haveRadio";
publicVariable "haveNV";
publicVariable "missionsX";

if (isMultiplayer) then {[[petros,"hint","Variables Init Completed"],"A3A_fnc_commsMP"] call BIS_fnc_MP;};
diag_log format ["%1: [Antistasi] | INFO | initVar Completed.",servertime];
