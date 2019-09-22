////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
nameTeamPlayer = "NAPA";
SDKFlag = "Flag_Syndikat_F";
SDKFlagTexture = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
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
vehSDKBike = "I_G_Quadbike_01_F";
vehSDKLightArmed = "rhsgref_nat_uaz_dshkm";
vehSDKAT = "rhsgref_nat_uaz_spg9";
vehSDKLightUnarmed = "rhsgref_cdf_reg_uaz_open";
vehSDKTruck = "rhsgref_cdf_zil131";
//vehSDKHeli = "rhsgref_ins_g_Mi8amt";
vehSDKPlane = "RHS_AN2";
vehSDKBoat = "I_C_Boat_Transport_01_F";
vehSDKRepair = "rhsgref_cdf_gaz66_repair";

//Civilian Vehicles
civCar = "C_Offroad_01_F";
civTruck = "RHS_Ural_Open_Civ_03";
civHeli = "RHS_Mi8t_civilian";
civBoat = "C_Boat_Transport_02_F";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Static Weapons
SDKMGStatic = "rhsgref_nat_NSV_TriPod";
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
//Player spawn loadout
teamPlayerDefaultLoadout = [[],[],[],["U_BG_Guerilla1_1", []],[],[],"","",[],["ItemMap","","","","",""]];
//Mines
ATMineMag = "rhs_mine_tm62m_mag";
APERSMineMag = "rhs_mine_pmn2_mag";
//Starting Unlocks
unlockedWeapons append ["rhs_weap_akms","rhs_weap_makarov_pmm","Binocular","rhs_weap_rpg7","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_pp2000_folded","rhs_weap_savz61","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];
unlockedRifles append ["rhs_weap_akms","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_savz61","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];
unlockedMagazines append ["rhs_30Rnd_762x39mm","rhs_mag_9x18_12_57N181S","rhs_rpg7_PG7VL_mag","rhsgref_5Rnd_762x54_m38","rhsgref_5Rnd_792x57_kar98k","rhs_mag_rgd5","rhs_mag_9x19mm_7n21_20","rhsgref_20rnd_765x17_vz61","rhsgref_30rnd_1143x23_M1911B_SMG","rhsgref_8Rnd_762x63_M2B_M1rifle"];
initialRifles append ["rhs_weap_akms","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_savz61"];
unlockedItems pushBack "rhs_acc_2dpZenit";
unlockedAT append ["rhs_weap_rpg7"];
unlockedBackpacks append ["B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr"];
//TAFR Unlocks
if (hasTFAR) then {unlockedItems append ["tf_microdagr","tf_anprc154"]};
if (startLR) then {unlockedBackpacks pushBack "tf_anprc155_coyote"};