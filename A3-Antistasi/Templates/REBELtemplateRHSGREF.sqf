REBELmortar = "rhsgref_nat_2b14";
REBELmortarHEmag = "rhs_mag_3vo18_10";
REBELmortarSMOKEmag = "rhs_mag_d832du_10";
REBELstaticMG = "rhsgref_nat_NSV_TriPod";
REBELstaticAT = "rhsgref_nat_SPG9";
REBELstaticAA = "rhsgref_nat_ZU23";

REBELstaticCREW = "rhsgref_nat_crew";
REBELprisoner = "I_G_Survivor_F";
REBELsniper = ["rhsgref_nat_hunter","rhsgref_nat_pmil_hunter"];
REBELsoldierAT = ["rhsgref_nat_grenadier_rpg","rhsgref_nat_pmil_grenadier_rpg"];
REBELmedic = ["rhsgref_nat_medic","rhsgref_nat_pmil_medic"];
REBELsoldierMG = ["rhsgref_nat_machinegunner_mg42","rhsgref_nat_pmil_machinegunner"];
REBELsoldierEXP = ["rhsgref_nat_saboteur","rhsgref_nat_pmil_saboteur"];
REBELsoldierGL = ["rhsgref_nat_grenadier","rhsgref_nat_pmil_grenadier"];
REBELliteAT = ["rhsgref_nat_rifleman_mp44","rhsgref_nat_pmil_rifleman"];
REBELsquadLeader = ["rhsgref_nat_commander","rhsgref_nat_pmil_commander"];
REBELengineer = ["rhsgref_cdf_ngd_engineer","rhsgref_cdf_reg_engineer"];

REBELvehQUAD = "I_G_Quadbike_01_F";
REBELvehARMEDlite = "rhsgref_nat_uaz_dshkm";
REBELvehAT = "rhsgref_nat_uaz_spg9";
REBELvehUNARMEDlite = "rhsgref_cdf_reg_uaz_open";
REBELvehTRANSPORT = "rhsgref_cdf_zil131";
//REBELvehHELI = "rhsgref_ins_g_Mi8amt";
REBELvehPLANE = "RHS_AN2";
REBELvehBOAT = "I_C_Boat_Transport_01_F";
REBELvehREPAIR = "rhsgref_cdf_gaz66_repair";
REBELflag = "Flag_Syndikat_F";
REBELflagTEX = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
typePetros = "rhsgref_nat_warlord";

REBELstaticSUPPORTbag = "RHS_SPG9_Tripod_Bag";
REBELstaticSUPPORTbagAT = "RHS_SPG9_Gun_Bag";
REBELstaticSUPPORTbagTALL = "RHS_DShkM_Gun_Bag";
REBELstaticSUPPORTbagTALL2 = "RHS_DShkM_TripodHigh_Bag";
REBELstaticSUPPORTbagAA = "I_AA_01_weapon_F";
REBELstaticSUPPORTbagMORTAR = "RHS_Podnos_Gun_Bag";
REBELstaticSUPPORTbagMORTAR2 = "RHS_Podnos_Bipod_Bag";

CIVcar = "C_Offroad_01_F";
CIVtruck = "RHS_Ural_Open_Civ_03";
CIVheli = "RHS_Mi8t_civilian";
CIVboat = "C_Boat_Transport_02_F";

arrayCivVeh = arrayCivVeh + ["RHS_Ural_Civ_01","RHS_Ural_Civ_02","RHS_Ural_Civ_03","RHS_Ural_Open_Civ_01","RHS_Ural_Open_Civ_02","RHS_Ural_Open_Civ_03"];

petrosRifle = "rhs_weap_m76_pso";
REBELflashlight = ["rhs_acc_2dpZenit","acc_flashlight"];

REBELmineAT = "rhs_mine_tm62m_mag";
REBELmineAP = "rhs_mine_pmn2_mag";

if (hasFFAA) then
	{
	call compile preProcessFileLineNumbers "Templates\OccupantsFFAA.sqf"
	}
