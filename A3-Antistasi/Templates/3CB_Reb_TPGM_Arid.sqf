////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////

nameTeamPlayer = "TPGM";
SDKFlag = "Flag_TKM_B";
SDKFlagTexture = "uk3cb_factions\addons\uk3cb_factions_tkm\flag\tkm_b_flag_co.paa";
typePetros = "UK3CB_TKM_B_WAR";


////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//First Entry is Guerilla, Second Entry is Para/Military
staticCrewTeamPlayer = "UK3CB_TKM_B_RIF_1";
SDKUnarmed = "UK3CB_TKC_B_SPOT";
SDKSniper = ["UK3CB_TKM_B_SPOT","UK3CB_TKM_B_SNI"];
SDKATman = ["UK3CB_TKM_B_LAT","UK3CB_TKM_B_AT"];
SDKMedic = ["UK3CB_TKC_B_DOC","UK3CB_TKM_B_MD"];
SDKMG = ["UK3CB_TKM_B_AR","UK3CB_TKM_B_MG"];
SDKExp = ["UK3CB_TKM_B_IED","UK3CB_TKM_B_DEM"];
SDKGL = ["UK3CB_TKM_B_GL","UK3CB_TKM_B_GL"];
SDKMil = ["UK3CB_TKM_B_RIF_1","UK3CB_TKM_B_RIF_2"];
SDKSL = ["UK3CB_TKM_B_TL","UK3CB_TKM_B_SL"];
SDKEng = ["UK3CB_TKM_B_ENG","UK3CB_TKM_B_ENG"];

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
groupsSDKmid = [SDKSL,SDKGL,SDKMG,SDKMil];
groupsSDKAT = [SDKSL,SDKMG,SDKATman,SDKATman,SDKATman];
groupsSDKSquad = [SDKSL,SDKGL,SDKMil,SDKMG,SDKMil,SDKATman,SDKMil,SDKMedic];
groupsSDKSquadEng = [SDKSL,SDKGL,SDKMil,SDKMG,SDKExp,SDKATman,SDKEng,SDKMedic];
groupsSDKSquadSupp = [SDKSL,SDKGL,SDKMil,SDKMG,SDKATman,SDKMedic,[staticCrewTeamPlayer,staticCrewTeamPlayer],[staticCrewTeamPlayer,staticCrewTeamPlayer]];
groupsSDKSniper = [SDKSniper,SDKSniper];
groupsSDKSentry = [SDKGL,SDKMil];

//Rebel Unit Tiers (for costs)
sdkTier1 = SDKMil + [staticCrewTeamPlayer] + SDKMG + SDKGL + SDKATman;
sdkTier2 = SDKMedic + SDKExp + SDKEng;
sdkTier3 = SDKSL + SDKSniper;
soldiersSDK = sdkTier1 + sdkTier2 + sdkTier3;

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
vehSDKBike = "B_G_Quadbike_01_F";
vehSDKLightArmed = "UK3CB_TKM_B_Hilux_Pkm";
vehSDKAT = "UK3CB_TKM_I_LR_SPG9";
vehSDKLightUnarmed = "UK3CB_TKM_B_Datsun_Pkm";//Otherwise it would be an exact match of the civ one. Dumb confusion is dumb.
vehSDKTruck = "UK3CB_TKM_B_V3S_Open";
//vehSDKHeli = "rhsgref_ins_g_Mi8amt";
vehSDKPlane = "UK3CB_TKC_B_Antonov_AN2";
vehSDKBoat = "UK3CB_TKA_B_RHIB_Gunboat";
vehSDKRepair = "UK3CB_TKM_B_V3S_Repair";

//Civilian Vehicles
civCar = "UK3CB_C_Hilux_Open";
civTruck = "UK3CB_CHC_C_V3S_Recovery";
civHeli = "UK3CB_CHC_C_Mi8AMT";
civBoat = "C_Rubberboat";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Static Weapons
SDKMGStatic = "UK3CB_TKM_B_NSV";
staticATteamPlayer = "UK3CB_TKM_B_SPG9";
staticAAteamPlayer = "UK3CB_TKM_B_ZU23";
SDKMortar = "UK3CB_TKM_B_2b14_82mm";
SDKMortarHEMag = "rhs_mag_3vo18_10";
SDKMortarSmokeMag = "rhs_mag_d832du_10";

