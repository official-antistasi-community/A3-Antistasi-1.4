rebelMortar = "rhsgref_nat_2b14";
rebelMortarRoundHE = "rhs_mag_3vo18_10";
rebelMortarRoundSmoke = "rhs_mag_d832du_10";
rebelStaticMG = "rhsgref_nat_NSV_TriPod";
rebelStaticAT = "rhsgref_nat_SPG9";
rebelStaticAA = "rhsgref_nat_ZU23";

rebelStaticCrew = "rhsgref_nat_crew";
rebelUnarmed = "I_G_Survivor_F";
rebelSniper = ["rhsgref_nat_hunter","rhsgref_nat_pmil_hunter"];
rebelAT = ["rhsgref_nat_grenadier_rpg","rhsgref_nat_pmil_grenadier_rpg"];
rebelMedic = ["rhsgref_nat_medic","rhsgref_nat_pmil_medic"];
rebelHeavyGunner = ["rhsgref_nat_machinegunner_mg42","rhsgref_nat_pmil_machinegunner"];
rebelExpSpec = ["rhsgref_nat_saboteur","rhsgref_nat_pmil_saboteur"];
rebelGrenadier = ["rhsgref_nat_grenadier","rhsgref_nat_pmil_grenadier"];
rebelLiteAT = ["rhsgref_nat_rifleman_mp44","rhsgref_nat_pmil_rifleman"];
rebelSquadLeader = ["rhsgref_nat_commander","rhsgref_nat_pmil_commander"];
rebelEngineer = ["rhsgref_cdf_ngd_engineer","rhsgref_cdf_reg_engineer"];

rebelVehQuadbike = "I_G_Quadbike_01_F";
rebelVehLiteArmed = "rhsgref_nat_uaz_dshkm";
rebelVehLiteAT = "rhsgref_nat_uaz_spg9";
rebelVehLiteUnarmed = "rhsgref_cdf_reg_uaz_open";
rebelVehTransport = "rhsgref_cdf_zil131";
//rebelVehHeli = "rhsgref_ins_g_Mi8amt";
rebelVehPlane = "RHS_AN2";
rebelVehBoat = "I_C_Boat_Transport_01_F";
rebelVehRepair = "rhsgref_cdf_gaz66_repair";
rebelFlag = "Flag_Syndikat_F";
rebelFlagTexture = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
typePetros = "rhsgref_nat_warlord";

rebelStaticSupportMG = "RHS_SPG9_Tripod_Bag";
rebelStaticSupportAT = "RHS_SPG9_Gun_Bag";
rebelStaticTallMG = "RHS_DShkM_Gun_Bag";
rebelStaticSupportTallMG = "RHS_DShkM_TripodHigh_Bag";
rebelStaticSupportAA = "I_AA_01_weapon_F";
rebelStaticMortarBag = "RHS_Podnos_Gun_Bag";
rebelStaticSupportMortar = "RHS_Podnos_Bipod_Bag";

civCar = "C_Offroad_01_F";
civTruck = "RHS_Ural_Open_Civ_03";
civHeli = "RHS_Mi8t_civilian";
civBoat = "C_Boat_Transport_02_F";

arrayCivVeh = arrayCivVeh + ["RHS_Ural_Civ_01","RHS_Ural_Civ_02","RHS_Ural_Civ_03","RHS_Ural_Open_Civ_01","RHS_Ural_Open_Civ_02","RHS_Ural_Open_Civ_03"];

sniperRifle = "rhs_weap_m76_pso";
rebelStartingFlashlight = ["rhs_acc_2dpZenit","acc_flashlight"];

rebelMineAT = "rhs_mine_tm62m_mag";
rebelMineAP = "rhs_mine_pmn2_mag";

if (hasFFAA) then
	{
	call compile preProcessFileLineNumbers "Templates\OccupantsFFAA.sqf"
	}
