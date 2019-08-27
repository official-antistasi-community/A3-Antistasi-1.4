//Original Author: Barbolani //Edited and updated by the Antstasi Community Development Team
diag_log format ["%1: [Antistasi] | INFO | initVar Started.",servertime];
antistasiVersion = localize "STR_antistasi_credits_generic_version_text";

////////////////////////////////////
// INITIAL SETTING AND VARIABLES ///
////////////////////////////////////
debug = false;										//debug variable, not useful for everything..
diagOn = false;									//Turn on Diag_log messaging (unused - PBP)
cleantime = 3600;									//time to delete dead bodies, vehicles etc..
distanceSPWN = 1000;								//initial spawn distance. Less than 1Km makes parked vehicles spawn in your nose while you approach.
distanceSPWN1 = 1300;								//
distanceSPWN2 = 500;								//
musicON = false;									//Extra BGM
if (isServer and isDedicated) then {civPerc = 70;} else {civPerc = 35};
autoHeal = false;									//
recruitCooldown = 0;								//
savingClient = false;								//
incomeRep = false;									//
maxUnits = 140;									//

////////////////////////////////////
//   BEGIN SIDES AND COLORS      ///
////////////////////////////////////
//Setting Sides
diag_log format ["%1: [Antistasi] | INFO | initVar | Generating Sides.",servertime];
teamPlayer = side group petros;
Occupants = if (teamPlayer == independent) then {west} else {independent};
Invaders = east;
//Setting Side Colors
colourTeamPlayer = if (teamPlayer == independent) then {"colorGUER"} else {"colorBLUFOR"};
colorOccupants = if (teamPlayer == independent) then {"colorBLUFOR"} else {"colorGUER"};
colorInvaders = "colorOPFOR";
//Setting Respawn Locations
respawnTeamPlayer = if (teamPlayer == independent) then {"respawn_guerrila"} else {"respawn_west"};
respawnOccupants = if (teamPlayer == independent) then {"respawn_west"} else {"respawn_guerrila"};
posHQ = getMarkerPos respawnTeamPlayer;

//Declaring Items Arrays
allMagazines = [];
arifles = [];
srifles = [];
mguns = [];
hguns = [];
mlaunchers = [];
rlaunchers = [];
attachmentBipod = [];
attachmentMuzzle = [];
attachmentPointer = [];
attachmentOptics = [];
NVGoggles = [];
smokeX = [];
chemX = [];
opticsAAF = [];
flashLights = [];
pointers = [];
civUniforms = [];
helmets = [];
armoredHelmets = [];
vests = [];
armoredVests = [];

REBELuniforms = [];
REBELuniformsPM = [];
itemsAAF = [];
unlockedWeapons = [];
unlockedRifles = [];
unlockedMagazines = [];
unlockedRifles = [];
unlockedItems = [];
unlockedBackpacks = [];
unlockedOptics = [];
unlockedAT = [];
unlockedAA = [];
unlockedMG = [];
unlockedGL = [];
unlockedSN = [];
ammoDEFENDER = [];
weaponsDEFENDER = [];
ammoINVADER = [];
weaponsINVADER = [];

////////////////////////////////////
//     BEGIN MOD DETECTION       ///
////////////////////////////////////
//Faction MODs
hasRHS = false;
hasAFRF = false;
hasUSAF = false;
hasGREF = false;
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
startLR = false;

diag_log format ["%1: [Antistasi] | INFO | initVar | Patching mod weapon support",servertime];
//Radio Detection
hasTFAR = (isClass (configFile >> "CfgPatches" >> "task_force_radio"));
hasACRE = (isClass(configFile >> "cfgPatches" >> "acre_main"));
haveRadio = hasTFAR || hasACRE;
//ACE Detection
hasACE = (!isNil "ace_common_fnc_isModLoaded");
hasACEHearing = (isClass (configFile >> "CfgSounds" >> "ACE_EarRinging_Weak"));
hasACEMedical = (isClass (ConfigFile >> "CfgSounds" >> "ACE_heartbeat_fast_3"));
hasADVCPR = isClass (configFile >> "CfgPatches" >> "adv_aceCPR");
hasADVSplint = isClass (configFile >> "CfgPatches" >> "adv_aceSplint");
//IFA Detection
if (isClass(configFile/"CfgPatches"/"LIB_Core")) then {hasIFA = true; diag_log format ["%1: [Antistasi] | INFO | initVar | IFA Detected.",servertime];};
//RHS AFRF Detection
if ("rhs_weap_akms" in arifles) then {hasAFRF = true; hasRHS = true; diag_log format ["%1: [Antistasi] | INFO | initVar | RHS AFRF Detected.",servertime];};
if ("rhs_weap_m4a1_d" in arifles) then {hasUSAF = true; hasRHS = true; diag_log format ["%1: [Antistasi] | INFO | initVar | RHS USAF Detected.",servertime];};
if ("rhs_weap_m92" in arifles) then {hasGREF = true; hasRHS = true; diag_log format ["%1: [Antistasi] | INFO | initVar | RHS GREF Detected.",servertime];};
//3CB Detection
if (hasAFRF and hasUSAF and hasGREF) then {if ("UK3CB_BAF_L1A1" in arifles) then {has3CB = true; diag_log format ["%1: [Antistasi] | INFO | initVar | 3CB Detected.",servertime];};};
//FFAA Detection
if ("ffaa_armas_hkg36k_normal" in arifles) then {hasFFAA = true; diag_log format ["%1: [Antistasi] | INFO | initVar | FFAA Detected.",servertime];};

////////////////////////////////////
//          MOD CONFIG           ///
////////////////////////////////////
//TFAR config
if (hasTFAR) then
{
	startLR = true;																			//set to true to start with LR radios unlocked.
	["TF_no_auto_long_range_radio", true, true,"mission"] call CBA_settings_fnc_set;						//set to false and players will spawn with LR radio.
	if (hasIFA) then {
	  ["TF_give_personal_radio_to_regular_soldier", false, true,"mission"] call CBA_settings_fnc_set;
	  ["TF_give_microdagr_to_soldier", false, true,"mission"] call CBA_settings_fnc_set;
	};
	//tf_teamPlayer_radio_code = "";publicVariable "tf_teamPlayer_radio_code";								//to make enemy vehicles usable as LR radio
	//tf_east_radio_code = tf_teamPlayer_radio_code; publicVariable "tf_east_radio_code";					//to make enemy vehicles usable as LR radio
	//tf_guer_radio_code = tf_teamPlayer_radio_code; publicVariable "tf_guer_radio_code";					//to make enemy vehicles usable as LR radio
	["TF_same_sw_frequencies_for_side", true, true,"mission"] call CBA_settings_fnc_set;						//synchronize SR default frequencies
	["TF_same_lr_frequencies_for_side", true, true,"mission"] call CBA_settings_fnc_set;						//synchronize LR default frequencies
};