//Static Weapon Bags
MGStaticSDKB = "RHS_NSV_Gun_Bag";
ATStaticSDKB = "RHS_SPG9_Gun_Bag";
AAStaticSDKB = "I_AA_01_weapon_F";
MortStaticSDKB = "RHS_Podnos_Gun_Bag";
//Short Support
supportStaticSDKB = "RHS_SPG9_Tripod_Bag";
//Tall Support
supportStaticsSDKB2 = "RHS_NSV_Tripod_Bag";
//Mortar Support
supportStaticsSDKB3 = "RHS_Podnos_Bipod_Bag";

////////////////////////////////////
//             ITEMS             ///
////////////////////////////////////
//Mines
ATMineMag = "rhs_mine_smine35_press_mag";
APERSMineMag = "rhs_mine_pmn2_mag";

//Breaching explosives
//Breaching APCs needs one demo charge
breachingExplosivesAPC = [["rhs_ec200_mag", 1], ["rhs_ec200_sand_mag", 1], ["rhsusf_m112_mag", 1]];
//Breaching tanks needs one satchel charge or two demo charges
breachingExplosivesTank = [["rhs_ec400_mag", 1], ["rhs_ec400_sand_mag", 1], ["rhs_ec200_mag", 2], ["rhs_ec200_sand_mag", 2], ["rhsusf_m112x4_mag", 1], ["rhs_charge_M2tet_x2_mag", 1]];

//Starting Unlocks
initialRebelEquipment append ["UK3CB_BAF_L9A1","UK3CB_BAF_L117A2"];
initialRebelEquipment append ["UK3CB_Enfield","UK3CB_Enfield_Rail"];
initialRebelEquipment append ["rhs_weap_rpg75"];
initialRebelEquipment append ["UK3CB_BAF_9_13Rnd","UK3CB_BAF_9_15Rnd","UK3CB_Enfield_Mag","rhs_grenade_mkii_mag","rhs_grenade_mki_mag","rhs_mag_rdg2_black","rhs_grenade_m15_mag"];
initialRebelEquipment append ["UK3CB_CHC_C_B_MED","UK3CB_B_Bedroll_Backpack","UK3CB_TKC_C_B_Sidor_MED","UK3CB_CW_SOV_O_LATE_B_Sidor_RIF","UK3CB_CW_SOV_O_EARLY_B_Sidor_RIF"];
initialRebelEquipment append ["UK3CB_V_CW_Chestrig","UK3CB_V_CW_Chestrig_2_Small","UK3CB_V_Belt_KHK","UK3CB_V_Belt_Rig_KHK","UK3CB_V_Belt_Rig_Lite_KHK","UK3CB_V_Pouch","UK3CB_V_Chestrig_TKA_OLI","UK3CB_V_Chestrig_2_Small_OLI","UK3CB_V_Chestrig_TKA_BRUSH","UK3CB_V_Chestrig_Lite_KHK","UK3CB_V_Chestrig_Lite_2_Small_KHK"];
initialRebelEquipment append ["rhs_acc_2dpZenit","Binocular","UK3CB_BAF_Flashlight_L105A1"];
//TKM Uniforms
allRebelUniforms append ["UK3CB_TKM_B_U_01","UK3CB_TKM_B_U_01_B","UK3CB_TKM_B_U_01_C","UK3CB_TKM_B_U_03","UK3CB_TKM_B_U_03_B","UK3CB_TKM_B_U_03_C","UK3CB_TKM_B_U_04","UK3CB_TKM_B_U_04_B","UK3CB_TKM_B_U_04_C","UK3CB_TKM_B_U_05","UK3CB_TKM_B_U_05_B","UK3CB_TKM_B_U_05_C","UK3CB_TKM_B_U_06","UK3CB_TKM_B_U_06_B","UK3CB_TKM_B_U_06_C"];
//TFAR Unlocks
if (hasTFAR) then {initialRebelEquipment append ["tf_microdagr","tf_rf7800str"]};
if (hasTFAR && startWithLongRangeRadio) then {initialRebelEquipment pushBack "tf_rt1523g_big_rhs"};