else
	{
	if (gameMode != 4) then
		{
		militiaRifleman = "rhsgref_hidf_rifleman";
		militiaMarksman = "rhsgref_hidf_marksman";
		militiaVehArmed = "rhsgref_hidf_m1025_m2";
		militiaVehTransport = "rhsgref_cdf_b_ural_open";
		militiaVehUnarmed = "rhsgref_hidf_m998_4dr";

		militiaGroupLow = [["rhsgref_hidf_grenadier","rhsgref_hidf_rifleman"],["rhsgref_hidf_marksman","rhsgref_hidf_rifleman"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		militiaGroupMid = [["rhsgref_hidf_teamleader","rhsgref_hidf_machinegunner","rhsgref_hidf_machinegunner_assist","rhsgref_hidf_grenadier"],["rhsgref_hidf_teamleader","rhsgref_hidf_rifleman_m72","rhsgref_hidf_rifleman_m72","rhsgref_hidf_grenadier"]];//["IRG_InfAssault","IRG_InfTeam","IRG_InfTeam_AT"];///
		militiaGroupLarge = ["rhsgref_hidf_squadleader","rhsgref_hidf_machinegunner","rhsgref_hidf_machinegunner_assist","rhsgref_hidf_rifleman","rhsgref_hidf_rifleman_m72","rhsgref_hidf_rifleman_m72","rhsgref_hidf_grenadier","rhsgref_hidf_medic"];//"IRG_InfSquad";///
		militiaGroupBest = [militiaGroupLarge];
		militiaFactionName = "rhsgref_faction_hidf";
		}
	else
		{
		militiaRifleman = "rhs_msv_emr_rifleman";
		militiaMarksman = "rhs_msv_emr_marksman";
		militiaVehArmed = "rhs_tigr_sts_3camo_msv";
		militiaVehTransport = "rhs_zil131_open_msv";
		militiaVehUnarmed = "rhs_uaz_open_MSV_01";

		militiaGroupLow = [["rhs_msv_emr_grenadier",militiaRifleman],[militiaMarksman,militiaRifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		militiaGroupMid = [["rhsgref_hidf_teamleader","rhs_msv_emr_machinegunner",militiaRifleman,"rhs_msv_emr_grenadier"],["rhsgref_hidf_teamleader","rhs_msv_emr_machinegunner",militiaRifleman,"rhs_msv_emr_at"],["rhsgref_hidf_teamleader","rhs_msv_emr_machinegunner",militiaRifleman,"rhs_msv_emr_engineer"]];//["IRG_InfAssault","IRG_InfTeam","IRG_InfTeam_AT"];///
		militiaGroupLarge = ["rhs_msv_emr_officer","rhs_msv_emr_grenadier","rhs_msv_emr_machinegunner","rhs_msv_emr_rifleman","rhs_msv_emr_marksman","rhs_msv_emr_engineer","rhs_msv_emr_at","rhs_msv_emr_medic"];//"IRG_InfSquad";///
		militiaGroupBest = [militiaGroupLarge];
		militiaFactionName = "rhs_faction_msv";
		};
	};

vehPoliceCar = "rhsusf_mrzr4_d";
policeOfficer = "rhsusf_army_ucp_rifleman_m590";
policeGrunt = "rhsusf_army_ucp_rifleman_82nd";
groupsNATOGen = [policeOfficer,policeGrunt];
rebelFactionName = "NAPA";

factionGEN = "BLU_GEN_F";

//Player spawn loadout
rebelDefaultLoadout = [[],[],[],["U_BG_Guerilla1_1", []],[],[],"","",[],["ItemMap","","","","",""]];

//Arsenal and Initial AI weapon setup
unlockedWeapons = ["rhs_weap_akms","rhs_weap_makarov_pmm","Binocular","rhs_weap_rpg7","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_pp2000_folded","rhs_weap_savz61","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];
unlockedRifles = ["rhs_weap_akms","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_savz61","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];//standard rifles for AI riflemen, medics engineers etc. are picked from this array. Add only rifles.
unlockedMagazines = ["rhs_30Rnd_762x39mm","rhs_mag_9x18_12_57N181S","rhs_rpg7_PG7VL_mag","rhsgref_5Rnd_762x54_m38","rhsgref_5Rnd_792x57_kar98k","rhs_mag_rgd5","rhs_mag_9x19mm_7n21_20","rhsgref_20rnd_765x17_vz61","rhsgref_30rnd_1143x23_M1911B_SMG","rhsgref_8Rnd_762x63_M2B_M1rifle"];
initialRifles = ["rhs_weap_akms","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_savz61"];
unlockedItems = unlockedItems + ["rhs_acc_2dpZenit"];
unlockedAT = ["rhs_weap_rpg7"];
unlockedBackpacks = ["B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr"];
//TAFR Unlocks
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_anprc154"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_anprc155_coyote"]};