//////////////////////////////////////
//         TEMPLATE SELECTION      ///
//////////////////////////////////////
//Templates for GREENFOR Rebels
diag_log format ["%1: [Antistasi] | INFO | initVar | Reading Player Templates",servertime];
if (!hasIFA) then
	{
	//NON-IFA Templates for DEFENDER
		if (!hasUSAF) then
			{
			//Vanilla DEFENDER Template
			call compile preProcessFileLineNumbers "Templates\OccupantsVanilla.sqf";
			}
			else
			{
				if (has3CB) then
					{
					//3CB DEFENDER Template
					call compile preProcessFileLineNumbers "Templates\Occupants3CBBAF.sqf";
					}
					else
					{
						if (gameMode != 4) then
							{
							//RHS-USAF DEFENDER Template
							call compile preProcessFileLineNumbers "Templates\OccupantsRHSUSAF.sqf";
							}
							else
							{
							//RHS GREENFOR DEFENDER Template
							call compile preProcessFileLineNumbers "Templates\OccupantsRHSGREF.sqf";
							};
					};
			};
	//NON-IFA INVADER Templates
		if (!hasAFRF) then
			{
			//Vanilla INVADER Template
			call compile preProcessFileLineNumbers "Templates\InvadersVanilla.sqf";
			}
			else
			{
				if (has3CB) then
					{
					//3CB INVADER Template
					call compile preProcessFileLineNumbers "Templates\Invaders3CBTKM.sqf";
					}
					else
					{
					//RHS INVADER Template
					call compile preProcessFileLineNumbers "Templates\InvadersRHSAFRF.sqf";
					};
			};
		//NON-IFA REBEL Templates
		if (!hasGREF) then
			{
			//Vanilla REBEL Template
			call compile preProcessFileLineNumbers "Templates\REBELtemplateVANILLA.sqf";
			}
			else
			{
				if (has3CB) then
					{
					//3CB REBEL Template
					call compile preProcessFileLineNumbers "Templates\REBELtemplate3CBCCM.sqf";
					}
					else
					{
						if (gameMode != 4) then
							{
							//RHS REBEL Template
							call compile preProcessFileLineNumbers "Templates\REBELtemplateRHSGREF.sqf";
							}
							else
							{
							//RHS BLUFOR REBEL Template
							call compile preProcessFileLineNumbers "Templates\REBELtemplateRHSUSAF.sqf";
							};
					};
			};
	}
	else
	{
	call compile preProcessFileLineNumbers "Templates\REBELtemplateIFA.sqf";
	call compile preProcessFileLineNumbers "Templates\InvadersIFA.sqf";
	call compile preProcessFileLineNumbers "Templates\OccupantsIFA.sqf";
	};

////////////////////////////////////
//     CIVILLIAN UNITS LIST      ///
////////////////////////////////////
arrayCivs = if (worldName == "Tanoa") then
	{
	["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_scientist_F","C_Orestes","C_Nikos","C_Nikos_aged","C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan","C_Man_casual_6_F_tanoan"];
	}
else
	{
	if !(hasIFA) then
		{
		["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_scientist_F","C_Orestes","C_Nikos","C_Nikos_aged"];
		if (has3CB) then {arrayCivs append ["UK3CB_CHC_C_BODYG","UK3CB_CHC_C_CAN","UK3CB_CHC_C_COACH","UK3CB_CHC_C_DOC","UK3CB_CHC_C_FUNC","UK3CB_CHC_C_HIKER","UK3CB_CHC_C_LABOUR","UK3CB_CHC_C_PILOT","UK3CB_CHC_C_POLITIC","UK3CB_CHC_C_PROF","UK3CB_CHC_C_VILL","UK3CB_CHC_C_WORKER"]};
		}
	else
		{
		["LIB_CIV_Assistant","LIB_CIV_Assistant_2","LIB_CIV_Citizen_1","LIB_CIV_Citizen_2","LIB_CIV_Citizen_3","LIB_CIV_Citizen_4","LIB_CIV_Citizen_5","LIB_CIV_Citizen_6","LIB_CIV_Citizen_7","LIB_CIV_Citizen_8","LIB_CIV_Doctor","LIB_CIV_Functionary_3","LIB_CIV_Functionary_2","LIB_CIV_Functionary_4","LIB_CIV_Villager_4","LIB_CIV_Villager_1","LIB_CIV_Villager_2","LIB_CIV_Villager_3","LIB_CIV_Woodlander_1","LIB_CIV_Woodlander_3","LIB_CIV_Woodlander_2","LIB_CIV_Woodlander_4","LIB_CIV_SchoolTeacher","LIB_CIV_SchoolTeacher_2","LIB_CIV_Rocker","LIB_CIV_Worker_3","LIB_CIV_Worker_1","LIB_CIV_Worker_4","LIB_CIV_Worker_2"]
		};
	};

////////////////////////////////////
//      CIVILLIAN VEHICLES       ///
////////////////////////////////////
diag_log format ["%1: [Antistasi]: initVar | Building Vehicle list.",servertime];
arrayCivVeh = if !(hasIFA) then
	{
	["C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_fuel_F","C_Van_01_transport_F","C_Truck_02_transport_F","C_Truck_02_covered_F","C_Offroad_02_unarmed_F"];
	}
else
	{
	["LIB_DAK_OpelBlitz_Open","LIB_GazM1","LIB_GazM1_dirty","LIB_DAK_Kfz1","LIB_DAK_Kfz1_hood"];
	};
civBoats = if !(hasIFA) then {["C_Boat_Civil_01_F","C_Scooter_Transport_01_F","C_Boat_Transport_02_F","C_Rubberboat"]} else {[]};

////////////////////////////////////
//     ID LIST FOR UNIT NAMES    ///
////////////////////////////////////
if !(hasIFA) then
	{
	arrayids = ["Anthis","Costa","Dimitirou","Elias","Gekas","Kouris","Leventis","Markos","Nikas","Nicolo","Panas","Rosi","Samaras","Thanos","Vega"];
	if (isMultiplayer) then {arrayids = arrayids + ["protagonista"]};
	};

