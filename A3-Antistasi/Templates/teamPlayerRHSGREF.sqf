SDKMortar = "rhsgref_nat_2b14";
SDKMortarHEMag = "rhs_mag_3vo18_10";
SDKMortarSmokeMag = "rhs_mag_d832du_10";
SDKMGStatic = "rhsgref_nat_NSV_TriPod";
staticATteamPlayer = "rhsgref_nat_SPG9";
staticAAteamPlayer = "rhsgref_nat_ZU23";

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

vehSDKBike = "I_G_Quadbike_01_F";
vehSDKLightArmed = "rhsgref_nat_uaz_dshkm";
vehSDKAT = "rhsgref_nat_uaz_spg9";
vehSDKLightUnarmed = "rhsgref_cdf_reg_uaz_open";
vehSDKTruck = "rhsgref_cdf_zil131";
//vehSDKHeli = "rhsgref_ins_g_Mi8amt";
vehSDKPlane = "RHS_AN2";
vehSDKBoat = "I_C_Boat_Transport_01_F";
vehSDKRepair = "rhsgref_cdf_gaz66_repair";
SDKFlag = "Flag_Syndikat_F";
SDKFlagTexture = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
typePetros = "rhsgref_nat_warlord";

supportStaticSDKB = "RHS_SPG9_Tripod_Bag";
ATStaticSDKB = "RHS_SPG9_Gun_Bag";
MGStaticSDKB = "RHS_DShkM_Gun_Bag";
supportStaticsSDKB2 = "RHS_DShkM_TripodHigh_Bag";
AAStaticSDKB = "I_AA_01_weapon_F";
MortStaticSDKB = "RHS_Podnos_Gun_Bag";
supportStaticsSDKB3 = "RHS_Podnos_Bipod_Bag";

civCar = "C_Offroad_01_F";
civTruck = "RHS_Ural_Open_Civ_03";
civHeli = "RHS_Mi8t_civilian";
civBoat = "C_Boat_Transport_02_F";

arrayCivVeh = arrayCivVeh + ["RHS_Ural_Civ_01","RHS_Ural_Civ_02","RHS_Ural_Civ_03","RHS_Ural_Open_Civ_01","RHS_Ural_Open_Civ_02","RHS_Ural_Open_Civ_03"];

sniperRifle = "rhs_weap_m76_pso";
lampsSDK = ["rhs_acc_2dpZenit","acc_flashlight"];

ATMineMag = "rhs_mine_tm62m_mag";
APERSMineMag = "rhs_mine_pmn2_mag";

nameTeamPlayer = "NAPA";

//Player spawn loadout
teamPlayerDefaultLoadout = [[],[],[],["U_BG_Guerilla1_1", []],[],[],"","",[],["ItemMap","","","","",""]];

//Arsenal and Initial AI weapon setup
unlockedWeapons = ["rhs_weap_akms","rhs_weap_makarov_pmm","Binocular","rhs_weap_rpg7","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_pp2000_folded","rhs_weap_savz61","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];
unlockedRifles = ["rhs_weap_akms","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_savz61","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];//standard rifles for AI riflemen, medics engineers etc. are picked from this array. Add only rifles.
unlockedMagazines = ["rhs_30Rnd_762x39mm","rhs_mag_9x18_12_57N181S","rhs_rpg7_PG7VL_mag","rhsgref_5Rnd_762x54_m38","rhsgref_5Rnd_792x57_kar98k","rhs_mag_rgd5","rhs_mag_9x19mm_7n21_20","rhsgref_20rnd_765x17_vz61","rhsgref_30rnd_1143x23_M1911B_SMG","rhsgref_8Rnd_762x63_M2B_M1rifle"];
initialRifles = ["rhs_weap_akms","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_savz61"];
unlockedItems = unlockedItems + ["rhs_acc_2dpZenit"];
unlockedAT = ["rhs_weap_rpg7"];
unlockedBackpacks = ["B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr"];

