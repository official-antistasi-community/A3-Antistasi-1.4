SDKMortar = "rhsgref_cdf_b_reg_M252";
SDKMortarHEMag = "rhs_12Rnd_m821_HE";
SDKMortarSmokeMag = "rhs_12Rnd_m821_HE";
SDKMGStatic = "rhsgref_cdf_b_DSHKM";
staticATteamPlayer = "rhsgref_cdf_b_SPG9";
staticAAteamPlayer = "rhsgref_cdf_b_ZU23";

staticCrewTeamPlayer = "B_G_Soldier_unarmed_F";
SDKUnarmed = "B_G_Survivor_F";
SDKSniper = ["rhsgref_cdf_b_reg_marksman","rhsgref_hidf_marksman"];
SDKATman = ["rhsgref_cdf_b_ngd_grenadier_rpg","rhsgref_cdf_b_reg_grenadier_rpg"];
SDKMedic = ["rhsgref_cdf_b_ngd_medic","rhsgref_cdf_b_para_medic"];
SDKMG = ["rhsgref_cdf_b_ngd_machinegunner","rhsgref_cdf_b_reg_machinegunner"];
SDKExp = ["rhsgref_cdf_b_ngd_engineer","rhsgref_cdf_b_reg_engineer"];
SDKGL = ["rhsgref_cdf_b_ngd_grenadier","rhsgref_cdf_b_reg_grenadier"];
SDKMil = ["rhsgref_cdf_b_ngd_rifleman_lite","rhsgref_cdf_b_para_rifleman_lite"];
SDKSL = ["rhsgref_cdf_b_ngd_squadleader","rhsgref_cdf_b_reg_squadleader"];
SDKEng = ["rhsgref_cdf_b_ngd_engineer","rhsgref_cdf_b_reg_engineer"];

vehSDKBike = "B_G_Quadbike_01_F";
vehSDKLightArmed = "rhsgref_cdf_b_reg_uaz_dshkm";
vehSDKAT = "rhsgref_cdf_b_reg_uaz_spg9";
vehSDKLightUnarmed = "rhsgref_cdf_b_reg_uaz_open";
vehSDKTruck = "rhsgref_cdf_b_ural_open";
//vehSDKHeli = "I_C_Heli_Light_01_civil_F";
vehSDKPlane = "RHS_AN2_B";
vehSDKBoat = "B_G_Boat_Transport_01_F";
vehSDKRepair = "rhsgref_cdf_b_ural_repair";
SDKFlag = "Flag_FIA_F";
SDKFlagTexture = "\A3\Data_F\Flags\Flag_FIA_CO.paa";
typePetros = "rhsgref_cdf_b_reg_general";

supportStaticSDKB = "RHS_SPG9_Tripod_Bag";
ATStaticSDKB = "RHS_SPG9_Gun_Bag";
MGStaticSDKB = "RHS_DShkM_Gun_Bag";
supportStaticsSDKB2 = "RHS_DShkM_TripodHigh_Bag";
AAStaticSDKB = "no_exists";
MortStaticSDKB = "rhs_M252_Gun_Bag";
supportStaticsSDKB3 = "rhs_M252_Bipod_Bag";

civCar = "C_Offroad_01_F";
civTruck = "RHS_Ural_Open_Civ_03";
civHeli = "RHS_Mi8amt_civilian";
civBoat = "C_Boat_Transport_02_F";

arrayCivVeh = arrayCivVeh + ["RHS_Ural_Open_Civ_03","RHS_Ural_Open_Civ_01","RHS_Ural_Open_Civ_02"];

sniperRifle = "rhs_weap_m76_pso";
lampsSDK = ["rhs_acc_2dpZenit","acc_flashlight"];

ATMineMag = "rhs_mine_tm62m_mag";
APERSMineMag = "rhs_mine_pmn2_mag";