else
	{
	if (gameMode != 4) then
		{
		FIARifleman = "rhsgref_hidf_rifleman";
		FIAMarksman = "rhsgref_hidf_marksman";
		vehFIAArmedCar = "rhsgref_hidf_m1025_m2";
		vehFIATruck = "rhsgref_cdf_b_ural_open";
		vehFIACar = "rhsgref_hidf_m998_4dr";

		groupsFIASmall = [["rhsgref_hidf_grenadier","rhsgref_hidf_rifleman"],["rhsgref_hidf_marksman","rhsgref_hidf_rifleman"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		groupsFIAMid = [["rhsgref_hidf_teamleader","rhsgref_hidf_machinegunner","rhsgref_hidf_machinegunner_assist","rhsgref_hidf_grenadier"],["rhsgref_hidf_teamleader","rhsgref_hidf_rifleman_m72","rhsgref_hidf_rifleman_m72","rhsgref_hidf_grenadier"]];//["IRG_InfAssault","IRG_InfTeam","IRG_InfTeam_AT"];///
		FIASquad = ["rhsgref_hidf_squadleader","rhsgref_hidf_machinegunner","rhsgref_hidf_machinegunner_assist","rhsgref_hidf_rifleman","rhsgref_hidf_rifleman_m72","rhsgref_hidf_rifleman_m72","rhsgref_hidf_grenadier","rhsgref_hidf_medic"];//"IRG_InfSquad";///
		groupsFIASquad = [FIASquad];
		factionFIA = "rhsgref_faction_hidf";
		}
	else
		{
		FIARifleman = "rhs_msv_emr_rifleman";
		FIAMarksman = "rhs_msv_emr_marksman";
		vehFIAArmedCar = "rhs_tigr_sts_3camo_msv";
		vehFIATruck = "rhs_zil131_open_msv";
		vehFIACar = "rhs_uaz_open_MSV_01";

		groupsFIASmall = [["rhs_msv_emr_grenadier",FIARifleman],[FIAMarksman,FIARifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		groupsFIAMid = [["rhsgref_hidf_teamleader","rhs_msv_emr_machinegunner",FIARifleman,"rhs_msv_emr_grenadier"],["rhsgref_hidf_teamleader","rhs_msv_emr_machinegunner",FIARifleman,"rhs_msv_emr_at"],["rhsgref_hidf_teamleader","rhs_msv_emr_machinegunner",FIARifleman,"rhs_msv_emr_engineer"]];//["IRG_InfAssault","IRG_InfTeam","IRG_InfTeam_AT"];///
		FIASquad = ["rhs_msv_emr_officer","rhs_msv_emr_grenadier","rhs_msv_emr_machinegunner","rhs_msv_emr_rifleman","rhs_msv_emr_marksman","rhs_msv_emr_engineer","rhs_msv_emr_at","rhs_msv_emr_medic"];//"IRG_InfSquad";///
		groupsFIASquad = [FIASquad];
		factionFIA = "rhs_faction_msv";
		};
	};

vehPoliceCar = "rhsusf_mrzr4_d";
policeOfficer = "rhsusf_army_ucp_rifleman_m590";
policeGrunt = "rhsusf_army_ucp_rifleman_82nd";
groupsNATOGen = [policeOfficer,policeGrunt];
nameTeamPlayer = "NAPA";

factionGEN = "BLU_GEN_F";

//Player spawn loadout
REBELloadoutDEFAULT = [[],[],[],["U_BG_Guerilla1_1", []],[],[],"","",[],["ItemMap","","","","",""]];

//Arsenal and Initial AI weapon setup
unlockedWeapons = ["rhs_weap_akms","rhs_weap_makarov_pmm","Binocular","rhs_weap_rpg7","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_pp2000_folded","rhs_weap_savz61","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];
unlockedRifles = ["rhs_weap_akms","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_savz61","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];//standard rifles for AI riflemen, medics engineers etc. are picked from this array. Add only rifles.
unlockedMagazines = ["rhs_30Rnd_762x39mm","rhs_mag_9x18_12_57N181S","rhs_rpg7_PG7VL_mag","rhsgref_5Rnd_762x54_m38","rhsgref_5Rnd_792x57_kar98k","rhs_mag_rgd5","rhs_mag_9x19mm_7n21_20","rhsgref_20rnd_765x17_vz61","rhsgref_30rnd_1143x23_M1911B_SMG","rhsgref_8Rnd_762x63_M2B_M1rifle"];
initialRifles = ["rhs_weap_akms","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_savz61"];
unlockedItems = unlockedItems + ["rhs_acc_2dpZenit"];
unlockedAT = ["rhs_weap_rpg7"];
unlockedBackpacks = ["B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr"];
//TAFR Unlocks
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_anprc148jem","ItemRadio"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_anprc155_coyote"]};