//////////////////////////////////////
//      GROUPS CLASSIFICATION      ///
//////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Assigning Squad Types.",servertime];
//Rebel Unit Tiers
REBELunitsTIER1 = SDKMil + [staticCrewTeamPlayer] + SDKMG + SDKGL + SDKATman;
REBELunitsTIER2 = SDKMedic + SDKExp + SDKEng;
REBELunitsTIER3 = SDKSL + SDKSniper;
REBELunitsALL = REBELunitsTIER1 + REBELunitsTIER2 + REBELunitsTIER3;
//Rebel Groups
REBELgroupFIRETEAM = [SDKSL,SDKGL,SDKMG,SDKMil];
REBELgroupAT = [SDKSL,SDKMG,SDKATman,SDKATman,SDKATman];
REBELgroupSQUAD = [SDKSL,SDKGL,SDKMil,SDKMG,SDKMil,SDKATman,SDKMil,SDKMedic];
REBELgroupSQUADengineer = [SDKSL,SDKGL,SDKMil,SDKMG,SDKExp,SDKATman,SDKEng,SDKMedic];
REBELgroupSQUADsupport = [SDKSL,SDKGL,SDKMil,SDKMG,SDKATman,SDKMedic,[staticCrewTeamPlayer,staticCrewTeamPlayer],[staticCrewTeamPlayer,staticCrewTeamPlayer]];
REBELgroupSNIPER = [SDKSniper,SDKSniper];
REBELgroupSENTRY = [SDKGL,SDKMil];

squadLeaders = SDKSL + [(NATOSquad select 0),(NATOSpecOp select 0),(CSATSquad select 0),(CSATSpecOp select 0),(FIASquad select 0)];
medics = SDKMedic + [(FIAsquad select ((count FIAsquad)-1)),(NATOSquad select ((count NATOSquad)-1)),(NATOSpecOp select ((count NATOSpecOp)-1)),(CSATSquad select ((count CSATSquad)-1)),(CSATSpecOp select ((count CSATSpecOp)-1))];
//Define Sniper Groups and Units
sniperGroups = [groupsNATOSniper,groupsCSATSniper];
sniperUnits = ["O_T_Soldier_M_F","O_T_Sniper_F","O_T_ghillie_tna_F","O_V_Soldier_M_ghex_F","B_CTRG_Soldier_M_tna_F","B_T_soldier_M_F","B_T_Sniper_F","B_T_ghillie_tna_F"] + SDKSniper + [FIAMarksman,NATOMarksman,CSATMarksman];
//Do we need this anymore? unit classes should be set by template, not here.....
if (hasRHS) then {sniperUnits = sniperUnits + ["rhsusf_socom_marsoc_sniper","rhs_vdv_marksman_asval"]};

////////////////////////////////////
//   CLASSING TEMPLATE VEHICLES  ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Assigning vehicle Types",servertime];
vehNormal = vehNATONormal + vehCSATNormal + [vehFIATruck,vehSDKTruck,vehSDKLightArmed,vehSDKBike ,rebelVehRepair];
vehBoats = [vehNATOBoat,vehCSATBoat,vehSDKBoat];
vehAttack = vehNATOAttack + vehCSATAttack;
vehPlanes = vehNATOAir + vehCSATAir + [rebelVehPlane];
vehAttackHelis = vehCSATAttackHelis + vehNATOAttackHelis;
vehFixedWing = [vehNATOPlane,vehNATOPlaneAA,vehCSATPlane,vehCSATPlaneAA,rebelVehPlane] + vehNATOTransportPlanes + vehCSATTransportPlanes;
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
REBELvehALL = [vehSDKBike ,vehSDKLightArmed,SDKMGStatic,vehSDKLightUnarmed,vehSDKTruck,vehSDKBoat,SDKMortar,staticATteamPlayer,staticAAteamPlayer,vehSDKRepair];

////////////////////////////////////
//        BUILDINGS LISTS        ///
////////////////////////////////////
listMilBld = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_HelipadSquare_F"];
listbld = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F"];
UPSMON_Bld_remove = ["Bridge_PathLod_base_F","Land_Slum_House03_F","Land_Bridge_01_PathLod_F","Land_Bridge_Asphalt_PathLod_F","Land_Bridge_Concrete_PathLod_F","Land_Bridge_HighWay_PathLod_F","Land_Bridge_01_F","Land_Bridge_Asphalt_F","Land_Bridge_Concrete_F","Land_Bridge_HighWay_F","Land_Canal_Wall_Stairs_F","warehouse_02_f","cliff_wall_tall_f","cliff_wall_round_f","containerline_02_f","containerline_01_f","warehouse_01_f","quayconcrete_01_20m_f","airstripplatform_01_f","airport_02_terminal_f","cliff_wall_long_f","shop_town_05_f","Land_ContainerLine_01_F"];
//Lights and Lamps array used for 'Blackout'
lamptypes = ["Lamps_Base_F", "PowerLines_base_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampHarbour_F","Land_LampShabby_F","Land_NavigLight","Land_runway_edgelight","Land_PowerPoleWooden_L_F"];

////////////////////////////////////
//     SOUNDS AND ANIMATIONS     ///
////////////////////////////////////
dogSounds = ["Music\dog_bark01.wss", "Music\dog_bark02.wss", "Music\dog_bark03.wss", "Music\dog_bark04.wss", "Music\dog_bark05.wss","Music\dog_maul01.wss","Music\dog_yelp01.wss","Music\dog_yelp02.wss","Music\dog_yelp03.wss"];
injuredSounds =
[
	"a3\sounds_f\characters\human-sfx\Person0\P0_moan_13_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_14_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_15_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_16_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_17_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_18_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_20_words.wss",
	"a3\sounds_f\characters\human-sfx\Person1\P1_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_20_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_21_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_22_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_23_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_24_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_25_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_26_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_27_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_28_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_29_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_30_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_31_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_32_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_33_words.wss",
	"a3\sounds_f\characters\human-sfx\Person2\P2_moan_19_words.wss"
];
medicAnims = ["AinvPknlMstpSnonWnonDnon_medic_1","AinvPknlMstpSnonWnonDnon_medic0","AinvPknlMstpSnonWnonDnon_medic1","AinvPknlMstpSnonWnonDnon_medic2"];

