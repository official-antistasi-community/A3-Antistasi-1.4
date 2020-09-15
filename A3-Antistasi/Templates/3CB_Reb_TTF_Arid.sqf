////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
nameTeamPlayer = "CCM";
SDKFlag = "Flag_CCM_B";
SDKFlagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CCM\Flag\ccm_i_flag_co.paa";
typePetros = "UK3CB_TKP_I_OFF";

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//First Entry is Guerilla, Second Entry is Para/Military
staticCrewTeamPlayer = "UK3CB_CCM_I_COM";
SDKUnarmed = "UK3CB_CHC_I_SPY";
SDKSniper = ["UK3CB_CCM_I_MK","UK3CB_CCM_I_SNI"];
SDKATman = ["UK3CB_CCM_I_AT","UK3CB_CCM_I_AT"];
SDKMedic = ["UK3CB_CCM_I_MD","UK3CB_CCM_I_MD"];
SDKMG = ["UK3CB_CCM_I_AR","UK3CB_CCM_I_AR"];
SDKExp = ["UK3CB_CCM_I_DEM","UK3CB_CCM_I_DEM"];
SDKGL = ["UK3CB_CCM_I_RIF_LITE","UK3CB_CCM_I_RIF_LITE"];
SDKMil = ["UK3CB_CCM_I_RIF_BOLT","UK3CB_CCM_I_RIF_1"];
SDKSL = ["UK3CB_CCM_I_TL","UK3CB_CCM_I_OFF"];
SDKEng = ["UK3CB_CCM_I_ENG","UK3CB_CCM_I_ENG"];

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
vehSDKBike = "I_G_Quadbike_01_F";
vehSDKLightArmed = "UK3CB_CCM_I_Datsun_Pkm";
vehSDKAT = "UK3CB_I_G_Hilux_Spg9";
vehSDKLightUnarmed = "UK3CB_CCM_I_Datsun_Open";
vehSDKTruck = "UK3CB_CCM_I_V3S_Closed";
//vehSDKHeli = "rhsgref_ins_g_Mi8amt";
vehSDKPlane = "UK3CB_CHC_I_Antonov_AN2";
vehSDKBoat = "I_C_Boat_Transport_01_F";
vehSDKRepair = "UK3CB_CCM_I_V3S_Repair";

//Civilian Vehicles
civCar = "UK3CB_C_Hilux_Open";
civTruck = "UK3CB_CHC_C_V3S_Recovery";
civHeli = "UK3CB_CHC_C_Mi8AMT";
civBoat = "C_Rubberboat";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Static Weapons
SDKMGStatic = "UK3CB_TKP_I_NSV";
staticATteamPlayer = "UK3CB_UN_I_SPG9";
staticAAteamPlayer = "UK3CB_UN_I_ZU23";
SDKMortar = "rhsgref_ins_g_2b14";
SDKMortarHEMag = "rhs_mag_3vo18_10";
SDKMortarSmokeMag = "rhs_mag_d832du_10";

//Static Weapon Bags
MGStaticSDKB = "RHS_DShkM_Gun_Bag";
ATStaticSDKB = "RHS_SPG9_Gun_Bag";
AAStaticSDKB = "I_AA_01_weapon_F";
MortStaticSDKB = "RHS_Podnos_Gun_Bag";
//Short Support
supportStaticSDKB = "RHS_SPG9_Tripod_Bag";
//Tall Support
supportStaticsSDKB2 = "RHS_DShkM_TripodHigh_Bag";
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
//Greenfor uniforms
allRebelUniforms append ["U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_leader","U_IG_Guerrilla_6_1"];
//TFAR Unlocks
if (hasTFAR) then {initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (hasTFAR && startWithLongRangeRadio) then {initialRebelEquipment pushBack "tf_anprc155_coyote"};
