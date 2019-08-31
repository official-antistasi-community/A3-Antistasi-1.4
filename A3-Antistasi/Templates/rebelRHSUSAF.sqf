rebelMortar = "rhsgref_cdf_b_reg_M252";
rebelMortarRoundHE = "rhs_12Rnd_m821_HE";
rebelMortarRoundSmoke = "rhs_12Rnd_m821_HE";
rebelStaticMG = "rhsgref_cdf_b_DSHKM";
rebelStaticAT = "rhsgref_cdf_b_SPG9";
rebelStaticAA = "rhsgref_cdf_b_ZU23";

rebelStaticCrew = "B_G_Soldier_unarmed_F";
rebelUnarmed = "B_G_Survivor_F";
rebelSniper = ["rhsgref_cdf_b_reg_marksman","rhsgref_hidf_marksman"];
rebelAT = ["rhsgref_cdf_b_ngd_grenadier_rpg","rhsgref_cdf_b_reg_grenadier_rpg"];
rebelMedic = ["rhsgref_cdf_b_ngd_medic","rhsgref_cdf_b_para_medic"];
rebelHeavyGunner = ["rhsgref_cdf_b_ngd_machinegunner","rhsgref_cdf_b_reg_machinegunner"];
rebelExpSpec = ["rhsgref_cdf_b_ngd_engineer","rhsgref_cdf_b_reg_engineer"];
rebelGrenadier = ["rhsgref_cdf_b_ngd_grenadier","rhsgref_cdf_b_reg_grenadier"];
rebelLiteAT = ["rhsgref_cdf_b_ngd_rifleman_lite","rhsgref_cdf_b_para_rifleman_lite"];
rebelSquadLeader = ["rhsgref_cdf_b_ngd_squadleader","rhsgref_cdf_b_reg_squadleader"];
rebelEngineer = ["rhsgref_cdf_b_ngd_engineer","rhsgref_cdf_b_reg_engineer"];

rebelVehQuadbike = "B_G_Quadbike_01_F";
rebelVehLiteArmed = "rhsgref_cdf_b_reg_uaz_dshkm";
rebelVehLiteAT = "rhsgref_cdf_b_reg_uaz_spg9";
rebelVehLiteUnarmed = "rhsgref_cdf_b_reg_uaz_open";
rebelVehTransport = "rhsgref_cdf_b_ural_open";
//rebelVehHeli = "I_C_Heli_Light_01_civil_F";
rebelVehPlane = "RHS_AN2_B";
rebelVehBoat = "B_G_Boat_Transport_01_F";
rebelVehRepair = "rhsgref_cdf_b_ural_repair";
rebelFlag = "Flag_FIA_F";
rebelFlagTexture = "\A3\Data_F\Flags\Flag_FIA_CO.paa";
typePetros = "rhsgref_cdf_b_reg_general";

rebelStaticSupportMG = "RHS_SPG9_Tripod_Bag";
rebelStaticSupportAT = "RHS_SPG9_Gun_Bag";
rebelStaticTallMG = "RHS_DShkM_Gun_Bag";
rebelStaticSupportTallMG = "RHS_DShkM_TripodHigh_Bag";
rebelStaticSupportAA = "no_exists";
rebelStaticMortarBag = "rhs_M252_Gun_Bag";
rebelStaticSupportMortar = "rhs_M252_Bipod_Bag";

civCar = "C_Offroad_01_F";
civTruck = "RHS_Ural_Open_Civ_03";
civHeli = "RHS_Mi8amt_civilian";
civBoat = "C_Boat_Transport_02_F";

arrayCivVeh = arrayCivVeh + ["RHS_Ural_Open_Civ_03","RHS_Ural_Open_Civ_01","RHS_Ural_Open_Civ_02"];

sniperRifle = "rhs_weap_m76_pso";
rebelStartingFlashlight = ["rhs_acc_2dpZenit","acc_flashlight"];

rebelMineAT = "rhs_mine_tm62m_mag";
rebelMineAP = "rhs_mine_pmn2_mag";

if (gameMode != 4) then
	{
	militiaRifleman = "rhsgref_nat_pmil_rifleman_m92";
	militiaMarksman = "rhsgref_nat_pmil_hunter";
	militiaVehArmed = "rhsgref_nat_uaz_dshkm";
	militiaVehTransport = "rhsgref_nat_van";
	militiaVehUnarmed = "rhsgref_nat_uaz";
	militiaGroupLow = [["rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_rifleman_m92"],["rhsgref_nat_pmil_scout","rhsgref_nat_pmil_rifleman_aksu"],["rhsgref_nat_pmil_hunter","rhsgref_nat_pmil_scout"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	militiaGroupMid = [["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_grenadier"],["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_hunter","rhsgref_nat_pmil_hunter"],["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_grenadier_rpg"],["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_specialist_aa","rhsgref_nat_pmil_specialist_aa"]];
	militiaGroupLarge = ["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_hunter","rhsgref_nat_pmil_medic"];//"IRG_InfSquad";///
	militiaGroupBest = [militiaGroupLarge,["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_saboteur","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_medic"]];
	militiaFactionName = "rhsgref_faction_nationalist";
	}
else
	{
	militiaRifleman = "rhsgref_ins_militiaman_mosin";
	militiaMarksman = "rhsgref_ins_sniper";
	militiaVehArmed = "rhsgref_ins_uaz_dshkm";
	militiaVehTransport = "rhsgref_ins_gaz66o";
	militiaVehUnarmed = "rhsgref_ins_uaz_open";
	militiaGroupLow = [["rhsgref_ins_grenadier_rpg",militiaRifleman],["rhsgref_ins_grenadier_rpg",militiaRifleman],[militiaMarksman,militiaRifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	militiaGroupMid = [["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier",militiaRifleman],["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier",militiaMarksman],["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier","rhsgref_ins_grenadier_rpg"],["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier","rhsgref_ins_saboteur"]];
	militiaGroupLarge = ["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier","rhsgref_ins_grenadier_rpg","rhsgref_ins_sniper","rhsgref_ins_militiaman_mosin","rhsgref_ins_saboteur","rhsgref_ins_medic"];//"IRG_InfSquad";///
	militiaGroupBest = [militiaGroupLarge];
	militiaFactionName = "rhsgref_faction_chdkz";
	};

vehPoliceCar = "rhsgref_un_uaz";
policeOfficer = "rhsgref_cdf_un_squadleader";
policeGrunt = "rhsgref_cdf_un_rifleman_lite";
groupsNATOGen = [policeOfficer,policeGrunt];
rebelFactionName = "FIA";

factionGEN = "rhsgref_faction_un";

//Player spawn loadout
rebelDefaultLoadout = [[],[],[],["U_BG_Guerilla2_1", []],[],[],"","",[],["ItemMap","","","","",""]];

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