////////////////////////////////////
//     REBEL UNIFORMS LIST       ///
////////////////////////////////////
{
_unit = _x select 0;
_uniform = (getUnitLoadout _unit select 3) select 0;
REBELuniforms pushBackUnique _uniform;
REBELuniformsPM pushBackUnique _uniform;
if (count _x > 1) then
	{
	_unit = _x select 1;
	_uniform = (getUnitLoadout _unit select 3) select 0;
	REBELuniformsPM pushBackUnique _uniform;
	};
} forEach [SDKSniper,SDKATman,SDKMedic,SDKMG,rebelExpSpec,rebelGrenadier,SDKMil,SDKSL,SDKEng,[SDKUnarmed],[staticCrewTeamPlayer]];

////////////////////////////////////
//      CIV UNIFORMS LIST        ///
////////////////////////////////////
{
_uniform = (getUnitLoadout _x select 3) select 0;
civUniforms pushBackUnique _uniform;
} forEach arrayCivs;

////////////////////////////////////
//      ALL MAGAZINES LIST       ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Building Magazine Pool.",servertime];
_cfgMagazines = configFile >> "cfgmagazines";
for "_i" from 0 to ((count _cfgMagazines) -1) do
	{
	_magazine = _cfgMagazines select _i;
	if (isClass _magazine) then
		{
		_nameX = configName (_magazine);
		allMagazines pushBack _nameX;
		};
	};

////////////////////////////////////
//   ALL WEAPONS/ITEMS LIST      ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Building Weapon list",servertime];
_allPrimaryWeapons = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 1 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allHandGuns = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 2 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allLaunchers = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 4 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allItems = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 131072 } } )
" configClasses ( configFile >> "cfgWeapons" );

////////////////////////////////////
//  ITEM/WEAPON CLASSIFICATION   ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Classing Items.",servertime];
_alreadyChecked = [];
{
_nameX = configName _x;
_nameX = [_nameX] call BIS_fnc_baseWeapon;
if (not(_nameX in _alreadyChecked)) then
	{
	_magazines = getArray (configFile / "CfgWeapons" / _nameX / "magazines");
	_alreadyChecked pushBack _nameX;
	_item = [_nameX] call BIS_fnc_itemType;
	_itemType = _item select 1;
	switch (_itemType) do
		{
		case "AssaultRifle": {arifles pushBack _nameX};
		case "MachineGun": {mguns pushBack _nameX};
		case "SniperRifle": {srifles pushBack _nameX};
		case "Handgun": {hguns pushBack _nameX};
		case "MissileLauncher": {mlaunchers pushBack _nameX};
		case "RocketLauncher": {rlaunchers pushBack _nameX};
		case "Headgear": {helmets pushBack _nameX};
		case "Vest": {vests pushBack _nameX};
		case "AccessoryMuzzle": {attachmentMuzzle pushBack _nameX};
		case "AccessoryPointer": {attachmentPointer pushBack _nameX};
		case "AccessorySights": {attachmentOptics pushBack _nameX};
		case "AccessoryBipod": {attachmentBipod pushBack _nameX};
		case "NVGoggles": {NVGoggles pushBack _nameX};
		};
	};
} forEach _allPrimaryWeapons + _allHandGuns + _allLaunchers + _allItems;

////////////////////////////////////
//   ARMORED VESTS LIST          ///
////////////////////////////////////
//WHY is there no clean list?
armoredVests = vests select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") > 5};

////////////////////////////////////
//   ARMORED HELMETS LIST        ///
////////////////////////////////////
//WHY is there no clean list?
armoredHelmets = helmets select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 2};

////////////////////////////////////
//      ACE ITEMS LIST           ///
////////////////////////////////////
if (hasACE) then
	{
	aceItems = [
		"ACE_EarPlugs",
		"ACE_RangeCard",
		"ACE_Clacker",
		"ACE_M26_Clacker",
		"ACE_DeadManSwitch",
		"ACE_DefusalKit",
		"ACE_MapTools",
		"ACE_Flashlight_MX991",
		"ACE_wirecutter",
		"ACE_RangeTable_82mm",
		"ACE_EntrenchingTool",
		"ACE_Cellphone",
		"ACE_CableTie",
		"ACE_SpottingScope",
		"ACE_Tripod",
		"ACE_Chemlight_HiWhite",
		"ACE_Chemlight_HiRed",
		"ACE_acc_pointer_green",
		"ACE_HandFlare_White",
		"ACE_HandFlare_Red",
		"ACE_Spraypaintred"
	];
	if (hasACEMedical) then
		{
		aceBasicMedItems = [
			"ACE_fieldDressing",
			"ACE_bloodIV_500",
			"ACE_bloodIV",
			"ACE_epinephrine",
			"ACE_morphine",
			"ACE_bodyBag"
		];
		aceAdvMedItems = [
			"ACE_elasticBandage",
			"ACE_quikclot",
			"ACE_bloodIV_250",
			"ACE_packingBandage",
			"ACE_plasmaIV",
			"ACE_plasmaIV_500",
			"ACE_plasmaIV_250",
			"ACE_salineIV",
			"ACE_salineIV_500",
			"ACE_salineIV_250",
			"ACE_surgicalKit",
			"ACE_tourniquet",
			"ACE_adenosine",
			"ACE_atropine"
		];
		};
	publicVariable "aceItems";
	if (hasACEMedical) then
		{
		publicVariable "aceBasicMedItems";
		publicVariable "aceAdvMedItems";
		};
	};

//Begin Loot Lists

////////////////////////////////////
//   DEFENDER WEAPONS AND AMMO   ///
////////////////////////////////////
//Creates the list of weapons and ammo for DEFENDER loot crates
{
{
_typeX = _x;
if !(_typeX in _checked) then
	{
	_checked pushBack _typeX;
	_loadout = getUnitLoadout _typeX;
	for "_i" from 0 to 2 do
		{
		if !(_loadout select _i isEqualTo []) then
			{
				_weapon = [((_loadout select _i) select 0)] call BIS_fnc_baseWeapon;
				if !(_weapon in weaponsDEFENDER) then {weaponsDEFENDER pushBack _weapon};
			};
		};
	};
} forEach _x;
} forEach groupsNATOmid + [NATOSpecOp] + groupsNATOSquad;

{
_nameX = [_x] call BIS_fnc_baseWeapon;
_magazines = getArray (configFile / "CfgWeapons" / _nameX / "magazines");
ammoDEFENDER pushBack (_magazines select 0);
} forEach weaponsDEFENDER;

