REBELmortar = "rhsgref_cdf_b_reg_M252";
REBELmortarHEmag = "rhs_12Rnd_m821_HE";
REBELmortarSMOKEmag = "rhs_12Rnd_m821_HE";
REBELstaticMG = "rhsgref_cdf_b_DSHKM";
REBELstaticAT = "rhsgref_cdf_b_SPG9";
REBELstaticAA = "rhsgref_cdf_b_ZU23";

REBELstaticCREW = "B_G_Soldier_unarmed_F";
REBELprisoner = "B_G_Survivor_F";
REBELsniper = ["rhsgref_cdf_b_reg_marksman","rhsgref_hidf_marksman"];
REBELsoldierAT = ["rhsgref_cdf_b_ngd_grenadier_rpg","rhsgref_cdf_b_reg_grenadier_rpg"];
REBELmedic = ["rhsgref_cdf_b_ngd_medic","rhsgref_cdf_b_para_medic"];
REBELsoldierMG = ["rhsgref_cdf_b_ngd_machinegunner","rhsgref_cdf_b_reg_machinegunner"];
REBELsoldierEXP = ["rhsgref_cdf_b_ngd_engineer","rhsgref_cdf_b_reg_engineer"];
REBELsoldierGL = ["rhsgref_cdf_b_ngd_grenadier","rhsgref_cdf_b_reg_grenadier"];
REBELliteAT = ["rhsgref_cdf_b_ngd_rifleman_lite","rhsgref_cdf_b_para_rifleman_lite"];
REBELsquadLeader = ["rhsgref_cdf_b_ngd_squadleader","rhsgref_cdf_b_reg_squadleader"];
REBELengineer = ["rhsgref_cdf_b_ngd_engineer","rhsgref_cdf_b_reg_engineer"];

REBELunitsTIER1 = REBELliteAT + [REBELstaticCREW] + REBELsoldierMG + REBELsoldierGL + REBELsoldierAT;
REBELunitsTIER2 = REBELmedic + REBELsoldierEXP + REBELengineer;
REBELunitsTIER3 = REBELsquadLeader + REBELsniper;
REBELunitsALL = REBELunitsTIER1 + REBELunitsTIER2 + REBELunitsTIER3;

REBELgroupFIRETEAM = [REBELsquadLeader,REBELsoldierGL,REBELsoldierMG,REBELliteAT];
REBELgroupAT = [REBELsquadLeader,REBELsoldierMG,REBELsoldierAT,REBELsoldierAT,REBELsoldierAT];
//["BanditShockTeam","ParaShockTeam"];
REBELgroupSQUAD = [REBELsquadLeader,REBELsoldierGL,REBELliteAT,REBELsoldierMG,REBELliteAT,REBELsoldierAT,REBELliteAT,REBELmedic];
REBELgroupSQUADengineer = [REBELsquadLeader,REBELsoldierGL,REBELliteAT,REBELsoldierMG,REBELsoldierEXP,REBELsoldierAT,REBELengineer,REBELmedic];
REBELgroupSQUADsupport = [REBELsquadLeader,REBELsoldierGL,REBELliteAT,REBELsoldierMG,REBELsoldierAT,REBELmedic,[REBELstaticCREW,REBELstaticCREW],[REBELstaticCREW,REBELstaticCREW]];
REBELgroupSNIPER = [REBELsniper,REBELsniper];
REBELgroupSENTRY = [REBELsoldierGL,REBELliteAT];

REBELvehQUAD = "B_G_Quadbike_01_F";
REBELvehARMEDlite = "rhsgref_cdf_b_reg_uaz_dshkm";
REBELvehAT = "rhsgref_cdf_b_reg_uaz_spg9";
REBELvehUNARMEDlite = "rhsgref_cdf_b_reg_uaz_open";
REBELvehTRANSPORT = "rhsgref_cdf_b_ural_open";
//REBELvehHELI = "I_C_Heli_Light_01_civil_F";
REBELvehPLANE = "RHS_AN2_B";
REBELvehBOAT = "B_G_Boat_Transport_01_F";
REBELvehREPAIR = "rhsgref_cdf_b_ural_repair";

REBELvehALL = [REBELvehQUAD,REBELvehARMEDlite,REBELstaticMG,REBELvehUNARMEDlite,REBELvehTRANSPORT,REBELvehBOAT,REBELmortar,REBELstaticAT,REBELstaticAA,REBELvehREPAIR];

