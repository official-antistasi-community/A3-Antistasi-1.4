SDKMortar = "rhsgref_ins_g_2b14";
SDKMortarHEMag = "rhs_mag_3vo18_10";
SDKMortarSmokeMag = "rhs_mag_d832du_10";
SDKMGStatic = "rhsgref_ins_g_DSHKM";
staticATBuenos = "rhsgref_ins_g_d30_at";
staticAABuenos = "rhsgref_ins_g_ZU23";

staticCrewBuenos = "rhsgref_ins_g_militiaman_mosin";
SDKUnarmed = "I_G_Survivor_F";
SDKSniper = ["rhsgref_nat_hunter","rhsgref_nat_pmil_hunter"];
SDKATman = ["rhsgref_nat_grenadier_rpg","rhsgref_nat_pmil_grenadier_rpg"];
SDKMedic = ["rhsgref_ins_g_medic","rhsgref_cdf_ngd_medic"];
SDKMG = ["rhsgref_ins_g_machinegunner","rhsgref_cdf_ngd_machinegunner"];
SDKExp = ["rhsgref_nat_pmil_saboteur","rhsgref_ins_g_saboteur"];
SDKGL = ["rhsgref_nat_pmil_grenadier","rhsgref_ins_g_grenadier"];
SDKMil = ["rhsgref_nat_militiaman_kar98k","rhsgref_nat_rifleman_akms"];
SDKSL = ["rhsgref_nat_pmil_commander","rhsgref_nat_commander"];
SDKEng = ["rhsgref_ins_g_engineer","rhsgref_cdf_ngd_engineer"];

vehSDKBike = "I_G_Quadbike_01_F";
vehSDKLightArmed = "rhsgref_ins_g_uaz_dshkm_chdkz";
vehSDKAT = "rhsgref_nat_uaz_spg9";
vehSDKLightUnarmed = "rhsgref_cdf_reg_uaz_open";
vehSDKTruck = "rhsgref_nat_ural_open";
//vehSDKHeli = "rhsgref_ins_g_Mi8amt";
vehSDKPlane = "RHS_AN2";
vehSDKBoat = "I_C_Boat_Transport_01_F";
vehSDKRepair = "rhsgref_ins_g_gaz66_repair";
SDKFlag = "Flag_Syndikat_F";
SDKFlagTexture = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
tipoPetros = "rhsgref_ins_g_squadleader";

soporteStaticSDKB = "RHS_DShkM_TripodHigh_Bag";
ATStaticSDKB = "I_AT_01_weapon_F";
MGStaticSDKB = "RHS_DShkM_Gun_Bag";
soporteStaticSDKB2 = "I_HMG_01_support_high_F";
AAStaticSDKB = "I_AA_01_weapon_F";
MortStaticSDKB = "RHS_Podnos_Gun_Bag";
soporteStaticSDKB3 = "RHS_Podnos_Bipod_Bag";

civCar = "C_Offroad_01_F";
civTruck = "RHS_Ural_Open_Civ_03";
civHeli = "RHS_Mi8amt_civilian";
civBoat = "C_Boat_Transport_02_F";

arrayCivVeh = arrayCivVeh + ["RHS_Ural_Open_Civ_03","RHS_Ural_Open_Civ_01","RHS_Ural_Open_Civ_02"];

sniperRifle = "rhs_weap_m76_pso";
lamparasSDK = ["rhs_acc_2dpZenit","acc_flashlight"];

ATMineMag = "rhs_mine_tm62m_mag";
APERSMineMag = "rhs_mine_pmn2_mag";

if (hayFFAA) then
	{
	call compile preProcessFileLineNumbers "Templates\malosFFAA.sqf"
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

		gruposFIASmall = [["rhsgref_hidf_grenadier","rhsgref_hidf_rifleman"],["rhsgref_hidf_marksman","rhsgref_hidf_rifleman"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		gruposFIAMid = [["rhsgref_hidf_teamleader","rhsgref_hidf_machinegunner","rhsgref_hidf_machinegunner_assist","rhsgref_hidf_grenadier"],["rhsgref_hidf_teamleader","rhsgref_hidf_rifleman_m72","rhsgref_hidf_rifleman_m72","rhsgref_hidf_grenadier"]];//["IRG_InfAssault","IRG_InfTeam","IRG_InfTeam_AT"];///
		FIASquad = ["rhsgref_hidf_squadleader","rhsgref_hidf_machinegunner","rhsgref_hidf_machinegunner_assist","rhsgref_hidf_rifleman","rhsgref_hidf_rifleman_m72","rhsgref_hidf_rifleman_m72","rhsgref_hidf_grenadier","rhsgref_hidf_medic"];//"IRG_InfSquad";///
		gruposFIASquad = [FIASquad];
		factionFIA = "rhsgref_faction_hidf";
		}
	else
		{
		FIARifleman = "rhs_msv_emr_rifleman";
		FIAMarksman = "rhs_msv_emr_marksman";
		vehFIAArmedCar = "rhs_tigr_sts_3camo_msv";
		vehFIATruck = "rhs_zil131_open_msv";
		vehFIACar = "rhs_uaz_open_MSV_01";

		gruposFIASmall = [["rhs_msv_emr_grenadier",FIARifleman],[FIAMarksman,FIARifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		gruposFIAMid = [["rhsgref_hidf_teamleader","rhs_msv_emr_machinegunner",FIARifleman,"rhs_msv_emr_grenadier"],["rhsgref_hidf_teamleader","rhs_msv_emr_machinegunner",FIARifleman,"rhs_msv_emr_at"],["rhsgref_hidf_teamleader","rhs_msv_emr_machinegunner",FIARifleman,"rhs_msv_emr_engineer"]];//["IRG_InfAssault","IRG_InfTeam","IRG_InfTeam_AT"];///
		FIASquad = ["rhs_msv_emr_officer","rhs_msv_emr_grenadier","rhs_msv_emr_machinegunner","rhs_msv_emr_rifleman","rhs_msv_emr_marksman","rhs_msv_emr_engineer","rhs_msv_emr_at","rhs_msv_emr_medic"];//"IRG_InfSquad";///
		gruposFIASquad = [FIASquad];
		factionFIA = "rhs_faction_msv";
		};
	};

vehPoliceCar = "B_GEN_OFFROAD_01_gen_F";
policeOfficer = "B_GEN_Commander_F";
policeGrunt = "B_GEN_Soldier_F";
gruposNATOGen = [policeOfficer,policeGrunt];
nameBuenos = "ChDKZ";

factionGEN = "BLU_GEN_F";