////////////////////////////////////
//   INVADER WEAPONS AND AMMO    ///
////////////////////////////////////
//Creates the list of weapons and ammo for INVADER loot crates
_checked = [];
{
{
_typeX = _x;
if !(_typeX in _checked) then
	{
	_checked pushBack _typeX;
	_loadout = getUnitLoadout _typeX;
	for "_i" from 0 to 2 do
		{
		if !(_loadout select _i isEqualTo []) then
			{
				_weapon = [((_loadout select _i) select 0)] call BIS_fnc_baseWeapon;
				if !(_weapon in weaponsINVADER) then {weaponsINVADER pushBack _weapon};
			};
		};
	};
} forEach _x;
} forEach groupsCSATmid + [CSATSpecOp] + groupsCSATSquad;

{
_nameX = [_x] call BIS_fnc_baseWeapon;
_magazines = getArray (configFile / "CfgWeapons" / _nameX / "magazines");
ammoINVADER pushBack (_magazines select 0);
} forEach weaponsINVADER;

////////////////////////////////////
//   WEAPON ATTACHMENTS LIST     ///
////////////////////////////////////
{
{
_item = _x;
if !(_item in (opticsAAF + flashLights + pointers)) then
	{
	if (isCLass(configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "OpticsModes")) then
		{
		opticsAAF pushBack _item
		}
	else
		{
		if (isClass (configfile >> "CfgWeapons" >> _item >> "ItemInfo" >> "FlashLight" >> "Attenuation")) then
			{
			flashLights pushBack _item;
			}
		else
			{
			if (isClass (configfile >> "CfgWeapons" >> _item >> "ItemInfo" >> "Pointer")) then
				{
				pointers pushBack _item;
				};
			};
		};
	};
} forEach (_x call BIS_fnc_compatibleItems);
} forEach (weaponsDEFENDER + weaponsINVADER);

////////////////////////////////////
//   SMOKE GRENADES LIST         ///
////////////////////////////////////
//THIS LIST IS USED BY LOOT CRATES AND AI CURRENTLY
smokeX = ["SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellBlue","SmokeShellYellow","SmokeShellPurple","SmokeShellOrange"];

////////////////////////////////////
//   CHEMLIGHTS LIST             ///
////////////////////////////////////
//Chemlight loot for crates
//this is an ugly list of vanilla chems I made myself - PBP
chemX = ["Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue"];

////////////////////////////////////
//       REBEL LOOT ITEMS        ///
////////////////////////////////////
//These items occupy the general items slot of loot crates
itemsAAF =
	[
	"Laserbatteries",
	"MineDetector",
	"muzzle_snds_H",
	"muzzle_snds_L",
	"muzzle_snds_M",
	"muzzle_snds_B",
	"muzzle_snds_H_MG",
	"muzzle_snds_acp",
	"muzzle_snds_338_green",
	"muzzle_snds_93mmg_tan",
	"bipod_03_F_oli",
	"Rangefinder",
	"Laserdesignator",
	"ItemGPS",
	"acc_pointer_IR",
	"ItemRadio"
	];

if (hasRHS and !hasIFA) then
	{
	//RHS Loot Items
	itemsAAF =
		[
		"MineDetector",
		"ItemGPS",
		"acc_pointer_IR",
		"ItemRadio"
		];
	}
	else
		{
		if (hasIFA) then
			{
			//IFA Loot Items
			itemsAAF =
				[
				"LIB_ToolKit"
				];
			};
		};

////////////////////////////////////
//     PLACED EXPLOSIVES LOOT    ///
////////////////////////////////////
//This is the ONLY SOURCE of mines loot for crates
minesAAF =
	[
	"SLAMDirectionalMine_Wire_Mag",
	"SatchelCharge_Remote_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"ATMine_Range_Mag","APERSTripMine_Wire_Mag",
	"APERSMine_Range_Mag",
	"APERSBoundingMine_Range_Mag"
	];

if (hasRHS and !hasIFA) then
	{
	//RHS MINE LOOT
	minesAAF =
		["rhsusf_m112_mag",
		"rhsusf_mine_m14_mag",
		"rhs_mine_M19_mag",
		"rhs_mine_tm62m_mag",
		"rhs_mine_pmn2_mag"
		];
	}
	else
		{
		if (hasIFA) then
			{
			//IFA MINE LOOT
			minesAAF =
				["LIB_PMD6_MINE_mag",
				"LIB_TM44_MINE_mag",
				"LIB_US_TNT_4pound_mag"
				];
			};
		};

////////////////////////////////////
//   REBEL FACTION LAUNCHERS     ///
////////////////////////////////////
//These launchers will be IN ADDITION TO whatever launchers enemies carry
antitankAAF =
	[
	"launch_I_Titan_F",
	"launch_I_Titan_short_F"
	];
if (hasIFA) then
	{
	antitankAAF =
		["LIB_Shg24"];
	};
if (hasRHS) then
	{
	antitankAAF =
		[];
	};

////////////////////////////////////
//      REBEL STARTING ITEMS     ///
////////////////////////////////////
//These items will be unlocked when the mission starts
unlockedItems =
	[
	"ItemMap",
	"ItemWatch",
	"ItemCompass",
	"FirstAidKit",
	"Medikit",
	"ToolKit",
	"H_Booniehat_khk",
	"H_Booniehat_oli",
	"H_Booniehat_grn",
	"H_Booniehat_dirty",
	"H_Cap_oli",
	"H_Cap_blk",
	"H_MilCap_rucamo",
	"H_MilCap_gry",
	"H_BandMask_blk",
	"H_Bandanna_khk",
	"H_Bandanna_gry",
	"H_Bandanna_camo",
	"H_Shemag_khk",
	"H_Shemag_tan",
	"H_Shemag_olive",
	"H_ShemagOpen_tan",
	"H_Beret_grn",
	"H_Beret_grn_SF",
	"H_Watchcap_camo",
	"H_TurbanO_blk",
	"H_Hat_camo",
	"H_Hat_tan",
	"H_Beret_blk",
	"H_Beret_red",
	"H_Watchcap_khk",
	"G_Balaclava_blk",
	"G_Balaclava_combat",
	"G_Balaclava_lowprofile",
	"G_Balaclava_oli",
	"G_Bandanna_beast",
	"G_Tactical_Black",
	"G_Aviator",
	"G_Shades_Black",
	"acc_flashlight"
	];
	
	unlockedItems append REBELuniformsPM;
	unlockedItems append civUniforms;
	unlockeditems append unlockedVEST;