REBELflag = "Flag_FIA_F";
REBELflagTEX = "\A3\Data_F\Flags\Flag_FIA_CO.paa";
typePetros = "rhsgref_cdf_b_reg_general";

REBELstaticSUPPORTbag = "RHS_SPG9_Tripod_Bag";
REBELstaticSUPPORTbagAT = "RHS_SPG9_Gun_Bag";
REBELstaticSUPPORTbagTALL = "RHS_DShkM_Gun_Bag";
REBELstaticSUPPORTbagTALL2 = "RHS_DShkM_TripodHigh_Bag";
REBELstaticSUPPORTbagAA = "no_exists";
REBELstaticSUPPORTbagMORTAR = "rhs_M252_Gun_Bag";
REBELstaticSUPPORTbagMORTAR2 = "rhs_M252_Bipod_Bag";

CIVcar = "C_Offroad_01_F";
CIVtruck = "RHS_Ural_Open_Civ_03";
CIVheli = "RHS_Mi8amt_civilian";
CIVboat = "C_Boat_Transport_02_F";

arrayCivVeh = arrayCivVeh + ["RHS_Ural_Open_Civ_03","RHS_Ural_Open_Civ_01","RHS_Ural_Open_Civ_02"];

petrosRifle = "rhs_weap_m76_pso";
REBELflashlight = ["rhs_acc_2dpZenit","acc_flashlight"];

REBELmineAT = "rhs_mine_tm62m_mag";
REBELmineAP = "rhs_mine_pmn2_mag";

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
REBELfactionNAME = "FIA";

POLICE = "rhsgref_faction_un";

//Player spawn loadout
REBELloadoutDEFAULT = [[],[],[],["U_BG_Guerilla2_1", []],[],[],"","",[],["ItemMap","","","","",""]];

//Arsenal and Initial AI weapon setup
REBELvests0 = ["V_Rangemaster_belt","V_BandollierB_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_blk","V_BandollierB_oli","V_BandollierB_ghex_F","V_HarnessO_brn","V_HarnessO_gry","V_HarnessO_ghex_F","V_HarnessOGL_ghex_F","V_HarnessOGL_gry","V_HarnessOGL_brn","V_Pocketed_olive_F","V_Pocketed_coyote_F","V_Pocketed_black_F"];
unlockedWeapons = ["rhs_weap_akms","rhs_weap_makarov_pmm","Binocular","rhs_weap_rpg7","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_pp2000_folded","rhs_weap_savz61","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];
unlockedRifles = ["rhs_weap_akms","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_savz61","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];//standard rifles for AI riflemen, medics engineers etc. are picked from this array. Add only rifles.
unlockedMagazines = ["rhs_30Rnd_762x39mm","rhs_mag_9x18_12_57N181S","rhs_rpg7_PG7VL_mag","rhsgref_5Rnd_762x54_m38","rhsgref_5Rnd_792x57_kar98k","rhs_mag_rgd5","rhs_mag_9x19mm_7n21_20","rhsgref_20rnd_765x17_vz61","rhsgref_30rnd_1143x23_M1911B_SMG","rhsgref_8Rnd_762x63_M2B_M1rifle"];
unlockedRifles = ["rhs_weap_akms","rhs_weap_m38_rail","rhs_weap_kar98k","rhs_weap_savz61"];
unlockedBackpacks = ["B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr"];

if !(isMultiplayer) then
	{
	unlockedWeapons append ["arifle_AKM_F","arifle_AKS_F"];
	unlockedRifles append ["arifle_AKM_F","arifle_AKS_F"];
	unlockedRifles append ["arifle_AKM_F","arifle_AKS_F"];
	unlockedWeapons pushBack "launch_RPG7_F";
	unlockedAT = ["launch_RPG7_F"];
	unlockedMagazines pushBack "RPG7_F";
  };

// BEGIN ITEM CLASSIFICATION

REBELuniforms = [];
REBELuniformsPM = [];
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
} forEach [REBELsniper,REBELsoldierAT,REBELmedic,REBELsoldierMG,REBELsoldierEXP,REBELsoldierGL,REBELliteAT,REBELsquadLeader,REBELengineer,[REBELprisoner],[REBELstaticCREW]];

//TFAR Unlocks
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_anprc152","ItemRadio"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_rt1523g_rhs"]};
