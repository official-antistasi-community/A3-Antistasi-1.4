////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
nameTeamPlayer = "7CAV";
SDKFlag = "Cav_Flag_00_Flag_F";
SDKFlagTexture = "\z\cav\addons\flag\data\texture.paa";
typePetros = "rhsgref_nat_warlord";

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//First Entry is Guerilla, Second Entry is Para/Military
staticCrewTeamPlayer = "rhsgref_nat_crew";
SDKUnarmed = "I_G_Survivor_F";
SDKSniper = ["rhsgref_nat_hunter","rhsgref_nat_pmil_hunter"];
SDKATman = ["rhsgref_nat_grenadier_rpg","rhsgref_nat_pmil_grenadier_rpg"];
SDKMedic = ["rhsgref_nat_medic","rhsgref_nat_pmil_medic"];
SDKMG = ["rhsgref_nat_machinegunner_mg42","rhsgref_nat_pmil_machinegunner"];
SDKExp = ["rhsgref_nat_saboteur","rhsgref_nat_pmil_saboteur"];
SDKGL = ["rhsgref_nat_grenadier","rhsgref_nat_pmil_grenadier"];
SDKMil = ["rhsgref_nat_rifleman_mp44","rhsgref_nat_pmil_rifleman"];
SDKSL = ["rhsgref_nat_commander","rhsgref_nat_pmil_commander"];
SDKEng = ["rhsgref_cdf_ngd_engineer","rhsgref_cdf_reg_engineer"];

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
vehSDKBike = "B_Quadbike_01_F";
vehSDKLightArmed = "LOP_AM_Landrover_M2";
vehSDKAT = "LOP_AM_Landrover_SPG9";
vehSDKLightUnarmed = "LOP_AM_Landrover";
vehSDKTruck = "RHS_Ural_Civ_01";
vehSDKHeli = "RHS_Mi8AMTSh_vvsc";
vehSDKPlane = "RHS_AN2";
vehSDKBoat = "I_Boat_Armed_01_minigun_F";
vehSDKRepair = "rhsgref_cdf_gaz66_repair";
vehSDKAPC = "rhsusf_m113_usarmy_MK19";
vehSDKIFV = "RHS_M2A3_BUSKIII";
vehSDKTANK = "rhsusf_m1a2sep1d_usarmy";


//Civilian Vehicles
civCar = "C_Offroad_01_F";
civTruck = "C_Truck_02_transport_F";
civHeli = "rhs_uh1h_idap";
civBoat = "C_Boat_Transport_02_F";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Static Weapons
SDKMGStatic = "RHS_M2StaticMG_WD";
staticATteamPlayer = "rhsgref_nat_SPG9";
staticAAteamPlayer = "rhsgref_nat_ZU23";
SDKMortar = "rhsgref_nat_2b14";
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
ATMineMag = "rhs_mag_mine_ptm1";
APERSMineMag = "rhs_mine_ozm72_b_mag";

//Breaching explosives
//Breaching APCs needs one demo charge
breachingExplosivesAPC = [["rhs_ec200_mag", 1], ["rhs_ec200_sand_mag", 1], ["rhsusf_m112_mag", 1]];
//Breaching tanks needs one satchel charge or two demo charges
breachingExplosivesTank = [["rhs_ec400_mag", 1], ["rhs_ec400_sand_mag", 1], ["rhs_ec200_mag", 2], ["rhs_ec200_sand_mag", 2], ["rhsusf_m112x4_mag", 1], ["rhs_charge_M2tet_x2_mag", 1]];

//Starting Unlocks
initialRebelEquipment append ["rhs_weap_m3a1_specops","rhs_weap_pm63","rhs_weap_savz61_folded","rhs_weap_type94_new","rhs_weap_tt33","rhs_weap_Izh18","rhs_weap_kar98k","rhs_weap_akms","rhs_weap_svdp","rhsusf_weap_glock17g4","rhsusf_weap_m1911a1","rhs_weap_pp2000_folded","rhsusf_weap_m9","rhs_weap_M320","rhs_weap_l1a1_wood"];
initialRebelEquipment append ["rhs_weap_rpg75","rhs_weap_panzerfaust60","rhs_weap_m72a7"];
initialRebelEquipment append ["rhsgref_20rnd_765x17_vz61","rhs_mag_9x19mm_7n21_20","rhsgref_30rnd_1143x23_M1911B_2mag_SMG","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_7x45acp_MHP","rhs_mag_9x19mm_7n31_44","rhs_30Rnd_545x39_7N10_AK","rhs_100Rnd_762x54mmR","rhsusf_mag_15Rnd_9x19_FMJ","rhs_mag_6x8mm_mhp","rhs_mag_762x25_8","rhsgref_1Rnd_00Buck","rhsgref_1Rnd_Slug","rhsgref_5Rnd_792x57_kar98k","rhs_grenade_mkii_mag","rhs_grenade_mki_mag","rhs_mag_rdg2_black","rhs_grenade_m15_mag","rhs_75Rnd_762x39mm_tracer","rhs_45Rnd_545x39_AK_green","rhs_30Rnd_545x39_7N10_2mag_AK","rhs_mag_20Rnd_762x51_m80_fnfal","rhs_10Rnd_762x54mmR_7N1","rhs_30Rnd_762x39mm_bakelite"];
initialRebelEquipment append ["B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_Carryall_mcamo"];
initialRebelEquipment append ["rhsgref_chestrig","rhsgref_chicom","rhs_vydra_3m","rhs_vest_pistol_holster","rhs_vest_commander","rhs_6sh46","rhsgref_alice_webbing","V_SmershVest_01_radio_F"];
initialRebelEquipment append ["Binocular","ACE_Vector","ItemGPS","ItemcTab","acc_flashlight","rhs_acc_2dpzenit","ACE_Fortify","ACE_DeadManSwitch","rhsusf_m112_mag","rhs_acc_pso1m2","rhs_acc_pso1m21","rhs_acc_dtk1l","rhs_acc_pbs1","rhs_acc_perst1ik"];