//IFA Starting Unlocks
if (hasIFA) then
	{
	unlockedItems =
		[
		"ItemMap",
		"ItemWatch",
		"ItemCompass",
		"FirstAidKit",
		"Medikit",
		"ToolKit",
		//do we need both tookits?
		"LIB_ToolKit",
		"H_LIB_CIV_Villager_Cap_1",
		"H_LIB_CIV_Worker_Cap_2",
		"G_LIB_Scarf2_B",
		"G_LIB_Mohawk"
		];

	unlockedItems append REBELuniformsPM;
	unlockedItems append civUniforms;
	};

////////////////////////////////////
//RHS WEAPON ATTACHMENTS REDUCER ///
////////////////////////////////////
if (hasRHS) then
	{
	opticsAAF = opticsAAF select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
	flashlights = flashlights select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
	pointers = pointers select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
	};

////////////////////////////////////
//   ACE ITEMS MODIFICATIONS     ///
////////////////////////////////////
if (hasACE) then
	{
	//additional starting items
	unlockedItems append aceItems;
	//Fix for bad ammo types in loot crates
	ammoDEFENDER = ammoDEFENDER - ["ACE_PreloadedMissileDummy"];
	ammoINVADER = ammoINVADER - ["ACE_PreloadedMissileDummy"];
	};

//ACE medical starting items
if (hasACEMedical) then {
	switch (ace_medical_level) do {
		case 1: {
			unlockedItems append aceBasicMedItems;
		};
		case 2: {
			unlockedItems = unlockedItems + aceBasicMedItems + aceAdvMedItems;
		};
	};
};
//ACE items when IFA isnt detected
if (hasACE and !hasIFA) then
	{
	// add ace mine detectors to crates
	weaponsDEFENDER pushBack ["ACE_VMH3","ACE_VMM3"];
	weaponsINVADER pushBack ["ACE_VMH3","ACE_VMM3"];
	itemsAAF append ["ACE_acc_pointer_green_IR","ACE_Chemlight_Shield"];
	//remove vanilla mine detector
	itemsAAF = itemsAAF - ["MineDetector"];
	weaponsINVADER = weaponsINVADER - ["MineDetector"];
	weaponsDEFENDER = weaponsDEFENDER - ["MineDetector"];
	//add ACE chem and smoke
	chemX append ["ACE_Chemlight_HiOrange","ACE_Chemlight_HiRed","ACE_Chemlight_HiYellow","ACE_Chemlight_HiWhite","ACE_Chemlight_Orange","ACE_Chemlight_White","ACE_Chemlight_IR"];
	smokeX append ["ACE_HandFlare_White","ACE_HandFlare_Red","ACE_HandFlare_Green","ACE_HandFlare_Yellow"];
	};

////////////////////////////////////
//   IFA ITEMS MODIFICATIONS     ///
////////////////////////////////////
if (hasIFA) then
	{
	smokeX = ["LIB_RDG","LIB_NB39"];	//Resets Smoke Greandes
	chemX = [];					//Clears all chems
	helmets = [];					//Clears all Helmets
	NVGoggles = [];				//Clears NVG's
	};

////////////////////////////////////
// ACE + IFA ITEMS MODIFICATIONS ///
////////////////////////////////////
//IF you have ACE but NOT IFA
if (hasACE and !hasIFA) then
	{
	//additonal unlocks
	unlockedBackpacks pushBackUnique "ACE_TacticalLadder_Pack";
	unlockedWeapons pushBackUnique "ACE_VMH3";
	itemsAAF append ["ACE_Kestrel4500","ACE_ATragMX","ACE_M84"];
	};

//IF you have both ACE AND IFA
if (hasACE and hasIFA) then
	{
	itemsAAF append ["ACE_LIB_LadungPM","ACE_SpareBarrel"];
	};

////////////////////////////////////
//     ACRE ITEM MODIFICATIONS   ///
////////////////////////////////////
unlockedItems append ["ACRE_PRC343","ACRE_PRC148","ACRE_PRC152","ACRE_PRC77","ACRE_PRC117F"];

////////////////////////////////////
//     TFAR ITEM MODIFICATIONS   ///
////////////////////////////////////
if (hasTFAR) then {unlockedItems append ["tf_microdagr","tf_rf7800str"];};
if (startLR) then {unlockedBackpacks pushBack "tf_anprc155"};

////////////////////////////////////
//     MISSION PATH WARNING      ///
////////////////////////////////////
_getMissionPath = [] execVM "initGetMissionPath.sqf";
waitUntil
{
	if (scriptDone _getMissionPath) then {true} else
	{
		hint "Stuck on compiling missionPath, re-launch the mission.";
		false;
	}
};
hint "Done compiling missionPath";

////////////////////////////////////
//   STOPS ANY NON HOST PLAYER   ///
////////////////////////////////////
if (!isServer and hasInterface) exitWith {};

////////////////////////////////////
//   SERVER AND HOST VARIABLES   ///
////////////////////////////////////
difficultyCoef = if !(isMultiplayer) then {0} else {floor ((({side group _x == teamPlayer} count playableUnits) - ({side group _x != teamPlayer} count playableUnits)) / 5)};
AAFpatrols = 0;
reinfPatrols = 0;
smallCAmrk = [];
smallCApos = [];
bigAttackInProgress = false;
chopForest = false;
distanceForAirAttack = 10000;
distanceForLandAttack = if (hasIFA) then {5000} else {3000};

////////////////////////////////////
//     VEHICLE SPAWN POINTS      ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Setting Vehicle Spawn Points.",servertime];
if (worldName == "Tanoa") then
	{
	roadsMrk = ["road","road_1","road_2","road_3","road_4","road_5","road_6","road_7","road_8","road_9","road_10","road_11","road_12","road_13","road_14","road_15","road_16"];
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
	}