if (gameMode != 4) then
	{
	FIARifleman = "rhsgref_nat_pmil_rifleman_m92";
	FIAMarksman = "rhsgref_nat_pmil_hunter";
	vehFIAArmedCar = "rhsgref_nat_uaz_dshkm";
	vehFIATruck = "rhsgref_nat_van";
	vehFIACar = "rhsgref_nat_uaz";
	groupsFIASmall = [["rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_rifleman_m92"],["rhsgref_nat_pmil_scout","rhsgref_nat_pmil_rifleman_aksu"],["rhsgref_nat_pmil_hunter","rhsgref_nat_pmil_scout"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	groupsFIAMid = [["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_grenadier"],["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_hunter","rhsgref_nat_pmil_hunter"],["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_grenadier_rpg"],["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_specialist_aa","rhsgref_nat_pmil_specialist_aa"]];
	FIASquad = ["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_hunter","rhsgref_nat_pmil_medic"];//"IRG_InfSquad";///
	groupsFIASquad = [FIASquad,["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_saboteur","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_medic"]];
	factionFIA = "rhsgref_faction_nationalist";
	}
else
	{
	FIARifleman = "rhsgref_ins_militiaman_mosin";
	FIAMarksman = "rhsgref_ins_sniper";
	vehFIAArmedCar = "rhsgref_ins_uaz_dshkm";
	vehFIATruck = "rhsgref_ins_gaz66o";
	vehFIACar = "rhsgref_ins_uaz_open";
	groupsFIASmall = [["rhsgref_ins_grenadier_rpg",FIARifleman],["rhsgref_ins_grenadier_rpg",FIARifleman],[FIAMarksman,FIARifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	groupsFIAMid = [["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier",FIARifleman],["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier",FIAMarksman],["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier","rhsgref_ins_grenadier_rpg"],["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier","rhsgref_ins_saboteur"]];
	FIASquad = ["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier","rhsgref_ins_grenadier_rpg","rhsgref_ins_sniper","rhsgref_ins_militiaman_mosin","rhsgref_ins_saboteur","rhsgref_ins_medic"];//"IRG_InfSquad";///
	groupsFIASquad = [FIASquad];
	factionFIA = "rhsgref_faction_chdkz";
	};

vehPoliceCar = "rhsgref_un_uaz";
policeOfficer = "rhsgref_cdf_un_squadleader";
policeGrunt = "rhsgref_cdf_un_rifleman_lite";
groupsNATOGen = [policeOfficer,policeGrunt];
nameTeamPlayer = "FIA";

factionGEN = "rhsgref_faction_un";

//Player spawn loadout
teamPlayerDefaultLoadout = [[],[],[],["U_BG_Guerilla2_1", []],[],[],"","",[],["ItemMap","","","","",""]];

//Arsenal and Initial AI weapon setup
unlockedWeapons = ["rhs_weap_akms","rhs_weap_makarov_pmm","Binocular","rhs_weap_rpg7","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_pp2000_folded","rhs_weap_savz61","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];
unlockedRifles = ["rhs_weap_akms","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_savz61","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];//standard rifles for AI riflemen, medics engineers etc. are picked from this array. Add only rifles.
unlockedMagazines = ["rhs_30Rnd_762x39mm","rhs_mag_9x18_12_57N181S","rhs_rpg7_PG7VL_mag","rhsgref_5Rnd_762x54_m38","rhsgref_5Rnd_792x57_kar98k","rhs_mag_rgd5","rhs_mag_9x19mm_7n21_20","rhsgref_20rnd_765x17_vz61","rhsgref_30rnd_1143x23_M1911B_SMG","rhsgref_8Rnd_762x63_M2B_M1rifle"];
initialRifles = ["rhs_weap_akms","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_savz61"];
unlockedItems = unlockedItems + ["rhs_acc_2dpZenit"];
unlockedAT = ["rhs_weap_rpg7"];
unlockedBackpacks = ["B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr"];
//TFAR Unlocks
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_rf7800str"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_rt1523g_rhs"]};
