SDKMortar = "rhsgref_cdf_b_reg_M252";
SDKMortarHEMag = "rhs_12Rnd_m821_HE";
SDKMortarSmokeMag = "rhs_12Rnd_m821_HE";
SDKMGStatic = "rhsgref_cdf_b_DSHKM";
staticATBuenos = "rhsgref_cdf_b_SPG9";
staticAABuenos = "rhsgref_cdf_b_ZU23";

staticCrewBuenos = "B_G_Soldier_unarmed_F";
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
tipoPetros = "rhsgref_cdf_b_reg_general";

soporteStaticSDKB = "RHS_SPG9_Tripod_Bag";
ATStaticSDKB = "RHS_SPG9_Gun_Bag";
MGStaticSDKB = "RHS_DShkM_Gun_Bag";
soporteStaticSDKB2 = "RHS_DShkM_TripodHigh_Bag";
AAStaticSDKB = "no_exists";
MortStaticSDKB = "rhs_M252_Gun_Bag";
soporteStaticSDKB3 = "rhs_M252_Bipod_Bag";

civCar = "C_Offroad_02_unarmed_F";
civTruck = "RHS_Ural_Open_Civ_03";
civHeli = "RHS_Mi8amt_civilian";
civBoat = "C_Boat_Transport_02_F";

arrayCivVeh = arrayCivVeh + ["RHS_Ural_Open_Civ_03","RHS_Ural_Open_Civ_01","RHS_Ural_Open_Civ_02"];

sniperRifle = "rhs_weap_m76_pso";
lamparasSDK = ["rhs_acc_2dpZenit","acc_flashlight"];

ATMineMag = "rhs_mine_tm62m_mag";
APERSMineMag = "rhs_mine_pmn2_mag";

if (gameMode != 4) then
	{
	FIARifleman = "rhsgref_nat_pmil_rifleman_m92";
	FIAMarksman = "rhsgref_nat_pmil_hunter";
	vehFIAArmedCar = "rhsgref_nat_uaz_dshkm";
	vehFIATruck = "rhsgref_nat_van";
	vehFIACar = "rhsgref_nat_uaz";
	gruposFIASmall = [["rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_rifleman_m92"],["rhsgref_nat_pmil_scout","rhsgref_nat_pmil_rifleman_aksu"],["rhsgref_nat_pmil_hunter","rhsgref_nat_pmil_scout"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	gruposFIAMid = [["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_grenadier"],["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_hunter","rhsgref_nat_pmil_hunter"],["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_grenadier_rpg"],["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_specialist_aa","rhsgref_nat_pmil_specialist_aa"]];
	FIASquad = ["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_hunter","rhsgref_nat_pmil_medic"];//"IRG_InfSquad";///
	gruposFIASquad = [FIASquad,["rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_saboteur","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_medic"]];
	factionFIA = "rhsgref_faction_nationalist";
	}
else
	{
	FIARifleman = "rhsgref_ins_militiaman_mosin";
	FIAMarksman = "rhsgref_ins_sniper";
	vehFIAArmedCar = "rhsgref_ins_uaz_dshkm";
	vehFIATruck = "rhsgref_ins_gaz66o";
	vehFIACar = "rhsgref_ins_uaz_open";
	gruposFIASmall = [["rhsgref_ins_grenadier_rpg",FIARifleman],["rhsgref_ins_grenadier_rpg",FIARifleman],[FIAMarksman,FIARifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	gruposFIAMid = [["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier",FIARifleman],["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier",FIAMarksman],["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier","rhsgref_ins_grenadier_rpg"],["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier","rhsgref_ins_saboteur"]];
	FIASquad = ["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier","rhsgref_ins_grenadier_rpg","rhsgref_ins_sniper","rhsgref_ins_militiaman_mosin","rhsgref_ins_saboteur","rhsgref_ins_medic"];//"IRG_InfSquad";///
	gruposFIASquad = [FIASquad];
	factionFIA = "rhsgref_faction_chdkz";
	};

vehPoliceCar = "rhsgref_un_uaz";
policeOfficer = "rhsgref_cdf_un_squadleader";
policeGrunt = "rhsgref_cdf_un_rifleman_lite";
gruposNATOGen = [policeOfficer,policeGrunt];
nameBuenos = "FIA";

factionGEN = "rhsgref_faction_un";