else
	{
	if (worldName == "Altis") then
		{
		roadsMrk = ["road","road_1","road_2","road_3","road_4","road_5","road_6","road_7","road_8","road_9","road_10","road_11","road_12","road_13","road_14","road_15","road_16","road_17","road_18","road_19","road_20","road_21","road_22","road_23","road_24","road_25","road_26","road_27","road_28","road_29","road_30","road_31","road_32","road_33","road_34","road_35","road_36","road_37","road_38","road_39","road_40","road_41","road_42"];
		{_x setMarkerAlpha 0} forEach roadsMrk;
		roadsX setVariable ["airport",[[[21175.06,7369.336,0],62.362,"Tank"],[[21178.89,7361.573,0.421],62.36,"Tank"],[[20961.332,7295.678,0],0,"Mort"],[[20956.143,7295.142,0],0,"Mort"],[[20961.1,7290.02,0.262632],0,"Mort"]]];
        	roadsX setVariable ["airport_1",[[[23044.8,18745.7,0.0810001],88.275,"Tank"],[[23046.8,18756.8,0.0807302],88.275,"Tank"],[[23214.8,18859.5,0],267.943,"Tank"],[[22981.2,18903.9,0],0,"Mort"],[[22980.1,18907.5,0.553066],0,"Mort"]]];
        	roadsX setVariable ["airport_2",[[[26803.1,24727.7,0.0629988],359.958,"Mort"],[[26809,24728.2,0.03755],359.986,"Mort"],[[26815.2,24729,0.0384922],359.972,"Mort"],[[26821.3,24729.1,0.0407047],359.965,"Mort"],[[26769.1,24638.7,0.290344],131.324,"Tank"],[[26774.2,24643.9,0.282555],134.931,"Tank"]]];
        	roadsX setVariable ["airport_3",[[[14414.9,16327.8,-0.000991821],207.397,"Tank"],[[14471.9,16383.2,0.0378571],359.939,"Mort"],[[14443,16379.2,0.0369205],359.997,"Mort"],[[14449.4,16376.9,0.0369892],359.996,"Mort"],[[14458,16375.9,0.0369167],359.997,"Mort"],[[14447.2,16397.1,3.71081],269.525,"MG"],[[14472.3,16312,12.1993],317.315,"MG"],[[14411,16229,0.000303268],40.6607,"Tank"],[[14404.4,16235,-0.0169964],50.5741,"Tank"],[[14407.2,16331.7,0.0305004],204.588,"Tank"]]];
        	roadsX setVariable ["airport_4",[[[11577.4,11953.6,0.241838],122.274,"Tank"],[[11577.8,11964.3,0.258125],124.324,"Tank"],[[11633.3,11762,0.0372791],359.996,"Mort"],[[11637.3,11768.1,0.043232],0.0110098,"Mort"],[[11637.1,11763.1,0.0394402],0.00529677,"Mort"]],true];
        	roadsX setVariable ["airport_5",[[[9064.02,21531.3,0.00117016],138.075,"Tank"],[[9095.12,21552.8,0.614614],157.935,"Tank"],[[9030.28,21531.1,0.261349],157.935,"Mort"],[[9033.91,21534.7,0.295588],157.935,"Mort"]]];
		}
	else
		{
		roadsMrk = ["road","road_1","road_2","road_3","road_4","road_5","road_6","road_7","road_8","road_9","road_10","road_11","road_12","road_13","road_14","road_15","road_16","road_17","road_18","road_19","road_20","road_21","road_22","road_23","road_24","road_25","road_26","road_27","road_28","road_29","road_30","road_31","road_32","road_33","road_34","road_35","road_36","road_37","road_38"];
		{_x setMarkerAlpha 0} forEach roadsMrk;
		roadsX setVariable ["airport",[[[12191.2,12605.8,9.43077],0,"MG"],[[12194.2,12599.4,13.3954],0,"AA"],[[12141,12609,0.00088501],0,"Mort"],[[12144.3,12615.9,0],0,"Mort"],[[12156.5,12614.3,0],0,"Mort"],[[12170,12595.9,0.000305176],250.234,"AT"],[[12070.4,12656,0.0098114],23.5329,"Tank"],[[12022.5,12670.9,0.0098114],18.9519,"Tank"]]];
        	roadsX setVariable ["airport_1",[[[4782.75,10251.4,18],0,"AA"],[[4716.17,10215.3,13.1149],278.308,"AA"],[[4713.94,10209.3,9.12177],188.973,"MG"],[[4787.34,10248.9,4.99982],188.303,"MG"],[[4740.75,10333.2,20.3206],232.414,"MG"],[[4818.39,10200.1,0.00982666],239.625,"Tank"],[[4765.22,10330.8,0],0,"Mort"],[[4758.21,10328.1,0],0,"Mort"],[[4751.45,10324.4,0],0,"Mort"],[[4745.39,10320.6,0],0,"Mort"],[[4739.97,10283.2,0.00567627],291.41,"AT"],[[4814.19,10245.1,0.00567627],211.414,"AT"],[[4841.34,10158.9,0.0102844],240.137,"Tank"],[[4865.7,10116.7,0.00970459],239.499,"Tank"],[[4888.33,10074.2,0.00982666],235.077,"Tank"]]];
        	roadsX setVariable ["airport_2",[[[4717.95,2595.24,12.9766],0,"AA"],[[4714.27,2590.97,8.97349],176.197,"MG"],[[4743.55,2567.69,0.0130215],207.155,"Tank"],[[4775.62,2547.37,0.00691605],210.579,"Tank"],[[4719.88,2582.34,0.00566483],261.79,"AT"],[[4826.5,2558.35,0.00150108],0,"Mort"],[[4821.12,2550.32,0.00147152],0,"Mort"],[[4816.59,2543.65,0.00147247],0,"Mort"],[[4812.77,2518.77,0.00566483],150.397,"AT"]]];
		};
	};

if (!isServer) exitWith {};
////////////////////////////////////
//    UNIT AND VEHICLE PRICES    ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Building Pricelist.",servertime];
{server setVariable [_x,50,true]} forEach SDKMil;
{server setVariable [_x,75,true]} forEach (REBELunitsTIER1 - SDKMil);
{server setVariable [_x,100,true]} forEach  REBELunitsTIER2;
{server setVariable [_x,150,true]} forEach REBELunitsTIER3;
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
{server setVariable [_x,400,true]} forEach [rebelStaticMG,vehSDKBoat,rebelVehRepair];			//400
{server setVariable [_x,800,true]} forEach [rebelMortar,rebelStaticAT,rebelStaticAA];			//800

////////////////////////////////////
//        SERVER VARIABLES       ///
////////////////////////////////////
server setVariable ["hr",8,true];														//initial HR value
server setVariable ["resourcesFIA",1000,true];											//Initial FIA money pool value
skillFIA = 0;																		//Initial skill level for FIA soldiers
prestigeNATO = 5;																	//Initial Prestige NATO
prestigeCSAT = 5;																	//Initial Prestige CSAT
prestigeOPFOR = 50;																	//Initial % support for NATO on each city
if (SkillMult == 2) then {prestigeOPFOR = 75};											//if you play on vet, this is the number
prestigeBLUFOR = 0;																	//Initial % FIA support on each city
countCA = 600;																		//600
bombRuns = 0;
cityIsSupportChanging = false;
resourcesIsChanging = false;
savingServer = false;
revealX = false;
prestigeIsChanging = false;
markersChanging = [];
staticsToSave = [];
napalmCurrent = false;
tierWar = 1;
haveNV = false;
zoneCheckInProgress = false;
garrisonIsChanging = false;
playerHasBeenPvP = [];
missionsX = []; publicVariable "missionsX";
movingMarker = false;
garageIsUsed = false;
vehInGarage = [];
destroyedBuildings = [];
reportedVehs = [];

////////////////////////////////////
//    MAP MARKERS AND ROADS DB   ///
////////////////////////////////////
if (worldName == "Tanoa") then
	{
	{server setVariable [_x select 0,_x select 1]} forEach [["Lami01",277],["Lifou01",350],["Lobaka01",64],["LaFoa01",38],["Savaka01",33],["Regina01",303],["Katkoula01",413],["Moddergat01",195],["Losi01",83],["Tanouka01",380],["Tobakoro01",45],["Georgetown01",347],["Kotomo01",160],["Rautake01",113],["Harcourt01",325],["Buawa01",44],["SaintJulien01",353],["Balavu01",189],["Namuvaka01",45],["Vagalala01",174],["Imone01",31],["Leqa01",45],["Blerick01",71],["Yanukka01",189],["OuaOue01",200],["Cerebu01",22],["Laikoro01",29],["Saioko01",46],["Belfort01",240],["Oumere01",333],["Muaceba01",18],["Nicolet01",224],["Lailai01",23],["Doodstil01",101],["Tavu01",178],["Lijnhaven01",610],["Nani01",19],["PetitNicolet01",135],["PortBoise01",28],["SaintPaul01",136],["Nasua01",60],["Savu01",184],["Murarua01",258],["Momea01",159],["LaRochelle01",532],["Koumac01",51],["Taga01",31],["Buabua01",27],["Penelo01",189],["Vatukoula01",15],["Nandai01",130],["Tuvanaka01",303],["Rereki01",43],["Ovau01",226],["IndPort01",420],["Ba01",106]];
	call compile preprocessFileLineNumbers "roadsDB.sqf";
	}
else
	{
	if (worldName == "Altis") then
		{
		call compile preprocessFileLineNumbers "roadsDBAltis.sqf";
		{server setVariable [_x select 0,_x select 1]} forEach [["Therisa",154],["Zaros",371],["Poliakko",136],["Katalaki",95],["Alikampos",115],["Neochori",309],["Stavros",122],["Lakka",173],["AgiosDionysios",84],["Panochori",264],["Topolia",33],["Ekali",9],["Pyrgos",531],["Orino",45],["Neri",242],["Kore",133],["Kavala",660],["Aggelochori",395],["Koroni",32],["Gravia",291],["Anthrakia",143],["Syrta",151],["Negades",120],["Galati",151],["Telos",84],["Charkia",246],["Athira",342],["Dorida",168],["Ifestiona",48],["Chalkeia",214],["AgiosKonstantinos",39],["Abdera",89],["Panagia",91],["Nifi",24],["Rodopoli",212],["Kalithea",36],["Selakano",120],["Frini",69],["AgiosPetros",11],["Feres",92],["AgiaTriada",8],["Paros",396],["Kalochori",189],["Oreokastro",63],["Ioannina",48],["Delfinaki",29],["Sofia",179],["Molos",188]];
		}
	else
		{
		if (worldName == "chernarus_summer") then
			{
			call compile preprocessFileLineNumbers "roadsDBcherna.sqf";
			{server setVariable [_x select 0,_x select 1]} forEach [["vill_NovySobor",129],["city_StarySobor",149],["vill_Guglovo",26],["vill_Vyshnoye",41],["vill_Kabanino",86],["vill_Rogovo",66],["vill_Mogilevka",104],["city_Gorka",115],["vill_Grishino",168],["vill_Shakhovka",55],["vill_Pogorevka",57],["vill_Pulkovo",26],["vill_Nadezhdino",109],["city_Vybor",180],["vill_Polana",118],["vill_Staroye",115],["vill_Dubrovka",86],["vill_Pustoshka",163],["vill_Kozlovka",100],["vill_Pusta",52],["vill_Dolina",83],["vill_Gvozdno",78],["vill_Prigorodki",145],["vill_Drozhino",58],["vill_Sosnovka",54],["vill_Msta",96],["vill_Lopatino",159],["city_Zelenogorsk",280],["vill_Orlovets",65],["city_Berezino",340],["vill_Myshkino",49],["vill_Petrovka",45],["city_Chernogorsk",761],["vill_Bor",46],["vill_Nizhnoye",146],["vill_Balota",147],["vill_Khelm",110],["city_Krasnostav",194],["vill_Komarovo",127],["city_Elektrozavodsk",745],["city_Solnychniy",224],["vill_Kamyshovo",196],["vill_Tulga",35],["vill_Pavlovo",99],["vill_Kamenka",127],["hill_Olsha",20]];
			};
		};
	};

////////////////////////////////////
// DECLARE VARIBALES FOR CLIENTS ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Storing variables.",servertime];

publicVariable "hasACE";
publicVariable "hasTFAR";
publicVariable "hasACRE";
publicVariable "hasACEHearing";
publicVariable "hasACEMedical";
publicVariable "hasADVCPR";
publicVariable "hasADVSplint";

publicVariable "unlockedWeapons";
publicVariable "unlockedRifles";
publicVariable "unlockedItems";
publicVariable "unlockedOptics";
publicVariable "unlockedBackpacks";
publicVariable "unlockedMagazines";
publicVariable "unlockedMG";
publicVariable "unlockedGL";
publicVariable "unlockedSN";
publicVariable "unlockedAT";
publicVariable "unlockedAA";
publicVariable "unlockedRifles";

publicVariable "civPerc"
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

if (isMultiplayer) then {[[petros,"hint","Variables Init Completed"],"A3A_fnc_commsMP"] call BIS_fnc_MP;};
diag_log format ["%1: [Antistasi] | INFO | initVar Completed.",servertime];
